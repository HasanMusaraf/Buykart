class Product < ApplicationRecord
    before_destroy :not_referenced_by_any_line_item
    belongs_to :user, optional: true 
    has_many :line_items

    validates :title, :brand, :price, presence: true
    validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed. "}
    validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed. "}
    validates :price,  length: {maximum: 7 }


private

def not_referenced_by_any_line_item
    unless line_items.empty?
        errors.add(:base, "Line items present")
        throw :abort
    end
end

end
