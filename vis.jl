using PyPlot


function plot1()
	close("all")

	pAA(mut) = 1/4 .+ 3/4*exp.(-4/3*mut)
	pAC(mut) = 1/4 .- 1/4*exp.(-4/3*mut)
	
	figure(figsize=(10.0,10.0))
	mut = range(0,stop=4,length=100)
	plot(mut,pAA(mut),label=L"$p_{A,A}(\mu t)$", linewidth=4.0)
	plot(mut,pAC(mut),label=L"$p_{A,C}(\mu t)$", linewidth=4.0)
	legend()
	grid("true")
	savefig("mutationAAAC.png")
end


function plot2()
	close("all")

	pAA(mut) = 1/4 .+ 3/4*exp.(-4/3*mut)
	pAC(mut) = 1/4 .- 1/4*exp.(-4/3*mut)
	

	probdiff(n,k,mut) = 3.0 .^k / 4.0.^n.* binomial.(n,k) .* pAA(mut).^(n.-k) .* pAC(mut).^k
	figure(figsize=(10.0,10.0))
	
	k = [ i for i=0:100]
	plot(k,probdiff(100,k,0.05), label=L"\mu t = 0.05",linewidth=4.0)

	legend()
	grid("true")
	savefig("difference.png")
end
