class ChatttyGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      m.migration_template "migrations/#{migration_source_name}.rb",
                           'db/migrate',
                           :migration_file_name => "chattty_#{migration_target_name}"
      
    end
  end

  private

  def migration_source_name
    'create_activities'
  end

  def migration_target_name
    'create_activities'
  end

  def schema_version
    IO.read(File.join(File.dirname(__FILE__), '..', '..', 'VERSION')).strip.gsub(/[^\d]/, '_')
  end

  
end

