#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to check if a command exists
command_exists () {
    command -v "$1" >/dev/null 2>&1 ;
}

# Check if an argument (project name) is provided
if [ -z "$1" ]; then
    echo "Error: No project name provided."
    echo "Usage: $0 <project_name>"
    exit 1
fi

# Set the project name from the argument
PROJECT_NAME="$1"
PROJECT_DIR="$(pwd)/$PROJECT_NAME"

# 1. Install Homebrew if not installed
if ! command_exists brew ; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# 2. Update Homebrew
echo "Updating Homebrew..."
brew update

# 2.5 Check for NVM installation
if [ -z "$NVM_DIR" ] || ! command_exists nvm ; then
    echo "NVM not found. Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

    # Load NVM into the current shell session
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    echo "NVM installed successfully."
else
    echo "NVM is already installed."
fi

# 3. Install Node.js and npm (via Homebrew)
if ! command_exists node || ! command_exists npm ; then
    echo "Installing Node.js and npm..."
    brew install node
else
    echo "Node.js and npm are already installed."
fi

# 4. Verify Node.js and npm installation
echo "Node version: $(node -v)"
echo "npm version: $(npm -v)"

# 5. Install Firebase CLI
if ! command_exists firebase ; then
    echo "Installing Firebase CLI..."
    npm install -g firebase-tools
else
    echo "Firebase CLI is already installed."
fi

# 6. Login to Firebase
echo "Logging into Firebase..."
firebase login

# 7. Install global npm packages for FERN development
echo "Installing global npm packages for FERN stack development..."
npm install -g express-generator create-react-app nodemon

# 8. Create a new directory for the FERN project
echo "Creating a new FERN project directory at $PROJECT_DIR..."
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# 9. Set up Express backend
echo "Setting up Express backend in $PROJECT_NAME/backend..."
express --no-view backend
cd backend
npm install
cd ..

# 10. Set up React frontend
echo "Setting up React frontend in $PROJECT_NAME/frontend..."
npx create-react-app frontend
cd frontend
npm install
cd ..

#11. login to firebase
firebase login --reauth

# 11.1 Initialize Firebase project
echo "Initializing Firebase project..."
firebase init

# 12. Run the backend server
echo "To run the backend, go to $PROJECT_DIR/backend and use: 'npm start' or 'nodemon'."
echo "To run the frontend, go to $PROJECT_DIR/frontend and use: 'npm start'."

# 13. Success message
echo "FERN stack setup for $PROJECT_NAME is complete! Happy coding!"

# 14. Open the project directory in VS Code
code "$PROJECT_DIR"
echo "Opening $PROJECT_DIR in Visual Studio Code..."
