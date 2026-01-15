@jsx.component
type props={value:int}
// Solidjs doesn't allow props destructuring:
// https://docs.solidjs.com/concepts/components/props#destructuring-props
let make=(props:props)=><>
{Solid.string(` `)}
<span className={props.value % 2 == 0 ? {`text-red-500`} : {`text-green-500`}}>{Solid.int(props.value)} </span>
</>