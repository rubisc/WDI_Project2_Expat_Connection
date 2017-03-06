class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_attached_file :profile_photo,
                    styles: { medium: "500x500#", thumb: "100x100#" },
                    storage: :s3,
                    url: ":s3_domain_url",
                    path: ":class/:attachment/:id_partition/:style/:filename",
                    s3_region: ENV["S3_REGION"],
                    s3_credentials: Proc.new{ |a| a.instance.s3_credentials }
def s3_credentials
  {
    bucket: ENV["S3_BUCKET_NAME"],
    access_key_id: ENV["S3_ACCESS_KEY_ID"],
    secret_access_key: ENV["S3_SECRET_ACCESS_KEY"]
  }
end
validates_attachment_content_type :profile_photo, content_type: /\Aimage\/.*\Z/


  validates :name,  presence: true, length: { maximum: 40 }
  validates :email, presence: true, length: { maximum: 50 },
            uniqueness: true
  has_secure_password
  # Comment out the below so that update and delete work.
  validates :password, presence: true, length: { minimum: 7 }, if: :should_validate?
  def should_validate?
    new_record? || password.present?
  end
end
