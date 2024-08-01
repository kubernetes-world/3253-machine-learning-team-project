

select column_name from (describe lit_panel) where not ends_with(column_name, 'Fn')
