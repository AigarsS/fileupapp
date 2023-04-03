# frozen_string_literal: true

class Upload < ApplicationRecord
  belongs_to :user
  has_one_attached :uploaded_file

  scope :for_current_user, ->(user_id) { where(user_id: user_id) }

  scope :between_dates, ->(start_date, end_date) do
    where(created_at: start_date.beginning_of_day..end_date.end_of_day).
      order(created_at: :desc)
  end

  validates :uploaded_file, presence: true
end

# == Schema Information
#
# Table name: attachment_files
#
#  id                                       :bigint           not null, primary key
#  name                                     :string
#  created_at                               :datetime         not null
#  updated_at                               :datetime         not null
#  user_id(Refernce to uploaded file owner) :bigint
#
# Indexes
#
#  index_attachment_files_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
