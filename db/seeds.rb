Category.destroy_all
Item.destroy_all

%w{Starters Entrees Drinks Desserts}.each do |category_name|
  Category.create name: category_name, photo_filename: "#{category_name.downcase}.jpg"
end

puts "#{Category.count} categories."

starters_category = Category.find_by_name 'Starters'
# Item.create :category_id => starters_category.id, price: 7, name: 't'..

starters_category.items.create price: 7, name: 'Tiny Hot Dogs', description: 'Too small to see!'
starters_category.items.create price: 5, name: 'Onion Strands', description: 'Better than rings'

entrees_category = Category.find_by_name 'Entrees'
entrees_category.items.create price: 25, name: 'Steak', description: 'T-Bone Steak'

