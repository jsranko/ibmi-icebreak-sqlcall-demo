000100210323      Call QSYS2.QCMDEXC ('CHGCURLIB CURLIB(ICE_DEM2)');
000101210302
000102210302	  -- ---------------------------------------------------------------------
000103210302	  -- Delete TelefonverzeichnisEintrag
000104210302	  -- ---------------------------------------------------------------------
000105210302	
000106210323      Create or Replace Procedure ICE_DEM2/EXT_addDTF00P
000107210302      (
000110210323         InOut IOP_tfrowid Bigint Default Null,
000111210323         In INP_tftvnr Numeric(5, 0) Default Null,
000112210323         In INP_tfpenr Decimal(4, 0) Default Null,
000113210323         In INP_tfanre Char(1) Default Null,
000114210323         In INP_tfnam Varchar(30) Default Null,
000115210323         In INP_tfkst Numeric(5, 0) Default Null,
000116210323         In INP_tftext Char(50) Default Null,
000117210323         In INP_tfnamz Char(3) Default Null,
000118210323         In INP_tftelh Char(4) Default Null,
000119210323         In INP_tffaxi Char(4) Default Null,
000120210323         In INP_tftelr Char(6) Default Null,
000121210323         In INP_tfteln Char(9) Default Null,
000122210323         In INP_tfropo Char(2) Default Null,
000123210323         In INP_tfraum Decimal(3, 0) Default Null,
000124210323         In INP_tfpark Char(3) Default Null,
000125210323         In INP_tfsrbg Char(1) Default Null,
000126210323         In INP_tfegro Char(1) Default Null,
000127210323         In INP_tfnams Char(30) Default Null,
000128210323         In INP_tfsag Char(4) Default Null,
000129210323         In INP_tftelm Char(4) Default Null,
000130210323         In INP_tfvmte Char(4) Default Null,
000131210323         In INP_tfrmte Char(9) Default Null,
000132210323         In INP_tfmobi Char(1) Default Null,
000133210323         In INP_tftels Char(4) Default Null,
000134210323         In INP_tffaxn Char(9) Default Null,
000135210323         In INP_tfgdat Decimal(8, 0) Default Null,
000136210323         In INP_tfmaild1 Char(30) Default Null,
000137210323         In INP_tfmaild2 Char(30) Default Null,
000138210323         In INP_tfmailp Char(30) Default Null
000139210323      )
000140210323      Language SQL
000141210323      Modifies SQL Data
000142210323      Specific ICE_DEM2/DTF0000SP
000143210323      Returns Null On Null Input
000144210323      Set Option DBGVIEW = *SOURCE,
000145210323                 COMMIT = *CHG,
000146210323                 CLOSQLCSR = *ENDACTGRP
000153210302
000154210302      Begin Atomic
000162210302
000164210302
000165210302      End;
000166210302
000167210323      Label On Specific Procedure ICE_DEM2/DTF0000SP Is 'SP: Add TelefonverzeichnisEintrag';
000168210323
000169210323      Grant Execute on Specific Procedure ICE_DEM2/DTF0000SP To Public ;
000170210302
000171210302      -- Schema zurucksetzen
000172210302      Call QSYS2.QCMDEXC ('CHGCURLIB CURLIB(*CRTDFT)');
