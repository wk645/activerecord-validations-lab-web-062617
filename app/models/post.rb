class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
	validate :clickbait_validation

	def clickbait_validation
		words = /(Won't Believe | Secret | Top | Guess)/i
		if !words.match(title)
			errors.add(:title, "clickbait")
		end
	end
end

#  pattern = /(Won't Believe|Secret|Top|Guess)/i
#  	if !pattern.match(title)
#  	errors.add(:title, "clickbait")