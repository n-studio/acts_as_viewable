module ActsAsViewable #:nodoc:
  # Class View
  class View < ActiveRecord::Base
    belongs_to :viewable, polymorphic: true, counter_cache: :views_count
    belongs_to :viewer, polymorphic: true

    validates :viewable_id, presence: true
    # validates :viewer_id, presence: true

    # @scope
    # Get views by the viewable object
    scope :by_viewable, -> (viewable) {
      where(viewable_id: viewable, viewable_type: viewable.class.to_s).
          order("viewable_id ASC")
    }

    # @scope
    # Get views by the viewer object
    scope :by_viewer, -> (viewer) {
      where(viewer_id: viewer, viewer_type: viewer.class.to_s).
          order("viewer_id ASC")
    }


    class << self

      # Adds a new visability to a viewable model
      # If a view from a particular viewer already exists
      #   then will increment the number of views of this viewer
      # In other case it will create a new view
      # @param [Viewer] viewer
      # @param [Viewable] viewable
      def viewed_by(viewer, viewable)
        view = by_viewer(viewer).by_viewable(viewable).first
        if view
          view.update_count!
        else
          create(viewer: viewer, viewable: viewable)
        end
      end
    end

    # Retrieve the last time this view was viewd
    # @alias to updated_at
    def viewed_at
      self.updated_at
    end

    # Increment the count for this view
    def update_count!
      self.times_viewed += 1
      self.past_time_viewed = updated_at
      if self.viewable.respond_to?(:views_count)
        viewable.class.increment_counter(:views_count, self.viewable_id)
      end
      save!
    end

  end
end
