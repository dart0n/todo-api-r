module Api::V1::Sessions::Contract
  class Create < Reform::Form
    feature Reform::Form::Dry

    property :username
    property :password

    validation do
      required(:username).filled(:str?)
      required(:password).filled(:str?)
    end
  end
end
