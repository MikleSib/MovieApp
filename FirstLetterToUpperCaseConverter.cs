using Microsoft.Maui.Controls;
using System;
using System.Globalization;

public class FirstLetterToUpperCaseConverter : IValueConverter
{
    public object Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        if (value is string text && !string.IsNullOrEmpty(text))
        {
            return char.ToUpper(text[0]) + text.Substring(1);
        }
        return value;
    }


    public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        throw new NotImplementedException();
    }
}