conn zjdms/zjdms;
spool "D21_��ʱ�ļ���\D21_��ȡ���б�sql.txt"
select 'table '||table_name from all_tables where owner='zjdms';
spool off;
exit;
exit;
