require 'rubygems'
require 'twilio-ruby'
 
# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC97d26245bd7ae2ce002f206c85927024'
auth_token = '5707512e34f45d0fb983ff97d4c1faf3'
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.messages.create(:body => "Test Twilio",
    :to => "+447721163161",     # Replace with your phone number
    :from => "+441280830048")   # Replace with your Twilio number
puts message.sid