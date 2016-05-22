module MiEdificioServer
  class App
    module StatusHelper

      NO_CONTENT = 204
      NOT_FOUND = 404

      def respond_no_content
        NO_CONTENT
      end

      def respond_not_found
        NOT_FOUND
      end

      def respond_if_condition(condition, &block)
        if (condition)
          block.call(condition)
        else
          respond_not_found
        end
      end

      def respond_not_nil(response_object, &block)
        respond_if_condition(response_object, &block)
      end
    end

    helpers StatusHelper
  end
end