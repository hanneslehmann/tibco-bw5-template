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

