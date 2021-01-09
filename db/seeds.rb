# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Transaction.destroy_all
CreditCard.destroy_all
Account.destroy_all
User.destroy_all
 
p 'Creating users....'
yukuhiro = User.create(first_name: "Yukuhiro", last_name: "Matsumoto")
sandi = User.create(first_name: "Sandi", last_name: "Matz")
martin = User.create(first_name: "Martin", last_name: "Fowler")
alan = User.create(first_name: "Alan", last_name: "Kay")

p  'Users created!'

p 'Creating accounts....'

yukuhiro_account = Account.create(user_id: User.first)
sandi_account = Account.create(user_id: User.second)
martin_account = Account.create(user_id: User.third)
alan_account = Account.create(user_id: User.fourth)

p 'Accounts created!!'

p 'Creating credit cards....'

yukuhiro_credit_card = CreditCard.create(account_id: Account.first, limit: 400000, number: "4485574948951439", flag: "Visa", cvv: "142", expiration_date: "04/2022")
sandi_credit_card = CreditCard.create(account_id: Account.second, limit: 700000, number: "4485667547631509", flag: "Visa", cvv: "252", expiration_date: "06/2024")
alan_credit_card = CreditCard.create(account_id: Account.fourth, limit: 1000000, number: "4929677779630842", flag: "Visa", cvv: "870", expiration_date: "07/2024")
martin_credit_card = CreditCard.create(account_id: Account.third, limit: 200000, number: "5226018916410482", flag: "Mastercard", cvv: "870", expiration_date: "07/2024")

p 'Credit Cards created!!'


p 'Creating Transactions...'


Transaction.create(credit_card_id: CreditCard.first, currency: "usd", amount: 40000, status: "paid", created: rand.to_s[2..11] )

# - 5 Should be linked to Customer 1 Visa Credit Card
# - 3 Should be linked to Customer 2 Visa Credit Card
# - 1 Should be linked to Customer 3 MasterCard Credit Card
# - 1 Should be linked to Customer 4 Visa Credit Card


#t.integer "credit_card_id", null: false
#t.string "currency"
#t.string "amount"
#t.string "status"
#t.string "created"