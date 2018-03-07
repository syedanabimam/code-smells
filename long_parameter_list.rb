# BAD
# app/mailers/mailer.rb
class Mailer < ActionMailer::Base
  default from: 'from@example.com'

  def completion_notification(first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    mail(
      to: email,
      subject: 'Thank you for completing the survey'
    )
  end
end

completion_notification(first_name, last_name, email)

# BETTER
class Mailer < ActionMailer::Base
  default from: 'from@example.com'

  def completion_notification(recipient)
    @recipient = recipient
    mail(
      to: recipient.email,
      subject: 'Thank you for completing the survey'
    )
  end
end

# Struct
Recepient = Struct.new(:first_name, :last_name, :email)
recipient = Recepient.new(first_name, last_name, email)
completion_notification(recipient)

# Hash
recipient = { first_name: first_name, last_name: last_name, email: email }
completion_notification(recipient)
