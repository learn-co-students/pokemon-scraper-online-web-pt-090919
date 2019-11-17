class Pokemon
  
  attr_accessor :name, :type
  attr_reader :id, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id_number)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    db.execute(sql, id_number)
    binding.pry
    # result = DB[:conn].execute(sql, name)[0]
    # Song.new(result[0], result[1], result[2])
  end
  
  
  
end
