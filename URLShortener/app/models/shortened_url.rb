require"byebug"
# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :short_url, :long_url, presence: true, uniqueness: true
    
    after_initialize do |user|
        puts "You have initialized an object!"
        generate_short_url
    end

    def self.random_code 
        debugger
        new_url = SecureRandom.urlsafe_base64
        if new_url.exists?
            ShortenedUrl.random_code
        else
            return new_url 
        end
    end

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
private
    def generate_short_url
        self.short_url = ShortenedUrl.random_code
    end
end
