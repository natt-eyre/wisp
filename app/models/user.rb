class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :omniauthable, :omniauth_providers => [:vkontakte]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create!
  end
end
