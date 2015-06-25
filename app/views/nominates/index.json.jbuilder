json.array!(@nominates) do |nominate|
  json.extract! nominate, :id, :yourname, :yourbiz, :youremail, :referralname, :referralbiz, :referralemail, :referralstate
  json.url nominate_url(nominate, format: :json)
end
