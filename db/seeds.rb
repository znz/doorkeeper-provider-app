# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.where(email: 'admin@example.com').first_or_create(name: 'admin', password: 'adminpass')
admin.add_role(:admin)

User.where(email: 'user@example.com').first_or_create(name: 'user', password: 'password')
