class TwilioController < ApplicationController

  skip_before_filter :authenticate_user!, :only => "incoming"
  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def incoming
    slack_post
    text_response
  end

  private

    def slack_post
      user = match params[:From]

      data = JSON.parse user.slack_data
      token = data["credentials"]["token"]

      request = HTTParty.post "https://slack.com/api/chat.postMessage",
      header: {
        "Authorization" => "token #{token}",
        "User-Agent" => "Vega"
      },
      query: {
        token: token,
        channel: "random",
        text: "#{params[:Body]}",
        as_user: true
      }
    end

    def text_response
      client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
      client.messages.create(
        from: '+19197565397',
        to: params[:From],
        body: "Your text has been posted to the TIYTextAPP Slack Team."
      )
    end

    def match phone_number
      phone = PhoneNumber.find_by(raw_phone_number: phone_number )
      if phone
        return phone.user
      else
        return nil
      end
    end


end
