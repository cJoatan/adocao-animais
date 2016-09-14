class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	has_many :adoptions_created, class_name: 'Adoption', inverse_of: :user_creator
 	has_many :adoptions, class_name: 'Adoption', inverse_of: :user_adopted

 	enum gender: [:Masculino, :Feminino]
 	
 	def adoptions_created
    Adoption.where(['user_creator_id = ?', self.id])
 	end

 	def adoptions
 		Adoption.where(['user_adopted_id = ?', self.id])
 	end
end
