AMOUNT_IMAGES = 3
AMOUNT_SHOES = 25
NUMBER_OF_ORDERS = rand(4..5)
SHOES_CATEGORY = %w[running basketball tennis nike adidas puma balenciaga gucci].freeze
EMAIL_MANAGER = 'manager_123@gmail.com'.freeze
EMAIL_CUSTOMER = 'customer_123@gmail.com'.freeze
USER_PASSWORD = 'password'.freeze

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

def create_user(account_type:, email:)
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: email,
    password: USER_PASSWORD,
    account_type: account_type,
    confirmed_at: Time.now
  )
  user.skip_confirmation!
  user.save!
  user
end

def create_order(user)
  shoe = Shoe.all.sample
  Order.create(
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.zip_code,
    user: user,
    shoe: shoe
  )
end

# Create Users
create_user(account_type: User::MANAGER, email: EMAIL_MANAGER)
customer = create_user(account_type: User::CUSTOMER, email: EMAIL_CUSTOMER)

# Create Shoes
AMOUNT_SHOES.times { create_shoe }

# Create Orders
NUMBER_OF_ORDERS.times { create_order(customer) }

puts "Seeding completed successfully!"
