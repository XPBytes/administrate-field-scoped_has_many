require 'test_helper'

module Administrate
  module Field
    class CodeTest < Minitest::Test
      def test_that_it_has_a_version_number
        refute_nil Administrate::Field::ScopedHasMany::VERSION
      end

      def test_has_the_correct_partial
        %i[show index form].each do |page|
          reviews = []
          field = Administrate::Field::ScopedHasMany.new(:reviews, reviews, page)
          partial_path = field.to_partial_path

          assert_equal "/fields/has_many/#{page}", partial_path
        end
      end
    end
  end
end
