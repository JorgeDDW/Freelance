class Request < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :attachment_file

  validates :title, presence: { message: "Cannot be Empty."}
  validates :description, presence: { message: "Cannot be Empty."}
  validates :delivery, numericality: { only_integer, true, message: "Cannot be Empty and most be a Number."}
end
