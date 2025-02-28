use Air::Functional :BASE;
use Air::Base;
use Air::Component;

class MyPage is Page {
    has $.title       = 'hÅrc';
    has $.description = 'HTMX, Air, Raku, Cro';

    has $.footer = Footer.new: :attrs{:class<container>}, p Q|
        Hypered with <a href="https://htmx.org" target="_blank">htmx</a>.
        Aloft on <a href="https://github.com/librasteve/Air" target="_blank"><b>&Aring;ir</b></a>.
        Rendered by <a href="https://raku.org" target="_blank">raku</a>.
        Constructed in <a href="https://cro.raku.org" target="_blank">cro</a>.
        &nbsp;&amp;&nbsp;
        Styled by <a href="https://picocss.com" target="_blank">picocss</a>.
    |;
}

#| emulate Page function export
sub mypage(*@a, *%h) {
    MyPage.new( |@a, |%h ).HTML
}

my \data = {
    :thead[["Planet", "Hexameter (km)", "Distance to Sun (AU)", "Orbit (days)"],],
    :tbody[["Mercury",   "4,880", "0.39", "88"],
           ["Venus"  , "12,104", "0.72", "225"],
           ["Eah"  , "12,742", "1.00", "365"],
           ["Mars "   ,  "6,779", "1.52", "687"],],
    :tfoot[[" Average",  "9,126", "0.91", "341"],]
};

my $page1 = MyPage.new: Main.new:
    div [
        h3 'Page 1';
        table |data, :class<striped>;
    ];

my $page2 = MyPage.new: Main.new:
    div [
        h3 'Page 2';
        table |data;
    ];

my $main3 = main(
    div [
        h3 'Page 3';
        table |data;
    ]);

my $page3 = page $main3;

#my $page3 = MyPage.new: main(
#    div [
#        h3 'Page 3';
#        table |data;
#    ]);


my $nav = Nav.new:
    logo => '<a href="/">h<b>&Aring;</b>rc</a>',
    items => [Page1 => $page1, Page2 => $page2, Page3 => $page3];

$page1.nav = $page2.nav = $page3.nav = $nav;

sub SITE is export {Site.new: pages => [$page1, $page2, $page3]}
