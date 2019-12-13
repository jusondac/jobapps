class Joblist < ApplicationRecord
	validates :title,presence: true,length:{ minimum:5 }
	validates :description,presence:true,length:{ minimum:10 }
	validates :status,presence:true
end
