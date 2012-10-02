require_relative('JsonRESTWorker')

class ParallelRESTComms

  # Pass array of end points to collect data for
  # {
  #  :identifier => "url",
  #  :identifier => "url",
  #  ...
  # }
  def initialize(urlRequests)
    @worker_list = Hash.new

    urlRequests.each { |id, url|
      @worker_list[id] =  JsonRESTWorker.new(url)
    }
  end

  def run
    threads = []

    # Start each comm request
    @worker_list.each { |id, worker| 
      threads << Thread.new { worker.run }
    }
    
    # Wait for all of the threads to finish
    threads.each do |th|
      th.join
    end 
  end

  def get_result(id)
    @worker_list[id]
  end
end
