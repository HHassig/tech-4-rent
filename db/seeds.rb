require "csv"
require "open-uri"

csv_text = File.read(Rails.root.join('lib','seeds','users.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'UTF-8')

csv.each do |row|
  file = URI.open(row["profile_picture"])
  puts "opened url #{row["profile_picture"]}"
  user = User.new({ first_name: row["first_name"], last_name: row["last_name"], email: row["email"], password: row["password"], username: row["username"], user_type: row["user_type"] })
  puts "user.new #{user.id} done"
  user.profile_picture.attach(io: file, content_type: "image/png", filename: "#{user.id}.jpg")
  puts "attached photo"
  user.save!
  puts "saved"
end

csv_text = File.read(Rails.root.join('lib','seeds','laptops.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'UTF-8')

csv.each do |row|
  file = URI.open(row["photo"])
  puts "opened url #{row["photo"]}"
  laptop = Laptop.new({ year_built: row["year_built"], brand: row["brand"], model: row["model"], screen_size: row["screen_size"], hard_drive: row["hard_drive"], ram: row["ram"], user_id: row["user"].to_i, price: row["price"], address: row["address"] })
  puts "laptop.new done"
  laptop.photo.attach(io: file, content_type: "image/png", filename: "laptop#{laptop.id}.jpg")
  puts "attached photo"
  laptop.save!
  puts "saved"
end

csv_text = File.read(Rails.root.join('lib','seeds','bookings.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'UTF-8')

csv.each do |row|
  booking = Booking.new({ user_id: row["user"], laptop_id: row["laptop_id"].to_i, duration: row["duration"] })
  puts "booking.new done"
  booking.save!
  puts "saved"
end
