config = YAML.load_file(File.join(Rails.root, "config", "email.yml"))[Rails.env]

ActionMailer::Base.delivery_method     = config["delivery_method"].to_sym
ActionMailer::Base.default_url_options = config["default_url_options"].symbolize_keys
ActionMailer::Base.postmark_settings   = config["postmark_settings"].symbolize_keys unless config["postmark_settings"].blank?
