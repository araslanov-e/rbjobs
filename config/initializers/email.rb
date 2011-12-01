config = YAML.load_file(File.join(Rails.root, "config", "email.yml"))[Rails.env]

Rbjobs::Application.config.action_mailer.delivery_method     = config["delivery_method"]
Rbjobs::Application.config.action_mailer.default_url_options = config["default_url_options"]
Rbjobs::Application.config.action_mailer.postmark_settings   = config["postmark_settings"] unless config["postmark_settings"].blank?
