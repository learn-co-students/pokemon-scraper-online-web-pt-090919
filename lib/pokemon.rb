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
    sql = <<-SQL
      INSERT INTO pokemon (name, type, db)
      VALUES (?, ?, ?)
    SQL
    
    @db.execute(sql, name, type, db)
    @id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  
  
end
