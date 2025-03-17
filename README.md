[![License: Artistic-2.0](https://img.shields.io/badge/License-Artistic%202.0-0298c3.svg)](https://opensource.org/licenses/Artistic-2.0)

### WORK IN PROGRESS ###

Please raise an Issue if you would like to feedback or assist.

# Air::Play

Playing with the HARC stack (HTMX, Air, Red, Cro)
Examples with Pico CSS

path is
1. get to the point where I can build a website on Cro the right way
2. build a static site example that could be a new design for raku.org and then offer it to the team,
3. add htmx based edit / preview to certain pages for admin (like the current rakudoc site), with raku syntax highlighting with Rainbow and
4. do something similar for markdown

---

# Local

## GETTING STARTED

Install raku - eg. from [rakubrew](https://rakubrew.org), then:

### Install Air, Cro & Red
- `zef install --/test cro`
- `zef install Cro::WebApp`
- `zef install Red --exclude="pq:ver<5>"`
- `zef install https://github.com/librasteve/Air.git"

### Install this repo
- `git clone https://github.com/librasteve/Air-Play.git`
- `cd Air-Play` && `zef install .`

### Run and view it
- `export WEBSITE_HOST="0.0.0.0" && export WEBSITE_PORT="3000"`
- `raku -Ilib service.raku`
- Open a browser and go to `http://localhost:3000`

Select the example site you want by commenting out the others in the `Play.rakumod` file.

You will note that cro has many other options as documented at [Cro](https://cro.raku.org) if you want to deploy to a production server.

---

# Server

## Development

### Pico CSS (IntelliJ)
install sass (in the static/css dir)
- follow this [guide](https://www.jetbrains.com/help/webstorm/transpiling-sass-less-and-scss-to-css.html)
    - install IJ sass & file watcher plugins
    - `cd static/css`
    - `brew install npm`
    - `npm install -g sass`
    - `npm install @picocss/pico`
    - in styles.css, `@use "node_modules/@picocss/pico/scss";`
    - `sass styles.scss styles.css`  [target is then styles.scss/styles]
    - `--load-path=node_modules/@picocss/pico/scss/`
      from https://picocss.org
- some tweaks to root styles (mainly to reduce scale) from [here](https://github.com/picocss/pico/discussions/482)

## Deployment
- `zef install https://github.com/librasteve/Air-Play.git --deps-only --/test`
- `git clone https://github.com/librasteve/Air-Play.git && cd Air-Play`
- `zef install . --force-install --/test`
- adjust .cro.yml for your needs (e.g. HTTPS) -or-
- `export WEBSITE_HOST="0.0.0.0" && export WEBSITE_PORT="3000"`
- `raku -Ilib service.raku` -or-
- `nohup raku service.raku >> server.log 2>&1`  <=== detach from terminal [note PID]
- `tail -f server.log` and finally `kill -9 PID`  [ps -ef | grep raku]

## Build
this site runs on a linux server preloaded with git, raku, zef (& docker-compose)
- `sudo apt-get install build-essentials` (for Digest::SHA1::Native)
- viz. https://chatgpt.com/share/6748a185-c690-8009-96ff-80bf8018dd7d
    - `sudo apt-get install nginx`
    - `sudo systemctl start nginx`
    - `sudo systemctl enable nginx`
    - etc
    - `vi simple.raku`   <= port to 8888
    - `raku simple.raku`
- using librasteve for certbot

---

# COPYRIGHT AND LICENSE

Copyright(c) 2025 Henley Cloud Consulting Ltd.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

---

---

# BACKLOG
- gnat css https://github.com/gnat/css-scope-inline?tab=readme-ov-file
- pico/gnat css to Theme module
- picocss.com left nav
- language switcher
- sitemap & robots.txt
  - https://www.xml-sitemaps.com/details-elucid8.org-74ab32874.html
  - https://github.com/tristangoossens/php-sitemap-generator/tree/main
  - https://developers.google.com/search/docs/crawling-indexing/robots/create-robots-txt
- htmx forms
- do all pico examples https://picocss.com/docs/
- do all htmx examples
- docker deployment
eg
```
docker build -t this .
docker run --rm -p 8888:8888 this
```
