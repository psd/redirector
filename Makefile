#
#
#
www.direct.gov.uk:	mappings.csv mappings.pl
	mappings.pl > $@

# download mappings from Migratorator
# mappings.csv:
	# curl "https://migratorator.production.alphagov.co.uk/mappings/filter/status:closed.csv" > mappings.csv
