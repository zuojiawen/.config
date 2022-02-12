# list branch
git branch -a 

# show information about a given remote repo
git remote show origin

git branch <branch_name>     # creat a lacal branch
git branch -b <branch_name>   # creat a branch and swith to it.  
# delete a local branch 
git branch -D <branch_name>
# swith branch
git checkout <branch_name>




# creat a remote branch 
it is in github website

# delete a remote branch 
it is in github website
and you should run 'git remote prune' to remove it in local.
or you can use 'git fetch --prune' to remove it it local.

# merge remote repo and local repo
git fetch 
git merge origin/master
# or you can git pull
