# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
BagStatus.delete_all
BagStatus.create! id: 1, name: "In Progress"
BagStatus.create! id: 2, name: "Ready"
BagStatus.create! id: 3, name: "Complete"
BagStatus.create! id: 4, name: "Cancelled"
DonationStatus.delete_all
DonationStatus.create! id: 1, name: "In Progress"
DonationStatus.create! id: 2, name: "Pick up requested"
DonationStatus.create! id: 3, name: "Pick up confirmed"
DonationStatus.create! id: 4, name: "Drop off"
DonationStatus.create! id: 5, name: "Complete"
DonationStatus.create! id: 6, name: "Cancelled"
