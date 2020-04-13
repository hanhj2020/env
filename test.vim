if exists("loaded_a")
	echo "reload a.vim"
	finish
endif
let loaded_a=1
let i=1
while i<5
	echo i
	let i=i+1
endwhile
echo "tw is ".&tw

function SumLine() range
	let n=a:firstline
	let countw=0
	while n<=a:lastline 
		let countw=countw+Wordcount(getline(n))
		let n=n+1
	endwhile
	echo "count ".countw." words"
endfunction
function Max(num1,num2)
	if a:num1>a:num2 
		echo a:num1
	else
		echo a:num2
	endif
endfunction
function Wordcount(str)
	let s:index=0
	let s:pos=0
	let s:countw=0
	if strlen(a:str)==0
		echo "str is 0 len"
	else 
		while s:index != -1
			let s:index = match(a:str,'[ \t:{}";+=()]\{1,10\}',s:pos)
			let s:pos=s:index+1
			let s:countw=s:countw+1
		endwhile
	endif
	echo " count ".s:countw." words" 
	return s:countw
endfunction
