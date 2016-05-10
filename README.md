# Rails CMS Bootstrap

This is a fairly bare bones template illustrating how to create the beginnings of a CMS UI using
Rails 5/Postgres 9 using Bootstrap 4.

## Features

* The model hierarchy is: Site -> Page -> Widget. The page/widget relationship
  is modeled via an array of IDs in a JSON column in Postgres. It is easier to version documents
  than normalized relational data models.
* There is the beginnings of a simple versioning scheme for the Page model. It saves versions
  in a PageVersion model.
* Has a simple User model and login/login routes. Authentication is required for all pages.
* There is a change log (audit) for all write operations that are performed by editors in the CMS

## Design Principles

* Simplicity is a prerequisite for reliability
* Be restrictive with library dependencies. This helps with simplicity and Rails upgrades.

## Getting Started

```
bundle install
bin/rake db:create db:migrate
bin/rails c
User.create!(name: 'Admin User', email: 'admin@example.com', password: 'admin')
exit
bin/rails s
open http://localhost:3000
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
