# BAD

def export_csv(user_id)
  user = @user.find(user_id)
  user_category_data = []

  if user_category_data.size < 1

  else
    line_limit = 10
    build_csv_data(user_category_data, line_limit)

  end
end

# BETTER

def export_csv(user_id)
  user = @user.find(user_id)
  @user_category_data = []
  get_category_data(user)
  render_error_message && return if user_category_data.empty?
  build_csv_data(user_category_data, line_limit)
  render_success_message
end

def get_category_data(user)
  user.categories.each do |category|
    @user_category_data << category if category.name == 'Shipping'
  end
end

def render_error_message
  render json: { error: error }, status: :unprocessable_entity
end

def render_success_message
  render json: { message: 'User category data is good for processing' }
end
