json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :user_id, :customer_id, :invoice_number, :invoice_date, :due_date, :terms, :message
  json.url invoice_url(invoice, format: :json)
end
