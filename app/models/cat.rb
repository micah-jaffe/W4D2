class Cat < ApplicationRecord
  COLORS = ["black", "brown", "gray", "orange"]
  SEXES = ["M", "F"]

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: SEXES }

  def age
    (DateTime.now - birth_date).to_i / 365
  end

end
