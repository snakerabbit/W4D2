class CatRentalRequest < ApplicationRecord
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: {in: %w(APPROVED DENIED PENDING)}
  validate :does_not_overlap_approved_requests

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat,
    dependent: :destroy

  def overlapping_requests
    start_date = self.start_date
    end_date = self.end_date
    CatRentalRequest.where("(start_date BETWEEN ? and ? OR ? BETWEEN start_date and end_date) AND cat_id = ?",start_date, end_date, start_date, self.cat_id)
  end

  def overlapping_approved_requests
    overlapping_requests.where('status = \'APPROVED\' ')
  end

  def does_not_overlap_approved_requests
    if overlapping_approved_requests.exists?
      errors[:start_date] << "Overlaps with approved request"
      errors[:end_date] << "Overlaps with approved request"
    end
  end
end

# t.integer :cat_id, null: false
# t.date :start_date, null: false
# t.date :end_date, null: false
# t.string :status, default: 'PENDING', null: false
