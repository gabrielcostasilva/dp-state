# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "billing"
  spec.version = "0.1.0"
  spec.summary = "Billing gem for handling billing operations"
  spec.authors = ["Gabriel Costa Silva"]

  spec.required_ruby_version = ">= 3.4.2"

  spec.require_paths = ["lib"]

  spec.files = ["lib/billing.rb"]

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency "rake", "~>13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.21"
end
