module ActsAsViewable
  class View < ActiveRecord::Base
    belongs_to :viewable, :polymorphic => true
    belongs_to :viewer, :polymorphic => true

    validates_presence_of :viewable_id
    validates_presence_of :viewer_id


    scope :by_viewable, lambda{ |viewable|
      where(viewable_id: viewable, viewable_type: viewable.class.to_s).
          order("viewable_id ASC")
    }

    scope :by_viewer, lambda{ |viewer|
      where(viewer_id: viewer, viewer_type: viewer.class.to_s).
          order("viewer_id ASC")
    }

  end
end