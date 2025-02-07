use Cro::HTTP::Router;

use Air::Functional :BASE;
use Air::BaseLib;
use Air::Component;

#| write your own role to setup default values and custom attributes
class MyPage does Page {}

#| then each Page instance can reuse the defaults
my $p = MyPage.new:
    description => 'HTMX, Air, Raku, Cro',
    title       => 'HARC Stack',
;
$p.defaults;

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

$p.body: [
    div [
        h3 'Table';
        table |%data, :class<striped>;
    ]
];

class MySite {
#class Site01 does Site {

    method routes {
        route {
            get -> {
                content 'text/html', $p.HTML

            }
        }
    }

}

