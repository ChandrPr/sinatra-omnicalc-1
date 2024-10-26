require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_form)
end

get("/square/new") do
  erb(:square_form)
end

get("/square/results") do
  @input_val = params['number'].to_f
  @output_val = @input_val ** 2
  erb(:square_result)
end

get("/square_root/new") do
  erb(:squareroot_form)
end

get("/square_root/results") do
  @input_val = params['number'].to_f
  @output_val = @input_val ** (1/2.0)
  erb(:squareroot_result)
end

get("/random/new") do
  erb(:random_form)
end

get("/random/results") do
  @min_val = params['min_val'].to_f
  @max_val = params['max_val'].to_f
  @output_val = rand(@min_val..@max_val)
  erb(:random_result)
end

get("/payment/new") do
  erb(:payment_form)
end


get("/payment/result") do
  @apr = params['apr'].to_f
  @years = params['years'].to_i
  @pv = params['pv'].to_f

  r = @apr / 100 / 12
  n = @years * 12
  numerator = r * @pv
  denominator = 1 - (1+r)**(-n)
  @payment = numerator / denominator

  erb(:payment_result)
