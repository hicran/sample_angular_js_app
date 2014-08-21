class CasesLabel < ActiveRecord::Base
  belongs_to :case
  belongs_to :label
end
