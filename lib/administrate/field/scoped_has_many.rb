require 'administrate/field/has_many'
require 'administrate/field/scoped_has_many/version'
require 'rails/engine'

module Administrate
  module Field
    class ScopedHasMany < Administrate::Field::HasMany
      include ScopedHasManyVersion

      class Engine < ::Rails::Engine
      end

      def to_s
        data
      end

      def to_partial_path
        "/fields/#{self.class.superclass.field_type}/#{page}"
      end

      def self.html_class
        "has-many"
      end

      private

      def candidate_resources
        scope = options[:scope] ? options[:scope].call(self) : associated_class.all
        scope = scope.includes(*options.fetch(:includes)) if options.key?(:includes)

        order = options.delete(:order)
        order ? scope.reorder(order) : scope
      end
    end
  end
end
