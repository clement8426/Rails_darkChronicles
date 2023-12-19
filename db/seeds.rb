require 'faker'

User.destroy_all
Npc.destroy_all

# Seed Users
mj_user = User.create!(
  email: 'mj@example.com',
  password: 'password',
  type: 'MJ',
  name: 'MJ Name',
  description: 'Description of MJ',
  latitude: 48.8566,  # Latitude for Paris
  longitude: 2.3522   # Longitude for Paris
)

player1 = User.create!(
  email: 'player1@example.com',
  password: 'password',
  type: 'joueur',
  name: 'Player 1',
  latitude: 48.8566,  # Latitude for Paris
  longitude: 2.3522   # Longitude for Paris
)

player2 = User.create!(
  email: 'player2@example.com',
  password: 'password',
  type: 'joueur',
  name: 'Player 2',
  latitude: 48.8566,  # Latitude for Paris
  longitude: 2.3522   # Longitude for Paris
)

# Seed NPCs
clans = %w[Assamites Cappadocian Salubrien Setite Giovanni Lasombra Ravnos Tzimisce Ventrue Brujah Gangrel Malkavian Nosferatu Toreador Tremere humain ghoule inconnu]
sectes = %w[anarch camarilla sabbat]
european_countries = %w[Albania Andorra Austria Belarus Belgium Bosnia_and_Herzegovina Bulgaria Croatia Cyprus Czech_Republic Denmark Estonia Finland France Germany Greece Hungary Iceland Ireland Italy Kosovo Latvia Liechtenstein Lithuania Luxembourg Malta Moldova Monaco Montenegro Netherlands North_Macedonia Norway Poland Portugal Romania Russia San_Marino Serbia Slovakia Slovenia Spain Sweden Switzerland Ukraine United_Kingdom Vatican_City]
generations = %w[Inconnu G-13 G-12 G-11 G-10 G-9 G-8 G-7 G-6 G-5 G-4]

100.times do
  npc = Npc.create!(
    name: Faker::Games::DnD.name,
    generation: generations.sample,
    clan: clans.sample,
    secte: sectes.sample,
    address: european_countries.sample,
    description: Faker::Fantasy::Tolkien.poem,
    user_id: [player1.id, player2.id, mj_user.id].sample
  )
  npc.update(latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
end

puts 'Seed completed successfully.'
