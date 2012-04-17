module ActsAsViewable
  class View < ActiveRecord::Base
    belongs_to :viewable, :polymorphic => true
    belongs_to :viewer, :polymorphic => true

    validates_presence_of :viewable_id
    validates_presence_of :viewer_id


  end
end