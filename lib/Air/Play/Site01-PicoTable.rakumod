use Cro::HTTP::Router;

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

my $html =
    div [
        h3 'Table';
        table |%data, :class<striped>;
    ]
;

sub routes() is export {
    route {
        get -> {
            content 'text/html', $html

        }
    }
}