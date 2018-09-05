class Reply
  attr_accessor :author_id, :question_id, :parent_reply_id
  def self.find_by_user_id(author_id)
   reply = QuestionDatabase.instance.execute(<<-SQL, author_id)
    SELECT
      *
    FROM
      replies
    WHERE
      author_id = ?
  SQL
  
  result = []
  reply.each do |repl|
    result << Reply.new(repl)
  end

  end 
  
  def self.find_by_question_id(question_id)
    reply = QuestionDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      *
    FROM
      replies
    WHERE
      question_id = ?
    SQL
    
    result = []
    reply.each do |repl|
      result << Reply.new(repl)
    end
    result
  end

  def initialize(options)
    @parent_reply_id = options['parent_reply_id']
    @author_id = options['author_id']
    @question_id = options['question_id']
  end 
  
  def author
    # target = self.id
    User.find_by_id(self.author_id)
  end
  
  def question
    Question.find_by_id(self.question_id)
  end
  
  def parent_reply 
    Reply.find_by_user_id(self.parent_reply_id)
  end 
  
  def child_replies
    Reply.find_by_question_id(self.question_id)
  end
end 


