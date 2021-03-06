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

  
  # belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :product_categories
  has_many :categories, through: :product_categories
  

end
