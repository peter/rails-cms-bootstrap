module Versioned
  def self.add(klass, options = {})
    klass.class_eval do
      cattr_accessor :version_class_name, :versioned_columns

      self.version_class_name = klass.to_s + "Version"
      self.versioned_columns = options[:columns]

      has_many :versions, class_name: version_class_name

      before_save :check_for_new_version

      private

      def check_for_new_version
        instantiate_version if create_new_version?
        true # Never halt save
      end

      def instantiate_version
        new_version = versions.build
        versioned_columns.each do |attribute|
          new_version.__send__ "#{attribute}=", __send__(attribute)
        end
        new_version.version_number = (new_record? ? 1 : versions.maximum(:version_number) + 1)
        self.version_number = new_version.version_number
      end

      def create_new_version?
        versioned_columns.detect {|a| __send__ "#{a}_changed?"}
      end
    end
  end
end
