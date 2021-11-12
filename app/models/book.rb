class Book < ApplicationRecord
    has_many :flows, dependent: :destroy
end
