class Adoption < ApplicationRecord
	belongs_to :user_creator, class_name: 'User'
	belongs_to :user_adopted, class_name: 'User'

	belongs_to :animal
	belongs_to :breed

	has_many :adoptions_images
end
