#
# Custom application template.
#
# See: https://guides.rubyonrails.org/rails_application_templates.html
#
gem_group :development, :test do
  gem 'dalli'
  gem 'rspec'
  gem 'rubocop'
  gem 'sorbet'
  gem 'sorbet-runtime'
  gem 'tapioca'
  gem 'watchman-rails'
end
