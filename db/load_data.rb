10.times do |i|
  Spree::Store.create({
    name: "Store#{i}",
    address: "Random address",
    latitude: 55.6498661 + 2*rand - 1,
    longitude: 37.606152 + 2*rand - 1,
    code: rand(1000),
    url: "test.ru", 
    mail_from_address: "Test address"
  })
end

products = Spree::Product.all

options = []

options.push(small = Spree::OptionValue.where(name: 'Small').first)
options.push(medium = Spree::OptionValue.where(name: 'Medium').first)
options.push(large = Spree::OptionValue.where(name: 'Large').first)
options.push(extra_large = Spree::OptionValue.where(name: 'Extra Large').first)

colors = []

colors.push(red = Spree::OptionValue.where(name: 'Red').first)
colors.push(blue = Spree::OptionValue.where(name: 'Blue').first)
colors.push(green = Spree::OptionValue.where(name: 'Green').first)

index = 100
100.times do |i|
  variant =
  {
    product: products[rand(products.count)],
    option_values: [options[rand(options.count)], colors[rand(colors.count)]],
    sku: "ROR-000#{index+i}",
    cost_price: rand(30)+5,
    store_id: rand(10)
  }
  Spree::Variant.create!(variant) if Spree::Variant.where(product_id: variant[:product].id, sku: variant[:sku]).none?
end