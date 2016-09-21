class Adoption < ApplicationRecord
	belongs_to :user_creator, class_name: 'User'
	belongs_to :user_adopted, class_name: 'User'

	belongs_to :animal
	belongs_to :breed
	has_many :adoptions_images
	belongs_to :location

	attr_accessor :state, :city, :street, :neighborhood, :address_number, :complement, :cep
	delegate :state, :city, :street, :neighborhood, :address_number, :complement, :cep, to: :location

	enum status: {:disabled, :enabled, :finished}
end
