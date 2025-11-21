import 'package:flutter/material.dart';

/// Primary elevated button with consistent styling
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Size? minimumSize;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.child,
    this.padding,
    this.minimumSize,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
  });

  /// Factory constructor for buttons with icons
  factory PrimaryButton.icon({
    Key? key,
    required String text,
    required IconData icon,
    VoidCallback? onPressed,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Color? backgroundColor,
    Color? foregroundColor,
    double? elevation,
  }) {
    return PrimaryButton(
      key: key,
      text: text,
      onPressed: onPressed,
      padding: padding,
      minimumSize: minimumSize,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon, size: 18), const SizedBox(width: 8), Text(text)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        foregroundColor:
            foregroundColor ?? Theme.of(context).colorScheme.onPrimary,
        elevation: elevation ?? 2,
        minimumSize: minimumSize ?? const Size(88, 36),
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: child ?? Text(text),
    );
  }
}

/// Primary text button with consistent styling
class PrimaryTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Color? foregroundColor;

  const PrimaryTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.child,
    this.padding,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor:
            foregroundColor ?? Theme.of(context).colorScheme.primary,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      child: child ?? Text(text),
    );
  }
}

/// Primary outlined button with consistent styling
class PrimaryOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? borderWidth;

  const PrimaryOutlinedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.child,
    this.padding,
    this.foregroundColor,
    this.borderColor,
    this.borderWidth,
  });

  /// Factory constructor for buttons with icons
  factory PrimaryOutlinedButton.icon({
    Key? key,
    required String text,
    required IconData icon,
    VoidCallback? onPressed,
    EdgeInsetsGeometry? padding,
    Color? foregroundColor,
    Color? borderColor,
    double? borderWidth,
  }) {
    return PrimaryOutlinedButton(
      key: key,
      text: text,
      onPressed: onPressed,
      padding: padding,
      foregroundColor: foregroundColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon, size: 18), const SizedBox(width: 8), Text(text)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor:
            foregroundColor ?? Theme.of(context).colorScheme.primary,
        side: BorderSide(
          color: borderColor ?? Theme.of(context).colorScheme.primary,
          width: borderWidth ?? 1.0,
        ),
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: child ?? Text(text),
    );
  }
}

/// Primary icon button with consistent styling
class PrimaryIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Widget? child;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final double? iconSize;

  const PrimaryIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.child,
    this.foregroundColor,
    this.backgroundColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: child ?? Icon(icon),
      style: IconButton.styleFrom(
        foregroundColor:
            foregroundColor ?? Theme.of(context).colorScheme.primary,
        backgroundColor: backgroundColor ?? Colors.transparent,
        iconSize: iconSize ?? 24,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}

/// Destructive button with red styling (supports elevated, outlined, and text variants)
class DestructiveButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Size? minimumSize;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? elevation;
  final double? borderWidth;
  final DestructiveButtonType type;

  const DestructiveButton({
    super.key,
    required this.text,
    this.onPressed,
    this.child,
    this.padding,
    this.minimumSize,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.elevation,
    this.borderWidth,
    this.type = DestructiveButtonType.elevated,
  });

  /// Factory constructor for elevated buttons with icons
  factory DestructiveButton.icon({
    Key? key,
    required String text,
    required IconData icon,
    VoidCallback? onPressed,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Color? backgroundColor,
    Color? foregroundColor,
    double? elevation,
  }) {
    return DestructiveButton(
      key: key,
      text: text,
      onPressed: onPressed,
      padding: padding,
      minimumSize: minimumSize,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      type: DestructiveButtonType.elevated,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon, size: 18), const SizedBox(width: 8), Text(text)],
      ),
    );
  }

  /// Factory constructor for outlined buttons
  factory DestructiveButton.outlined({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    Widget? child,
    EdgeInsetsGeometry? padding,
    Color? foregroundColor,
    Color? borderColor,
    double? borderWidth,
  }) {
    return DestructiveButton(
      key: key,
      text: text,
      onPressed: onPressed,
      padding: padding,
      foregroundColor: foregroundColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
      type: DestructiveButtonType.outlined,
      child: child,
    );
  }

  /// Factory constructor for outlined buttons with icons
  factory DestructiveButton.outlinedIcon({
    Key? key,
    required String text,
    required IconData icon,
    VoidCallback? onPressed,
    EdgeInsetsGeometry? padding,
    Color? foregroundColor,
    Color? borderColor,
    double? borderWidth,
  }) {
    return DestructiveButton(
      key: key,
      text: text,
      onPressed: onPressed,
      padding: padding,
      foregroundColor: foregroundColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
      type: DestructiveButtonType.outlined,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon, size: 18), const SizedBox(width: 8), Text(text)],
      ),
    );
  }

  /// Factory constructor for text buttons
  factory DestructiveButton.text({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    EdgeInsetsGeometry? padding,
    Color? foregroundColor,
    Widget? child,
  }) {
    return DestructiveButton(
      key: key,
      text: text,
      onPressed: onPressed,
      padding: padding,
      foregroundColor: foregroundColor,
      type: DestructiveButtonType.text,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case DestructiveButtonType.elevated:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.red,
            foregroundColor: foregroundColor ?? Colors.white,
            elevation: elevation ?? 2,
            minimumSize: minimumSize ?? const Size(88, 36),
            padding:
                padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: child ?? Text(text),
        );

      case DestructiveButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: foregroundColor ?? Colors.red,
            side: BorderSide(
              color: borderColor ?? Colors.red,
              width: borderWidth ?? 1.0,
            ),
            padding:
                padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: child ?? Text(text),
        );

      case DestructiveButtonType.text:
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: foregroundColor ?? Colors.red,
            padding:
                padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          child: child ?? Text(text),
        );
    }
  }
}

/// Enum for destructive button types
enum DestructiveButtonType { elevated, outlined, text }

