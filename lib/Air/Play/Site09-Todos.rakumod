use Air::Functional :BASE;
use Air::Base;
use Air::Component;

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

class Todo does Component {
    also does HxTodo;

    has Bool $.checked is rw = False;
    has Str  $.text;

    method toggle is routable {
        $!checked = !$!checked;
        respond self;
    }

    multi method HTML {
        tr
            td(input :type<checkbox>, :$!checked, |$.hx-toggle),
            td($!checked ?? del $!text !! $!text),
            td(button :type<submit>, :style<width:50px>, |$.hx-delete, '-'),
    }
}

class Frame does Tag {
    also does HxTodo;

    has Todo @.todos;
    has $.url = "todo";

    multi method HTML {
        div [
            h3 'Todos';
            table @!todos;
            form  |$.hx-create, [
                input  :name<text>;
                button :type<submit>, '+';
            ];
        ]
    }
}

my &index = &page.assuming(
        title       => 'hÅrc',
        description => 'HTMX, Air, Raku, Cro',
        footer      => footer p ['Aloft on ', b 'Åir'],
    );

my @todos = do for <one two 3> -> $text { Todo.new: :$text };

sub SITE is export {
    site :components(@todos), :theme-color<azure>,
        index
            main
                Frame.new: :@todos;
}
