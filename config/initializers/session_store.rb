# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_FirinTehole_session',
  :secret      => '0eaa810ca81be4898155f50261546b76f5b837b6c00538727e1b62348342023bfd95d2515f824c3097bc265f214caf202580c63bddbc38ed2074938748051a68'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
