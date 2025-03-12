use Air::Functional :BASE;
use Air::Base;
use Air::Component;

use Air::Play::Site;

my @components = [SearchTable.new];

my &index = &page.assuming( #:REFRESH(1),
    title       => 'hÅrc',
    description => 'HTMX, Air, Raku, Cro',
    footer      => footer p ['Aloft on ', b safe '&Aring;ir'],
);

sub SITE is export {
    site :@components,
        index
            main
                div [
                    searchtable :id(0)
                ]
}
