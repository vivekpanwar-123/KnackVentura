
Square Repos Viewer
This project is an iOS app built using UIKit and Swift that fetches and displays a scrollable list of repositories for the square organization on GitHub. The app uses a clean and testable architecture, handles loading and failure states gracefully, and follows best practices for maintainable and scalable code.


Here's a README.md file for your project:

Square Repos Viewer
This project is an iOS app built using UIKit and Swift that fetches and displays a scrollable list of repositories for the square organization on GitHub. The app uses a clean and testable architecture, handles loading and failure states gracefully, and follows best practices for maintainable and scalable code.


Implementation Details
UI:
1)The main screen is a UITableViewController that lists repositories.
2)Each cell displays the repository name and description.

Networking
1)NetworkManager handles API calls and parsing of JSON data.
2)Uses URLSession for making network requests.

Error Handling
1)Gracefully handles errors with proper user feedback (e.g., alerts for network failures).

Testing
1)Unit tests are written for the NetworkManager to validate API calls and data parsing.
2)A MockURLSession is used to simulate network requests in unit tests.

Features
1)Displays a list of repositories for the square organization on GitHub.
2)Shows the repository name and description.
3)Handles loading and error states.
4)Implements unit tests to ensure reliable functionality.

Architecture
The app follows the MVVM (Model-View-ViewModel) architecture:

Model: Represents the Repository structure and handles data decoding.
View: The UIKit components (UIViewController and UITableViewCell) responsible for displaying the data.
ViewModel: Acts as the intermediary between the view and the model, handling data transformations and API calls using the NetworkManager.
Why MVVM?
MVVM separates concerns, making the code more modular and testable.
ViewModels allow easy unit testing without involving UI components.
Makes it easy to extend and maintain the project as features grow.


How to Run the Project
1)Clone this repository.
2)Open the .xcodeproj file in Xcode.
3)Build and run the project on a simulator or a real device.
4)How to Run Tests
5)Open the project in Xcode.
6)Go to the Test Navigator (Command + 6).
7)Select the test cases and click the play button to run the tests.
