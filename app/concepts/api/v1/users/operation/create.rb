module Api::V1::Users::Operation
  class Create < Trailblazer::Operation
    step Model(User, :new)
    step Contract::Build(constant: Api::V1::Users::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
  end
end
