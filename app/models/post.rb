class Post < ActiveRecord::Base
	belongs_to :group
	validates :content,  presence: true

	belongs_to :user

	
	def is_editable_by?(user)
		if user && user.id == user_id
			true
		else
			false
		end
	end


end
