use Air::Functional :BASE;
use Air::Base;

my @items = <bla ble bli>;

sub SITE is export {
    site
        page
            main
                ul
                    @items.map: { li $_ }
}




#`[
use Component;
use Slang;

component Item {
    has Str $.data;
    method render {
        <li>
            {{$.data}}
        </li>
    }
}

component UlList {
    has Str @.items;
    method render {
        <ul>
            {{
                do for @.items -> $item {
                    <Item data={{$item}} />
                }
            }}
        </ul>
    }
}

say UlList.new(:items<bla ble bli>).render.render
#]