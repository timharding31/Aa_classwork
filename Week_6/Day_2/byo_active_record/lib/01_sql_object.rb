require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject 
  def self.columns
    @all_cols ||= DBConnection.execute2(<<-SQL)
      SELECT * 
      FROM #{self.table_name}
    SQL
    @all_cols[0].map { |col| col.to_sym }
  end

  def self.finalize!
    self.columns.each do |col| 
      define_method(col) do
        self.attributes[col]
      end 

      define_method("#{col}=") do |val|
        self.attributes[col] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.tableize
  end

  def self.all
    res = DBConnection.execute(<<-SQL)
      SELECT #{table_name}.*
      FROM #{table_name}
    SQL

    parse_all(res)
  end

  def self.parse_all(results)
    results.map do |res|
      self.new(res) 
    end
  end

  def self.find(id)
    res = DBConnection.execute(<<-SQL, id)
      SELECT #{table_name}.*
      FROM #{table_name}
      WHERE #{table_name}.id = ?
    SQL
    parse_all(res)[0]
  end

  def initialize(params = {})
    params.each do |attr_name, val| 
      attr_name_sym = attr_name.to_sym 
      raise "unknown attribute '#{attr_name_sym}'" if !self.class.columns.include?(attr_name_sym)
      self.send("#{attr_name_sym}=", val)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
