unit class Air::Play;

#use Air::Play::Site01-Simple;
#use Air::Play::Site02-Sections;
#use Air::Play::Site03-Pages;
#use Air::Play::Site04-Elucid8;
use Air::Play::Site05-PagesFunc;
#use Air::Play::Site06-Semantic;


sub routes is export {
    SITE.routes
}

=begin pod

=head1 NAME

Air::Play - blah blah blah

=head1 SYNOPSIS

=begin code :lang<raku>

use Air::Play;

=end code

=head1 DESCRIPTION

Air::Play is ...

=head1 AUTHOR

librasteve <librasteve@furnival.net>

=head1 COPYRIGHT AND LICENSE

Copyright 2025 librasteve

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
