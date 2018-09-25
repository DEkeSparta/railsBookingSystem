# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Room.create(name: 'Tetris', capacity: 8, details: 'a nice room')
Room.create(name: 'Mario', capacity: 8, details: 'a nice room')
Room.create(name: 'Cortana', capacity: 8, details: 'a nice room')
Room.create(name: 'Frogger', capacity: 8, details: 'a nice room')
Room.create(name: 'Zelda', capacity: 8, details: 'a nice room')
Room.create(name: 'BreakOut', capacity: 8, details: 'a nice room')
Room.create(name: 'Pacman', capacity: 8, details: 'a nice room')
Room.create(name: 'Office', capacity: 8, details: 'a nice room')

Booking.create(room_id: 1, description: 'ENG-15', date: "2018/09/24", start: "09:00:00", end: "10:00:00")