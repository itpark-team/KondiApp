   M S B A M L   `   `   `  ����F  BWpfAppKondi, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:WpfAppKondiWpfAppKondi  5   	       WpfAppKondi.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:WpfAppKondi     5   	   $	��800��5   A   $
��1200��6N     � WindowStartupLocation$  CenterScreen=�6[    � Title 6	   ��  �� ElementName$ Frame�� �� Path$ Content.Title�.��5	      �  � RowDefinitions 5
   
   �� 5      $	��30* �6   �� 5      $	��70* �6   .+�5   
   �� $��Stretch=�6   $��0q�63   $��Stretch=�6>   
�������6s   �� 5   
   $
��Left=�6    �� Orientation$ 
Horizontal=�60   .+�5      �� $��\Resources\logo.jpg��6   63   �� 5      $��30(�6   ��6&   �� $ Frame��$ Content.Title�6_   5      �� 5   
   $��Right=�6   .+�5      �� -   5        $��
ButtonBack��5      $��70��6'   $��30��62   .��6W   
Назад6^   �� 5      -   5        $��
ButtonExit��5      $��70��6'   $��30��62   .��6W   
Выход6^   5       � 5   
   -   5        $��Frame��5      $��1��6     � NavigationUIVisibility$ Hidden=�6*   6t   5      5      