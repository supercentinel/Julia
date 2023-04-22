using CSV, DataFrames, Plots

struct Punto
    x::Float64
    y::Float64
end

data = CSV.read("aavsodata_644360b8ab4c4.txt", DataFrame)

puntos = [Punto(row.JD, row.Magnitude) for row in eachrow(data)]


scatter(xlabel = "JD", ylabel = "Magnitude", legend = false)

# Plot the points
for punto ∈ puntos
    scatter!([punto.x], [punto.y])
end

display(plot)
savefig("plot.png")
