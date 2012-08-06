all::	testmappings www.direct.gov.uk

www.direct.gov.uk:	mappings.csv mappings.pl
	./mappings.pl > $@

# download mappings from Migratorator
# mappings.csv:
# curl "https://migratorator.production.alphagov.co.uk/mappings/filter/status:closed.csv" > mappings.csv

testmappings:
	mkdir -p testmappings

clean::
	rm www.direct.gov.uk
	rm -rf testmappings
