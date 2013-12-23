# Ecstatic

Ecstatic is a static site generator focused on simplicity. It uses just enough of the right tools, leaving as much power in your hands while still providing plenty of value. Ecstatic is opinionated in favor of [HAML](http://haml.info/), [SASS](http://sass-lang.com/), and [CoffeeScript](http://coffeescript.org/).

Ecstatic provides a straight-forward directory structure for your site. It also provides a mechanism to push either the `master` or `gh-pages` branch to GitHub.

Ecstatic does **not** provide an automatic mechanism for blogging. If you want to use Ecstatic for blogging, you will have to curate your own site structure. Not ideal, but it's not a core feature. Perhaps someone will write a plugin that provides automatic blogging functionality (hint, hint).

Ecstatic is not meant to create ridiculously optimized sites. It will instead make fairly optimized sites. Perhaps, in the future, there can be a plugin ecosystem that takes Ecstatic output and performs further optimization (e.g., pre-gzip, JS Google closure tools advanced compilation, etc.)

## Requirements

You will need Ruby 2.0. It should also run fine on Ruby 1.9.3. Either RVM or rbenv should work. You will also need a way to compile CoffeeScript. Simply having [node.js](http://nodejs.org/) on your machine should suffice.

## Creating a static site for GitHub Pages

Starting from scratch:

    $ mkdir my_site
    $ cd my_site
    $ echo 'ruby-2.0.0' > .ruby-version
    $ echo 'my_site' > .ruby-gemset
    $ cd . # load the gemset when using RVM
    $ gem install bundler
    $ (echo "source 'https://rubygems.org'"; echo "gem 'ecstatic'") > Gemfile
    $ bundle
    $ ecstatic init

If your site is a Github Pages page rather than a user or organization home page, then your last step is different:

    $ ecstatic init --ghpages

## Getting started

After installation and initialization, you should have the following directory tree:

```
.
├── Gemfile
├── Gemfile.lock
├── README.md
├── config.rb
├── gh-pages
└── site
    ├── assets
    │   ├── scripts
    │   └── stylesheets
    └── pages
```

When writing your website, you will focus almost exclusively on the `site` directory. While you're working on your site, you'll want to run `ecstatic server` and view its contents at [localhost:4567](http://localhost:4567).

Ecstatic will automatically compile HAML files in `site/pages/` and SCSS files in `site/assets/stylesheets`. CoffeeScript and JavaScript files live in `site/assets/scripts` -- CoffeeScript will get compiled, while JavaScript files are merely copied into place.

## Deploying to GitHub Pages

Assuming everything worked and you set up your git remotes right, you should be able to deploy with:

```
ecstatic deploy
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push -u origin my-new-feature`)
5. Create new Pull Request
