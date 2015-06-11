require 'rails_helper'

RSpec.describe Course, :type => :model do
  it "should name is valid" do
	    FactoryGirl.build(:courses, name: "teste --- ").should be_valid
	    FactoryGirl.build(:courses, name: nil).should_not be_valid
  end

  it "should state is valid" do
	    FactoryGirl.build(:courses, status: 1).should be_valid
	    FactoryGirl.build(:courses, status: nil).should_not be_valid
  end
end
