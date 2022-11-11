class Cat < ApplicationRecord
    CAT_COLORS = ["brown", "tortuga", "white", "void","orange"]

    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: { in: CAT_COLORS }
    validates :sex, inclusion: {in: ["M", "F"] }
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        if birth_date > Date.today
            errors.add(:birth_date, "birth date cannot be in the future")
        end
    end
    
end

# Cat.create(color: "orange", name: "moe", sex: "M", birth_date: "1/1/2010").save