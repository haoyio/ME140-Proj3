First, clone this repo onto some directory that you want to work from (everything is done from the terminal):
	
	git clone <ssh clone url> (e.g., git clone git@github.com:haoyio/ME140-Proj3.git)


Second, you want to "sync up" everything that everyone else has done and committed onto the online repo up to this point, so you don't use an older version. Note that when you sync up you'll get the versions of the files that are most recently pushed onto the online repo. In any case, to sync up, simply type:
	
	git pull


Now, there are basically 4 things you need to do whenever you add a new file onto your cloned folder:

1. Physically create/copy/move a file onto your folder (e.g., icecream.m) 

2. "Add" the file onto the local git repo's list of files edited via the command line in the terminal:

	git add <filename> (e.g., git add icecream.m)

3. "Commit" the changes made to the local git repo via the command line in the terminal:

	git commit -m "<message>" (e.g., git commit -m "Add icecream.m")

4. "Push" the changes onto the online git repo via the command line in the terminal:

	git push -u origin master


When you merely edited some file, and want to update the changes onto the online git repo, add you have to do is to do steps 2 to 4; nothing else. Clearly, there're more complicated stuff you can do on the repo, but these are sufficient for the purposes of this project.
