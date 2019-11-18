module DateHepler
  module_function

  def valid_date?(str, format = '%Y-%m-%d')
    Date.strptime(str, format) rescue false
  end
end
