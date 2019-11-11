class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id = nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL

    db.execute(sql, name, type)

    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(id, db)
      sql = <<-SQL
        SELECT *
        FROM pokemon
        WHERE id = ?
      SQL
      row = db.execute(sql, id).flatten
      pokemon = self.new(id=nil)
      pokemon.id = row[0]
      pokemon.name = row[1]
      pokemon.type = row[2]
      pokemon
    end
  end
