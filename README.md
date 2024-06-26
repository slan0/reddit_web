# Reddit Tests

Repository for Test Automation using Robot Framework.

# Pre-Requisites

* Chromedriver - check your current Chrome version and download a relevant Chromedriver from https://googlechromelabs.github.io/chrome-for-testing/
* Corresponding drivers for other browsers (if you are interested in cross-browser testing)

# Installation Guide

1. Download and Install Python: https://www.python.org/downloads/. This is at the home directory level. 

   In Python version 3.4 or later, PIP package is included by default.
2. Download and Install IDE, eg. Pycharm Community Edition (Free version): https://www.jetbrains.com/pycharm/download/?section=windows
3. Clone the git repository: 
`git clone https://github.com/slan0/reddit_web.git`
4. Open the downloaded repository in Pycharm
5. Create a Virtual Environment by running the below command in the terminal:
   `python -m venv /path/to/new/virtual/environment`
6. Set Python Interpreter: in Pycharm, go to the Python Interpreter in PyCharm Settings and set the location of the newly created virtual environment.
7. Activate the virtual environment by running the below command in the terminal:
`source .venv/bin/activate`
8. Install dependencies:
   NOTE: Make sure you are installing the packages in the virtual environment to avoid conflict with other projects. 
   If the virtual environment is not running you can activate it as explained above.
To install dependencies, run the below commands in the terminal:
`pip install robotframework`
`pip install selenium`
`pip install robotframework-seleniumlibrary`
`pip install pyyaml`
9. Run the test cases by using the below command in the Pycharm terminal (terminal should show the path to the root of the repository):

   `robot --variable Username:<"your_username"> --variable Password:<"your_password">  Tests/RedditTests.robot`
10. Post run, test report is available at:
`<<path_to_the_folder_with_the_repo>>\reddit_web\report.html`
11. Additional information - files structure explained:
- Resources:
  - Page Objects - contains Page Objects to store locators and the web page related keywords.
  - Helpers - contains keywords to facilitate business keywords (technical non-business keywords)
- TestData - contains .yml file to store data needed for test execution in key:value pair
- Tests - contains the Test Cases to be executed
