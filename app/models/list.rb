# frozen_string_literal: true

# List model
class List < ApplicationRecord
  validates :name, :color, presence: true
  validates :name, uniqueness: true
  validates :color, format: { with: /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/,
                              message: 'Only hex colors are permitted.',
                              multiline: true }
end
