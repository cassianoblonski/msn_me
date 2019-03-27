# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "cassianoblonski", email:"cassianobsampaio@gmail.com", password:"1234")
User.create(username: "rafaela", email:"rafaela@email.com", password:"1234")
User.create(username: "bob", email:"bob@email.com", password:"1234")
User.create(username: "mashrur", email:"mashrur@email.com", password:"1234")
User.create(username: "pedro", email:"pedro@email.com", password:"1234")
User.create(username: "milena", email:"milena@email.com", password:"1234")

Message.create(body: "Hi I'm a new message", user: User.find_by_username("cassianoblonski"))
Message.create(body: "Hi", user: User.find_by_username("rafaela"))
Message.create(body: "Hi guys", user: User.find_by_username("bob"))
Message.create(body: "Whats up?", user: User.find_by_username("mashrur"))


