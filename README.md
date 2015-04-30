tibco-bw5-template
==================

Template TIBCO Business Works 5.12 Project with Makefile to create skeleton


Kickstart BW5.12 Project
------------------------

I have created the a small make file to speed up BusinessWorks Designer Project creation. Additionally it creates some sub-directories which helps keeping the project structure clean.

I will possibly update the make file, so be sure to subscribe to the git repo!

Make based script
-------------------------
Usage:

```bash
make project='somename' 
```

Here comes the make file (can be found in my GitHub repository). It takes an existing bw project stored in a (hidden) directory under *.template* and copies it to the target project name. It then replaces the name in some files needed by TIBCO BW Designer.


```bash
# Makefile 
# Created to speed up initialization of a TIBCO BW 5.12 project
# by Hannes Lehmann
#
# Change following property to reflect your local setup
DESIGNER_BASE=/data/tibco/designer/5.9

PROJ=${project}
PROJDIR=

run:    
ifdef PROJ
	@echo Creating skeleton for a new project called: $(project)
	@cp -R .template/* $(PROJ)
	@sed -i 's/ProjectTemplate/${project}/g' ${project}/vcrepo.dat
	@sed -i 's/ProjectTemplate/${project}/g' ${project}/defaultVars/defaultVars.substvar
else
	@echo Nothing done, try to pass an argument project=
endif

launch:
	cd $(DESIGNER_BASE)/bin/ && $(DESIGNER_BASE)/bin/designer $(CURDIR)/$(PROJ)
	cd $(DIR)
```

ANT based script
-------------------------
Usage:

```bash
ant init 
```

Better (for Windows Batch):

```bash
initProject.bat "MyProject"
```

The AutoIt script/exe makes it even easier to use under Windows.

As the make file above the ANT script takes an existing bw project stored in a (hidden) directory under *.template* and copies it to the target project name. It then replaces the name in some files needed by TIBCO BW Designer.
You have to set an environment variable containing the project name beforehand. For Windows I have created a batch script and an AutoIt Script speeding up the usage.


```ant
<?xml version="1.0" encoding="ISO-8859-1" ?>
<project name="initBWProject" default="init" basedir=".">

<property environment="env"/>
<property name="templatename" value="ProjectTemplate"/>

	<target name="init" >

		<echo message="Initialize project" />
		<echo message="Copy template project to ${env.BWPROJECT}${line.separator}"/>
		<!-- copy the template -->
		<copy todir="${env.BWPROJECT}" overwrite="true">
			<fileset dir=".template" >
				<include name="**/*"/>
			</fileset>
		</copy>
		<!-- search & replace "ProjectTemplate" -->
		<echo message="Configure the project..."/>
		<replace file="${env.BWPROJECT}/vcrepo.dat" token="${templatename}" value="${env.BWPROJECT}"/>
		<replace file="${env.BWPROJECT}/.folder" token="${templatename}" value="${env.BWPROJECT}"/>
		<replace file="${env.BWPROJECT}/defaultVars/defaultVars.substvar" token="${templatename}" value="${env.BWPROJECT}"/>
		
	</target>

</project>

```

Description
-----------

What I do with this script is: run it for creating a new BW project. Before you can use it, either you:

+ clone the git repo.
+ put your BW project template into .template. BUT: the project MUST be named "ProjectTemplate" as this will be searched and replaced!

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
