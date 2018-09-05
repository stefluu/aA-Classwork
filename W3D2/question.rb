require_relative 'questiondatabase'
class Question 
  attr_accessor :id, :title, :body, :author_id
  
  def self.find_by_id(id)
      question =QuestionDatabase.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM
          questions
        WHERE
          id = ?
    SQL
    Question.new(question.first)
  end
  
  def self.find_by_author_id(author_id)
    question = QuestionDatabase.instance.execute(<<-SQL, author_id)
      SELECT 
        *
      FROM
        questions 
      WHERE 
        author_id = ?
    SQL
    result = []
    question.each do |ques|
      result << Question.new(ques)
    end 
    result  
  end 
  
  def author
    # target = self.id
    User.find_by_id(self.author_id)
  end
  
  def replies
    # target = self.id
    Reply.find_by_question_id(self.id)
  end
  
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end 
end 