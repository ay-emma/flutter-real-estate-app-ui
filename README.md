# Emma Real Estate App

A Flutter application for browsing and managing real estate properties. This app provides a modern interface for users to explore available properties, view detailed information, and connect with real estate agents. The app features elegant animations, interactive maps, and a sleek UI design.

## Features

- Browse property listings with detailed information
- View property images and location maps
- Filter and search properties by various criteria
- Interactive map with property price markers
- Animated UI elements for a premium user experience
- Toggle between list and map views
- View buy and rent property statistics
- User authentication and profile management

## Project Structure

- `lib/`: Contains the Dart code for the application
  - `main.dart`: Entry point of the application
  - `src/`: Contains the core application code
    - `style/`: Design system and styling constants
      - `styles.dart`: App-wide style constants like colors and spacing
      - `assets.dart`: Asset path constants
    - `views/`: UI components and screens
      - `home_page.dart`: Main property browsing screen
      - `map_page.dart`: Interactive map view of properties
      - `widgets/`: Reusable UI components
        - `bottom_nav.dart`: Custom navigation bar
        - `house_list_view.dart`: Property listing grid
        - `location_header.dart`: Location display component
        - `offers_tile.dart`: Animated statistics tiles
        - `pin_marker.dart`: Map location markers
        - `slide_btn.dart`: Animated sliding button

- `assets/`: Contains images, fonts, and other static resources
  - `fonts/`: Euclid Circular A font family
  - `images/`: Property images and map assets

- `test/`: Contains application tests

## UI Components

The app uses several custom UI components with animations:

- **SlideBtn**: Animated buttons that expand with text
- **PinMarker**: Interactive map markers that can show/hide price information
- **OffersTile**: Animated statistics display with counting effect
- **BottomNav**: Custom navigation with page transitions

## Screenshots

The app includes property images and maps for visualization.

## Getting Started

This project is built with Flutter. To get started:

1. Ensure you have Flutter installed on your machine
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application. Best viewed on mobile

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
