# Classe para adicionar fotos ao filme
class Movie < ApplicationRecord
  has_many_attached :photos

  validate :correct_photo_mime_type
  validate :photo_size_validation

  private

  def correct_photo_mime_type
      if photos.attached?
          photos.each do |photo|
              unless photo.content_type.in?(%w(image/jpeg image/png))
                  errors.add(:photos, 'Deve ser um arquivo jpeg ou png')
              end
          end
      end
  end

  def photo_size_validation
      if photos.attached?
          photos.each do |photo|
              if photo.byte_size > 5.megabytes
                  errors.add(:photos, 'Deve ser menor que 5MB')
              end    
          end
      end
  end
end