#!/bin/zsh

# Author: Jan Erik Hjelseth
# Date Created: 10.11.2024
# Last modified: 05.12.2024

# Description:
# The script creates project structure based on argument indicating programming language
# Git is also initialised in the project folder, and a repository created on github
# The main branch is committed and initial push to upstream branch
# Files for the project are also created in the Obsidian Vault for notes/research/documentation etc

# Usage:
# newProject [language]


language=$1
projectname=$2
newprojectfolder="/home/janerik/Dokumenter/source/"$projectname"/"

case $language in
    "c++")
        # Create C++ project
        cp -r /home/janerik/Dokumenter/source/templates/cpp/ $newprojectfolder
        echo "C++ project created " $projectname
        # Move to new project folder
        cd $newprojectfolder/
        ;;
    "python")
        # Create Python project
        cp -r /home/janerik/Dokumenter/source/templates/python/ $newprojectfolder
        echo "Python project created "$projectname
        # Move to new project folder
        cd $newprojectfolder/
        ;;
    "zsh")
        # Create zsh project
        cp -r /home/janerik/Dokumenter/source/templates/zsh/ $newprojectfolder
        echo "ZSH project created "$projectname
        # Move to new project folder
        cd $newprojectfolder/

        # Rename main script file
        mv ${newprojectfolder}src/script.sh ${newprojectfolder}src/${projectname}.sh
        echo "Renamed script.sh to " $projectname".sh"
        ;;
    "bash")
        # Create zsh project
        cp -r /home/janerik/Dokumenter/source/templates/bash/ $newprojectfolder
        echo "BASH project created "$projectname
        # Move to new project folder
        cd $newprojectfolder/

        # Rename main script file
        mv ${newprojectfolder}src/script.sh ${newprojectfolder}src/${projectname}.sh
        echo "Renamed script.sh to " $projectname".sh"
        ;;

    * )
        # No language match
        echo "ERROR: No language match found!"
        exit -1
        ;;
esac


# Create Obsidian Note Files


# Initialize local git repo
git init
echo "Git Init Completed"

# Create remote git repo on github
gh repo create $projectname --public --source=. --remote=upstream
echo "Remote repo created on Github"

# First commit
git add .
echo "Git Add . Completed"
git commit -m "First commit - Automated Project Creation"
echo "Git Commit Completed"

# Push local main branch to remote repository
git branch -M main  # Rename the default branch to 'main' if needed
git push -u upstream main  # Push the main branch and set upstream
echo "Git Push Completed"

# Open new project in VS Code
echo "Opening project in VS Code"
exec code /home/janerik/Dokumenter/source/$projectname/
echo "DONE !"
