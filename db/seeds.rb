# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
#
def name_gen
name_ar = []
  while name_ar.length < 29
    name_ar << Faker::FunnyName.name
    if name_ar.uniq == name_ar
    else
      name_ar.pop
    end
  end
  name_ar
end

names = name_gen
i=0
29.times do
  Attendee.create(name: names[i], email: Faker::Internet.free_email("#{names[i]}"), phone_number: Faker::PhoneNumber.cell_phone)
  i += 1
end

def item_gen
item_ar = []
  while item_ar.length < 29
    item_ar << Faker::Food.dish
    if item_ar.uniq == item_ar
    else
      item_ar.pop
    end
  end
  item_ar
end
items = item_gen

i = 0
29.times do
  Item.create(name: items[i], cost: rand(1..30), attendee_id: rand(1..29))
  i += 1
end
