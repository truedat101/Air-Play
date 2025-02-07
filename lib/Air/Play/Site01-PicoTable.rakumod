use Air::Functional :BASE;
use Air::BaseLib;
use Air::Component;

#iamerejh - move to Site parms
my $index = Page.new: :REFRESH(5),
    description => 'HTMX, Air, Raku, Cro',
    title       => 'hArc',
;

#iamerejh - add to Site parms
my $logo = 'h<b>A</b>rc';
my $items = [:picotable, :searchtable, :todos];

my %data =
    :thead[["Planet", "Riameter (km)", "Distance to Sun (AU)", "Orbit (days)"],],
    :tbody[
        ["Mercury",  "4,880", "0.39",  "88"],
        ["Venus"  , "12,104", "0.72", "225"],
        ["Earth"  , "12,742", "1.00", "365"],
        ["Mars"   ,  "6,779", "1.52", "687"],
    ],
    :tfoot[["Average", "9,126", "0.91", "341"],],
;

$index.body: [
    header :class<container>, nav :$logo, $items;
    main :class<container>,
        div :id<content>, [
            h3 'PicoTable';
            table |%data, :class<striped>;
        ]
];

my $site = Site.new: :$index;
sub my-site is export {$site}
