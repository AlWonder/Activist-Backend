<h1>Мой профиль</h1>
<p>E-Mail: {{.Email}}</p>
<p>{{.FirstName}} {{.SecondName}} {{.LastName}}</p>
<p>Пол: 
{{if eq .Gender 0}}
Неизвестен
{{else if eq .Gender 1}}
Мужской
{{else if eq .Gender 2}}
Женский
{{end}}</p>
<p>Группа:
{{if eq .Group 1}}
Участник
{{else if eq .Group 2}}
Организатор
{{else if eq .Group 3}}
Модератор
{{else if eq .Group 4}}
Администратор
{{end}}</p>

{{if eq .Group 1}}

	<h2>Где я участвую</h2>

	{{range $val := .Events}}
		<h3>{{$val.Name}}</h3>
		<p>{{html2str $val.Description}}</p>
		<p>Дата проведения: {{dateformat $val.EventDate "2006-01-02"}} {{if $val.EventTime | iszero | not}}{{dateformat $val.EventTime "15:04"}}{{end}}</p>
		<a href="http://localhost:8080/events/deny/{{$val.Id}}">Больше не хочу участвовать</a>
	{{end}}
{{end}}

{{if eq .Group 2}}

	<h2>Мои мероприятия</h2>

	<a href="/events/new">Новое мероприятие</a>

	{{range $val := .Events}}
		<h3>{{$val.Name}}</h3>
		<p>{{html2str $val.Description}}</p>
		<p>Дата проведения: {{dateformat $val.EventDate "2006-01-02"}} {{if $val.EventTime | iszero | not}}{{dateformat $val.EventTime "15:04"}}{{end}}</p>
		<p><a href="http://localhost:8080/events/participants/{{$val.Id}}">Участники</a></p>
		<a href="http://localhost:8080/events/edit/{{$val.Id}}">Редактировать</a> | 
		<a href="http://localhost:8080/events/delete/{{$val.Id}}">Удалить</a>
	{{end}}
{{end}}