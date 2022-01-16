" Compile function
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:resize-8
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc






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
		elseif c is ']'  
			let pairpos=cpos+1 
			break  
		elseif c is '"'
			let pairpos=cpos+1 
			break   
		elseif c is "'"
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

   
