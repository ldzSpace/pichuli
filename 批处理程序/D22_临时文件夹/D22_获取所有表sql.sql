conn zjdms/zjdms;
spool "D22_��ʱ�ļ���\D22_��ȡ���б�sql.txt"
select 'table '||table_name from all_tables where owner='ZJDMS';
spool off;
exit;
exit;
