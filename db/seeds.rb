require 'faker'

User.destroy_all
Npc.destroy_all

# Seed Users
mj_user = User.create!(
  email: 'mj@example.com',
  password: 'password',
  type: 'mj',
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
clans = %w[Assamites Lasombra Ravnos Tzimisce Ventrue Brujah Gangrel Malkaviens Nosferatu Toreador Tremere humain ghoule inconnu]
sectes = %w[anarch camarilla sabbat]
pays = %w[France Italy Spain Greece]
generations = %w[Inconnu G-13 G-12 G-11 G-10 G-9 G-8 G-7 G-6 G-5 G-4]

100.times do
  npc = Npc.create!(
    name: Faker::Games::DnD.name,
    generation: generations.sample,
    clan: clans.sample,
    secte: sectes.sample,
    address: Faker::Address.country,
    description: Faker::Fantasy::Tolkien.poem,
    user_id: [player1.id, player2.id].sample
  )
  npc.update(latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
end

puts 'Seed completed successfully.'
