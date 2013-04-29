# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
OnlineCodeEditor::Application.config.secret_key_base = '5426863e363b0e2e64ca7ee42a64e1f7bb570ddcb5695f793d78c53d0627fa92011c1cc4b1feca54b5ac8cd1ef5e4ee78a50846d1aca1032be66d46ad0ef3b5b'

OnlineCodeEditor::Application.config.secret_token = "So we beat on, boats against the current, borne back ceaselessly into the past."
