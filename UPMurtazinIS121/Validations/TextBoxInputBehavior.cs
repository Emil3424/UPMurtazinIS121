using System.Linq;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace UPMurtazinIS121.Validations
{
    public static class TextBoxInputBehavior
    {
        // 1) Только цифры и фиксированная длина
        public static readonly DependencyProperty OnlyDigitsProperty =
            DependencyProperty.RegisterAttached(
                "OnlyDigits", typeof(bool),
                typeof(TextBoxInputBehavior),
                new PropertyMetadata(false, OnOnlyDigitsChanged));

        public static void SetOnlyDigits(TextBox tb, bool value) => tb.SetValue(OnlyDigitsProperty, value);
        public static bool GetOnlyDigits(TextBox tb) => (bool)tb.GetValue(OnlyDigitsProperty);

        private static void OnOnlyDigitsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is TextBox tb)
            {
                if ((bool)e.NewValue)
                    tb.PreviewTextInput += DigitsOnly_Preview;
                else
                    tb.PreviewTextInput -= DigitsOnly_Preview;
            }
        }

        private static void DigitsOnly_Preview(object sender, TextCompositionEventArgs e)
            => e.Handled = !e.Text.All(char.IsDigit);


        // 2) Разрешённые по regex символы
        public static readonly DependencyProperty AllowedRegexProperty =
            DependencyProperty.RegisterAttached(
                "AllowedRegex", typeof(string),
                typeof(TextBoxInputBehavior),
                new PropertyMetadata(null, OnAllowedRegexChanged));

        public static void SetAllowedRegex(TextBox tb, string value) => tb.SetValue(AllowedRegexProperty, value);
        public static string GetAllowedRegex(TextBox tb) => (string)tb.GetValue(AllowedRegexProperty);

        private static void OnAllowedRegexChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is TextBox tb)
            {
                tb.PreviewTextInput -= Regex_Preview;
                if (e.NewValue is string pattern && pattern.Length > 0)
                    tb.PreviewTextInput += Regex_Preview;
            }
        }

        private static void Regex_Preview(object sender, TextCompositionEventArgs e)
        {
            var tb = (TextBox)sender;
            var pat = GetAllowedRegex(tb);
            e.Handled = pat == null || !Regex.IsMatch(e.Text, pat);
        }
    }
}