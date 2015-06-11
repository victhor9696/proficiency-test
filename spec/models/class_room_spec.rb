require 'rails_helper'

RSpec.describe ClassRoom, :type => :model do
    it "should student is valid" do
	  	FactoryGirl.build(:classrooms, student_id: 1).should be_valid
	    FactoryGirl.build(:classrooms, student_id: "").should_not be_valid
	    FactoryGirl.build(:classrooms, student_id: nil).should_not be_valid
    end
	it "should course is valid" do
	    FactoryGirl.build(:classrooms, course_id: 1).should be_valid
	    FactoryGirl.build(:classrooms, course_id: "").should_not be_valid
	    FactoryGirl.build(:classrooms, course_id: nil).should_not be_valid
	end
	it "should date is valid" do
	    FactoryGirl.build(:classrooms, entry_at: '2015-05-05').should be_valid
	    FactoryGirl.build(:classrooms, entry_at: "").should_not be_valid
	    FactoryGirl.build(:classrooms, entry_at: nil).should_not be_valid 
    end
  
end
