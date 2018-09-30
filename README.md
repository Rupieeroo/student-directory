# student-directory #

The student directory script allows you to manage the list of students enrolled at Villains Academy.

Working through the Makers Academy Pre-course, the directory.rb file started as a list of students who were enrolled and gradually evolved step-by-step into an interactive directory, allowing the user to input student's names, their cohort, country of origin and age. These can then be loaded back again from the interactive menu. 

## How to use ##

```shell
ruby directory.rb
```

### 1. Input the students ###
Allows the user to add the student information when prompted; starting with the student's name, then cohort, then country of origin and finally their age. Once this information is entered the user can input the next student, or to stop, simply type 'stop' then press enter.

### 2. Show the students ###
Outputs a list of students  in the order they were input, followed by the students grouped into which cohort they are attending. And finally, it displays a count of all the students in the list. For example:

    The students of Villains Academy
             -------------

       1. Mark (November cohort)
      From Spain and 23 years old

           November cohort:
                1. Mark
             -------------
    Overall, we have 1 great student
    
### 3. Save the list ###
Saves the students that have been added during the instance to the students.csv file or, in theory, any other file that is given as an argument, adding them to the directory for calling upon later.

### 4. Load the students ###
Loads the students that have been added previously to the students.csv file or, in theory, any other file that is given as an argument. Somewhat defunct in this particular code as the students are also auto-loaded from the students.csv file upon the program opening.

### 9. Exit ###
Exits the program instance and takes you back to the command line.
