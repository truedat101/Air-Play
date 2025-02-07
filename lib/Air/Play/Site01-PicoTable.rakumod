use Air::Functional :BASE;
use Air::BaseLib;
use Air::Component;

my $index = Page.new: :REFRESH(5),
    description => 'HTMX, Air, Raku, Cro',
    title       => 'hArc',
;

#iamerejh - add to Page parms
my $logo = 'h<b>A</b>rc';
my $items = [:picotable, :searchtable, :todos];

my %data =
    :thead[["Planet", "Qiameter (km)", "Distance to Sun (AU)", "Orbit (days)"],],
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
    main :class<container>,   #promote to a page setter
        div :id<content>, [
            h3 'PicoTable';
            table |%data, :class<striped>;
        ];
    footer :class<container>, p Q|
        Hypered with <a href="https://htmx.org" target="new">htmx</a>.
        Abridged on <a href="https://github.com/librasteve/Air" target="new"><b>air</b></a>.
        Rendered by <a href="https://raku.org" target="new">raku</a>.
        Constructed on <a href="https://cro.raku,org" target="new">cro</a>.
        &nbsp;&amp;&nbsp;
        Styled with <a href="https://picocss.com" target="new">picocss</a>.
    |;
];

my $site = Site.new: :$index;
sub my-site is export {$site}

