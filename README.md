# Ecstatic

Ecstatic is a static site generator focused on simplicity. It uses just enough of the right tools, leaving as much power in your hands while still providing plenty of value. Ecstatic is opinionated in favor of [HAML](http://haml.info/), [SASS](http://sass-lang.com/), and [CoffeeScript](http://coffeescript.org/).

Ecstatic provides a straight-forward directory structure for your site and concatenates scripts and stylesheets. It also provides a mechanism to push either the `master` or `gh-pages` branch to GitHub.

Ecstatic does **not** provide an automatic mechanism for blogging. If you want to use Ecstatic for blogging, you will have to curate your own site structure. Not ideal, but it's not a core feature. Perhaps someone will write a plugin that provides automatic blogging functionality (hint, hint).

Ecstatic is not meant to create ridiculously optimized sites. It will instead make fairly optimized sites. Perhaps, in the future, there can be a plugin ecosystem that takes Ecstatic output and performs further optimization (e.g., pre-gzip, js closure compilation, etc.).

## Requirements

You will need Ruby 1.9.3 or greater (it may work with earlier versions of 1.9.x, but they are not tested). You will also need a way to compile CoffeeScript. Simply having [node.js](http://nodejs.org/) on your machine should suffice.

## Creating a static site for GitHub Pages

Starting from scratch:

    $ mkdir my_site
    $ cd my_site
    $ echo 'rvm use 1.9.3@my_site --create' > .rvmrc && cd . # if you're using rvm
    $ gem install bundler
    $ (echo 'source :rubygems'; echo "gem 'ecstatic'") > Gemfile
    $ bundle
    $ rake init

## Getting started

After installation and initialization, you should have the following directory tree:

    .
    ├── .gitignore
    ├── .rvmrc
    ├── Gemfile
    ├── Gemfile.lock
    ├── README.md
    ├── Rakefile
    ├── site
    │   ├── assets
    │   │   ├── fonts
    │   │   └── images
    |   ├── pages
    |   │   └── index.haml
    │   ├── scripts
    │   |   └── site.coffee
    │   └── stylesheets
    │       ├── fonts.scss
    |       └── site.scss
    ├── tmp
    │   └── js
    └── vendor

When writing your website, you will focus almost exclusively on the `site` directory. While you're working on your site, you'll want to run `rake server` and view its contents at [localhost:4567](http://localhost:4567). The server functionality will compile your content on demand to the root directory of your project (sadly, necessary for GitHub Pages).

## Deploying to GitHub Pages

### Preconditions

You must commit your code to git. Ecstatic will not do that for you. In addition, contrary to typical application development, you must commit the generated files to git. This is a limitation of GitHub pages. (If someone could provide a sample .gitattributes file to ease this process, I'd appreciate it.)

There are two ways to GitHub Pages can handle sites:

1. on the `gh-pages` branch for projects
2. on the `master` branch for users/organizations

There are, however, three use cases for Ecstatic on Github:

1. Provide a site as a reference or supplement to a project
2. Provide a home site for a user or organization
3. The site *is* the project. (Perhaps a rich client-side application that can be statically generated and would otherwise be hosted on a VPS or Heroku or ...).

In the first two cases, you'll want to deploy with `rake deploy:current_branch`. This will, unsurprisingly, deploy by pushing the current branch, whether `master` or `gh-pages`. In the third case, you'll want to deploy with `rake deploy:merge_to_gh_pages_first`. This will merge the current branch to the `gh-pages` branch before pushing.

These task names are a bit long. That's ok, because the intent is that you add one of the following lines to your Rakefile:

    # By default, the deploy rake task does not exist.
    # Pick one of the following to define it:

    # Use this if you deploy the site by pushing the current branch
    task deploy: 'deploy:current_branch'

    # OR use this if you deploy the site by merging it to `gh-pages` first
    task deploy: 'deploy:merge_to_gh_pages_first'

Then, to deploy, you simply issue:

    $ rake deploy

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push -u origin my-new-feature`)
5. Create new Pull Request
