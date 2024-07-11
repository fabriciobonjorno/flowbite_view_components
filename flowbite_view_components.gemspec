# frozen_string_literal: true

require_relative "lib/flowbite_view_components/version"

Gem::Specification.new do |spec|
  spec.name = "flowbite_view_components"
  spec.version = FlowbiteViewComponents::VERSION
  spec.authors = ["Fabricio Bonjorno"]
  spec.email = ["fabricio.bonjorno@gmail.com"]

  spec.summary = "Easily generate components for your rails project"
  spec.description = "This gem is to facilitate the generation of flowbite components and view components"
  spec.homepage = "https://github.com/fabriciobonjorno/flowbite_view_components"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  #spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "view_component", "~> 3.12"
  spec.add_development_dependency "rspec-rails"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
