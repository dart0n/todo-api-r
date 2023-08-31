module Api::V1::Sessions::Operation
  class Destroy < Trailblazer::Operation
    step :destroy_session

    def destroy_session(_ctx, found_token:, **)
      JWTSessions::Session.new.flush_by_token(found_token)
      true
    end
  end
end
