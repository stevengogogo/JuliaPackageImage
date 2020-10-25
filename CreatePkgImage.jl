using Pkg

Pkg.add("PackageCompiler")
Pkg.build("PackageCompiler")
Pkg.add("DiffEqBase")
using PackageCompiler

function installed()
    deps = Pkg.dependencies()
    installs = Dict{String, VersionNumber}()
    for (uuid, dep) in deps
        dep.is_direct_dep || continue
        dep.version === nothing && continue
        installs[dep.name] = dep.version
    end
    return installs
end

function adduninstalled(pkgs)
    for i in pkgs
        i_str = String(i)
        if i_str ∉ keys(installed())
            Pkg.add(String(i))
        end
    end
end



# Add your packages here
conservative = [
    :ForwardDiff
    :Plots
    :StaticArrays
    :BenchmarkTools
    :Parameters
    :NLsolve
    :FiniteDiff
    :LabelledArrays
    :DifferentialEquations
]

# Add packages if not exists
adduninstalled(conservative)


diffeqbase = [
    :DiffEqBase
]



PackageCompiler.create_sysimage(vcat(conservative,diffeqbase);replace_default=true)
