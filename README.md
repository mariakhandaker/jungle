# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Screenshots
!["about page"](https://github.com/mariakhandaker/jungle/blob/master/jungle%20images/about%20page.png)
!["admin categories page"](https://github.com/mariakhandaker/jungle/blob/master/jungle%20images/admin%20all%20categories.png)
!["admin products page"](https://github.com/mariakhandaker/jungle/blob/master/jungle%20images/admin%20all%20products.png)
!["admin create new product"](https://github.com/mariakhandaker/jungle/blob/master/jungle%20images/admin%20new%20product.png)
!["admin create new category"](https://github.com/mariakhandaker/jungle/blob/master/jungle%20images/admin_new_category.png)
!["apparel category with sold out badge"](https://github.com/mariakhandaker/jungle/blob/master/jungle%20images/apparel%20category%20with%20sold%20out%20badge%20over%20sold%20out%20item.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
