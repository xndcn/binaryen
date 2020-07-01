(module
 (import "module" "empty" (func $empty))
 (import "module" "ignored" (func $ignored (param i32)))
 (import "module" "foo1" (func $foo1 (param i32) (param f64)))
 (import "module" "foo2" (func $foo2 (param i32) (param f64)))
 (import "module" "foo3" (func $foo3 (param i32) (param f64)))
 (import "module" "foo4" (func $foo4 (param i32) (param f64)))
 (import "module" "foo5" (func $foo5 (param i32) (param f64)))
 (import "module" "foo6" (func $foo6 (param i32) (param f64)))
 (import "module" "foo7" (func $foo7 (param i32) (param f64)))
 (import "module" "foo8" (func $foo8 (param i32) (param f64)))
 (func $bad-in-same-func
  (call $foo1
   (i32.const 1)
   (f64.const 1)
  )
  (call $foo1
   (i32.const 2)
   (f64.const 3)
  )
 )
 (func $bad-in-other-func1
  (call $foo2
   (i32.const 1)
   (f64.const 1)
  )
 )
 (func $bad-in-other-func2
  (call $foo2
   (i32.const 2)
   (f64.const 3)
  )
 )
 (func $partial-bad-1
  (call $foo3
   (i32.const 1)
   (f64.const 1)
  )
  (call $foo3
   (i32.const 1)
   (f64.const 3)
  )
 )
 (func $partial-bad-2
  (call $foo4
   (i32.const 1)
   (f64.const 1)
  )
  (call $foo4
   (i32.const 2)
   (f64.const 1)
  )
 )
 (func $no-contest
  (call $foo5
   (unreachable)
   (unreachable)
  )
  (call $foo6
   (i32.const 2)
   (f64.const 3)
  )
 )
 (func $non-const
  (call $foo7
   (i32.const 1)
   (f64.const 1)
  )
  (call $foo7
   (unreachable)
   (unreachable)
  )
  (call $foo8
   (unreachable)
   (unreachable)
  )
  (call $foo8
   (i32.const 1)
   (f64.const 1)
  )
 )
)