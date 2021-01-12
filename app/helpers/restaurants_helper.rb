module RestaurantsHelper
    def is_chain_restaurant(restaurant)
        if restaurant.is_chain 
            content_tag(:h2, "Chain Restaurant")
        else
            content_tag(:h3, "Independently Owned")
        end
    end

    def name_and_cuisine(restaurant)
        "#{restaurant.name} - #{restaurant.cuisine.name}"
    end

    def filter(param)
        if param == "expensive"
          Restaurant.high_dollar.sort_by_rating
        elsif param == "price"
          Restaurant.sort_by_price
        elsif param != nil
          Restaurant.where('name Like ?', "%#{param}%")
        else
          Restaurant.sort_by_rating
        end
  end

    def display_header(cuisine)
      if cuisine
        content_tag(:h1, "#{cuisine.name} Restaurants")
      else
        content_tag(:h1, "All Restaurants")
      end
    end

    def cuisine_select(f)
      if params[:cuisine_id]
        f.hidden_field :cuisine_id
      else
        render partial: "cuisine_select", locals: {f: f}
      end
    end
end
