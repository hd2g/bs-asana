open Client

type t

let get builder = builder "/users" Get
let me builder = builder "/users/me" Get
let get_user userId builder = builder "/users/" ^ userId Get
