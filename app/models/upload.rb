class Upload < ActiveRecord::Base
  mount_upload :upload, UploadUploader
  
  validates :arquivo, {less_than: 5.megabytes}
end
