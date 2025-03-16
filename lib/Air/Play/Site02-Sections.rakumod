use Air::Functional :BASE;
use Air::Base;

# content
my %data =
    :thead[["Planet", "Diameter (km)", "Distance to Sun (AU)", "Orbit (days)"],],
    :tbody[
        ["Mercury",  "4,880", "0.39",  "88"],
        ["Venus"  , "12,104", "0.72", "225"],
        ["Earth"  , "12,742", "1.00", "365"],
        ["Mars"   ,  "6,779", "1.52", "687"],
    ],
    :tfoot[["Average", "9,126", "0.91", "341"],];

my $Content1 = content [
    h3 'Content 1';
    table |%data, :class<striped>;
];

my $Content2 = content [
    h3 'Content 2';
    table |%data;
];

my $Google = external :href<https://google.com>;

# theme
my &index = &page.assuming( #:REFRESH(5),
    title       => 'hx-arc',
    description => 'HTMX: Air, Raku, Cro',
    nav         => nav(
        logo    => safe('<a href="/">hx-<b>årc</b></a>'),
        items   => [:$Content1, :$Content2, :$Google],
        widgets => [lightdark],
    ),
    footer      => footer p ['Aloft on ', b 'åir'],
);

# site
sub SITE is export {
    site :bold-color<maroon>,
        index
            main $Content1
}