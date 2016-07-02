class TwilioController < ApplicationController

  skip_before_filter :authenticate_user!, :only => "incoming"
  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def incoming
    slack_post
    boot_twilio
    sms = @client.messages.create(
      from: '+19197565397',
      to: params[:From],
      body: "Your text has been posted to TIYTextAPP Slack Team."
    )
  end

  private

    def slack_post
      request = HTTParty.post "https://slack.com/api/chat.postMessage",
      header: {
        "Authorization" => "token #{ENV["TEST_TOKEN"]}",
        "User-Agent" => "Vega"
      },
      query: {
        token: ENV["TEST_TOKEN"],
        channel: "C1MSM6PLY",
        text: "#{params[:Body]}",
        as_user: true
      }
    end

    def boot_twilio
      @client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
    end


end
