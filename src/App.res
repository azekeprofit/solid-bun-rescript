@jsx.component
let make = () => {
  let (a, set) = Solid.createSignal(0)

  Solid.createEffect(() => Console.log("a changed:" + a()->Int.toString))

  let (show, setShow) = Solid.createSignalWithOptions(true, ~name="strr")

  <div>
    // Solid's Show tag has 'when' attribute, but 'when' is a reserved keyword in Rescript and can't be used as a prop name
    <Solid.show when_={show()} fallback={<i> {`Hidden!`->Solid.string} </i>}>
      <p>
        {"a="->Solid.string}
        <Indicator value={a()} />
        <button onClick={_ => set(c => c + 1)}> {`+1`->Solid.string} </button>
      </p>
    </Solid.show>
    <p>
      <button onClick={_ => setShow(s => !s)}> {(show() ? "hide" : "show")->Solid.string} </button>
    </p>
  </div>
}
