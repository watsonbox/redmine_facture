module EnumerationsControllerPatch
  def self.included(base)
    base.class_eval do
      def index_with_plugin
        respond_to do |format|
          format.html
          format.api {
            @klass = Enumeration.get_subclass(params[:type])
            if @klass
              if params[:project_id]
                @enumerations = @klass.for_project_unique(params[:project_id])
              else
                @enumerations = @klass.shared.sorted.all
              end
            else
              render_404
            end
          }
        end
      end

      alias_method_chain :index, :plugin
    end
  end
end