class Category < ApplicationRecord
	has_many :items
	has_many :sales, through: :items
	has_many :suppliers, through: :items
	has_many :users, through: :items
end
