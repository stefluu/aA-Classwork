require_relative 'questiondatabase'
require_relative 'question'
require_relative 'user'
class QuestionFollow
  def self.find_by_id(id)
    question_follow = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    
    QuestionFollow.new(question_follow)
  end
  
  def self.followed_questions_for_user_id(user_id)
    question_follow = QuestionDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        * 
      FROM 
        questions 
      INNER JOIN 
        users 
      ON users.id = question_follows.user_id 
      WHERE 
        question.author_id = user_id
      SQL
  result = [] 
   question_follow.each do |ques| 
     result << QuestionFollow.new(ques)
   end 
   result 
 end 
  
  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end 
