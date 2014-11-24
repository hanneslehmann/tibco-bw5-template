PROJ=${project}
PROJDIR=

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
	cd /data/tibco/designer/5.9/bin/ && /data/tibco/designer/5.9/bin/designer $(CURDIR)/$(PROJ)
	cd $(DIR)

