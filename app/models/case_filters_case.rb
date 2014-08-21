class CaseFiltersCase < ActiveRecord::Base
  belongs_to :case
  belongs_to :case_filter
end
