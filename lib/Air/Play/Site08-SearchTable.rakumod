use Air::Functional :BASE;
use Air::Base;
use Air::Component;

use Air::Play::Site;

my &index = &page.assuming( #:REFRESH(1),
    title       => 'hÅrc',
    description => 'HTMX, Air, Red, Cro',
    footer      => footer p ['Aloft on ', b 'Åir'],
);


sub SITE is export {
    site :components[SearchTable.new],
        index
            main
                div [
                    searchtable :serial(0)
                ]
}
