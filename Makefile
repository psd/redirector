all::	www.direct.gov.uk

www.direct.gov.uk:	mappings.csv mappings.pl mappings.sh
	./mappings.sh www.direct.gov.uk < mappings.csv > $@

# download mappings from Migratorator
mappings.csv:
	curl "https://${MIGRATORATOR_AUTH}@migratorator.production.alphagov.co.uk/mappings/filter/status:closed" > $@

testmappings:
	mkdir -p testmappings

clean::
	rm www.direct.gov.uk
	rm -rf testmappings
