class SpotChangeProposal < ApplicationRecord
  belongs_to :surf_spot
  belongs_to :user

  validates :field_name, :new_value, presence: true
  validates :status, inclusion: { in: [ "pending", "approved", "rejected" ] }

  # Constants for automatic approval threshold
  APPROVAL_THRESHOLD = 5  # Net upvotes needed for automatic approval

  # Method to add an upvote
  def upvote!
    update(upvotes: upvotes + 1)
    check_vote_threshold
  end

  # Method to add a downvote
  def downvote!
    update(downvotes: downvotes + 1)
    check_vote_threshold
  end

  # Method to apply the change if approved
  def apply_change!
    return unless status == "approved"

    # Only apply if the field exists on the surf spot
    if surf_spot.has_attribute?(field_name)
      surf_spot.update(field_name => new_value)
      update(status: "applied")
    end
  end

  private

  # Check if the vote threshold has been reached for automatic approval/rejection
  def check_vote_threshold
    net_votes = upvotes - downvotes

    if net_votes >= APPROVAL_THRESHOLD
      update(status: "approved")
      apply_change!
    elsif net_votes <= -APPROVAL_THRESHOLD
      update(status: "rejected")
    end
  end
end
