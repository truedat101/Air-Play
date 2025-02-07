#!/usr/bin/env raku

use lib "../lib";
use Cro::HTTP::Router;
use Cro::HTTP::Server;

use Air::Play::Site01-PicoTable;
my $site = MySite.new;

my Cro::Service $http = Cro::HTTP::Server.new(
    http => <1.1>,
    host => "0.0.0.0",
    port => 3000,
    application => $site.routes,
);
$http.start;
say "Listening at http://0.0.0.0:3000";
react {
    whenever signal(SIGINT) {
        say "Shutting down...";
        $http.stop;
        done;
    }
}

