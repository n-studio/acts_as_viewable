module ActsAsViewable
  module Viewer
    extend ActiveSupport::Concern

    #Instance method
    def viewer?
      false
    end

    #Class methods
    module ClassMethods

      def viewer?
        false
      end
      def acts_as_viewer(*args)
        has_many :views, :class_name => "ActsAsViewable::View", :as => :viewer

        def self.viewer?
          true
        end

        class_eval do
          include ActsAsViewable::Extenders::Viewer
          def viewer?
            true
          end
        end

      end
    end

  end
end

ActiveRecord::Base.send :include, ActsAsViewable::Viewer
