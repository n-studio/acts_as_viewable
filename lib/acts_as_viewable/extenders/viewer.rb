module ActsAsViewable
  module Extenders
    module Viewer

      def views_of viewable
        ActsAsViewable::View.by_viewer(self).by_viewable(viewable).first
      end

    end
  end
end