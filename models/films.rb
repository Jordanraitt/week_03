require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "
    INSERT INTO films
    (title, price)
    VALUES
    ($1, $2)
    RETURNING id;
    "
    values = [@title, @price]
    film = SqlRunner.run( sql, values ).first
    @id = film['id'].to_i
  end

  def update()
    sql = "
    UPDATE films
    SET (title, price) = ($1, $2)
    WHERE id = $3;
    "

    values = [@title, @price, @id]

    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM films"
    film_data = SqlRunner.run(sql)
    return Film.map_items(film_data)
  end

  def delete()
    sql = "DELETE * FROM films where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def customers()
    sql = "
    SELECT customers.*
    FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    WHERE tickets.film_id = $1
    "
      customer = SqlRunner.run(sql, [@id])
      result = customer.map do |thingy| Customer.new(thingy)
      end
    return result
  end

end
