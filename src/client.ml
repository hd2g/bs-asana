type methods = Get | Post | Put | Delete

type members_t =
  { instance : Axios.Instance.t
  ; url : string
  ; methods : methods
  }

let base_url = "https://app.asana.com/api/1.0"

let makeInstance ?(baseUrl = base_url) token =
  let headers =
    [ "Content-Type", "application/json"
    ; "Authorication", "Bearer " ^ token
    ]
    |> Js.Dict.fromList
    |> Axios.Headers.fromDict
  in
  let config = Axios.makeConfig ~headers:headers ~baseURL:baseUrl () in
  Axios.Instance.create config

let build personalAccessToken ?(query = []) uri methods =
  let instance = makeInstance personalAccessToken in
  let url = Uri_query.add query uri in
  { instance; url; methods }

module Tasks = struct
  type t

  let get builder = builder "/tasks" Get
end
