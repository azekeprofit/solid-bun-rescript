switch document->WebAPI.Document.querySelector("#root") {
| Value(domElement) => Solid.render(() => <App />, domElement)
| _ => ()
}
