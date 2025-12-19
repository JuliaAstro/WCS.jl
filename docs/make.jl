using WCS
using Documenter, DocumenterInterLinks
using Documenter.Remotes: GitHub

using FITSIO: FITSIO, read_header # Precompile package extensions

DocMeta.setdocmeta!(WCS, :DocTestSetup, :(using WCS); recursive = true)

links = InterLinks(
    "FITSIO" => "https://juliaastro.org/FITSIO/stable/",
)

makedocs(;
    modules = [WCS, Base.get_extension(WCS, :FITSIOExt)],
    authors = "JuliaAstro contributors",
    repo = GitHub("JuliaAstro/WCS.jl"),
    sitename = "WCS.jl",
    format = Documenter.HTML(;
        canonical = "https://juliaastro.org/WCS/stable/",
        assets = String[],
    ),
    pages = [
        "Home" => "index.md",
    ],
    plugins = [links],
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
