class Pokemon
  
  attr_accessor :id, :name, :type, :db
  @@all = []
  
  def initialize(id:, name:, type:, db:)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    @@all.push(self)
  end
  
  def self.all
    @@all
  end
  
  def self.save(name, type, db)
    new = self.new(id: nil, name: name, type: type, db: db)
    
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?);
    SQL
    
    db.execute(sql, name, type)
    new.id = db.execute("SELECT last_insert_rowid() FROM pokemon;")[0][0]
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL
    
    pokemon_array = db.execute(sql, id).first
    self.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], db: db)
  end
  
  
  
end
