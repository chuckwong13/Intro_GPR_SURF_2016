# Installation of Required Software to run the examples and handouts

## Install R (**MANDATORY**):

- To install R, follow the instructions [here](https://cran.r-project.org/)
- To install the required packages in R, open R terminal and copy/paste:
    install.packages('DiceKriging', repos = "http://cran.us.r-project.org")
    install.packages('lhs', repos = "http://cran.us.r-project.org")



## Installation core JUPYTER Notebook (**RECOMENDED**):

Install Anacoda:

- Install Anacoda (PYTHON 2.7), from [here](https://www.continuum.io/downloads)
    - Additionally:
        - For windows users: 
            - You need C, C++, Fortran compilers, as well as the Python sources. Start a command line (look for cmd) and type: 
            conda install mingw libpython
        - For Apple users: 
            1. Download and install Xcode
            2. Agree to the license of Xcode by opening a terminal and typing: 
                sudo xcrun cc
            3. Install your favorite version of the GNU compiler suite. You can do this with Homebrew (after you install it of course), by typing in the terminal:
                brew install gcc
        - For Linux users:
            - You are ok

## Install R modules for JUPYTER notebook:
    
- For Windows users: 
	- follow the instructions [here](https://irkernel.github.io/installation/#binary-panel)
- For Mac users: 
	- follow the instructions [here](https://irkernel.github.io/installation/#binary-panel)
- For Linux users: 
	- follow the instructions [here](https://irkernel.github.io/installation/#source-panel)



# How to Run the notebooks


- Open the command line.
    - cd to your favorite folder.
- Then, type:
    - git clone https://github.com/georgios-stats/Intro_GPR_SURF_2016

- This will download the contents of this repository in a folder called Intro_GPR_SURF_2016.
- Enter the uq-course folder:
    - cd Intro_GPR_SURF_2016

- Start the jupyter notebook by typing the command:
    - jupyter notebook

- Use the browser to navigate the course, experiment with code etc.
- If the course contented is updated, type the following command (while being inside Intro_GPR_SURF_2016) to get the latest version:
    - git pull origin master




