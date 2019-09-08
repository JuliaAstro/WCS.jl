using Documenter
using WCS

makedocs(
    sitename = "WCS.jl",
    format = Documenter.HTML(
        # assets = ["assets/logo.gif"]
    ),
    modules = [WCS],
    strict = true,
)

deploydocs(
    repo = "github.com/JuliaAstro/WCS.jl.git"
)
