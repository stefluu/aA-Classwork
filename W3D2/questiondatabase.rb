require "sqlite3"
require "singleton"
require_relative 'questionfollow'
require_relative 'user'
require_relative 'question'

class QuestionDatabase < SQLite3::Database
  include Singleton
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end


