package main

import (
	"fmt"
	"net/http"
)

func helloHello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello world!")
}

func main() {
	http.HandleFunc("/", helloHello)
	err := http.ListenAndServe(":9090", nil)
	if err != nil {
		fmt.Printf("http server failed, err:%v\n", err)
		return
	}
}
