use Air::Functional :BASE;
use Air::Base;
use Air::Component;


my &index = &page.assuming( #:REFRESH(1),
    title       => 'hÅrc',
    description => 'HTMX, Air, Raku, Cro',
    footer      => footer p ['Aloft on ', b safe '&Aring;ir'],
);

sub SITE is export {
    site #:bold-color<blue>,
        index
            main
                div [
                    h3 'Table';
                    table [[1,2],[3,4]], :thead[<Left Right>,];

                    hr;

                    h3 'Grid';
                    grid 1..6;
                ]
}

