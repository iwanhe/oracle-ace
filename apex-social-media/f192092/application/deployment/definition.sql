prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 192092
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>146726770692635976661
,p_default_application_id=>192092
,p_default_id_offset=>8155984660337852939
,p_default_owner=>'WKSP_KCSI'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(9840141003865487908)
,p_deinstall_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260519060641Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260611164731Z')
,p_created_by=>'ANKITABERI14@GMAIL.COM'
,p_last_updated_by=>'ANKITABERI14@GMAIL.COM'
);
wwv_flow_imp.component_end;
end;
/
