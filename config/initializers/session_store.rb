Rails.application.config.session_store :cookie_store,
  key: 'user_session',
  expire_after: 10.minutes
