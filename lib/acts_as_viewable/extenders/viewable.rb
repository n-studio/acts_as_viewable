module ActsAsViewable
  module Extenders
    module Viewable

      def viewed_by viewer
        ActsAsViewable::View.view_by(viewer, self)
      end

      def count_views
        views.collect(&:times_viewed).inject(:+)
      end

    end
  end
end