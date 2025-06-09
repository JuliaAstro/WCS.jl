using WCS
using Documenter
using Documenter.Remotes: GitHub

DocMeta.setdocmeta!(WCS, :DocTestSetup, :(using WCS); recursive=true)
include("pages.jl")
makedocs(;
    modules=[WCS],
    authors="JuliaAstro contributors",
    repo=GitHub("JuliaAstro/WCS.jl"),
    sitename="WCS.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://juliaastro.org/WCS/stable/",
        assets=String[],
    ),
    pages=pages
)

deploydocs(;
    repo = "github.com/JuliaAstro/WCS.jl",
    devbranch = "master",
    push_preview = true,
    versions = ["stable" => "v^", "v#.#"], # Restrict to minor releases
)
