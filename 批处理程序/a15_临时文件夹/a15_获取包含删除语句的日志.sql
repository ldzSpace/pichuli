conn zjzhbg/zjzhbg;
spool "a15_��ʱ�ļ���\a15_����ɾ��������־.txt";
select 'drop table '||table_name||';' from all_tables where owner='ZJZHBG';
spool off;
exit;
