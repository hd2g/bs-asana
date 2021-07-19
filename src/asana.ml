type methods = Get | Post | Put | Delete

module UriQuery = struct
  let rec concat = function
    | [] -> ""
    | (key, value) :: [] -> key ^ "=" ^ value
    | (key, value) :: tl -> key ^ "=" ^ value ^ "&" ^ concat tl

  let add query uri = uri ^ "?" ^ concat query
end

module Client = struct
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
    let url = UriQuery.add query uri in
    { instance; url; methods }

  module Users = struct
    type t

    let get builder = builder "/users" Get
    let me builder = builder "/users/me" Get
    let get_user userId builder = builder "/users/" ^ userId
  end
end

(*
let () =
  let token = "" in
  let client = Asana.Client.create () in
  let instance = Asana.Client.useAccessToken client token in
  let me = Asana.Client.Users.me client in
 *)
