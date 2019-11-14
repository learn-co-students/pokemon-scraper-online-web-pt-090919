class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(dex)
    @id = dex[:id]
    @name = dex[:name]
    @type = dex[:type]
    @db = dex[:db]
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type, db)
      VALUES (?, ?, ?)
    SQL
    DB
  end
  
end
