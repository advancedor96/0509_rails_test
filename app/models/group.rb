class Group < ActiveRecord::Base
	validates :title,  presence: true
	has_many :posts, dependent: :destroy
	belongs_to :user


	def is_editable_by?(user)
		if user && user.id == user_id
			true
		else
			false
		end
	end


end
