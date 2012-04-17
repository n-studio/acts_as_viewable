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


    class << self
      def view_by viewer, viewable
        view = by_viewer(viewer).by_viewable(viewable).first
        if view
          view.update_count!
        else
          create(viewer: viewer, viewable: viewable)
        end
      end
    end

    def viewed_at
      self.updated_at
    end


    def update_count!
      self.times_viewed += 1
      self.past_time_viewed = updated_at
      save!
    end

  end
end