require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    arr = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
    SQL

    arr.map!(&:to_sym)
    @columns = arr


  end

  def self.finalize!
    col = self.columns

    col.each do |col|
      define_method(col) do
        @attributes[col]
        # instance_variable_get("@#{col}")
      end

      define_method("#{col}=") do |value|
        # instance_variable_set("@#{col}", value)
        @attributes[col] = value
      end
    end

end

  def self.table_name=(table_name)
    @table_name = table_name
    # ...
  end

  def self.table_name
     @table_name || self.name.underscore.pluralize
    # @table_name = self.tableize
    # ...
  end

  def self.all
    all_things =
    DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}.first

    -- all_things.map{ |thing| SQLObject.new(thing)}
    SQL
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
      params.each do |attr_name, value|
        attr_name = attr_name.to_sym
        class_columns = self.class.columns
          if class_columns.include?(attr_name)
            self.send("attributes")
          else
            raise "unknown attribute '#{attr_name}'"
          end
      end
    # ...
  end

  def attributes
    @attributes = {} unless @attributes

    #attributes = self.finalize! #hash of attributes

    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
