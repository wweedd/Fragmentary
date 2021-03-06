# load a dataset
using RDatasets
iris = dataset("datasets", "iris");

# load the StatPlots recipes (for DataFrames) available via:
# Pkg.add("StatPlots")
using StatPlots

# Scatter plot with some custom settings
@df iris scatter(:SepalLength, :SepalWidth, group=:Species,
        title = "My awesome plot",
        xlabel = "Length", ylabel = "Width",
        m=(0.5, [:cross :hex :star7], 12),
        bg=RGB(.2,.2,.2))

# save a png
