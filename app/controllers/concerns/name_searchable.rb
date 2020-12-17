module NameSearchable
  extend ActiveSupport::Concern

  included do 
    scope :search_by_name, -> (value) do
      self.where("name Ilike?", "%#{value}%")
    end
  end 
end 