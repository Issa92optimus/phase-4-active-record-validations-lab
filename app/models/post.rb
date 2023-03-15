class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_is_sufficiently_clickbaity

    def title_is_sufficiently_clickbaity
        if title
            unless title.include?("Won't Believe") || title.include?("Secret") || title.match?(/Top\s\d/) || title.include?("Guess")
            errors.add(:title, "title is not sufficiently clickbait-y")
            end
        end
    end
end
