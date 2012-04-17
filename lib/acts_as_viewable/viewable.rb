module ActsAsViewable
  module Viewable
    extend ActiveSupport::Concern

    #Instance method
    def viewable?
      false
    end

    #Class methods
    module ClassMethods

      def viewable?
        false
      end

      def acts_as_viewable(*args)
        has_many :views, :class_name => "ActsAsViewable::View", :as => :viewable

        def self.viewable?
          true
        end

        class_eval do
          include ActsAsViewable::Extenders::Viewable
          def viewable?
            true
          end
        end

      end
    end

  end
end

ActiveRecord::Base.send :include, ActsAsViewable::Viewable
