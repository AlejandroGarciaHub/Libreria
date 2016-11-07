# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(email: "admin@admin.com", password: "123456", admin: true)

Category.create(nombre: "Terror")
Category.create(nombre: "Romance")
Category.create(nombre: "Ciencia-Ficcion")
Category.create(nombre: "Drama")
Category.create(nombre: "Policiaco")
Category.create(nombre: "Juvenil")
Category.create(nombre: "Aventuras")
Category.create(nombre: "Fantasia")
