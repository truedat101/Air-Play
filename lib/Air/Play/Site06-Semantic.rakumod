use Air::Functional :BASE;
use Air::Base;
use Air::Component;

# site

sub SITE is export {
site
  page :styled-aside, [
    header $[
      h1 'Welcome to My Blog';
      nav $[
        :Home(   internal :href<#home>),
        :Blog(   internal :href<#blog>),
        :About(  internal :href<#about>),
        :Contact(internal :href<#contact>),
      ];
    ];
    main $[
      div [
        section :id<blog>, [
          h2 'Latest Blog Posts';
          article [
            h3 'The Importance of Semantic HTML';
            p safe 'Published on <time datetime="2025-02-23">February 23, 2025</time>';
            p 'Semantic HTML is crucial for accessibility, SEO, and maintainable code. In this post, we explore its benefits and best practices.';
            button 'Read More';
          ];

          article [
            h3 'Getting Started with Pico CSS';
            p safe 'Published on <time datetime="2025-02-20">February 20, 2025</time>';
            p 'Pico CSS is a minimal CSS framework that makes designing beautiful websites easy. Learn how to get started in this beginner-friendly guide.';
            button 'Read More';
          ];
        ];

        section :id<contact>, [
          h2 'Contact Us';
          form [
            label :for<name>, 'Name:';
            input :type<text>, :id<name>, :name<name>, :required;

            label :for<email>, 'Email:';
            input :type<email>, :id<email>, :name<email>, :required;

            label :for<message>, 'Message:';
            textarea :id<message>, :name<message>, :required;

            button :type<submit>, 'Send';
          ];
        ];
      ];
      aside :id<about>, [
        h2 'About Me';
        p "I'm a web developer passionate about creating accessible and user-friendly websites.";

        h3 'Recent Posts';
        ul [
          li a :href<#>, 'The Future of Web Designs';
          li a :href<#>, '10 CSS Tricks You Should Know';
          li a :href<#>, 'Why Accessibility Matters';
        ];

        h3 'Follow Me';
        nav $[
          :Twitter( external :href<#>),
          :GitHub(  external :href<#>),
          :LinkedIn(external :href<#>),
        ];
      ];
    ];

    footer
      p safe '&copy; 2025 My Blog. All rights reserved.';
  ]
}