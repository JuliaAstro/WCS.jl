using WCS
using Documenter

DocMeta.setdocmeta!(WCS, :DocTestSetup, :(using WCS); recursive=true)
include("pages.jl")
makedocs(;
    modules=[WCS],
    authors="JuliaAstro contributors",
    repo="https://github.com/JuliaAstro/WCS.jl/blob/{commit}{path}#{line}",
    sitename="WCS.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://JuliaAstro.github.io/WCS.jl",
        assets=String[],
    ),
    pages=pages
)

deploydocs(;
    repo="github.com/JuliaAstro/WCS.jl",
    devbranch="master",
)
