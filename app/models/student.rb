class Student < ActiveRecord::Base

  validates :name,presence: true
  validates :status,presence: true
  has_many :class_rooms

  def self.status_arr
		return {
			-2 => "Pendente",
			-1 => "Bloqueado",
			2 => "Ativo",
			4 => "Ex-aluno"
		}
	end

	def create_register_number
		while(true)
			number = rand(1000...9999)
			if Student.where(:register_number => number).first.nil?
				return number
			end	
		end
	end

	before_create do
    self.register_number = create_register_number 
  end

end