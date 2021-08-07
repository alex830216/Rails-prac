Rails.application.routes.draw do
  get "/yoman", to: "hihi#whatsup"
  get "/rices", to: "rices#cook"
end