# Social media platform

This repository contains a feature-rich Instagram clone developed with Flutter and Firebase. The application replicates core functionalities of Instagram, including user authentication, a dynamic home feed, a Reels-like video player, and a user profile system. This project was developed for a mobile application development course.

## Features

-   **User Authentication**: Secure sign-up and login with email/password and Google Sign-In, powered by Firebase Authentication. Includes a password reset feature.
-   **Home Feed**: A scrollable feed displaying posts with images and videos. Users can interact with posts through likes, comments, and bookmarks.
-   **Post Creation**: A dedicated screen for creating new posts, allowing users to select multiple images from a grid and write captions.
-   **Stories**: A horizontal list of stories at the top of the home feed.
-   **Reels**: A full-screen, vertical video player for short-form video content, complete with interaction buttons and a comment sheet.
-   **User Profile**: A detailed profile page displaying user statistics (posts, followers, following), a grid view of their posts, and suggestions for discovering other users.
-   **Search**: A search page with a media grid and functionality to look up other users and content.
-   **Notifications**: A screen to display activity updates and follow suggestions grouped by time (Today, Yesterday, etc.).
-   **Internationalization**: Supports both English and Vietnamese languages using the `easy_localization` package.

## Tech Stack

-   **Framework**: Flutter
-   **Programming Language**: Dart
-   **Backend & Database**: Firebase (Authentication, Cloud Firestore)
-   **State Management**: `StatefulWidget` / `setState`
-   **Key Packages**:
    -   `firebase_core`, `firebase_auth`, `cloud_firestore`
    -   `google_sign_in` for Google authentication.
    -   `video_player` for video playback in posts and reels.
    -   `easy_localization` for multi-language support.
    -   `smooth_page_indicator` for image carousels.

## Getting Started

To get a local copy up and running, follow these steps.

### Prerequisites

-   Flutter SDK installed.
-   A configured Firebase project.

### Installation

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/Nguyen1976/2025_LTTBDD_N05_Nhom_Nguyen_Huy.git
    ```

2.  **Navigate to the project directory:**
    ```sh
    cd 2025_LTTBDD_N05_Nhom_Nguyen_Huy
    ```

3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

4.  **Firebase Configuration:**
    The project includes a pre-configured Firebase setup in `lib/main.dart` for demonstration. To use your own Firebase backend, replace the configuration with your project's credentials.

5.  **Run the application:**
    ```sh
    flutter run
    ```

## Project Structure

The core application logic is located in the `lib` directory, organized as follows:

-   `lib/`
    -   `main.dart`: The main entry point of the application, handling Firebase initialization and routing.
    -   `bottomnav.dart`: Manages the main bottom navigation bar and switches between screens.
    -   `screens/`: Contains the primary UI screens of the app (Home, Profile, Login, Reels, Search, etc.).
    -   `models/`: Defines the data models for `Post`, `Comment`, `User`, and other entities.
    -   `service/`: Includes services for interacting with Firebase, such as `auth.dart` for authentication and `database.dart` for Firestore operations.
    -   `mockdata/`: Contains mock data used for development and demonstration purposes.
    -   `lang/`: Holds the JSON files for English (`en.json`) and Vietnamese (`vi.json`) translations.
    -   `assets/`:
        -   `images/`: Contains static images, avatars, and icons.
        -   `videos/`: Stores sample video files.
        -   `fonts/`: Includes custom fonts used in the application.
