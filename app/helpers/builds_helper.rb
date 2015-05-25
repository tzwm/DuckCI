module BuildsHelper
  def state_color build, text=false
    ret = case build.state
          when Build::STATE[:wait]
            "grey lighten-1"
          when Build::STATE[:building]
            "amber lighten-2"
          when Build::STATE[:end]
            build.exit_status == 0 ? "lime lighten-1" : "deep-orange lighten-1"
          else
            "white"
          end
    text ? ret.gsub(/ /, "-text text-") : ret
  end

  def pretty_output output
    h(output).gsub(/[\n\r]/, '<br />')
  end
end
