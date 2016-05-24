# Rails CMS Bootstrap

This is a fairly bare bones Rails app illustrating how to create the beginnings of a CMS UI using Rails 5, Postgres 9, and Bootstrap 4.

There is a [demo app](https://rails-cms-bootstrap.herokuapp.com) where you can log in with
admin@example.com / admin.

*NOTE*: I have also put together a [Clojure CMS REST API based on Mongodb](https://github.com/peter/clojure-cms-api). For a CMS with versioning a document database seems like a good fit.

## Features

* The model hierarchy is: Site -> Page -> Widget. The page/widget relationship
  is modeled via an array of IDs in a JSON column in Postgres. It is easier to version documents
  than normalized relational data models.
* There is the beginnings of a simple versioning scheme for the Page model. It saves versions in a PageVersion model.
* The Page model has a publication status and it maintains a unique url (path).
* There is a User model and login/login routes. Authentication is required for all pages.
* There is a change log (audit) for all write operations that are performed by users (editors) of the CMS

## Design Principles

* Simplicity is a prerequisite for reliability
* Be restrictive with library dependencies. This helps with simplicity and Rails upgrades.
* Respect Rails and Ruby idioms

## Getting Started

```
bundle install
bin/rake db:create db:migrate db:seed
bin/rails s
open http://localhost:3000
```

## Deploying to Heroku

Create your app on heroku with the Postgres addon and then do:

```
heroku git:remote -a <my-heroku-app>
git push heroku master
heroku run rake db:migrate db:seed
heroku open
```

## Resources

### Deployment

* [Rails 5 on Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails5)

### Security

* [Rails Strong Parameters](http://edgeapi.rubyonrails.org/classes/ActionController/StrongParameters.html)

### Authentication

* [ActiveModel has_secure_password](http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html)
* [Rails Authentication from Scratch](
http://railscasts.com/episodes/250-authentication-from-scratch)

### Versioning

* [Versioning ActiveRecord](https://github.com/jmckible/version_fu/wiki/State-of-the-Project)

### Auditing

* [Auditing ActiveRecord](https://github.com/collectiveidea/audited)

### CSS

* [Bootstrap 4 for Rails](https://github.com/twbs/bootstrap-rubygem)
* [Bootstrap 4 Admin Theme](http://www.bootstrapzero.com/bootstrap-template/bootstrap-4-admin-dashboard)
* [Bootstrap 4 AdminPlus Theme](http://themeforest.net/item/adminplus-premium-bootstrap-4-admin-dashboard/full_screen_preview/14601290)
