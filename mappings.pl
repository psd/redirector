#!/usr/bin/env perl

use strict;
use Text::CSV;
use Data::Dumper;

my $csv = Text::CSV->new({ binary => 1 });

my $server_name = "www.direct.gov.uk";

print "server {\n";
print "  server_name $server_name;\n";

open my $fh, "<:encoding(utf8)", "mappings.csv" or die "mappings.csv: $!";

my $titles = $csv->getline($fh);

while (my $row = $csv->getline($fh)) {

        #Title,Old Url,New Url,Status,Notes,Group,Name,Whole Tag
	my ($title, $old, $new, $status, $notes, $group, $tag) = @$row;

	$old =~ s/^https*:\/\/$server_name//;
	if ($status =~ "301") {
		print "  location $old { add_header Location: $new; return 301; }\n";
	} elsif ($status =~ /^\d{3}$/) {
		print "  location $old { return $status; }\n";
	} else {
		print  "# invalid status for $old\n";
	}
}

$csv->eof or $csv->error_diag();
close $fh;

print "}\n";
