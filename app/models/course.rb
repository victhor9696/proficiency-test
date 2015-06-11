class Course < ActiveRecord::Base

	validates :name,presence: true
	validates :status,presence: true
	belongs_to :class_room

	def self.status_arr
		return {
			-2 => "Pendente",
			-1 => "Bloqueado",
			1 => "Ativo",
			2 => "Aguardando homologação"
		}
	end

end
