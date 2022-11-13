class CatRentalRequest < ApplicationRecord
    validates :status, :start_date, :end_date, :cat_id

    validates :status, inclusion: ["PENDING","APPROVED","DENIED"]

    belongs_to :cat
end