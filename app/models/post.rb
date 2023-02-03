class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :not_true_facts

    def not_true_facts
        unless title != "True Facts"
            errors.add(:title, "Title cannot be True Facts")
        end
    end
end
