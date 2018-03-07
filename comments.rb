# EXAMPLES
class Invitation
  # Deliver the invitation
  def deliver
    Mailer.invitation_notification(self, message).deliver
  end
end

# config/initalizer/rspotify.rb
spotify_secrets = Rails.application.secrets.spotify
# Authenticates the Spotify
RSpotify.authenticate(
  spotify_secrets.fetch(:client_id),
  spotify_secrets.fetch(:client_secret)
)


# app/models/open_question.rb
def summary
  # Text for each answer in order as a comma-separated string
  answers.order(:created_at).pluck(:text).join(', ')
end
