OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :facebook, '473076656138533', '9abb142a6c8106dcfdb59e5b8c80acc6'
end

