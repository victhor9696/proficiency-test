# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :classrooms, class:ClassRoom do
    student_id 1
    course_id 1
    entry_at "2015-06-11 08:51:40"
  end
end
