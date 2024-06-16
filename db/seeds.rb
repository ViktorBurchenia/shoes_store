Shoe.destroy_all
AMOUNT_IMAGES = 3
AMOUNT_SHOES = 25

def create_shoe
  Shoe.create(
    amount: rand(1..50),
    brand_name: Shoe::BRAND_NAMES.sample,
    category: Shoe::CATEGORIES.sample,
    color: Faker::Color.color_name,
    model: Faker::Lorem.word,
    price: rand(50..300),
    size: Shoe::SIZES.sample,
    images: AMOUNT_IMAGES.times.map { Faker::LoremFlickr.image(size: "800x600", search_terms: ['sneakers', 'running']) }
  )
end

AMOUNT_SHOES.times do
  create_shoe
end
