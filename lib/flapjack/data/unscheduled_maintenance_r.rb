#!/usr/bin/env ruby

module Flapjack
  module Data
    class UnscheduledMaintenanceR

      include Flapjack::Data::RedisRecord

      define_attributes :start_time => :timestamp,
                        :end_time   => :timestamp,
                        :summary    => :string,
                        :notified  => :boolean,
                        :notification_times => :set

      validates :start_time, :presence => true
      validates :end_time, :presence => true

      belongs_to :entity_check, :class_name => 'Flapjack::Data::EntityCheckR'

      def duration
        self.end_time - self.start_time
      end

    end
  end
end