using {
    Currency,
    managed
} from '@sap/cds/common';

namespace ifl.db;

entity IFLT0001 : managed {
    key FLOWNO           : UUID @odata.Type : 'Edm.String'; /*Mapping UUIDs to OData 참고*/
        FLOWCODE         : String(5);
        FLOWCNT          : String(3);
        BUKRS            : String(4);
        BUKRS_T          : localized String(50);
        CREATOR_LOGIN_ID : String(20);
        CREATOR_NAME     : String(35);
        CREATOR_PERNR    : String(10);
        CREATOR_ORGEH    : String(10);
        CREATOR_ORGTX    : String(40);
        TITLE            : String(100);
        CREATE_DATE      : Date;
        CREATE_TIME      : Time;
        START_DATE       : Date;
        START_TIME       : Time;
        END_DATE         : Date;
        END_TIME         : Time;
        DETAIL           : Composition of many IFLT0002
                               on DETAIL.FLOWNO = FLOWNO;
/* "Composition of"는 Deep CRUD가 가능하게 해줍니다. */
}

define entity IFLT0001_texts @(cds.autoexpose) {
    key locale  : String(5);
        BUKRS   : String(4);
        BUKRS_T : String(50);
}

extend entity IFLT0001 with {
    texts     : Composition of many IFLT0001_texts
                    on texts.BUKRS = BUKRS;
    localized : Association to IFLT0001_texts
                    on  localized.BUKRS  = BUKRS
                    and localized.locale = $user.locale;
}


entity IFLT0002 {
    key FLOWNO           : UUID @odata.Type : 'Edm.String'; /*Mapping UUIDs to OData 참고*/
        FLOWCODE         : String(5);
        FLOWCNT          : String(3);
        FLOWIT           : String(2);
        WFIT_TYPE        : String(2);
        CREATE_DATE      : Date;
        CREATE_TIME      : Time;
        START_DATE       : Date;
        START_TIME       : Time;
        END_DATE         : Date;
        END_TIME         : Time;
        IT_WFSTAT        : String(1);
        APPROVE_LOGIN_ID : String(20);
        APPROVER_SAP_ID  : String(12);
        APPROVER_NAME    : String(35);
        APPROVER_PERNR   : String(10);
        APPROVER_ORGEH   : String(14);
        APPROVER_ORGTX   : String(40);
}
