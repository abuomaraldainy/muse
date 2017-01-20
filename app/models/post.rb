class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	# attr_accessor :image_file_name
    has_attached_file :image, styles: { medium: "500x500>", small: "350x250#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
