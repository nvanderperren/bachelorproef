```shell
MacBook-Air-van-Nastasia:~ nastasiavanderperren$  jq -rc '.[].outputs.data.concepts[1,2,3,4,5,6] | .name,.value' response.json
pet
0.97686213
computer
0.97427475
portrait
0.9691319
people
0.9690177
room
0.9665985
laptop
0.96410555
```
```shell
MacBook-Air-van-Nastasia:~ nastasiavanderperren$  jq -rc '.[].outputs.data.concepts[1,2,3,4,5,6] | {naam: .name,waarde: .value}' response.json
{"naam":"pet","waarde":"0.97686213"}
{"naam":"computer","waarde":"0.97427475"}
{"naam":"portrait","waarde":"0.9691319"}
{"naam":"people","waarde":"0.9690177"}
{"naam":"room","waarde":"0.9665985"}
{"naam":"laptop","waarde":"0.96410555"}
```

```shell
MacBook-Air-van-Nastasia:~ nastasiavanderperren$  jq -rc '.[].outputs.data.concepts[1,2,3,4,5,6] | {name,value}' response.json
{"name":"pet","value":"0.97686213"}
{"name":"computer","value":"0.97427475"}
{"name":"portrait","value":"0.9691319"}
{"name":"people","value":"0.9690177"}
{"name":"room","value":"0.9665985"}
{"name":"laptop","value":"0.96410555"}
```
```shell
MacBook-Air-van-Nastasia:~ nastasiavanderperren$  jq -rc '.[].outputs.data.concepts[1,2,3,4,5,6] | {(.name): .value}' response.json
{"pet":"0.97686213"}
{"computer":"0.97427475"}
{"portrait":"0.9691319"}
{"people":"0.9690177"}
{"room":"0.9665985"}
{"laptop":"0.96410555"}
```
```shell
MacBook-Air-van-Nastasia:~ nastasiavanderperren$  jq '.outputs[].data.concepts[] | {name,value} | select(.value >= 0.95)' response.json
{
  "name": "cat",
  "value": 0.9987245
}
{
  "name": "pet",
  "value": 0.97686213
}
{
  "name": "computer",
  "value": 0.97427475
}
{
  "name": "portrait",
  "value": 0.9691319
}
{
  "name": "people",
  "value": 0.9690177
}
{
  "name": "room",
  "value": 0.9665985
}
{
  "name": "laptop",
  "value": 0.96410555
}
{
  "name": "apple",
  "value": 0.96334034
}
{
  "name": "kitten",
  "value": 0.9575433
}
{
  "name": "family",
  "value": 0.9550264
}
{
  "name": "mouse",
  "value": 0.95314467
}
```
```shell
MacBook-Air-van-Nastasia:~ nastasiavanderperren$ jq '.outputs[].data.concepts[] | {name,value} | select(.value >= 0.95) | [.name,.value]' response.json | tr -d [ | tr ] , | tr -d "\n"
"cat",0.9987245,"pet",0.97686213,"computer",0.97427475,"portrait",0.9691319,"people",0.9690177,"room",0.9665985,"laptop",0.96410555,"apple",0.96334034,"kitten",0.9575433,"family",0.9550264,"mouse",0.95314467,
```
```shell
MacBook-Air-van-Nastasia:~ nastasiavanderperren$ jq -rs 'map(.outputs[].data.concepts | map({n: .name, v:.value} | select(.v > 0.95) | [.n, .v])) | add[] | @csv' response.json
"cat",0.9987245
"pet",0.97686213
"computer",0.97427475
"portrait",0.9691319
"people",0.9690177
"room",0.9665985
"laptop",0.96410555
"apple",0.96334034
"kitten",0.9575433
"family",0.9550264
"mouse",0.95314467
```