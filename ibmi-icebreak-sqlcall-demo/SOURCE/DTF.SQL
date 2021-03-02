000100210302      Call QSYS2.QCMDEXC ('CHGCURLIB CURLIB(ICE_DEM1)');
000101210302
000102210302	  -- ---------------------------------------------------------------------
000103210302	  -- Delete TelefonverzeichnisEintrag
000104210302	  -- ---------------------------------------------------------------------
000105210302	
000106210302      Create or Replace Procedure deleteTelefonverzeichnisEintrag
000107210302      (
000108210302         In in_tfrowid Bigint
000109210302      )
000110210302      Language SQL
000111210302      Modifies Sql Data
000112210302      Specific ICE_DEM1/DTFDTVE
000113210302      Returns Null On Null Input
000114210302      Set Option DBGVIEW = *SOURCE
000115210302
000116210302      Begin Atomic
000117210302         Declare InputParameters Varchar(256);
000118210302         Declare Exit Handler For Not Found Begin
000119210302             Set InputParameters = 'deleteTelefonverzeichnisEintrag(' Concat
000120210302                                      Char(in_tfrowid) Concat ')';
000121210302             SIGNAL SQLSTATE 'DTF04'
000122210302                    SET MESSAGE_TEXT = InputParameters;
000123210302         End;
000124210302
000125210302         Delete From Dtf00p a where a.tfrowid = in_tfrowid;
000126210302
000127210302      End;
000128210302
000129210302      Label On Specific Procedure DTFDTVE Is 'SP: Delete TelefonverzeichnisEintrag';
000130210302
000131210302      Grant Execute on Specific Procedure DTFDTVE To Public ;
000132210302
000133210302      -- Schema zurucksetzen
000134210302      Call QSYS2.QCMDEXC ('CHGCURLIB CURLIB(*CRTDFT)');
