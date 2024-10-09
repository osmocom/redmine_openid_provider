Redmine::Plugin.register :redmine_openid_provider do
  name 'Redmine Openid Provider plugin'
  author 'MIURA Toru'
  description 'This plugin enables Redmine to behave as an Open ID provider.'
  version '1.0.0'
  url 'https://github.com/buri17/redmine_openid_provider'
  author_url 'https://github.com/buri17'
end

# Modify the middleware stack safely
RedmineApp::Application.configure do
  new_middleware_stack = config.middleware.dup  # Create a copy of the middleware stack
  new_middleware_stack.delete OpenIdAuthentication  # Modify the copy
  config.middleware = new_middleware_stack  # Assign the modified stack back
end

Mime::Type.register "application/xrds+xml", :xrds