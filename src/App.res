@react.component
let make = () => {
  let (a, set) = Solid.createSignal(0)
  <div>
    <p>
      {Solid.string(`a=`)}
      <Indicator value={a()} />
    </p>
    <button onClick={_ => set(c => c + 1)}> {Solid.string("+1")} </button>
  </div>
}
