require 'net/http'
require 'tempfile'
class EditorController < ApplicationController
  def index

  end

  def compile
    # compile_url = 'http://api.hackerearth.com/code/compile/'
    # run_url = 'http://api.hackerearth.com/code/run/'

    # client_secret = 'dad9925d41c91830707d555bd7fe11f79b26d805'
    # time_limit = 5
    # memory_limit = 262144

    source = params[:source]
    lang = params[:lang]
    input = params[:input]

    rand_num = rand(1000000000)

    if lang == "RUBY"
      target = "/tmp/temp#{rand_num}.rb"
      input_file = "/tmp/temp#{rand_num}.in"
      File.open(target, "w+") do |f|
        f.write(source)
      end
      File.open(input_file, "w+") do |f|
        f.write(input)
      end
      of = IO.popen("ruby #{target} < #{input_file}")
      output = of.read
      #system("rm #{target} #{input_file}")
    elsif lang == "C"
      target = "/tmp/temp#{rand_num}.c"
      exe = "/tmp/temp#{rand_num}"
      File.open(target, "w+") do |f|
        f.write(source)
      end
      system("gcc #{target} -o #{exe} -std=c99")
      of = IO.popen(exe)
      output = of.read
      system("rm #{target} #{exe}")
    elsif lang == "C++"
      target = "/tmp/temp#{rand_num}.cpp"
      exe = "/tmp/temp#{rand_num}"
      File.open(target, "w+") do |f|
        f.write(source)
      end
      system("g++ #{target} -o #{exe}")
      of = IO.popen(exe)
      output = of.read
      system("rm #{target} #{exe}")
    end

    # post_data = {
    #   'client_secret' => client_secret,
    #   'source' => source,
    #   'lang' => lang,
    #   'time_limit' => time_limit,
    #   'memory_limit' => memory_limit
    # }

    # uri = URI(run_url)
    # http = Net::HTTP.new(uri.host, uri.port)

    # request = Net::HTTP::Post.new(uri.request_uri)
    # request.add_field('Content-Type', 'application/json')
    # request.set_form_data(post_data)
    # response = http.request(request)
    # data = JSON.parse(response.body)
    respond_to do |format|
      msg = {:output => output}
      if params[:callback]
        format.js { render :json => msg, :callback => params[:callback] }
      else
        format.json { render :json => msg }
      end
    end
  end
end
