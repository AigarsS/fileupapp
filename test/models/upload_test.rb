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
require "test_helper"

class AttachmentFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end