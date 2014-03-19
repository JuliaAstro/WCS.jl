using Clang.wrap_c

LLVM_VER = "3.3"
LLVM_BUILD_TYPE="Release"

JULIA_ROOT=abspath(JULIA_HOME, "../../")
LLVM_PATH=joinpath(JULIA_ROOT, "deps/llvm-$LLVM_VER")

clang_includes = [joinpath(LLVM_PATH,f)::ASCIIString for f in (
    "build_$LLVM_BUILD_TYPE/tools/clang/include/clang",
    "include/llvm",
    "include"
    )]

WCS_INCDIR = "../deps/usr/include/wcslib"

const exports = Symbol[]

function func_rewriter(e::Expr)
    fun = e.args[1].args[1]
    push!(exports, fun)
    r_ascii = r".+-prefix"

    for a in e.args[1].args[2:end]
        s = "$fun-$(a.args[1])"
        if a.args[2] == :Cint
            a.args[2] = :Integer
        elseif a.args[2] == :Cdouble
            a.args[2] = :Real
        elseif a.args[2] == :(Ptr{wcsprm})
            a.args[2] = :wcsprm
        elseif a.args[2] == :(Ptr{Uint8})
            if ismatch(r_ascii, s)
                a.args[2] = :ASCIIString
            end
        end
    end

    eccall = e.args[2].args[1]
    for (i,t) in enumerate(eccall.args[3].args)
        if t == :(Ptr{wcsprm})
            eccall.args[3+i] = Expr(:&, eccall.args[3+i])
        end
    end

    e
end

function type_rewriter(e::Expr)
    if e.args[2] == :wcsprm
        e.args[1] = true
        push!(e.args[3].args, :(wcsprm() = new(-1)))
    end
    e
end

context = wrap_c.init(clang_includes = clang_includes,
                      common_file = "libwcs_common.jl",
                      cursor_wrapped = (name,cursor) -> !endswith(name,"_errmsg"),
                      func_rewriter = func_rewriter,
                      type_rewriter = type_rewriter,
                      header_library = x -> "libwcs",
                      output_file = "libwcs_h.jl")

context.options.immutable_structs = true

wrap_c.wrap_c_headers(context, [joinpath(WCS_INCDIR,"wcshdr.h")])

open("libwcs_h.jl", "a") do f
    for ex in exports
        if beginswith(string(ex), "wcs")
            println(f, "export ", ex)
        end
    end
end
