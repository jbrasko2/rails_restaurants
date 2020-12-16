# RAILS RESTAURANTS

active record querying: https://guides.rubyonrails.org/active_record_querying.html#ordering

- create a migration for a Restaurant Model
    - attributes: name:string, cuisine:string, description:text, price(1-4):integer, rating(1-5):integer, is_chain:boolean
- create a model file - inherit from ActiveRecord::Base
- create a controller file
- create model methods
    - #name_and_cuisine
    - #star_generator
    - #dollar_sign_generator
    - .sort_by_price
    - .sort_by_rating
    - .high_dollar
- make an index route
    - create associated action + view
    - add seed data
- make a show route
    - create associated action + view
- add links to go from index to show route
- add links to layout
- add custom route that shows high dollar restaurants
    - create associated action + view
