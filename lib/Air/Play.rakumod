unit class Air::Play;

#use Air::Play::Site01-Simple;
#use Air::Play::Site02-Sections;
#use Air::Play::Site03-Pages;
#use Air::Play::Site04-Elucid8;
#use Air::Play::Site05-PagesFunc;
#use Air::Play::Site06-Semantic;
#use Air::Play::Site07-BaseExamples;
use Air::Play::Site08-SearchTable;
#use Air::Play::Site09-Todos;

sub routes is export {
    SITE.routes
}
