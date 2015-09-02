

class Restart

   def initialize
      @results = ''
      @command_results = ''
      @curl_exit = ''
      check
      restarting
      validate
   end

   def check
      @results = File.exist?('/etc/init.d/httpd')
      if @results == false
         puts "Error, Apache not found"
         abort("Exiting")
      elsif @results == true
         puts "Apache found"
      else
         puts "Error, another error found, might not be supported."
         abort("Exiting")
      end
   end

   def restarting
      validate()
      if @curl_exit != 0
         puts "Restarting function" 
         if @results == false
            puts "No action taken"
         elsif @results == true
            puts "Restarting Apache"
            @restart_results = `sudo /etc/init.d/httpd restart`
            @command_results = $?.exitstatus
            if @command_results == 0
               puts "Apache was restarted successfully"
            elsif @command_results == 1
               puts "Apache was not successful in restart, please check"
            else puts "Apache has an unknown error, please check"
            end
         end
      elsif @curl_exit == 0
         puts "Apache is running, not restarting"
      else puts "Apache has an error"
      end
   end

   def validate
         curl_results = `curl localhost:80 > /dev/null --silent`
         @curl_exit = $?.exitstatus
         if @curl_exit == 0
            puts "Apache is serving traffic"
         elsif @curl_exit != 0
            puts "Apache page is down"
         else puts "Apache has another problem"
            abort("Exiting")
         end
   end
end

Restart.new
