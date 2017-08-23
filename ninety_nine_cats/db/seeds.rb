# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.delete_all
cat1 = Cat.create(birth_date: '2001-1-13', color: 'black',
                  name: 'Alison', sex: 'F', description: 'first cat')
cat2 = Cat.create(birth_date: '2001-1-3', color: 'tabby',
                  name: 'Thomas', sex: 'M', description: 'second cat')
cat3 = Cat.create(birth_date: '2001-12-25', color: 'white',
                  name: 'Kelly', sex: 'M', description: 'TA cat')

# t.date "birth_date", null: false
# t.string "color", null: false
# t.string "name", null: false
# t.string "sex", null: false
# t.text "description", null: false

CatRentalRequest.delete_all

request1 = CatRentalRequest.create(cat_id: cat1.id, start_date: '2001-2-13', end_date: '2001-3-13')
request2 = CatRentalRequest.create(cat_id: cat2.id, start_date: '2001-2-13', end_date: '2001-3-13', status: 'APPROVED')
request3 = CatRentalRequest.create(cat_id: cat2.id, start_date: '2002-2-13', end_date: '2002-3-13')
request4 = CatRentalRequest.create(cat_id: cat3.id, start_date: '2003-2-13', end_date: '2003-3-13')
