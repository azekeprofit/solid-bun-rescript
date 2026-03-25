type form<'form>
type createFormArgumentObject<'form> = {schema: Valibot.t<'form>}

@module("@formisch/solid")
external createForm: createFormArgumentObject<'form> => form<'form> = "createForm"
let createForm = createForm

type formProps<'form> = {
  @as("of") of_: form<'form>,
  onSubmit: 'form => unit,
  children: Solid.element,
}
@module("@formisch/solid")
external form: formProps<'form> => Solid.element = "Form"
let form = form

type fieldArguments<'field> = {
  input: 'field,
  errors: nullable<array<string>>,
  props: Solid.Elements.props,
}

type fieldProps<'form, 'field> = {
  @as("of") of_: form<'form>,
  path: array<string>,
  children: fieldArguments<'field> => Solid.element,
}
@module("@formisch/solid")
external field: fieldProps<'form, 'field> => Solid.element = "Field"
let field = field
