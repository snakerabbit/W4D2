class Cat < ApplicationRecord
  CAT_COLORS = %w[black brown tabby white orange]
  validates :color, inclusion: {in: CAT_COLORS}, presence: true
  validates :sex, inclusion: {in: ['M','F']}, presence: true
  validates :birth_date, presence: true
  validates :name, presence: true
  validates :description, presence: true

  def age
    current_date = DateTime.now
    birth_date = self.birth_date
    years_between = current_date.yr - birth_date.yr
    months_between = current_date.mon - birth_date.mon
    days_between = current_date.mday - birth_date.mday
    if months_between < 0
      years_between -= 1
    elsif months_between == 0
      if days_between < 0
        years_between -= 1
      end
    end
    years_between
  end

  has_many :rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest

end
