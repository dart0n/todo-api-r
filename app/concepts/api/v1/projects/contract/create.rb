module Api::V1::Projects::Contract
  class Create < Reform::Form
    feature Reform::Form::Dry

    property :name

    validation do
      required(:name).filled(:str?)
    end
  end
end
