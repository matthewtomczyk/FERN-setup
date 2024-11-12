# FERN Stack Setup Script

This script automates the setup of a new FERN (Firebase, Express, React, Node.js) stack project on macOS. It installs necessary tools like Homebrew, NVM, Node.js, Firebase CLI, and sets up both the backend and frontend environments for a new project. It also initializes Firebase for the project and opens the project directory in Visual Studio Code.

## Prerequisites

- macOS
- Internet connection
- Command Line Tools (installed with Xcode Command Line Tools)

## Script Features

1. **Installs Homebrew** if not already installed.
2. **Updates Homebrew**.
3. **Installs Node Version Manager (NVM)** if not already installed.
4. **Installs Node.js** and **npm** via Homebrew.
5. **Installs Firebase CLI** globally using npm.
6. Logs into Firebase with the `firebase login` command.
7. Installs global npm packages required for FERN stack development (`express-generator`, `create-react-app`, and `nodemon`).
8. Creates a new project directory for both the backend and frontend:
    - Sets up an **Express backend**.
    - Sets up a **React frontend**.
9. Logs into Firebase and initializes the Firebase project using `firebase init`.
10. Provides instructions on how to run the backend and frontend servers.
11. Opens the newly created project directory in **Visual Studio Code**.

## Usage

1. Make the script executable:


    chmod +x setup-fern.sh


2. Run the script with the desired project name as an argument:


    ./setup-fern.sh <project_name>


    Replace `<project_name>` with the name of your project.

    Example:


    ./setup-fern.sh my-new-project
 

    This will create a new directory called `my-new-project`, set up the FERN stack, and open it in Visual Studio Code.

## Steps Followed by the Script

1. **Install Homebrew** (if not installed).
2. **Install NVM** (if not installed).
3. **Install Node.js** and **npm** (via Homebrew).
4. **Install Firebase CLI**.
5. **Install global npm packages** for development.
6. **Create backend and frontend directories**:
   - Backend: Express app with default configuration.
   - Frontend: React app with default configuration.
7. **Initialize Firebase** for the project.
8. **Run backend and frontend**.

## Notes

- This script assumes that you are using **macOS** and have basic command line experience.
- If any of the tools are already installed, the script will skip that step and proceed to the next.
- The Firebase initialization (`firebase init`) requires user input to select Firebase features (Firestore, Hosting, etc.).

## Troubleshooting

- If you encounter any issues with the script, ensure you have an active internet connection and the required permissions for installing software on your system.
- Check the Firebase CLI documentation if you face issues during Firebase setup.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

