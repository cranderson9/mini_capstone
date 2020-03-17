class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :description, presence: true
  validates :description, length: { in: 10..500}


  def is_discounted?
    price < 10
  end
  
  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  # def supplier
  #   Supplier.find_by(id: supplier_id).id
  # end

  belongs_to :supplier
  has_many :images

  # def neat_created_at
  #   created_at.strftime(%m-%e-%y %H:%M)
  # end

end
