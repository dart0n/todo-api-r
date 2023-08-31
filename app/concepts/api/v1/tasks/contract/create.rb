module Api::V1::Tasks::Contract
  class Create < Reform::Form
    feature Reform::Form::Dry

    property :text
    property :deadline
    property :is_done

    validation do
      configure do
        config.messages = :i18n

        def datetime?(value)
          value.to_datetime
        rescue Date::Error
          false
        end
      end

      required(:text).filled(:str?)
      optional(:deadline).maybe(:datetime?)
      optional(:is_done).maybe(:bool?)
    end
  end
end
