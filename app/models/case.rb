class Case < ActiveRecord::Base
  has_many :case_filters_cases
  has_many :case_filters, through: :case_filters_cases
  has_many :cases_labels
  has_many :labels, through: :cases_labels
end
