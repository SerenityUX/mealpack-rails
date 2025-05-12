class Recipe < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :ingredients, presence: true
    validates :directions, presence: true

    validate :ingredients_are_strings
    validate :directions_are_strings

    private

    def ingredients_are_strings
        unless ingredients.is_a?(Array) && ingredients.all? { |i| i.is_a?(String) }
            errors.add(:ingredients, "must be an array of strings")
        end
    end

    def directions_are_strings
        unless directions.is_a?(Array) && directions.all? { |d| d.is_a?(String) }
            errors.add(:directions, "must be an array of strings")
        end
    end
end
