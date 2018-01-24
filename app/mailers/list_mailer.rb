class ListMailer < ApplicationMailer
  default from: "shoplyBinda@gmail.com"
  layout 'mailer'
  def list_email(user)
    @user = user
    mail(to: @user.email, subject: "List modification")
    end
private
    def bzdury
      mg_client = Mailgun::Client.new ENV['api_key']
      message_params = {:from    => ENV['gmail_username'],
                        :to      => @user.email,
                        :subject => 'Shoply: List has been created or modified',
                        :text    => 'The list has been modified'}
      mg_client.send_message ENV['domain'], message_params  end
end
