module ActsAsViewable
  module Extenders
    module Viewable

      def viewed_by viewer
        ActsAsViewable::View.create(viewer: viewer, viewable: self)
      end

      def count_views
        ActsAsViewable::View.by_viewable(self).count
      end

    end
  end
end