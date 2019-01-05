class User < ApplicationRecord
	has_secure_password

    def self.deliver(id)
     	find(id).deliver
    end

	def deliver
		sleep 10
		raise "foo"
        update_attriute(:delivered_at, Time.zone.now)
	end
end
