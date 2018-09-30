require_relative('./models/customers.rb')
require_relative('./models/films.rb')
require_relative('./models/tickets.rb')

require('pry')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({
'name' => 'Harold Potinsnew',
'funds' => 20

  })
customer2 = Customer.new({
'name' => 'Ron Wicketton',
'funds' => 40

  })
customer3 = Customer.new({
'name' => 'Henrietta Gildsbury',
'funds' => 100

  })

customer1.save
customer2.save
customer3.save

film1 = Film.new({
  'title' => 'Pirates of the Carribbean',
  'price' => 20
})
film2 = Film.new({
  'title' => 'Howls Moving Castle',
  'price' => 20
})

film1.save
film2.save

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id
  })

ticket3 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film2.id
  })

ticket1.save
ticket2.save
ticket3.save

binding.pry
nil
