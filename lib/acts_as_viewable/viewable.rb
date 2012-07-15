module ActsAsViewable #:nodoc:
  # Module Viewable
  module Viewable
    extend ActiveSupport::Concern

    # Add viewable? response to instance objects
    def viewable?
      false
    end

    #Class methods
    module ClassMethods

      # Add viewable? response to models
      def viewable?
        false
      end

      # Enables the ability to become a visible
      def acts_as_viewable(*args)
        has_many :views, :class_name => "ActsAsViewable::View", :as => :viewable

        # Updates viewable? response to models
        def self.viewable?
          true
        end

        class_eval do
          include ActsAsViewable::Extenders::Viewable
          # Add viewable? response to instance objects
          def viewable?
            true
          end
        end

      end
    end

  end
end

ActiveRecord::Base.send :include, ActsAsViewable::Viewable
