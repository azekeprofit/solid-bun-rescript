@val @return(nullable)
external querySelector: string => option<Dom.element> = "document.querySelector"

switch querySelector("#root") {
| Some(domElement) => Solid.render(() => <App />, domElement)
| None => ()
}
