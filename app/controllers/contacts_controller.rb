class ContactsController < ApplicationController
  def index
  	@contacts = Contact.all
  end

  def upload
  end

  def do_upload
    # @contents = params[:contact].read
    CSV::Converters[:blank_to_nil] = lambda do |field|
      field && field.empty? ? nil : field
    end

    file_path = "#{Rails.root}/config/test.csv"

    if File.exist?(file_path)
      body = File.open(file_path, "r:ISO-8859-1")
      csv = CSV.new(body, :headers => true, :header_converters => :symbol, :converters => [:all, :blank_to_nil])
      info_array = csv.to_a.map {|row| row.to_hash }

      info_array.each do |hash|
        @contact = Contact.create(hash)
      end
      render json: {message: 'success'}, status: 200
    else
      render json: {message: 'fail,no file'}, status: 404
    end

  end

  def create
  	@contact = Contact.create(task_params)
  end
end
