class Donation < ApplicationRecord
  belongs_to :donation_status
  belongs_to :user
  belongs_to :org
  belongs_to :donation_bag

  acts_as_notifiable :users,
  targets: :custom_notification_users,
  group: :article,
  notifier: :user,
  email_allowed: :custom_notification_email_to_users_allowed?,
  notifiable_path: :custom_notifiable_path
end
