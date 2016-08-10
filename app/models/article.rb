class Article < ActiveRecord::Base
 extend FriendlyId

 before_validation { image.clear if @delete_image }
   has_attached_file :image,
     :styles => {  :large => "600x600>",:medium => "300x300>", :thumb => "150x150#"  },
     :storage => :dropbox,
     :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
     :dropbox_options => {
       :path => proc { |style| "#{style}/#{id}_#{image.original_filename}"},
       :unique_filename => true
     }
   #validates :image, :attachment_presence => true
   # Validate content type
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
   # Validate filename
   validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /jpg\Z/]

   def delete_image
     @delete_image ||= false
   end

   def delete_image=(value)
     if value
       self.image = nil
     end
     @delete_image  = !value.to_i.zero?
   end



 friendly_id :title, use: :slugged
end
