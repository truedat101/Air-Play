use Air::Functional :BASE;
use Air::Base;
use Air::Component;

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

my $Content1 = Content.new: $[
    h3 'Content 1';
    table |%data, :class<striped>; ];

my $Content2 = Content.new: $[
    h3 'Content 2';
    table |%data; ];

my $Google = External.new: :href<https://google.com>, 'Google';

# theme
class MyPage is Page {
    has $.title       = 'hÅrc';
    has $.description = 'HTMX, Air, Raku, Cro';

    has $.nav = Nav.new:
        logo => '<a href="/">h<b>&Aring;</b>rc</a>',
        items => [:$Content1, :$Content2, :$Google];

    has $.footer = Footer.new: :attrs{:class<container>}, p Q|
        Hypered with <a href="https://htmx.org" target="_blank">htmx</a>.
        Aloft on <a href="https://github.com/librasteve/Air" target="_blank"><b>&Aring;ir</b></a>.
        Rendered by <a href="https://raku.org" target="_blank">raku</a>.
        Constructed in <a href="https://cro.raku.org" target="_blank">cro</a>.
        &nbsp;&amp;&nbsp;
        Styled by <a href="https://picocss.com" target="_blank">picocss</a>.
    |;
}

sub SITE is export {
    Site.new:
        MyPage.new:
            Main.new: $Content1.HTML;
}
