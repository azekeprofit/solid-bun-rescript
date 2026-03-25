@jsx.component
let make = () => {
  let (show, setShow) = Solid.createSignal(true)

  <div>
    // Solid's Show tag has 'when' attribute, but 'when' is a reserved keyword in Rescript and can't be used as a prop name
    <Solid.show
      when_={show()} fallback={<span class={`underline`}> {`Hidden!`->Solid.string} </span>}
    >
      <Solid.for_ each={Store.store.arr}>
        {(ind, index) => {
          <p>
            <Indicator value={ind.counter} />
            <button onClick={_ => Store.setIndicator(index(), ind.counter + 1)}>
              {`+1`->Solid.string}
            </button>
          </p>
        }}
      </Solid.for_>
      <p>
        <button onClick={_ => Store.addIndicator()}> {`add indicator`->Solid.string} </button>
      </p>
    </Solid.show>

    <p>
      <button onClick={_ => setShow(s => !s)}> {(show() ? "hide" : "show")->Solid.string} </button>
    </p>

    <Form />
    <Clock color="#1293D8" size={400.0} handColor="white" />
  </div>
}
