# https://github.com/charliesome/better_errors/issues/314
require 'better_errors'

BetterErrors.editor = 'atm://open?url=file://%{file}&line=%{line}'
