using WCS
using Documenter

DocMeta.setdocmeta!(WCS, :DocTestSetup, :(using WCS); recursive=true)

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
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JuliaAstro/WCS.jl",
    devbranch="master",
)
