require 'pry'

class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db 

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db =  pokemon[:db]
  end 
  
  def self.save(name,type,db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?,?)"

    db.execute(sql, name, type) 
  end 

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL

    db_pokemon = db.execute(sql, id) 
    new_pokemon = {id: db_pokemon[0][0], name: db_pokemon[0][1], type: db_pokemon[0][2], db: db}
    instance = Pokemon.new(new_pokemon)
    instance 
  end 

end
