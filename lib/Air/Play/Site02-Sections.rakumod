use Air::Functional :BASE;
use Air::BaseLib;
use Air::Component;

my %data =
    :thead[["Planet", "Diameter (km)", "Distance to Sun (AU)", "Orbit (days)"],],
    :tbody[
        ["Mercury",  "4,880", "0.39",  "88"],
        ["Venus"  , "12,104", "0.72", "225"],
        ["Earth"  , "12,742", "1.00", "365"],
        ["Mars"   ,  "6,779", "1.52", "687"],
    ],
    :tfoot[["Average", "9,126", "0.91", "341"],],
;

my $section1 = Section.new:
    div :id<content>, [
        h3 'Section1';
        table |%data, :class<striped>;
    ];

my $section2 = Section.new:
    div :id<content>, [
        h3 'Section2';
        table |%data;
    ];

my $nav = Nav.new:
    logo => 'h<b>A</b>rc',
    items => [Section1 => $section1, Section2 => $section2];

my $footer = Footer.new: :attrs{:class<container>}, p Q|
    Hypered with <a href="https://htmx.org" target="new">htmx</a>.
    Abridged on <a href="https://github.com/librasteve/Air" target="new"><b>air</b></a>.
    Rendered by <a href="https://raku.org" target="new">raku</a>.
    Constructed in <a href="https://cro.raku.org" target="new">cro</a>.
    &nbsp;&amp;&nbsp;
    Styled by <a href="https://picocss.com" target="new">picocss</a>.
|;

my $index = Page.new: :$nav, :$footer, #:REFRESH(5),
    description => 'HTMX, Air, Raku, Cro',
    title       => 'hArc';

$index.main: $section1.HTML;

my $site = Site.new: :$index;
sub my-site is export {$site}
