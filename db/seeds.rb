10.times do 
    Cuisine.create({
        name: Faker::Restaurant.type
    })
end


50.times do 
    Restaurant.create({ 
        name: Faker::Restaurant.name, 
        cuisine_id: rand(1..10) , 
        description: Faker::Restaurant.description, 
        price: rand(1..4), 
        rating: rand(1..5), 
        is_chain: rand(2) == 1 ? true : false
    })
end