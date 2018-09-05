require_relative 'questiondatabase'
class User
  attr_accessor :id, :fname, :lname
  
  def self.find_by_id(id)
      user =QuestionDatabase.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM
          users
        WHERE
          id = ?
    SQL
    p user
    User.new(user.first)
  end
  
  def self.find_by_name(fname, lname)
    user = QuestionDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT 
        *
      FROM 
        users 
      WHERE 
        fname = ? AND lname = ?
    SQL
    User.new(user.first)
  end 
  
  def self.authored_questions(author_id)
    Question.find_by_author_id(author_id)
  #   user = QuestionDatabase.instance.execute(<<-SQL, author_id)
  #     SELECT 
  #       title, body 
  #     FROM 
  #       questions  
  #     WHERE 
  #       author_id = ?
  #   SQL
  # end 
  end 
  
  def self.authored_replies(user_id)
    Reply.find_by_user_id(user_id)
  end 
  
  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
    
  end
end
