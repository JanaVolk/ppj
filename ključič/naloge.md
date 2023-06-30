### Naloga 1

c)

```ocaml
let apply_func (f: 'a -> 'b -> 'c) (arg1: 'b) (arg2: 'a) : 'c =
  f arg2 arg1
```

Example of usage:

```ocaml
let concat_strings (str1: string) (str2: string) : string =
  str1 ^ str2

let result : string = apply_func concat_strings " World!" "Hello"
```

The result should be "Hello World!".
