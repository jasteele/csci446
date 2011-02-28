# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_project06_session',
  :secret      => '2c71f5c64fd171f77a4edbd637f9f4a271a2c1f83293cf51f7a4de1a57de7e12073bfce4b8f639c7d9b995a1d8a8d7d2c9ba1d023cac30b01f6609241298ccd3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
