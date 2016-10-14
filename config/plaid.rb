Plaid.config do |p|
  p.client_id = ENV["PLAID_CLIENT"]
  p.secret = ENV["PLAID_SECRET"]
  p.env = :tartan
end