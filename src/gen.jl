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

WCS_INCDIR = abspath("../deps/usr/include/wcslib")

function func_rewriter(e::Expr)
    for a in e.args[1].args[2:end]
        if a.args[2] == :Cint
            a.args[2] = :Integer
        elseif a.args[2] == :Cdouble
            a.args[2] = :Real
        end
    end
    e
end

context = wrap_c.init(clang_includes = clang_includes,
                      common_file = "libwcs_common.jl",
                      cursor_wrapped = (name,cursor) -> !endswith(name,"_errmsg"),
                      func_rewriter = func_rewriter,
                      header_library = x -> "libwcs",
                      output_file = "libwcs_h.jl")

context.options.immutable_structs = true

wrap_c.wrap_c_headers(context, [joinpath(WCS_INCDIR,"wcs.h")])
