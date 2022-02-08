function obtain_git_branch {
  br=`git branch | grep "*"`
  echo ${br/* /}
}
branch=`obtain_git_branch`
echo 'save and pull ......'
git add .
if [ $# -gt 2 ]
then 
    git commit -m "$1"
    git pull origin "$3"
    git checkout -b "$2"
    git push origin "$2"
elif [ $# -gt 1 ] 
then 
    git commit -m "$1"
    git pull origin test
    echo 'push ......'
    git checkout -b "$2"
    git push origin "$2"
elif [ $# -gt 0 ] 
then
    git commit -m "$1"
    git pull origin test
    echo 'push ......'
    git push origin "$branch"
else
    git commit -m "修复了一些bug"
    git pull origin test
    echo 'push ......'
    git push origin "$branch"
fi

exit
