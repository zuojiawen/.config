function! JumpPair()
	let buf=getline(".")
	let pairpos=0
	let endl=col("$")-1
	let cpos=col(".")-1
	while endl-cpos>=0 
		let c=buf[cpos]
		if c is ')' 
			let pairpos=cpos+1 
			break  
		elseif c is '"'
			let pairpos=cpos+1 
			break   
		endif
		let cpos=cpos+1 
	endwhile 
	if pairpos>0 
		return printf("\<ESC>0%dla",pairpos-1)
	elseif pairpos<1 
		return "\t"

	endif 
endfunction 

   
inoremap jl <c-r>=JumpPair()<CR>
