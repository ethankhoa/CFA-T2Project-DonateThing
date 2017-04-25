class Org < ApplicationRecord
  belongs_to :user
  has_one :address, :as => :addressable
  has_many :donations

  acts_as_notifiable :users,
  targets: :custom_notification_users,
  group: :article,
  notifier: :user,
  email_allowed: :custom_notification_email_to_users_allowed?,
  notifiable_path: :custom_notifiable_path

end
