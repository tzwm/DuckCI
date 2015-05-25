module BuildsHelper
  def state_color build
    case build.state
    when Build::STATE[:wait]
      "grey lighten-1"
    when Build::STATE[:building]
      "amber lighten-2"
    when Build::STATE[:end]
      build.exit_status == 0 ? "lime accent-4" : "deep-orange lighten-1"
    else
      "white"
    end
  end
end
