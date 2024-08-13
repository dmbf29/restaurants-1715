# Fill the DB with some instances we can use
puts "Cleaning the DB..."
Restaurant.destroy_all

CHEFS = %w[Akitaka Ali Anamol Cadeyrn Chae Eri Igor James Joe🇺🇸 Joe🇹🇭 Jonas Kevin Max Mia Mint Nicholas Pierre Ryo Ryuya Steven Sunjun Yu Yuta]
CATEGORIES = %W[burger ramen sushi desserts healthy kebabs pizza tacos sandwiches dumplings soup curry rice pasta steakhouse vegan bakery juice salads seafood brunch wings cafe bbq deli pies buffet pub brasserie shakes creamery grill]

def get_category(name)
  last_word = name.split.last.downcase
  CATEGORIES.include?(last_word) ? last_word : CATEGORIES.sample
end

neighborhoods = %w[Aobadai Komaba Meguro Mita Nakacho Nakameguro Ohashi Shimomeguro Yutenji]

puts "Creating #{CHEFS.count} Restaurants..."
CHEFS.shuffle.each do |name|
  restaurant_name = Faker::Restaurant.unique.name
  Restaurant.create!(
    name: "#{name}'s #{restaurant_name}",
    rating: rand(3..5),
    address: "#{rand(1..3)}-#{rand(1..11)} Meguro, Meguro ku, Tokyo",
    # address: "4-12-18, Meguro, Tokyo, 153-0064, Japan ",
    category: get_category(restaurant_name),
    chef_name: name,
  )
end
puts "... created #{Restaurant.count} restaurants"
# coords = [
#   [35.63388, 139.70817],
#   [35.63484, 139.70750],
#   [35.63556, 139.70571],
#   [35.63391, 139.70609],
#   [35.63206, 139.70791],
#   [35.63298, 139.70941]
# ]

# addresses = coords.map do |coord|
#   results = Geocoder.search(coord)
#   results.first.address
# end
# p addresses
