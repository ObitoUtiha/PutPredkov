using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using DocumentFormat.OpenXml.Wordprocessing;
using PutPredkovApp.Entities;
using System.Linq;
using System.Windows;

namespace PutPredkovApp.Classes
{
    public class WordHelperClass
    {

        private FileInfo _fileInfo;
        public DateTime currentTime;


        public WordHelperClass(string fileName)
        {
            if (File.Exists(fileName))
            {
                _fileInfo = new FileInfo(fileName);
            }
            else
            {
                throw new Exception("File not found");
            }
        }

        public void CreateInventoryDocument(string inventoryNumber, DateTime inventoryDate, List<Material> materials, List<Result> results, Employees employee, string reason, string InventoryResult)
            {


                    string newDocumentPath = _fileInfo.DirectoryName + "\\" + currentTime.ToString("yyyy.MM.dd HH.mm.ss ") + " Инвентаризация.docx";
                    string templatePath = _fileInfo.FullName;
                    File.Copy(templatePath, newDocumentPath, true);

            // Создание нового документа
            using (WordprocessingDocument wordDocument = WordprocessingDocument.Open(newDocumentPath, true))
            {
                        // Получение основного контента в документе
                        MainDocumentPart mainPart = wordDocument.MainDocumentPart;

                        // Замена меток в документе
                        ReplacePlaceholder(mainPart, "InventoryNumber", inventoryNumber);
                        ReplacePlaceholder(mainPart, "InventoryDate", inventoryDate.ToShortDateString());
                        ReplacePlaceholder(mainPart, "InventoryReason", reason);
                        ReplacePlaceholder(mainPart, "InventoryResult", InventoryResult);
                        ReplacePlaceholder(mainPart, "InventoryUser", employee.Name);
                        ReplacePlaceholder(mainPart, "InventoryRole", employee.Position.Title);

                        // Добавление данных о предметах
                        Table table = CreateTable(materials, results);
                        mainPart.Document.Body.Append(table);
                        MessageBox.Show($"Файл сохранён по следующему пути:\n {newDocumentPath}");
                }
            }

            private Table CreateTable(List<Material> materials, List<Result> CurrentResults)
            {
                // Создание таблицы для списка предметов
                Table table = new Table();

                // Создание стиля для границ таблицы
                TableProperties tableProperties = new TableProperties(
                    new TableBorders(
                        new TopBorder() { Val = new EnumValue<BorderValues>(BorderValues.Single), Size = 6 },
                        new BottomBorder() { Val = new EnumValue<BorderValues>(BorderValues.Single), Size = 6 },
                        new LeftBorder() { Val = new EnumValue<BorderValues>(BorderValues.Single), Size = 6 },
                        new RightBorder() { Val = new EnumValue<BorderValues>(BorderValues.Single), Size = 6 },
                        new InsideHorizontalBorder() { Val = new EnumValue<BorderValues>(BorderValues.Single), Size = 6 },
                        new InsideVerticalBorder() { Val = new EnumValue<BorderValues>(BorderValues.Single), Size = 6 }
                    )
                );
                table.AppendChild(tableProperties);

                // Добавление заголовков столбцов
                TableRow headerRow = new TableRow();
                headerRow.Append(CreateTableCell("Производитель"));
                headerRow.Append(CreateTableCell("Название"));
                headerRow.Append(CreateTableCell("Ожидаемое кол-во"));
                headerRow.Append(CreateTableCell("Фактическое кол-во"));
                headerRow.Append(CreateTableCell("Стоимость"));
                headerRow.Append(CreateTableCell("Результат проверки"));
                table.AppendChild(headerRow);

                // Добавление данных о предметах
                foreach (var material in CurrentResults)
                {
                    TableRow newRow = new TableRow();
                    newRow.Append(CreateTableCell(material.Inventory.Material.Manufacturer));
                    newRow.Append(CreateTableCell(material.Inventory.Material.Name));
                    newRow.Append(CreateTableCell(material.Inventory.Quantity.ToString()));
                    newRow.Append(CreateTableCell(materials.Where(p=>p.InventoryNumber == material.Inventory.Material.InventoryNumber).First().QuantityMaterial.ToString()));
                    newRow.Append(CreateTableCell($"{material.Inventory.Material.Cost.ToString()}руб."));
                    newRow.Append(CreateTableCell(material.ResultName));
                    table.AppendChild(newRow);
                }

                return table;
            }

        private TableCell CreateTableCell(string text)
            {
                return new TableCell(new Paragraph(new Run(new Text(text))));
            }

        private void ReplacePlaceholder(MainDocumentPart mainPart, string placeholder, string value)
        {
            foreach (var run in mainPart.Document.Descendants<Run>())
            {
                string runText = run.InnerText;
                if (runText.Contains(placeholder))
                {
                    runText = runText.Replace(placeholder, value);
                    run.GetFirstChild<Text>().Text = runText;
                }
            }
        }
    }
}
