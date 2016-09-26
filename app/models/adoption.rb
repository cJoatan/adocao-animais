class Adoption < ApplicationRecord
	belongs_to :user_creator, class_name: 'User'
	belongs_to :user_adopted, class_name: 'User'

	belongs_to :animal
	belongs_to :breed
	has_many :adoptions_images
	belongs_to :location
	has_many :comments
	
	attr_accessor :state, :city, :street, :neighborhood, :address_number, :complement, :cep
	delegate :state, :city, :street, :neighborhood, :address_number, :complement, :cep, to: :location

	enum status: {disabled: 0, enabled: 1, finished: 2}

	scope :disabled, -> {where(status: "disabled")}
	scope :enabled, -> {where(status: "enabled")}
	scope :finished, -> {where(status: "finished")}
end
