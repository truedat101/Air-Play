use Air::Functional :BASE;
use Air::Base;
use Air::Component;

my &index = &page.assuming( #:REFRESH(5),
    title       => 'hÅrc',
    description => 'HTMX, Air, Red, Cro',
    footer      => footer p ['Aloft on ', b 'Åir'],
);

role HxCounter {
    method hx-increment(--> Hash()) {
        :hx-get("$.url-id/increment"), :hx-target("#$.id"),
        :hx-swap<outerHTML>, :hx-trigger<click>;
    }
    method hx-load(--> Hash()) {
        :hx-get($.url-id), :hx-target<input>,
        :hx-swap<outerHTML>, :hx-trigger<load>;
    }
}

class Counter does Component {
    also does HxCounter;

    has Int $.value = 0;

    method increment is routable {
        $!value++;
        respond self;
    }

    multi method HTML {
        input :$.id, :$.name, :$!value;
    }
}

my $c = Counter.new;

sub SITE is export {
    site :components($c), #:theme-color<red>,
        index
            main [
                h3 'Server Counter:';
                form |$c.hx-increment, [
                    input |$c.hx-load;
                    button :type<submit>, '+';
                ];
            ]
}
