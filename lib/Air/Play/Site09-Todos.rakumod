use Air::Functional :BASE;
use Air::Base;
use Air::Component;

sub hx-create($url --> Hash()) {
    :hx-post("$url"),
    :hx-target<table>,
    :hx-swap<beforeend>,
    :hx-on:htmx:after-request<this.reset()>,
}
sub hx-toggle($url, $id --> Hash()) {
    :hx-get("$url/$id/toggle"),
    :hx-target<closest tr>,
    :hx-swap<outerHTML>,
}
sub hx-delete($url, $id --> Hash()) {
    :hx-delete("$url/$id"),
    :hx-confirm<Are you sure?>,
    :hx-target<closest tr>,
    :hx-swap<delete>,
}

class Todo does Component {
    has Bool $.checked is rw = False;
    has Str  $.text;

    method toggle is routable {
        $!checked = !$!checked;
        respond self;
    }

    multi method HTML {
        tr
            td( input :type<checkbox>, |hx-toggle($.url,$.id), :$!checked ),
            td( $!checked ?? del $!text !! $!text),
            td( button :type<submit>, |hx-delete($.url,$.id), :style<width:50px>, '-'),
    }
}

my &index = &page.assuming(
    title       => 'hÅrc',
    description => 'HTMX, Air, Red, Cro',
    footer      => footer p ['Aloft on ', b 'Åir'],
);

my @todos = do for <one two> -> $text { Todo.new: :$text };

sub SITE is export {
    site :components(@todos),
        index
            main [
                h3 'Todos';
                table @todos;
                form  |hx-create("todo"), [
                    input  :name<text>;
                    button :type<submit>, '+';
                ];
            ]
}
