class Category < ApplicationRecord
  
  has_and_belongs_to_many :jobs, class_name: 'Job', join_table: 'categories_jobs'
end
