@jsx.component
type props = {value: int}
// Solidjs doesn't allow props destructuring:
// https://docs.solidjs.com/concepts/components/props#destructuring-props
let make = (props: props) => {
  Solid.onMount(() => Console.log("mounted"))

  Solid.onCleanup(() => Console.log("cleanup"))

  // derived signal from a prop
  let odd = _ => props.value % 2 == 0

  let oddMemoized = Solid.createMemoWithOptions(_ => odd(),false,~name="debug")

  <>
    {` `->Solid.string}
    // classList are Rescript dict types
    <span classList=dict{"text-red-500": oddMemoized(), "text-green-500": !oddMemoized()}>
      {props.value->Solid.int}
    </span>
  </>
}
