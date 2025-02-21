use Air::Functional :BASE;
use Air::BaseLib;
use Air::Component;

my $specification = External.new: :href<https://raku.github.io/rakudoc>;
my $reference     = External.new: :href<https://finanalyst.github.io>;
my $github        = External.new: :href<https://github.com/orgs/elucid8-org/repositories>;
my $talk          = External.new: :href<https://discord.gg/Bthw6vG8>;

# theme
class MyPage is Page {
    has $.title = 'elucid8';

    has $.header = Header.new:
        nav => Nav.new(
            logo    => '<a href="/">elucid<b>=8</b></a>',
            items   => [:$specification,:$reference,:$github,:$talk],
            widgets => [LightDark.new],
        ),
        tagline => Q|<i>a Multilingual Documentation Framework</i>|;

    has $.footer = Footer.new: p Q|
        Hypered with <a href="https://htmx.org" target="_blank">htmx</a>.
        Aloft on <a href="https://github.com/librasteve/Air" target="_blank"><b>&Aring;ir</b></a>.
        Rendered by <a href="https://raku.org" target="_blank">raku</a>.
        Constructed in <a href="https://cro.raku.org" target="_blank">cro</a>.
        &nbsp;&amp;&nbsp;
        Styled by <a href="https://picocss.com" target="_blank">picocss</a>.
    |;
}

my $index = MyPage.new;
$index.main: overview();

sub SITE is export {Site.new: :$index}

sub overview { q:to/END/
<p>elucid8 (pronounced 'elucidate') provides utilities to create, manage, and maintain a set of complex documents that explain
how to use a product in multiple languages. A complex document is one that contains multiple headings, cross-references, tables,
images, words to be indexed, footnotes, and other types of information.</p>

<p>The complex documents are created and maintained in RakuDoc v2. The suite is written in canonical human language (e.g. English), and
there are translations of the suite in other human languages (e.g. French, Spanish, Chinese), which are called the derived languages.</p>

<p>It takes a directory of canonical files, directories of derived languages, renderers them all into HTML, and creates the links between
them so that a user can switch between languages at the section level (a section is one started by a heading). The link to a target
language is presented in that target language.</p>

<p>elucid8 is a Free Open Source Software (FOSS) distribution.</p>

<h2>Motivation</h2>

<p>There are very many CMS (Content Management Systems) available today. Many of them offer multilingual functionality. Websites have
proliferated, and companies now are obliged to maintain documentation on-line.</p>

<p>It is relatively easy now to create a website that combines some text, images, and blogs. Even a novice website designer can achieve
effective websites because of themes and skins that place simple text component, and images together.</p>

<p>It is not so easy to create a website when the underlying document is complex. Corporate professionals are used to creating complex
documents in programs such as MSWord or LibreOffice, with Tables of Contents, Indexes, Tables, Diagrams, etc. Transferring these aspects
to the web is tricky, time-consuming, and error-prone. These challenges intensify when language translations are part of the requirement.</p>

<p>elucid8 is a framework to assemble and to publish consistent information.</p>

<h2>Workflow</h2>

<div class="structure"><pre>

            canonical directory  -|
            derived 1 directory  -|
            derived 2 directory  -|                          | interlinked HTML pages
                                  |->  elucid8             ->|
                                       |-> RakuDoc Render |

</pre></div>

<p>Each directory contains many files in RakuDoc markup. They are rendered one-by-one by the renderer, and then linked by elucid8.</p>

<p>When a change is made to a file in the canonical directory, corresponding sections in the derived files are styled to show
a change is needed.</p>

<p>Each derived file can be separately edited by one person, or across a documentation & translation team. Editing a derived file,
changing an altered section, removes the styling.</p>

<h2>Applicability</h2>

<p>Rakudoc is an easy-to-use markup language for document formatting. It was originally introduced as "POD6" for use with the Raku
programming language. However, all along, its design with the use of metadata options, and its customisability make it far more
than just a tool for software documentation needs. This general capability was dubbed "Plain Old Documentation".</p>

<p>It is applicable to a wide range of situations from a single page that needs translating into a handful of
Western languages to documentation suites of hundreds of pages and translation into dozens of natural languages with deep
support for non-Latin text and the Unicode standard.</p>

<p>elucid8 helps to simplify workflows, save time, avoid errors and save costs.</p>

<p>Many industries and organizations require multi-language documentation to cater to global audiences, comply with regulations,
and improve user experiences. Here are some prominent examples:</P

<p><strong>Industries:</strong></p>
<ul>
  <li>Technology and Software Development</li>
  <li>Healthcare and Pharmaceuticals</li>
  <li>Manufacturing and Engineering</li>
  <li>E-commerce and Retail</li>
  <li>Education and E-learning</li>
  <li>Legal and Financial Services</li>
  <li>Government and Non-Profit Organizations</li>
  <li>Travel and Hospitality</li>
  <li>Media and Entertainment</li>
  <li>Energy and Utilities</li>
</ul>

<p><strong>Organizations:</strong></p>
<ul>
  <li>Multinational Corporations</li>
  <li>Export Businesses</li>
  <li>Educational Institutions</li>
  <li>Healthcare Providers</li>
  <li>Regulatory Bodies</li>
</ul>

<h2>Community</h2>

<p>Please do join us on the elucid8 chat server on <a href="https://discord.gg/Bthw6vG8">Discord</a>! We warmly welcome contributions
and support requests (please file an Issue) over at <a href="ttps://github.com/orgs/elucid8-org/repositories">GitHub</a>.</p>

<h2>Background</h2>

<p>RakuDoc was created together with the Raku language. It is open to any programming langauge and already supports Perl and
JavaScript software documentation needs. Many elements of POD6 (i.e. version 1) were undocumented and were not implemented.
It became clear that an updated specification was needed and recently Rakudoc v2 was released. There is now a generic renderer
which transforms Rakudoc v2 into text output, HTML output, and MarkDown output which is the underlying engine for elucid8.</p>

<p>Rakudoc is a textual markup language like Markdown. In common with Markdown, it offers text-based embedded markup which
helps with readability and compatibility with workflows such as difference checking, merging and translation (unlike most
WYSIWYG Word processors, where the formatting is hidden). However, unlike Markdown, RakuDoc can easily be used to specify a
complex document with inline and block level options and it does not suffer from incompatible variants.</p>

<p>elucid8 is a new solution framework bringing the benefits of Rakudoc to a wider audience.</p>
END
}
