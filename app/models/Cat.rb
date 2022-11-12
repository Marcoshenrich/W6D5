require 'date'

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

    def age
        now = Date.today
        d = Date.parse(self.birth_date.to_s)
        before = Date.civil(d.year, d.mon, d.day)
        difference_in_days = (now - before).to_i
        difference_in_days/365
    end
    
end

# Cat.create(color: "orange", name: "moe", sex: "M", birth_date: "1/1/2010").save