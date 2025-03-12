use Air::Functional :BASE;
use Air::Base;
use Air::Component;

my &index = &page.assuming( #:REFRESH(1),
    title       => 'hÅrc',
    description => 'HTMX, Air, Raku, Cro',
    footer      => footer p ['Aloft on ', b safe '&Aring;ir'],
);

role HxTodo {
    method hx-toggle(--> Hash()) {
        :hx-get("$.url/$.id/toggle"),
        :hx-target<closest tr>,
        :hx-swap<outerHTML>,
    }

    method hx-create(--> Hash()) {
        :hx-post("$.url"),
        :hx-target<table>,
        :hx-swap<beforeend>,
        :hx-on:htmx:after-request<this.reset()>,
    }

    method hx-delete(--> Hash()) {
        :hx-delete("$.url/$.id"),
        :hx-confirm<Are you sure?>,
        :hx-target<closest tr>,
        :hx-swap<delete>,
    }
}

class Todo does HxTodo does Component {
    has Bool $.checked is rw = False;
    has Str  $.text;

    method toggle is routable {
        $!checked = !$!checked;
        respond self;
    }

    method HTML {
        tr
            td(input :type<checkbox>, :$!checked, |$.hx-toggle),
            td($!checked ?? del $!text !! $!text),
            td(button :type<submit>, :style<width:50px>, |$.hx-delete, '-'),
    }
}

class Frame does Tag does HxTodo {
    has Todo @.todos;
    has $.url = "todo";

    method HTML {
        div [
            table @!todos;
            form  |$.hx-create, [
                input  :name<text>;
                button :type<submit>, '+';
            ];
        ]
    }
}

my @todos = do for <one two three> -> $text { Todo.new: :$text };

sub SITE is export {
    site :components(@todos),
        index
            main
                div [
                    h3 'Todos';
                    Frame.new: :@todos;
                ]
}
