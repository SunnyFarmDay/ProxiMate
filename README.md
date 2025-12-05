# playground

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# How to run the project

1. To run the project, install docker compose from the web for your system.
https://docs.docker.com/compose/install/

2. cd to the project dir

3. For local setup, create a .env file with the following at the root by copy and pasting the .env.sample and rename it to .env
```
# ProxiMate Environment Configuration
# Copy this file to .env and update with your production values

# API Base URL - The backend API endpoint
# For local development: http://localhost:8000
# For Docker network: http://backend-service:8000
# For production: https://api.proximate.app
API_BASE_URL=http://localhost:8000

# Environment mode
ENVIRONMENT=production
```
4. run this command in terminal:
```bash
docker compose up --build
```

5. you can now access the website using the url, http://localhost:8300.
