000100210302**FREE
000101210302
000112210302//*********************************************************************************************
000113210302//
000118210302//    addlible ice_0666
000119210302//    addlible ice_dem1
000120210302//
000121210302//    CRTSQLRPGI OBJ(QTEMP/DTFWD) SRCFILE(ice_dem1/SOURCE) COMMIT(*NONE)
000122210302//               OBJTYPE(*MODULE) RPGPPOPT(*LVL2) TGTRLS(*CURRENT) DBGVIEW(*SOURCE)
000123210302//
000124210302//    CRTSRVPGM SRVPGM(ice_dem1/DTFWD) MODULE(QTEMP/DTFWD) EXPORT(*ALL) OPTION(*DUPPROC)
000125210302//
000126210302//*********************************************************************************************
000127210302
000128210302ctl-opt nomain;
000129210302ctl-opt decedit('0,') datedit(*DMY.);
000130210302ctl-opt option(*srcstmt:*nodebugio);
000131210302ctl-opt bnddir('ice_dem1');
000132210302///ctl-opt bnddir('ICEBREAK');
000134210302ctl-opt bnddir('NOXDB/NOXDB');
000135210302
000136210302/include qrpglesrc,noxDb
000137210302
000138210302//*********************************************************************************************
000139210302// deleteRows
000140210302//*********************************************************************************************
000141210302dcl-proc deleteRows export;
000142210302dcl-pi deleteRows pointer;
000143210302  InputJson pointer value;
000144210302end-pi;
000145210302dcl-s error pointer;
000146210302dcl-s parameters pointer;
000147210302dcl-s output pointer;
000148210302dcl-s showMe varchar(32000);
000149210302
000150210302  error = json_newObject();
000151210302  showMe = json_asJsonText(InputJson);
000152210302  parameters = renameAttributes('in_':0:json_locate(InputJson : 'parameters'));
000153210302  showMe = json_asJsonText(parameters);
000154210302  output = json_sqlCall('ICE_DEM1.deleteTelefonverzeichnisEintrag': parameters);
000155210302  showMe = json_asJsonText(output);
000156210302  if json_Error(output);
000157210302    json_setStr(error: 'message' : json_Message(output));
000158210302  endif;
000159210302
000160210302  return error;
000161210302end-proc;
000162210302
000163210302//*********************************************************************************************
000164210302// renameAttributes
000165210302//*********************************************************************************************
000166210302dcl-proc renameAttributes;
000167210302dcl-pi renameAttributes pointer;
000168210302  RenameData varchar(50) value;
000169210302  RenameOperation int(5) value;
000170210302  InputJson pointer value;
000171210302end-pi;
000172210302dcl-ds list likeds(json_iterator);
000173210302dcl-ds list2 likeds(json_iterator);
000174210302
000175210302  list = json_setIterator(InputJson);
000176210302  dow json_ForEach(list);
000177210302    list2 = json_setIterator(list.this);
000178210302    dow json_ForEach(list2);
000179210302      select;
000180210302      when RenameOperation = 0;
000181210302        json_NodeRename(list2.this:RenameData + json_getName(list2.this));
000182210302      when RenameOperation = 1;
000183210302        json_NodeRename(list2.this:json_getName(list2.this) + RenameData);
000184210302      endsl;
000185210302    enddo;
000186210302  enddo;
000187210302
000188210302  return InputJson;
000189210302end-proc;
