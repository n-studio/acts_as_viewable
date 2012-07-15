module ActsAsViewable #:nodoc:
  # Module Viewer
  module Viewer
    extend ActiveSupport::Concern

    # Add viewer? response to instance objects
    def viewer?
      false
    end

    #Class methods
    module ClassMethods

      # Add viewer? response to models
      def viewer?
        false
      end
      # Enables the ability to become a viewer
      def acts_as_viewer(*args)
        has_many :views, :class_name => "ActsAsViewable::View", :as => :viewer

        # Updates viewer? response to models
        def self.viewer?
          true
        end

        class_eval do
          include ActsAsViewable::Extenders::Viewer
          # Add viewer? response to instance objects
          def viewer?
            true
          end
        end

      end
    end

  end
end

ActiveRecord::Base.send :include, ActsAsViewable::Viewer
