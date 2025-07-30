# weather_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# Flutter_Weather_App

You can get your temperature, what it feels like, weather condition, humidity, wind, and visibility data according to your latitude and longtitude

What I learnt from this project: 

# Asynchronous Network Communication:

• HTTP GET Requests: Mastered sending HTTP GET requests to fetch data from remote APIs using the http package.

• async and await: Understood how to use async and await keywords to handle asynchronous operations (like network calls) gracefully, preventing the UI from freezing.

# API Integration and Data Handling:

• JSON Parsing (dart:convert): Learned to decode JSON strings received from an API into usable Dart objects (like Map<String, dynamic>), enabling access to specific data fields.

• API Key Management (flutter_dotenv): Implemented a method to securely store and load sensitive information like API keys from a .env file, keeping them out of directly committed source code. This also involved correctly configuring assets in pubspec.yaml and using dotenv.load().

• API-Specific Interactions (OpenWeatherMap): Gained experience in formulating specific API requests (e.g., using lat, lon, appid, units parameters) and interpreting the structure of their JSON responses.

# Advanced State Management with StatefulWidget:

• Managing Dynamic Data: Deepened understanding of StatefulWidget and setState() for updating UI elements dynamically based on fetched data.
• State Variables: Learned to declare and correctly update member variables within the _State class to hold fetched data (e.g., _temperature, _weatherCondition), making them accessible to the build method.
• Initialization and UI Reflection: Understood the importance of initializing state variables and how setState() triggers a rebuild to reflect the new data in the UI.

# User Input and Control:

• Text Field Input (TextEditingController): Utilized TextEditingController to capture user input from text fields (latitude and longitude) for dynamic API queries.
• Resource Management (dispose): Practiced cleaning up controllers using the dispose() method to prevent memory leaks.

# Robust Error Handling:

• try-catch Blocks: Implemented try-catch blocks to gracefully handle potential errors during network requests (e.g., network issues, invalid API responses).
• Status Code Interpretation: Learned to check response.statusCode (e.g., 200 for success, 401 for unauthorized, 403 for forbidden) and display appropriate messages to the user.

# Refined UI Layout Techniques:

• Nested Layout Widgets: Gained experience in creating more complex layouts by nesting Column and Row widgets.
• mainAxisAlignment and crossAxisAlignment for Specific Control: Used mainAxisAlignment.spaceBetween within Rows to distribute content and crossAxisAlignment.center on Columns to center entire blocks of content.
• Sizing Widgets: Used SizedBox to control the dimensions of specific UI elements.

<img width="789" height="622" alt="Screenshot at Jul 30 18-15-40" src="https://github.com/user-attachments/assets/0571f9d7-c7b3-419e-83e7-63fed6d1f42c" />
<img width="788" height="619" alt="Screenshot at Jul 30 18-15-53" src="https://github.com/user-attachments/assets/c31c0e0a-d209-4bfd-9c65-1192a8a44a3e" />
<img width="789" height="618" alt="Screenshot at Jul 30 18-18-44" src="https://github.com/user-attachments/assets/73a69026-fb3f-4bed-bbc5-d88cdaa5046c" />
<img width="799" height="620" alt="Screenshot at Jul 30 18-18-55" src="https://github.com/user-attachments/assets/96faa305-e7ae-4511-881c-5b99944ea360" />
<img width="792" height="620" alt="Screenshot at Jul 30 18-19-04" src="https://github.com/user-attachments/assets/38d978ca-7cc8-495f-a2cc-7ae006d8d081" />
