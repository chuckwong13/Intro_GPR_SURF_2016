# README


Introduction to the Gaussian process regression

Course
    SURF 2016

Lecturer :
    Georgios Karagiannis, Department of Mathematics, Purdue

July 8, 2016



## Preperation:


After the lecture there will be a practice session. The softwere that we will use is R. In order to be able to run the handouts, you will need to install JUPYTER R in your system as well. Instructions, on how to install the software is described in what follows.



## Installation of Required Software to run the examples

### Install R:

- To install R, follow the instructions here (https://cran.r-project.org/)
- To install the required packages in R, open R terminal and copy/paste:
    install.packages('DiceKriging', repos = "http://cran.us.r-project.org")
    install.packages('lhs', repos = "http://cran.us.r-project.org")



### Installation core JUPYTER Notebook

Install Anacoda:

- Install Anacoda (PYTHON 2.7), from https://www.continuum.io/downloads
    - Additionally:
        - For windows users: 
            You need C, C++, Fortran compilers, as well as the Python sources. Start a command line (look for cmd) and type: 
            conda install mingw libpython
        - For Apple users: 
            1. Download and install Xcode
            2. Agree to the license of Xcode by opening a terminal and typing: 
                sudo xcrun cc
            3. Install your favorite version of the GNU compiler suite. You can do this with Homebrew (after you install it of course), by typing in the terminal:
                brew install gcc
        - For Linux users:
            You are ok

### Install R modules for JUPYTER notebook:
    
- For Windows users: follow the instructions at https://irkernel.github.io/installation/#binary-panel
- For Mac users: follow the instructions at https://irkernel.github.io/installation/#binary-panel
- For Linux users: follow the instructions at https://irkernel.github.io/installation/#source-panel



## How to Run the notebooks


- Open the command line.
    - cd to your favorite folder.
- Then, type:
    - git clone https://github.com/georgios-stats/SURF2016-GPR-lecture.git

- This will download the contents of this repository in a folder called uq-course.
- Enter the uq-course folder:
    - cd SURF2016-GPR-lecture

- Start the jupyter notebook by typing the command:
    - jupyter notebook

- Use the browser to navigate the course, experiment with code etc.
- If the course contented is updated, type the following command (while being inside uq-course) to get the latest version:
    - git pull origin master




