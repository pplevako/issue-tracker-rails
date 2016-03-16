class Task < ActiveRecord::Base
  belongs_to :user

  enum status: [:new_task, :in_progress, :approved, :done]
end
