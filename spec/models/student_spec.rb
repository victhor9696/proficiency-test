require 'rails_helper'

RSpec.describe Course, :type => :model do
  it "should name is valid" do
	    FactoryGirl.build(:students, name: "teste --- ").should be_valid
	    FactoryGirl.build(:students, name: nil).should_not be_valid
  end

  it "should state is valid" do
	    FactoryGirl.build(:students, status: 1).should be_valid
	    FactoryGirl.build(:students, status: nil).should_not be_valid
  end
end
