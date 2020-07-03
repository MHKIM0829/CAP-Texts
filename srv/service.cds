using {ifl.db as db} from '../db/schema';

service iflowService @(path : 'IFL') {
    entity IFLT0001 as projection on db.IFLT0001;

    @cds.localized : false
    entity IFLT0002 as projection on db.IFLT0002;
}
