let rec concat = function
  | [] -> ""
  | (key, value) :: [] -> key ^ "=" ^ value
  | (key, value) :: tl -> key ^ "=" ^ value ^ "&" ^ concat tl

let add query uri = uri ^ "?" ^ concat query
