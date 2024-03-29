﻿#language: ru

@tree

Функционал: проверка расчета поля Количество (итог) документа Заказ

Как Менеджер по продажам я хочу
проверить расчет поля Количество (итог) документа Заказ
чтобы правильно вести учет заказов покупателей 

Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка расчета поля Количество (итог) документа Заказ
И заполнение шапки документа Заказ
* Заполнение табличной части Товары документа Заказ
	И в таблице "Товары" я нажимаю на кнопку с именем 'КомандаПодбор'
	Тогда открылось окно 'Подбор товара'
	И в таблице  "СписокТоваров" я перехожу на один уровень вниз
	И в таблице "СписокТоваров" я перехожу к строке:
			| 'Код'       | 'Наименование' | 'Цена'   |
			| '000000032' | 'Торт '        | '300,00' |
	И в таблице "СписокТоваров" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '3,00'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "СписокТоваров" я перехожу к строке:
		| 'Код'       | 'Наименование' | 'Цена'  |
		| '000000029' | 'Хлеб'         | '30,00' |
	И в таблице "СписокТоваров" я выбираю текущую строку
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '4,00'
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ОК'
	Тогда открылось окно 'Заказ (создание) *'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* Проверка расчета поля Количество (итог)
	Тогда элемент формы с именем "ТоварыИтогКоличество" стал равен "7"