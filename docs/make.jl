using WCS
using Documenter
using Documenter.Remotes: GitHub

DocMeta.setdocmeta!(WCS, :DocTestSetup, :(using WCS); recursive = true)

makedocs(;
    modules = [WCS],
    authors = "JuliaAstro contributors",
    repo = GitHub("JuliaAstro/WCS.jl"),
    sitename = "WCS.jl",
    format = Documenter.HTML(;
        canonical = "https://juliaastro.org/WCS/stable/",
        assets = String[],
    ),
    pages = [
        "Home" => "index.md",
    ]
)

# CI only: deploy docs
in_CI_env = get(ENV, "CI", "false") == "true"
if in_CI_env
    deploydocs(;
        repo = "github.com/JuliaAstro/WCS.jl",
        devbranch = "master",
        push_preview = true,
        versions = ["stable" => "v^", "v#.#"], # Restrict to minor releases
    )
end
