tibco-bw5-template
==================

Template TIBCO Business Works 5.12 Project with Makefile to create skeleton


Kickstart BW5.12 Project
------------------------

I have created the a small make file to speed up BusinessWorks Designer Project creation. Additionally it creates some sub-directories which helps keeping the project structure clean.

I will possibly update the make file, so be sure to subscribe to the git repo!

Usage:

```bash
make project='somename' 
```

Here comes the make file (can be found in my GitHub repository). It takes an existing bw project stored in a (hidden) directory under *.template* and copies it to the target project name. It then replaces the name in some files and creates some additional sub-directories.



```bash
# Makefile 
# Created to speed up initialization of a TIBCO BW 5.12 project
# by Hannes Lehmann
#

PROJ=${project}
PROJDIR=
DESIGNER_BASE=/data/tibco/designer/5.9

run:    
ifdef PROJ
	@echo Creating skeleton for a new project called: $(project)
	@mkdir -p ${project}/Schemas 
	@mkdir -p ${project}/Processes
	@mkdir -p ${project}/Services
	@mkdir -p ${project}/Resources  
	@cp -R .template/* $(PROJ)
	@sed -i 's/1template1/${project}/g' ${project}/vcrepo.dat
	@sed -i 's/1template1/${project}/g' ${project}/defaultVars/defaultVars.substvar
else
	@echo Nothing done, try to pass an argument project=
endif

launch:
	cd $(DESIGNER_BASE)/bin/ && $(DESIGNER_BASE)/bin/designer $(CURDIR)/$(PROJ)
	cd $(DIR)
```

What I do with this script is: run it for creating a new BW project. Before you can use it, either you:

+ create a project called '1template1' and change the directory to '.template'
+ clone the git repo.

Eventually I will add additional functionality to the script (possibly remove the dependency on the template project).

Best Practice for BW project structure
--------------------------------------

Create some folder insider your project collecting/grouping functions together. For example the Makefile above will create following directories:

* Schemas (for XSDs, WSDLs, etc.)
* Processes (put your bw processes here)
* Services (if any WebServices are created, collect them here)
* Resources (any http, jdbc or whatever else is needed)

This is only a recommendation and a really flat hierarchy. Avoid to create to many folders/subdirs as it should still be usable (remember: some OSses/Systems don't like really long path names).


Be sure to follow [my blog](http://hanneslehmann.github.io/)
