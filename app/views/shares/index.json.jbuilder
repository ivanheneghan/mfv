json.array!(@shares) do |share|
  json.extract! share, :id, :share_id, :name, :company, :share_price, :volume
  json.url share_url(share, format: :json)
end
