class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id
  
  # Pokemon initialized w/ keyword arguments of id, name, type & db
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db  
  end
  
  # Save an instance of a pokemon with the correct id
  def self.save(name, type, db)
    # @db = db
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?,?)
    SQL
    
    # db.execute("touch db/pokemon.db")
    # db.execute(sql, name, type)
    # @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    
    db.execute(sql, name, type)
  end
  
  # Find a pokemon from the db by their id number & returns a new Pokemon object
  def self.find(id, db)
    sql = "SELECT * FROM pokemon where id = ?"
    result = db.execute(sql, id)[0]
    new_pokemon = self.new(id:result[0], name:result[1], type:result[2], db:db)
  end
end
