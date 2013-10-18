OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :facebook, '473076656138533', '9abb142a6c8106dcfdb59e5b8c80acc6'


OmniAuth.config.on_failure = Proc.new do |env| new_path = "/search"
 [302, {'Location' => new_path, 'Content-Type'=> 'text/html'}, []]
end	
end

