class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include Devise::Controllers::Helpers


end
