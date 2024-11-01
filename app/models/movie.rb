class Movie < ApplicationRecord
    has_many_attached :photos

    validate :correct_photo_mime_type

    private 

    def correct_photo_mime_type
        if photos.attached?
            photos.each do |photo|
                unless !photo.content_type_in?('image/jpeg', 'image/png')
                    error.add(:photos, 'Deve ser um arquivo jpeg ou png.')
                end
            end
        end
    end
end
