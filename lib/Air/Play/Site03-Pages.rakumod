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

sub section1 { content $[
    h3 'Section 1';
    table |%data, :class<striped>; ]
}

sub section2 { content $[
    h3 'Section 2';
    table |%data; ]
}

class MyPage is Page {
    has $.title       = 'hArc';
    has $.description = 'HTMX, Air, Raku, Cro';

    has $.footer = Footer.new: :attrs{:class<container>}, p Q|
        Hypered with <a href="https://htmx.org" target="new">htmx</a>.
        Abridged on <a href="https://github.com/librasteve/Air" target="new"><b>air</b></a>.
        Rendered by <a href="https://raku.org" target="new">raku</a>.
        Constructed in <a href="https://cro.raku.org" target="new">cro</a>.
        &nbsp;&amp;&nbsp;
        Styled by <a href="https://picocss.com" target="new">picocss</a>.
    |;
}

my $page1 = MyPage.new: :name<page1>; $page1.main: section1;
my $page2 = MyPage.new: :name<page2>; $page2.main: section2;

my $nav = Nav.new:
    logo => 'h<b>A</b>rc',
    items => [Page1 => $page1, Page2 => $page2];

$page1.nav = $nav;
$page2.nav = $nav;

my $site = Site.new: pages => [$page1,$page2];
sub my-site is export {$site}
