module Events



    def subs() @subs ||= [] end



    def add_subscription(*args)
       
        args.each do |arg|
            subs << arg
        end
    
    end



    def remove_subscription(subscriber)
        
        subs.delete subscriber

    end


    
    def emit(event_name, *args)
        subs.each do |subscriber|
            if subscriber.respond_to? event_name
                subscriber.__send__ event_name, *args
            end
        end
    end



end
