# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  STATUS_OPTIONS = ['PENDING', 'APPROVED', 'DENIED']
  validates :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: STATUS_OPTIONS}
  validate :does_not_overlap_approved_requests

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: 'Cat'

  private
  
  def overlapping_requests
    CatRentalRequest
      .where(cat_id: self.cat_id)
      .where.not(id: self.id)
      .where.not("end_date < '#{self.start_date}' OR start_date > '#{self.end_date}'")
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_requests
    if overlapping_approved_requests.exists?
      errors[:base] << 'Invalid date range - already taken!'
    end
  end

end
