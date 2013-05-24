ENV["GOOGLE_KEY"] = nil
ENV["GOOGLE_SECRET"] = nil
ENV["TWITTER_CONSUMER_KEY"] = nil
ENV["TWITTER_CONSUMER_SECRET"] = nil
ENV["FACEBOOK_APP_ID"] = nil
ENV["FACEBOOK_APP_SECRET"] = nil

ENV['GRAVATAR_API_KEY'] = nil

I18n.available_locales = [:en, :fr]
I18n.default_locale = :fr

USER_ROLES_LIST = ['user', 'cowoteamer', 'admin']
