@react.component
let make = () => {
  let (a, set) = Solid.createSignal(0)
  <div>
    <p>
      {Solid.string(`a=`)}
      <span className={a() % 2 == 0 ? {`text-red-500`} : {`text-green-500`}}> {Solid.int(a())} </span>
    </p>
    <button onClick={_ => set(c => c + 1)}> {Solid.string("+1")} </button>
  </div>
}
