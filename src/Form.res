type form = {
  a: string,
  b: int,
  c: bool,
}

type formProps = | @as("a") FormPropsA | @as("b") FormPropsB | @as("c") FormPropsC

type rec allProps<_> = FormVariant(formProps): allProps<formProps>

let schema = Valibot.object(
  dict{
    "a": Valibot.pipe(
      Valibot.string(),
      [Valibot.nonEmpty("not empty"), Valibot.maxLength(5, "too long")],
    ),
    "b": Valibot.number("b is wrong!"),
  },
  "",
)

let errorsList = errors => Nullable.getOr(errors, [])->Array.join(", ")->Solid.string

@jsx.component
let make = () => {
  let form = Formisch.createForm({schema: schema})

  <p>
    <Formisch.form of_={form} onSubmit={t => Console.dir(t)}>
      <Formisch.string of_={form} path=["a"]>
        {({errors, input, props}) =>
          <div>
            <label>
              {"a="->Solid.string}
              <input {...props} value={input->Nullable.getOr("")}></input>
            </label>
            {errors->errorsList}
          </div>}
      </Formisch.string>

      <Formisch.int of_={form} path=["b"]>
        {({errors, props, input}) =>
          <div>
            <label>
              {"b="->Solid.string}
              <input
                {...props}
                type_="number"
                value={switch input {
                | Value(num) => num->Int.toString
                | _ => ""
                }}
              >
              </input>
            </label>
            {errors->errorsList}
          </div>}
      </Formisch.int>

      <button> {"submit"->Solid.string} </button>
    </Formisch.form>
  </p>
}
