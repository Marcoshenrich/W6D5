class CatRentalRequest < ApplicationRecord
    validates :status, :start_date, :end_date, :cat_id, presence: true

    validates :status, inclusion: ["PENDING","APPROVED","DENIED"]

    validate :does_not_overlap_approved_request

    belongs_to :cat

    def overlapping_requests
        CatRentalRequest.where("(start_date BETWEEN ? AND ?) OR (end_date BETWEEN ? AND ?)", start_date, end_date, start_date, end_date)
    end

    def overlapping_approved_requests
        self.overlapping_requests.where("status = ?", "APPROVED")
    end

    def does_not_overlap_approved_request
        if self.overlapping_approved_requests.exists?
            errors.add(:start_date, "overlapping dates with other request")
        end
    end

end