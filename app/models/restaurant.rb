class Restaurant < ActiveRecord::Base
	validates :name, :cuisine, :address, presence: true
	validates :name, format: { with: /\A[A-Z]/ }
end
