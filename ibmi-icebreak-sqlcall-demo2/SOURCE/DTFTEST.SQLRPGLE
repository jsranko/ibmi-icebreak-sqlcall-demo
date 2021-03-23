000100210302**FREE
000101210302
000112210302//*********************************************************************************************
000113210302//
000118210323//    addlible ice0674
000119210323//    addlible ice_dem2
000120210302//
000121210323//    CRTSQLRPGI OBJ(ICE_DEM2/DTFTEST) SRCFILE(ICE_DEM2/SOURCE) SRCMBR(DTFTEST)
000124210323//               COMMIT(*NONE) OBJTYPE(*PGM) RPGPPOPT(*LVL2) REPLACE(*NO) DBGVIEW(*SOURCE)
000129210302//
000130210302//*********************************************************************************************
000131210302
000132210323ctl-opt main(main);
000133210302ctl-opt decedit('0,') datedit(*DMY.);
000134210302ctl-opt option(*srcstmt:*nodebugio);
000135210323ctl-opt bnddir('ICE674/ICEBREAK');
000136210302
000137210302/include qrpglesrc,noxDb
000138210302
000139210302//*********************************************************************************************
000140210302// deleteRows
000141210302//*********************************************************************************************
000142210323dcl-proc main;
000143210323dcl-pi main;
000144210302end-pi;
000145210302dcl-s error pointer;
000146210302dcl-s parameters pointer;
000147210302dcl-s output pointer;
000148210323dcl-ds dsDaten extname('DTF00P') qualified inz;
000149210323end-ds;
000150210323dcl-s json pointer;
000151210323dcl-s handle	char(1);
000152210302dcl-s showMe varchar(32000);
000153210302
000154210323  dsDaten.TFTVNR = 213;
000155210323  dsDaten.TFANRE = '1';
000156210323  dsDaten.TFPENR = 429;
000157210323
000158210323  data-gen dsDaten %data(handle:'') %gen(json_DataGen(json));
000159210323
000160210302  error = json_newObject();
000161210323  showMe = json_asJsonText(json);
000162210323  parameters = renameAttributes('in_':0:json);
000163210302  showMe = json_asJsonText(parameters);
000164210323  output = json_sqlCall('ICE_DEM2.EXT_ADDDTF00P': parameters);
000165210302  showMe = json_asJsonText(output);
000166210302  if json_Error(output);
000167210302    json_setStr(error: 'message' : json_Message(output));
000168210323    showMe = json_asJsonText(error);
000169210302  endif;
000170210302
000171210323  return;
000172210302end-proc;
000173210302
000174210302//*********************************************************************************************
000175210302// renameAttributes
000176210302//*********************************************************************************************
000177210302dcl-proc renameAttributes;
000178210302dcl-pi renameAttributes pointer;
000179210302  RenameData varchar(50) value;
000180210302  RenameOperation int(5) value;
000181210302  InputJson pointer value;
000182210302end-pi;
000183210302dcl-ds list likeds(json_iterator);
000184210302dcl-ds list2 likeds(json_iterator);
000185210302
000186210302  list = json_setIterator(InputJson);
000187210302  dow json_ForEach(list);
000188210302    list2 = json_setIterator(list.this);
000189210302    dow json_ForEach(list2);
000190210302      select;
000191210302      when RenameOperation = 0;
000192210302        json_NodeRename(list2.this:RenameData + json_getName(list2.this));
000193210302      when RenameOperation = 1;
000194210302        json_NodeRename(list2.this:json_getName(list2.this) + RenameData);
000195210302      endsl;
000196210302    enddo;
000197210302  enddo;
000198210302
000199210302  return InputJson;
000200210302end-proc;
