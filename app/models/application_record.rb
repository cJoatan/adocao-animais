class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  default_scope -> { reverse_order }
end
