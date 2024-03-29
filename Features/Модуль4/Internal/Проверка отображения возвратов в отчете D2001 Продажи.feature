﻿#language: ru

@tree
@Отчеты

Функционал: проверка отображения возвратов в отчете D2001 Продажи

Как Тестировщик я хочу
проверить отображение возвратов в отчете D2001 Продажи
чтобы убедиться, что в отчете D2001 Продажи отображаются возвраты 

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: подготовительный сценарий (тестирование заполнения документов)
	Когда экспорт основных данных
	Когда экспорт документов продажи
	И я выполняю код встроенного языка на сервере
		|'Документы.SalesInvoice.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.SalesReturn.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		
Сценарий: проверка отображения возвратов в отчете D2001 Продажи 
* Формирование отчета с документом Возврат товара от покупателя
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе "Result" заполнится ячейка "R9C2" в течение 20 секунд
	Дано Табличный документ "Result" равен макету "Макет_D2001_Продажи_СВозвратом"
	И	я жду, что в табличном документе "Result" ячейка "R9C2" станет равна "2,000" в течение 20 секунд
	И Я закрываю окно 'D2001 Продажи'
* Формирование отчета без документа Возврата товаров от покупателя
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	Тогда открылось окно 'D2001 Продажи'
	И я нажимаю на кнопку с именем 'FormChangeVariant'
	Тогда открылось окно 'Вариант "Default" отчета "D2001 Продажи"'
	И я перехожу к закладке с именем "FilterPage"
	И в таблице "SettingsComposerSettingsFilterFilterAvailableFields" я перехожу к строке:
		| 'Доступные поля' |
		| 'Регистратор'    |
	И в таблице "SettingsComposerSettingsFilterFilterAvailableFields" я выбираю текущую строку
	И в таблице "SettingsComposerSettingsFilter" я активизирую поле с именем "SettingsComposerSettingsFilterComparisonType"
	И в таблице "SettingsComposerSettingsFilter" я выбираю текущую строку
	И в таблице "SettingsComposerSettingsFilter" из выпадающего списка с именем "SettingsComposerSettingsFilterComparisonType" я выбираю точное значение 'Не равно'
	И в таблице "SettingsComposerSettingsFilter" я активизирую поле с именем "SettingsComposerSettingsFilterRightValue"
	И в таблице "SettingsComposerSettingsFilter" я нажимаю кнопку выбора у реквизита с именем "SettingsComposerSettingsFilterRightValue"
	Тогда открылось окно 'Выбор типа данных'
	И в таблице "" я перехожу к строке:
		| 'Колонка1'                              |
		| 'Возврат товаров от покупателя' |
	И я нажимаю на кнопку с именем 'OK'
	Тогда открылось окно 'Возвраты товаров от покупателей'
	И в таблице "List" я перехожу к строке:
		| 'Валюта' | 'Дата'               | 'Контрагент' | 'Номер' | 'Организация'            | 'Партнер'                 | 'Ссылка'                                                | 'Сумма'    |
		| 'USD'    | '17.02.2023 2:14:31' | 'Клиент 1'   | '2'     | 'Собственная компания 1' | 'Клиент 1 (1 соглашение)' | 'Возврат товаров от покупателя 2 от 17.02.2023 2:14:31' | '1 350,00' |
	И я нажимаю на кнопку с именем 'FormChoose'
	Тогда открылось окно 'Вариант "Default" отчета "D2001 Продажи"'
	И в таблице "SettingsComposerSettingsFilter" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'FormEndEdit'
	Тогда открылось окно 'D2001 Продажи'
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе "Result" заполнится ячейка "R9C2" в течение 20 секунд
	Дано Табличный документ "Result" равен макету "Макет_D2001_Продажи_БезВозврата"
	И	я жду, что в табличном документе "Result" ячейка "R9C2" станет равна "5,000" в течение 20 секунд
	И Я закрываю окно 'D2001 Продажи'					
	Когда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button1'	