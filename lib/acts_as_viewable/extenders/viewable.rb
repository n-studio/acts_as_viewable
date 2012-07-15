module ActsAsViewable #:nodoc:
  # Module Extenders
  module Extenders
    # Module Viewable
    module Viewable

      # Add a view for this object
      def viewed_by viewer
        ActsAsViewable::View.viewed_by(viewer, self)
      end

      # Get the view count for this object
      def count_views
        n = views.collect(&:times_viewed).inject(:+)
        n ? n : 0
      end

    end
  end
end