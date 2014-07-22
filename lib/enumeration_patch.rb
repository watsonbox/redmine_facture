module EnumerationPatch
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    # Merge project overridden enumerations with system enumerations (only hit DB once)
    # TODO: Could use for more efficient implementation of Project#system_activities_and_project_overrides
    def for_project_unique(project_id)
      mix = where(:project_id => [project_id, nil]).sorted
      mix.reject do |enum|
        # Reject system enumerations which are overridden for this project
        mix.exists? { |e| e.project_id = project_id && e.parent_id = enum.id } && enum.project_id.nil?
      end
    end
  end
end
