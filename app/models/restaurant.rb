class Restaurant < ActiveRecord::Base
	validates :name, :cuisine, :address, presence: true
end
