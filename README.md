# RAILS RESTAURANTS

# Day 6 To Do:
- When/how to use nested routes? [Nested Routes](https://guides.rubyonrails.org/routing.html#nested-resources)

# Day 5 To Do:
- When/Why use layouts? [Action View Layouts](https://api.rubyonrails.org/classes/ActionView/Layouts.html) - [Rendering Layouts](https://guides.rubyonrails.org/v5.2/layouts_and_rendering.html#structuring-layouts)
- When/Why use partials? [Action View Partials](https://guides.rubyonrails.org/action_view_overview.html#partials)
- When/Why use helpers? [Action View Helpers](https://guides.rubyonrails.org/action_view_helpers.html)

# Day 4 To Do:
- Why use nested forms?
- [Action View Form Helpers](https://guides.rubyonrails.org/form_helpers.html#nested-forms)
- Collection select for existing Cuisines
- Nested form for new Cuisine 
- Nested form to create 3 new restaurants when creating a cuisine

# Day 3 To Do:
- Why use AR model validations as opposed to view or controller validations
- Use the [Active Record Validations Guide](https://guides.rubyonrails.org/active_record_validations.html#common-validation-options) to add standard validations for our models
- Display error messages using  `.errors`
- Create custom validations

# Day 2 To Do:
- create a form for making new restaurants
    - demonstrate creating the same form with form_tag, form_for, and form_with
- create a form for editing a restaurant
- add a button to delete a restaurant

# Day 1 To Do:
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

[active record querying](https://guides.rubyonrails.org/active_record_querying.html#ordering)

```
<form action="/restaurants" method="post">
    <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
    <label>Name:</label>
    <input type="text" name="restaurants[name]">
    <input type="submit" value="Create">
</form>

<hr>

<%= form_tag(restaurants_path) do %>
    <%= label_tag("Name:") %>
    <%= text_field_tag("restaurants[name]") %>
    <%= submit_tag("Create") %>
<% end %>

<hr>

<%= form_for(@restaurant) do |f| %>
    <%= f.label("Name:") %>
    <%= f.text_field(:name) %>
    <%= f.submit %>
<% end %>

<hr>

<%= form_with(model: @restaurant) do |f| %>
    <%= f.label("Name:") %>
    <%= f.text_field(:name) %>
    <%= f.submit %>
<% end %>
```