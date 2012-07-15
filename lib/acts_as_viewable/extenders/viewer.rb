module ActsAsViewable #:nodoc:
  # Module Extenders
  module Extenders
    # Module Viewer
    module Viewer

      # Get the views of the +viewable+ objects
      def views_of viewable
        ActsAsViewable::View.by_viewer(self).by_viewable(viewable).first
      end

    end
  end
end