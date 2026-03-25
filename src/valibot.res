type schema
type t<'value> = schema
type specifier<'schema> = Specifier('schema)

@module("valibot")
external string: unit => schema = "string"

@module("valibot")
external number: string => schema = "number"

@module("valibot")
external nonEmpty: string => specifier<schema> = "nonEmpty"

@module("valibot")
external maxLength: (int,string) => specifier<schema> = "maxLength"

@module("valibot")
external minLength: (int,string) => specifier<schema> = "minLength"

@module("valibot")
external minValue: (int,string) => specifier<schema> = "minValue"

@module("valibot")
external maxValue: (int,string) => specifier<schema> = "maxValue"

external toSpecifier: 'schema => specifier<'schema> = "%identity"

@module("valibot") @variadic
external pipe: array<specifier<'schema>> => schema = "pipe"
let pipe = (schema, specifiers)=>pipe([schema->toSpecifier,...specifiers])

@module("valibot")
external object: (dict<t<_>>, string) => schema = "object"

@module("valibot")
external parse: (t<'value>, 'value) => 'value = "parse"

// let obj={"a":"strtr","b":3}

// let schema=object(dict{"a":string("a is wrong!"),"b":number("b is wrong!")},"")

// let test=()=>{
// Console.dir(parse(schema,obj))
// }
