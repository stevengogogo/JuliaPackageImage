# JuliaPackageImage
Create system image for julia packages to save your compiling time. 


## Customize your package image

Change the list here
[List of packages](https://github.com/stevengogogo/JuliaPackageImage/blob/6849df5fa02bbef129af9cab6ce5de8824c8799b/CreatePkgImage.jl#L26)


To create the system image, change path to the package folder including `conservative_package_compiler_testing.jl`, then run

```julia
include("conservative_package_compiler_testing.jl")
```


## Acknowledgement

- The original version is the courtesy from [sosiristseng](https://github.com/sosiristseng), and customized for my usage

