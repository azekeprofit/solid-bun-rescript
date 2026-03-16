type indicator = {
  mutable counter: int,
}

type store = {arr: array<indicator>}

let (store, set) = Solid.createStore({arr: []})

let addIndicator = () => set(Solid.produce(({arr}) => Array.push(arr, {counter: 0})))

let setIndicator = (index: int, value: int) =>
  set(
    Solid.produce(({arr}) =>
      switch arr[index] {
      | Some(ind) => ind.counter = value
      | None => ()
      }
    ),
  )
