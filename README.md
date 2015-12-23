# Venice
[![GitHub version](https://badge.fury.io/gh/alexkravets%2Fvenice.svg)](https://badge.fury.io/gh/alexkravets%2Fvenice)
[![Code Climate](https://codeclimate.com/github/alexkravets/venice/badges/gpa.svg)](https://codeclimate.com/github/alexkravets/venice)

*Where art meets technology.*

`v` `e` `n` `i` `c` `e` is boilderplate website & blog implementation based on
[Character](https://github.com/slate-studio/chr) library. It's used as
boilerplate for new Rails projects or quick prototypes.

Homepage: https://github.com/alexkravets/venice

## Installation

It assumes you have a machine equipped with Ruby & Mongodb.

1. Install the Venice gem using the [RubyGems](https://rubygems.org) package
manager:

  ```bash
  gem install venice-chr
  ```

2. Then kick off a new project:

  ```bash
  venice new your-project-name
  ```

## Shortcuts

We’ve also included some handy shortcuts with Venice:

- Install dependencies and clear the Git remote:

  ```bash
  venice setup
  ```

Default admin account is `user@example.com`:`password`.

- Run the deploy (supported platforms: Heroku):

  ```bash
  venice deploy
  ```

Default admin account: is `user@example.com`:`password`. After deploy is
finished, please login and create a new account, then remove default one.

- Start Venice server:

  ```bash
  rails s
  ```

## Related Gems

Venice is based on a bunch of open source gems. You might be interested to have
a look into those to get better understanding of how things do work inside:

- [Character](https://github.com/slate-studio/chr): Powerful responsive
javascript CMS for apps
- [Formagic](https://github.com/slate-studio/formagic): Building forms with
CoffeeScript
- [Journal](https://github.com/alexkravets/journal): Posts and pages
implementation with templates and CMS modules
- [Tape](https://github.com/alexkravets/tape): Basic RSS reader that integrates
into CMS
- [Ants](https://github.com/slate-studio/ants): Utility gem with helpers and
concerns that are used on the backend and CMS
- [Loft](https://github.com/slate-studio/loft): Media assets manager for
Character CMS
- [Mongosteen](https://github.com/slate-studio/mongosteen): An easy way to add
CRUD actions for Mongoid models


## Contributing

If you'd like to contribute a feature or bugfix: Thanks! To make sure your
fix/feature has a high chance of being included, please read the following
guidelines:

1. Fork the repository
2. Make your changes
3. Push your branch to your fork
4. Post a [pull request](https://github.com/alexkravets/venice/compare).

Thank you to all
[the contributors](https://github.com/alexkraves/venice/contributors)!
