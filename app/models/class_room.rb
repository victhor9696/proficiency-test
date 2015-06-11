class ClassRoom < ActiveRecord::Base
	validates :student_id,presence: true
	validates :course_id,presence: true
	validates :entry_at,presence: true

    belongs_to :student
    belongs_to :course

    before_save :student_classroom?

    def student_classroom?
		stud = ClassRoom.where("student_id = :student and course_id = :course",course: self.course,student: self.student)
    
    	if stud.first.nil?	
    	  return true
    	else
          return false
    	end
    end

end
