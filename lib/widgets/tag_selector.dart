import 'package:flutter/material.dart';

/// A widget for selecting a single tag from a list
class SingleTagSelector extends StatelessWidget {
  final String title;
  final List<String> availableTags;
  final String? selectedTag;
  final Function(String?) onSelected;
  final bool searchable;

  const SingleTagSelector({
    super.key,
    required this.title,
    required this.availableTags,
    required this.selectedTag,
    required this.onSelected,
    this.searchable = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showSelectionDialog(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: title,
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          selectedTag ?? 'Select $title',
          style: TextStyle(
            color: selectedTag == null ? Colors.grey[600] : null,
          ),
        ),
      ),
    );
  }

  void _showSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _TagSelectionDialog(
        title: title,
        availableTags: availableTags,
        selectedTag: selectedTag,
        onSelected: (value) => onSelected(value as String?),
        searchable: searchable,
        multiSelect: false,
      ),
    );
  }
}

/// A widget for selecting multiple tags from a list
class MultiTagSelector extends StatelessWidget {
  final String title;
  final List<String> availableTags;
  final List<String> selectedTags;
  final Function(List<String>) onSelected;
  final int? maxSelection;
  final bool searchable;
  final bool allowCustom;

  const MultiTagSelector({
    super.key,
    required this.title,
    required this.availableTags,
    required this.selectedTags,
    required this.onSelected,
    this.maxSelection,
    this.searchable = true,
    this.allowCustom = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => _showSelectionDialog(context),
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: title,
              suffixIcon: const Icon(Icons.add),
            ),
            child: Text(
              selectedTags.isEmpty
                  ? 'Select $title'
                  : '${selectedTags.length} selected',
              style: TextStyle(
                color: selectedTags.isEmpty ? Colors.grey[600] : null,
              ),
            ),
          ),
        ),
        if (selectedTags.isNotEmpty) ...[
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: selectedTags.map((tag) {
              return Chip(
                label: Text(tag),
                deleteIcon: const Icon(Icons.close, size: 18),
                onDeleted: () {
                  final newList = List<String>.from(selectedTags)..remove(tag);
                  onSelected(newList);
                },
              );
            }).toList(),
          ),
        ],
      ],
    );
  }

  void _showSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _TagSelectionDialog(
        title: title,
        availableTags: availableTags,
        selectedTags: selectedTags,
        onSelected: (tags) => onSelected(tags as List<String>),
        searchable: searchable,
        multiSelect: true,
        maxSelection: maxSelection,
        allowCustom: allowCustom,
      ),
    );
  }
}

/// Internal dialog for tag selection
class _TagSelectionDialog extends StatefulWidget {
  final String title;
  final List<String> availableTags;
  final String? selectedTag;
  final List<String> selectedTags;
  final Function(dynamic) onSelected;
  final bool searchable;
  final bool multiSelect;
  final int? maxSelection;
  final bool allowCustom;

  const _TagSelectionDialog({
    required this.title,
    required this.availableTags,
    this.selectedTag,
    this.selectedTags = const [],
    required this.onSelected,
    this.searchable = true,
    this.multiSelect = false,
    this.maxSelection,
    this.allowCustom = false,
  });

  @override
  State<_TagSelectionDialog> createState() => _TagSelectionDialogState();
}

class _TagSelectionDialogState extends State<_TagSelectionDialog> {
  late List<String> _filteredTags;
  late List<String> _selectedTags;
  late List<String> _customTags;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Separate custom tags from predefined ones
    _customTags = widget.selectedTags
        .where((tag) => !widget.availableTags.contains(tag))
        .toList();
    _filteredTags = [...widget.availableTags, ..._customTags];
    _selectedTags = List.from(widget.selectedTags);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterTags(String query) {
    setState(() {
      final allTags = [...widget.availableTags, ..._customTags];
      if (query.isEmpty) {
        _filteredTags = allTags;
      } else {
        final lowerQuery = query.toLowerCase();
        _filteredTags = allTags
            .where((tag) => tag.toLowerCase().contains(lowerQuery))
            .toList();
      }
    });
  }

  void _addCustomTagFromSearch(String query) {
    final customTag = query.trim();
    
    if (customTag.isEmpty) return;

    // Check if tag already exists
    if (widget.availableTags.contains(customTag) || _customTags.contains(customTag)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This tag already exists'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Check max selection limit
    if (widget.maxSelection != null && _selectedTags.length >= widget.maxSelection!) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Maximum ${widget.maxSelection} ${widget.title.toLowerCase()} can be selected'),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      _customTags.add(customTag);
      _selectedTags.add(customTag);
      _filteredTags = [...widget.availableTags, ..._customTags];
      _searchController.clear();
      _filterTags('');
    });
  }

  void _onTagTap(String tag) {
    if (widget.multiSelect) {
      setState(() {
        if (_selectedTags.contains(tag)) {
          _selectedTags.remove(tag);
        } else {
          if (widget.maxSelection == null ||
              _selectedTags.length < widget.maxSelection!) {
            _selectedTags.add(tag);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Maximum ${widget.maxSelection} ${widget.title.toLowerCase()} can be selected'),
                duration: const Duration(seconds: 2),
              ),
            );
          }
        }
      });
    } else {
      widget.onSelected(tag);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Select ${widget.title}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            // Search bar
            if (widget.searchable)
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search ${widget.title.toLowerCase()}...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              _filterTags('');
                            },
                          )
                        : null,
                  ),
                  onChanged: _filterTags,
                ),
              ),

            // Tag list
            Expanded(
              child: ListView.builder(
                itemCount: _filteredTags.isEmpty && widget.multiSelect && widget.allowCustom && _searchController.text.trim().isNotEmpty
                    ? 1
                    : _filteredTags.length,
                itemBuilder: (context, index) {
                  // Show "Add Custom" only when no search results and user has typed something
                  if (_filteredTags.isEmpty && widget.multiSelect && widget.allowCustom && _searchController.text.trim().isNotEmpty) {
                    final searchQuery = _searchController.text.trim();
                    return ListTile(
                      leading: Icon(Icons.add_circle_outline, color: Theme.of(context).primaryColor),
                      title: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: 'Add "',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: searchQuery,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '"',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => _addCustomTagFromSearch(searchQuery),
                    );
                  }
                  
                  final tag = _filteredTags[index];
                  final isSelected = widget.multiSelect
                      ? _selectedTags.contains(tag)
                      : tag == widget.selectedTag;
                  final isCustomTag = _customTags.contains(tag);

                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(child: Text(tag)),
                        if (isCustomTag && widget.multiSelect)
                          IconButton(
                            icon: const Icon(Icons.close, size: 18),
                            color: Colors.grey,
                            onPressed: () {
                              setState(() {
                                _customTags.remove(tag);
                                _selectedTags.remove(tag);
                                _filteredTags = [...widget.availableTags, ..._customTags];
                              });
                            },
                            tooltip: 'Remove custom tag',
                          ),
                      ],
                    ),
                    leading: widget.multiSelect
                        ? Checkbox(
                            value: isSelected,
                            onChanged: (_) => _onTagTap(tag),
                          )
                        : Radio<String>(
                            value: tag,
                            groupValue: widget.selectedTag,
                            onChanged: (_) => _onTagTap(tag),
                          ),
                    onTap: () => _onTagTap(tag),
                  );
                },
              ),
            ),

            // Footer for multi-select
            if (widget.multiSelect)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${_selectedTags.length} selected',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        widget.onSelected(_selectedTags);
                        Navigator.pop(context);
                      },
                      child: const Text('Done'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
