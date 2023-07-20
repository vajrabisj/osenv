import os
import readline

fn main(){
	println('Welcome to environment keyword search tool!')
	mut kw := readline.read_line('Please input the keyword: ')!
	mut vl := readline.read_line('Please input the value to search: ')!
	enp := os.environ()
	mut tries := true
	println('you wanna search ${vl.trim_space()} in ${kw.trim_space()}')
	println('the environment keywords are: ${enp.keys()}')
	for tries {
		if enp.keys().contains(kw.trim_space()) {
			println('keyword ${kw.trim_space()} is in the environment')
			println('processing content search...')
			tries = false
		} else {
			println('keyword ${kw.trim_space()} is not in the environment, they need to be exactly the same! Try again!')
			tries = true
			kw = readline.read_line('Please input the keyword: ')!
		}
	}
	println(os.getenv(kw.trim_space()))
	for k, v in enp{
		if k == kw.trim_space() {
			println('content of keyword ${kw.trim_space()} is: ')
			pv := v.split(';')
			for item in pv{
				if item.contains(vl.trim_space()){
					println(item)
				}
			}
		}
	}
}