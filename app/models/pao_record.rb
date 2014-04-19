class PaoRecord < ActiveRecord::Base
  validates_presence_of :pao_number, :pao_person, :pao_action, :pao_object, :pao_image_url
  validates_uniqueness_of :pao_number, :pao_person, :pao_action, :pao_object, :pao_image_url

  scope :by_pao_number, -> { order :pao_number }
end
