// Solid.res
/* Below is a number of aliases to the common `Jsx` module */
type element = Jsx.element

type component<'props> = Jsx.component<'props>

type componentLike<'props, 'return> = Jsx.componentLike<'props, 'return>

@module("solid-js/web")
external jsx: (component<'props>, 'props) => element = "jsx"

@module("solid-js/web")
external jsxKeyed: (component<'props>, 'props, ~key: string=?, @ignore unit) => element = "jsx"

@module("solid-js/web")
external jsxs: (component<'props>, 'props) => element = "jsxs"

@module("solid-js/web")
external jsxsKeyed: (component<'props>, 'props, ~key: string=?, @ignore unit) => element = "jsxs"

/* These identity functions and static values below are optional, but lets
you move things easily to the `element` type. The only required thing to
define though is `array`, which the JSX transform will output. */
external array: array<element> => element = "%identity"
@val external null: element = "null"

external float: float => element = "%identity"
external int: int => element = "%identity"
external string: string => element = "%identity"
external promise: promise<element> => element = "%identity"

/* These are needed for Fragment (<> </>) support */
type fragmentProps = {children?: element}

let jsxFragment: component<fragmentProps> = (props: fragmentProps) =>
  switch props.children {
  | Some(childs) => childs
  | None => null
  }

/* The Elements module is the equivalent to the ReactDOM module in Preact. This holds things relevant to _lowercase_ JSX elements. */
module Elements = {
  /* Here you can control what props lowercase JSX elements should have.
  A base that the React JSX transform uses is provided via JsxDOM.domProps,
  but you can make this anything. The editor tooling will support
  autocompletion etc for your specific type. */
  type props = {
    ...JsxDOM.domProps,
    classList?: dict<bool>,
  }

  @module("solid-js/web")
  external jsx: (string, props) => Jsx.element = "jsx"

  @module("solid-js/web")
  external div: (string, props) => Jsx.element = "jsx"

  @module("solid-js/web")
  external jsxKeyed: (string, props, ~key: string=?, @ignore unit) => Jsx.element = "jsx"

  @module("solid-js/web")
  external jsxs: (string, props) => Jsx.element = "jsxs"

  @module("solid-js/web")
  external jsxsKeyed: (string, props, ~key: string=?, @ignore unit) => Jsx.element = "jsxs"

  external someElement: element => option<element> = "%identity"
}

@module("solid-js")
external createSignal: 'a => (unit => 'a, ('a => 'a) => unit) = "createSignal"

@module("solid-js")
external createEffect: (unit => unit) => unit = "createEffect"

@module("solid-js")
external onMount: (unit => unit) => unit = "onMount"

@module("solid-js")
external onCleanup: (unit => unit) => unit = "onCleanup"

@module("solid-js/web")
external render: (unit => element, WebAPI.DOMAPI.element) => unit = "render"

type showProps = {@as("when") when_: bool, fallback?: element, children?: element}
@module("solid-js")
external show: showProps => element = "Show"
let show = show

type forProps<'val> = {each: array<'val>, fallback?: element, children: ('val, unit=>int) => element}
@module("solid-js")
external for_: forProps<'val> => element = "For"
let for_ = for_

type indexProps<'val> = {each: array<'val>, fallback?: element, children: (unit=>'val, int) => element}
@module("solid-js")
external index: indexProps<'val> => element = "Index"
let index = index

@module("solid-js")
external createMemo: ('val => 'val) => unit => 'val = "createMemo"

type equalityFn<'val> = ('val, 'val) => bool
@val external emptyEqualityFn: equalityFn<'val> = "false"
@val external emptyName: string = "undefined"
type optionsWithNameAndEqualityFn<'val> = {equals: equalityFn<'val>, name: string}
@module("solid-js")
external createMemoWithOptions: (
  'val => 'val,
  'val,
  optionsWithNameAndEqualityFn<'val>,
) => unit => 'val = "createMemo"
let createMemoWithOptions = (
  fn: 'val => 'val,
  init: 'val,
  ~equals: equalityFn<'val>=emptyEqualityFn,
  ~name: string=emptyName,
) => createMemoWithOptions(fn, init, {equals, name})

@module("solid-js")
external createSignalWithOptions: (
  'val,
  optionsWithNameAndEqualityFn<'val>,
) => (unit => 'val, ('val => 'val) => unit) = "createSignal"
let createSignalWithOptions = (
  init: 'val,
  ~equals: equalityFn<'val>=emptyEqualityFn,
  ~name: string=emptyName,
) => createSignalWithOptions(init, {equals, name})
