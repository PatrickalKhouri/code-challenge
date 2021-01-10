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

yukuhiro_account = Account.create(user_id: User.first.id)
sandi_account = Account.create(user_id: User.second.id)
martin_account = Account.create(user_id: User.third.id)
alan_account = Account.create(user_id: User.fourth.id)

p 'Accounts created!!'

p 'Creating credit cards....'

yukuhiro_credit_card = CreditCard.create(account: Account.first, limit: 400000, number: "4485574948951439", flag: "Visa", cvv: "142", expiration_date: "04/2022")
sandi_credit_card = CreditCard.create(account: Account.second, limit: 700000, number: "4485667547631509", flag: "Visa", cvv: "252", expiration_date: "06/2024")
alan_credit_card = CreditCard.create(account: Account.fourth, limit: 1000000, number: "4929677779630842", flag: "Visa", cvv: "870", expiration_date: "07/2024")
martin_credit_card = CreditCard.create(account: Account.third, limit: 200000, number: "5226018916410482", flag: "Mastercard", cvv: "870", expiration_date: "07/2024")

p 'Credit Cards created!!'


p 'Creating Transactions...'

p 'Paid transactions'

Transaction.create(credit_card: CreditCard.first, currency: "usd", amount: 2000, created: rand.to_s[2..11] )
Transaction.create(credit_card: CreditCard.first, currency: "usd", amount: 3000, created: rand.to_s[2..11] )
Transaction.create(credit_card: CreditCard.first, currency: "eur", amount: 6000, created: rand.to_s[2..11] )
Transaction.create(credit_card: CreditCard.first, currency: "eur", amount: 10000, created: rand.to_s[2..11] )
Transaction.create(credit_card: CreditCard.first, currency: "usd", amount: 20000, created: rand.to_s[2..11] )

Transaction.create(credit_card: CreditCard.second, currency: "usd", amount: 3100, created: rand.to_s[2..11] )
Transaction.create(credit_card: CreditCard.second, currency: "usd", amount: 2032, created: rand.to_s[2..11] )
Transaction.create(credit_card: CreditCard.second, currency: "usd", amount: 2301, created: rand.to_s[2..11] )

Transaction.create(credit_card: CreditCard.third, currency: "brl", amount: 23002, created: rand.to_s[2..11] )

Transaction.create(credit_card: CreditCard.fourth, currency: "usd", amount: 22310, created: rand.to_s[2..11] )

p 'Created paid transactions'

p "Creating failed transactions....."

fail_one = Transaction.create(credit_card: CreditCard.third, currency: "usd", amount: 223120, created: rand.to_s[2..11] )
fail_two = Transaction.create(credit_card: CreditCard.third, currency: "usd", amount: 61121, created: rand.to_s[2..11] )
fail_three = Transaction.create(credit_card: CreditCard.third, currency: "usd", amount: 13163, created: rand.to_s[2..11] )

fail_four = Transaction.create(credit_card: CreditCard.fourth, currency: "usd", amount: 221240, created: rand.to_s[2..11] )
fail_five = Transaction.create(credit_card: CreditCard.fourth, currency: "usd", amount: 132131, created: rand.to_s[2..11] )

p "Failed transactions created ....."

p 'Creating disputed transactions...'

disputed_one = Transaction.create(credit_card: CreditCard.first, currency: "brl", amount: 123610, created: rand.to_s[2..11] )
disputed_two = Transaction.create(credit_card: CreditCard.first, currency: "usd", amount: 83121, created: rand.to_s[2..11] )
disputed_three = Transaction.create(credit_card: CreditCard.first, currency: "usd", amount: 666540, created: rand.to_s[2..11] )

disputed_four = Transaction.create(credit_card: CreditCard.second, currency: "usd", amount: 17540, created: rand.to_s[2..11] )
disputed_five = Transaction.create(credit_card: CreditCard.second, currency: "usd", amount: 572140, created: rand.to_s[2..11])

p 'Disputed transactions created!'

p 'Transactions Created'

fail_one.fail
fail_one.save!
fail_two.fail
fail_two.save!
fail_three.fail
fail_three.save!
fail_four.fail
fail_four.save!
fail_five.fail
fail_five.save!
disputed_one.disputed
disputed_one.save!
disputed_two.disputed
disputed_two.save!
disputed_three.disputed
disputed_three.save!
disputed_four.disputed
disputed_four.save!
disputed_five.disputed
disputed_five.save!




# 5 should be disputed transactions:
#  - 3 should be linked to Customer 1 Visa Credit Card
#  - 2 should be linked to customer 2 Visa Credit Card

#t.integer "credit_card_id", null: false
#t.string "currency"
#t.string "amount"
#t.string "status"
#t.string "created"