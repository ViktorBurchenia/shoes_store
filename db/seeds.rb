AMOUNT_IMAGES = 3
AMOUNT_SHOES = 25

SHOES_CATEGORY =
  %w[
    running basketball tennis nike adidas puma balenciaga gucci
  ]

def create_shoe
  Shoe.create(
    amount: rand(1..50),
    brand_name: Shoe::BRAND_NAMES.sample,
    category: Shoe::CATEGORIES.sample,
    color: Faker::Color.color_name,
    model: Faker::Lorem.word,
    price: rand(50..300),
    size: Shoe::SIZES.sample,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    image: Faker::LoremFlickr.image(size: "800x600", search_terms: ['sneakers', SHOES_CATEGORY.sample], match_all: true)
  )
end

AMOUNT_SHOES.times do
  create_shoe
end
