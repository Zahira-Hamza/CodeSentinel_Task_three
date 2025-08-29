# Code Sentinel - API Data Fetching App

A professional Flutter application that fetches and displays posts from the JSONPlaceholder API with an attractive, modern UI.

##  App Overview

Code Sentinel demonstrates how to work with REST APIs in Flutter by fetching data from JSONPlaceholder and displaying it in a clean, card-based interface. Users can view posts, see details, and enjoy a seamless browsing experience.

##  Features

- **API Integration**: Fetches data from JSONPlaceholder REST API
- **Modern UI**: Professional card-based design with smooth animations
- **Pull-to-Refresh**: Refresh content with a simple swipe down
- **Error Handling**: Graceful error handling with retry functionality
- **Post Details**: Tap any post to view the full content in a detailed screen
- **Responsive Design**: Works beautifully on all screen sizes

##  Technologies Used

- **Flutter**: Cross-platform framework
- **HTTP**: For API requests
- **Provider**: State management
- **JSON**: Data parsing and serialization
- **Material Design**: UI components and theming

##  Project Structure

```
lib/
│
├── main.dart
│
├── core/
│   └── app_router.dart
│
├── features/
│   └── posts/
│       ├── data/
│       │   ├── models/
│       │   │   └── post_model.dart
│       │   └── api_service.dart
│       ├── presentation/
│       │   ├── view/
│       │   │   ├── posts_screen.dart
│       │   │   └── post_detail_screen.dart
│       │   ├── viewmodel/
│       │   │   └── posts_viewmodel.dart
│       │   └── widgets/
│       │       └── post_card.dart
```

##  Getting Started

### Prerequisites

- Flutter SDK (version 3.0 or higher)
- Dart (version 2.17 or higher)
- Android Studio or VS Code with Flutter extension

### Installation

1. Clone the repository:
```bash
git clone https://github.com/Zahira-Hamza/CodeSentinel_Task_three.git
cd CodeSentinel_Task_three
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Building for Release

```bash
flutter build apk --release
```

##  App Preview

The app features:
- Clean post cards with user and post IDs
- Professional color scheme with purple accents
- Smooth animations and transitions
- Detailed view for full post content
- Loading states and error handling

##  Learning Outcomes

This project demonstrates:
- REST API integration in Flutter
- JSON parsing and data modeling
- State management with Provider
- Professional UI/UX design principles
- Error handling and loading states
- Navigation between screens
- Responsive layout design

##  API Reference
This app uses the DummyJSON API - provides real English content for testing and prototyping.

Endpoint used: https://dummyjson.com/posts


##  Contact
Author: **Zahira Hamza**

GitHub: https://github.com/Zahira-Hamza
Project Link: https://github.com/Zahira-Hamza/CodeSentinel_Task_three.git

