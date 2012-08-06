#!/usr/bin/env perl

# generate test configuration data ..

use strict;
use String::Random qw(random_string);

my $server_name = @ARGV[0] || "testmappings";
my $nrows = @ARGV[1] || 100;
my $gone = @ARGV[2] || 3;

print "server {\n";
print "  server_name $server_name;\n";

for (my $n = 0; $n < $nrows; $n++) {

	my $old = "http://$server_name"
		. "/" . random_string("cccccccccccccc")
		. "/" . random_string("cccccccccccccc")
		. "/" . random_string("cccccccccccccc")
		. "/" . random_string("cccccccccccccc")
		. "/" . random_string("cccccccccccccc")
		. "/Index.htm";

	my $new = "http://example.com"
		. "/" . random_string("cccccccccccccc")
		. "/" . random_string("cccccccccccccc")
		. "/" . random_string("cccccccccccccc")
		. "/" . random_string("cccccccccccccc")
		. "/" . random_string("cccccccccccccc")
		;

	if ($gone && $n % $gone) {
		print "  rewrite $old $new permanent;\n";
	} else {
		print "  location $old { return 410; }\n";
	}
}

print "}\n";
