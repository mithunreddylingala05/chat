# Flutter Chat Application

A simple real-time chat application using Flutter + Firebase.

## Features
- Login and Registration
- Firebase Authentication
- Real-time Firestore chat messages
- Clean modern chat UI
- Logout option
- Timestamp on messages

## Setup Steps

### 1. Create Firebase Project
Go to Firebase Console and create a new project.

### 2. Add Android App
Use this package name:

```text
com.example.flutter_chat_app
```

Download `google-services.json`.

Place it here:

```text
android/app/google-services.json
```

### 3. Enable Firebase Services
In Firebase Console:
- Enable Authentication → Email/Password
- Enable Firestore Database

### 4. Firestore Rules for Testing

```js
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
    match /messages/{messageId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

### 5. Install Packages

```bash
flutter pub get
```

### 6. Run App

```bash
flutter run
```

## Important
This ZIP does not include `google-services.json`. You must add it from your own Firebase project.
