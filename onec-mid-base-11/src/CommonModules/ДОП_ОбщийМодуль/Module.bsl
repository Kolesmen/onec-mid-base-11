#Область ПрограммныйИнтерфейс

Функция ПолучитьИмяТабличнойЧастиПоСсылкеНаНоменклатуру(Номенклатура) Экспорт 
//Колесников Р.В. 12.12.2023
//Добавление функции, которая возвращает имя табличной части в которой выбрана строка по Ссылке на Номенклатуру 
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	               |	Номенклатура.ВидНоменклатуры КАК ВидНоменклатуры,
	               |	Номенклатура.Ссылка КАК Ссылка
	               |ИЗ
	               |	Справочник.Номенклатура КАК Номенклатура
	               |ГДЕ
	               |	Номенклатура.Ссылка = &Номенклатура";
	Запрос.УстановитьПараметр("Номенклатура", Номенклатура);
	Выборка = Запрос.Выполнить().Выбрать();
	Пока Выборка.Следующий() Цикл	
		Если Выборка.ВидНоменклатуры = Перечисления.ВидыНоменклатуры.Товар Тогда
			ИмяТабличнойЧасти = "Товары";
		ИначеЕсли Выборка.ВидНоменклатуры = Перечисления.ВидыНоменклатуры.Услуга Тогда
			ИмяТабличнойЧасти = "Услуги";
		КонецЕсли;
	КонецЦикла;	
    Возврат ИмяТабличнойЧасти;

КонецФункции // ПолучитьИмяТабличнойЧастиПоСсылкеНаНоменклатуру()

#КонецОбласти
