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

