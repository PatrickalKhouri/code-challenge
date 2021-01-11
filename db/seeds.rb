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

paid_one = Transaction.create(credit_card: CreditCard.first, currency: "usd", amount: 2000, created: rand.to_s[2..11] )
paid_two = Transaction.create(credit_card: CreditCard.first, currency: "usd", amount: 3000, created: rand.to_s[2..11] )
paid_three = Transaction.create(credit_card: CreditCard.first, currency: "eur", amount: 6000, created: rand.to_s[2..11] )
paid_four = Transaction.create(credit_card: CreditCard.first, currency: "eur", amount: 10000, created: rand.to_s[2..11] )
paid_five = Transaction.create(credit_card: CreditCard.first, currency: "usd", amount: 20000, created: rand.to_s[2..11] )

paid_six = Transaction.create(credit_card: CreditCard.second, currency: "usd", amount: 3100, created: rand.to_s[2..11] )
paid_seven = Transaction.create(credit_card: CreditCard.second, currency: "usd", amount: 2032, created: rand.to_s[2..11] )
paid_eight = Transaction.create(credit_card: CreditCard.second, currency: "usd", amount: 2301, created: rand.to_s[2..11] )

paid_nine = Transaction.create(credit_card: CreditCard.third, currency: "brl", amount: 23002, created: rand.to_s[2..11] )

paid_ten = Transaction.create(credit_card: CreditCard.fourth, currency: "usd", amount: 22310, created: rand.to_s[2..11] )

p 'Created paid transactions'

p 'Creating disputed transactions...'

disputed_one = Transaction.create(credit_card: CreditCard.first, currency: "brl", amount: 1610, created: rand.to_s[2..11] )
disputed_two = Transaction.create(credit_card: CreditCard.first, currency: "usd", amount: 821, created: rand.to_s[2..11] )
disputed_three = Transaction.create(credit_card: CreditCard.first, currency: "usd", amount: 6540, created: rand.to_s[2..11] )

disputed_four = Transaction.create(credit_card: CreditCard.second, currency: "usd", amount: 1700, created: rand.to_s[2..11] )
disputed_five = Transaction.create(credit_card: CreditCard.second, currency: "usd", amount: 5340, created: rand.to_s[2..11])

p 'Disputed transactions created!'

p "Creating failed transactions....."
fail_one = Transaction.create(credit_card: CreditCard.third, currency: "usd", amount: 2223120, created: rand.to_s[2..11] )
fail_two = Transaction.create(credit_card: CreditCard.third, currency: "usd", amount: 61112321, created: rand.to_s[2..11] )
fail_three = Transaction.create(credit_card: CreditCard.third, currency: "usd", amount: 13112363, created: rand.to_s[2..11] )

fail_four = Transaction.create(credit_card: CreditCard.fourth, currency: "usd", amount: 2211240, created: rand.to_s[2..11] )
fail_five = Transaction.create(credit_card: CreditCard.fourth, currency: "usd", amount: 13222131, created: rand.to_s[2..11] )

p "Failed transactions created ....."
p 'Transactions Created'

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