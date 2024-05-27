# Reddit Tests

Repository for Test Automation using Robot Framework.

# Pre-Requisites

Chromedriver (for latest chrome version)
Corresponding drivers for other browsers (if you are interested in cross browser testing)

# Installation Guide

1. Download and Install Python: https://www.python.org/downloads/. This is at home directory level. 

    In Python version 3.4 or later, PIP package is included by default.

2. Download and Install IDE, eg. Pycharm Community Edition (Free version): https://www.jetbrains.com/pycharm/download/?section=windows
3. Create Virtual Environment by running the below command in the terminal:
`python -m venv /path/to/new/virtual/environment`
4. Set Python Interpreter: in Pycharm, go to the Python Interpreter in PyCharm Settings and set the location of the newly created virtual environment. 
For running test cases.
5. Clone the git repository: `git clone https://github.com/slan0/reddit_web.git`
6. Activate the virtual environment by running the below command in the terminal:
`source .venv/bin/activate`
7. Install dependencies:
NOTE: Make sure you are installing the packages in the virtual environment to avoid conflict with other projects. 
If the virtual environment is not running you can activate it as explained above.
To istall dependencies, run the below commands in the terminal:
`pip install robotframework`
`pip install selenium`
`pip install robotframework-seleniumlibrary`
`pip install pyyaml`
8. Run the tests by using the below command in the terminal:
`robot  Tests/RedditTests.robot`
9. Test report is available at:
`<<path_to_the_folder_with_the_repo>>\reddit_web\report.html`
10. Additional requirements
Chromedriver - For running UI test cases you will need to download chromedriver. 
Check your current chrome version and download a relevant chromedriver from https://googlechromelabs.github.io/chrome-for-testing/