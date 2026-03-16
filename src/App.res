type indicatorId = int

type indicator = {
  id: indicatorId,
  mutable counter: int,
}

let rng = () => Math.floor(Math.random() * 1000.0)->Float.toInt

@jsx.component
let make = () => {
  let (show, setShow) = Solid.createSignalWithOptions(true)

  let (indicators, setIndicators) = Solid.createSignal([])

  let addIndicator = () =>
    setIndicators(prev =>
      [
        ...prev,
        {
          id: rng(),
          counter: 0,
        },
      ]
    )

  let setIndicator = (id: indicatorId, value: int) =>
    switch indicators()->Array.find(v => v.id == id) {
    | Some(indicator) => {
        indicator.counter = value
        setIndicators(i => [...i])
      }
    | None => ()
    }

  <div>
    // Solid's Show tag has 'when' attribute, but 'when' is a reserved keyword in Rescript and can't be used as a prop name
    <Solid.show when_={show()} fallback={<i> {`Hidden!`->Solid.string} </i>}>
      <Solid.for_ each={indicators()}>
        {({id}, _) => {
          let counter = () =>
            switch indicators()->Array.find(v => v.id == id) {
            | Some({counter}) => counter
            | None => 0
            }
          <p>
            // {` id=`->Solid.string}
            // {id->Solid.int}
            <Indicator value={counter()} />
            <button onClick={_ => setIndicator(id, counter() + 1)}> {`+1`->Solid.string} </button>
          </p>
        }}
      </Solid.for_>
      <p>
        <button onClick={_ => addIndicator()}> {`add indicator`->Solid.string} </button>
      </p>
    </Solid.show>

    <p>
      <button onClick={_ => setShow(s => !s)}> {(show() ? "hide" : "show")->Solid.string} </button>
    </p>
  </div>
}
