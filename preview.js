function showAlert() {
    alert("No es pot esborrar/inserir");

    return false;
}
// ============================================================================
// document_onload
// ============================================================================
function document_onload {
	sqltableAddEvent("BOX_11334", "before_insert", showAlert);
	sqltableAddEvent("BOX_11334", "before_delete", showAlert);
}
