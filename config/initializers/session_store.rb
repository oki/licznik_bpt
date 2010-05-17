# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_licznik_app_session',
  :secret      => '8c1056b7788207c388caac704535a725484b7304c2172337d630d8a03940087f9a9f15b4ace3428a34ce6eca0a9ddc060272fdac87a85f7989731754d28b82b0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
