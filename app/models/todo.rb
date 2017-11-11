class Todo < ApplicationRecord
  validates_presence_of :title, :date
end
