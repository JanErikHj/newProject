#!/bin/zsh
language=$1
projectname=$2
# newprojectfolder="/home/janerik/Dokumenter/source/"$projectname"/"

case $language in
    "c++")
        # Create C++ project
        newprojectfolder="/home/janerik/Dokumenter/source/cppProjects/"$projectname"/"
        cp -r /home/janerik/Dokumenter/source/templates/cpp/ $newprojectfolder
        echo "C++ project created " $projectname
        # Move to new project folder
        cd $newprojectfolder/
        ;;
    "python")
        # Create Python project
        newprojectfolder="/home/janerik/Dokumenter/source/pyProjects/"$projectname"/"
        cp -r /home/janerik/Dokumenter/source/templates/python/ $newprojectfolder
        echo "Python project created "$projectname
        # Move to new project folder
        cd $newprojectfolder/
        ;;
    "zsh")
        # Create zsh project
        newprojectfolder="/home/janerik/Dokumenter/source/bashProjects/"$projectname"/"
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
        newprojectfolder="/home/janerik/Dokumenter/source/bashProjects/"$projectname"/"
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
exec $newprojectfolder
echo "DONE !"
