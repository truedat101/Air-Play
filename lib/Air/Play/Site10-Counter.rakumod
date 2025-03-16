use Air::Functional :BASE;
use Air::Base;
use Air::Component;

my &index = &page.assuming(
    title       => 'hÅrc',
    description => 'HTMX, Air, Raku, Cro',
    footer      => footer p ['Aloft on ', b 'Åir'],
    );

sub hx-increment(--> Hash()) {
    :hx-get</counter/1/increment>, :hx-target<#counter-input>,
    :hx-swap<outerHTML>, :hx-trigger<click>,
}
sub hx-load(--> Hash()) {
    :hx-get<counter/1>, :hx-target<input>,
    :hx-swap<outerHTML>, :hx-trigger<load>,
}

class Counter does Component {
    has Int $.value = 0;

    method increment is routable {
        $!value++;
        respond self
    }

    multi method HTML {
        input :id<counter-input>, :name<counter>, :value($!value);
    }
}

sub SITE is export {
    site :components(Counter.new),
        index
            main [
                h3 'Server Counter:';
                form |hx-increment, [
                    input |hx-load;
                    button :type<submit>, '+';
                ];
            ]
}
