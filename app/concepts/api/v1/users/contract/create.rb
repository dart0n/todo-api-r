module Api::V1::Users::Contract
  class Create < Reform::Form
    feature Reform::Form::Dry

    property :username
    property :email
    property :password
    property :password_confirmation

    validation name: :default do
      configure do
        config.messages = :i18n
      end

      required(:username).filled(:str?)
      required(:email).filled(:str?)
      required(:password).filled(:str?).confirmation
    end

    validation name: :username, if: :default do
      configure do
        def username_unique?(value)
          !User.exists?(username: value)
        end
      end

      required(:username, &:username_unique?)
    end

    validation name: :email, if: :default do
      configure do
        def email_unique?(value)
          !User.exists?(email: value)
        end
      end

      required(:username, &:email_unique?)
    end
  end
end
