# encoding: utf-8

class MotorcyclePhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
