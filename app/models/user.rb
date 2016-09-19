class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


 	has_many :adoptions_created, class_name: 'Adoption', inverse_of: :user_creator
 	has_many :adoptions, class_name: 'Adoption', inverse_of: :user_adopted
 	belongs_to :location
 	
  attr_accessor :state, :city, :street, :neighborhood, :address_number, :complement, :cep
	delegate :state, :city, :street, :neighborhood, :address_number, :complement, :cep, to: :location

 	enum gender: [:Masculino, :Feminino]
 	
 	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/default-user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def after_initialize
  	location = Location.new
  end

 	def adoptions_created
    Adoption.where(['user_creator_id = ?', self.id])
 	end

 	def adoptions
 		Adoption.where(['user_adopted_id = ?', self.id])
 	end
end
