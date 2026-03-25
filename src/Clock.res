// recreating Elm's clock example in Rescript
// https://elm-lang.org/examples/clock

let half = size => (size / 2.0)->Float.toString

module Hand = {
  @jsx.componentWithProps
  type props = {width: int, length: float, turns: float, handColor: string, size: float}
  let make = (props: props) => {
    let angle = () => 2.0 * Math.Constants.pi * (props.turns - 0.25)
    let x = () => (props.size / 2.0 + props.length * angle()->Math.cos)->Float.toString
    let y = () => (props.size / 2.0 + props.length * angle()->Math.sin)->Float.toString

    <line
      x1={props.size->half}
      y1={props.size->half}
      x2={x()}
      y2={y()}
      stroke=props.handColor
      strokeWidth={props.width->Int.toString}
      strokeLinecap="round"
    />
  }
}

@jsx.componentWithProps
type props = {size: float, color: string, handColor: string}
let make = (props: props) => {
  let s = () => props.size->Float.toString

  let (time, setTime) = Solid.createSignal(Date.make())
  let timer = setInterval2(~handler=_ => setTime(_ => Date.make()), ~timeout=1000)
  Solid.onCleanup(() => clearInterval(timer))

  let hour = ()=>time()->Date.getHours->Int.toFloat / 12.0
  let minute = ()=>time()->Date.getMinutes->Int.toFloat / 60.0
  let seconds = ()=>time()->Date.getSeconds->Int.toFloat / 60.0

  <svg width={s()} height={s()} viewBox={`0 0 ${s()} ${s()}`}>
    <circle
      cx={props.size->half}
      cy={props.size->half}
      r={(props.size * 0.3)->Float.toString}
      fill={props.color}
    />
    <Hand handColor={props.handColor} size={props.size} width=6 length=60.0 turns={hour()} />
    <Hand handColor={props.handColor} size={props.size} width=6 length=90.0 turns={minute()} />
    <Hand
      handColor={props.handColor} size={props.size} width=3 length=90.0 turns={seconds()}
    />
  </svg>
}
