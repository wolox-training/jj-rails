# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
    User.create(email: 'julian.salas@wolox.com.ar', password: '12345678', first_name: 'Julian', last_name: 'Salas Perilli')
    
    Book.create(gender: 'Detective fiction', author: 'Sir Arthur Conan Doyle', image: 'https://google.com.ar', title: 'A Study in Scarlet', editor: 'Ward Lock & Co', year: '1887')

    Rent.create(user_id: User.first.id, book_id: Book.first.id, begin_date: '2019-12-19', end_date: '2019-12-21')
end