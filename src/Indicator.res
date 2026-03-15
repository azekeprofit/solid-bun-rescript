@jsx.component
type props = {value: int}
// Solidjs doesn't allow props destructuring:
// https://docs.solidjs.com/concepts/components/props#destructuring-props
let make = (props: props) => {

Solid.onMount(() => Console.log("mounted"))

Solid.onCleanup(() => Console.log("cleanup"))

  <>
  {` `->Solid.string}
  <span className={props.value % 2 == 0 ? {`text-red-500`} : {`text-green-500`}}>
    {props.value->Solid.int}
  </span>
</>
}