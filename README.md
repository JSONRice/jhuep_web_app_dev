CS.605.782 Team D Git Repository
============================

Team Members
--------------------
* **Jason Rice** is a software engineer who programs primarily in Java, but has experience in Perl, C++, Python, Ruby, HTML/CSS, and JavaScript. He frequently uses Eclipse, Netbeans, Maven, REST, Spring, Grails, SVN, and Git in his development. He also really enjoys the world of Unix and Linux and his heros include Richard Stallman, Linus Torvalds, and Larry Wall.
* **Matthew Pavan** is a software developer with end to end skills including web development, cloud hosting, and ETL solutions. Matthew is a hard working problem solver who will ensure your development needs are met.

### Github commands:
Command      | Description
------------ | -------------
git branch -v -a|Lists all branches in your repository. Asterisk next to current branch you are working on.
git branch testing|Create testing branch.
git checkout testing|Switch to testing branch.
git branch -b testing|Create and switch to testing branch.
git commit -m "Some changes"|Commit changes with comments to current working branch.
git checkout master|Checkout the master trunk.
git branch -d testing|Remove the testing branch.
git branch -D testing|Force remove testing branch.
git status|Get the status of files in the current repo.


### Git examples:
**Merging a branch into the master**
```
git checkout -b 'hotfix'
Switched to new branch "hotfix"
vim index.html
git commit -a -m 'fixed the broken email address'
...
...
git checkout master
git merge hotfix
```

### Maven and Tomcat:
**Redeploying updated WAR (localhost)**
```
mvn clean install
rm -r /usr/local/tomcat/webapps/jhuep_web_app_dev*
cp target/jhuep_web_app_dev.war /usr/local/tomcat/webapps/
``` 

Optionally a war can be scp'd or sftp'd from your localhost over to dev8 for Tomcat redeployment
