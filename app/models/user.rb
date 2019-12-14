class User < ApplicationRecord
	include Humanizer 
	require_human_on :create

	validates :username,presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, uniqueness: true,on: :create,length:{minimum:5},confirmation: true
end
