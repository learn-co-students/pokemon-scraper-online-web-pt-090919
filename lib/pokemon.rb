class Pokemon
  
  attr_accessor :name, :type
  attr_reader :id, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def save
    if self.id
      self.update
    else
    sql = <<-SQL
      INSERT INTO pokemon (name, type, db)
      VALUES (?, ?, ?)
    SQL
    
  end
  
end
