using Documenter: DocMeta, doctest

@testset "Doctests" begin
    DocMeta.setdocmeta!(WCS, :DocTestSetup, :(using WCS); recursive=true)
    doctest(WCS)
end
