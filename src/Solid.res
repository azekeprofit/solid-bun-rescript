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

let jsxFragment: component<fragmentProps> = (props:fragmentProps)=>switch props.children {
| Some(childs) => childs
| None => null
}

/* The Elements module is the equivalent to the ReactDOM module in Preact. This holds things relevant to _lowercase_ JSX elements. */
module Elements = {
  /* Here you can control what props lowercase JSX elements should have.
  A base that the React JSX transform uses is provided via JsxDOM.domProps,
  but you can make this anything. The editor tooling will support
  autocompletion etc for your specific type. */
  type props = JsxDOM.domProps

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

@module("solid-js/web")
external render: (unit => element, Dom.element) => unit = "render"
