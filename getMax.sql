select uuid, aenttypename, freetext from latestnondeletedarchentidentifiers;



select uuid, a.response from identifierasspreadsheet a join latestnondeletedaentvalue using (uuid) join attributekey using (attributeid) 
where attributename = 'Unit ID' and uuid in (
select child.uuid from latestnondeletedaentreln parent join latestnondeletedaentreln child using (relationshipid)
where parent.uuid != child.uuid
);





select childuuid, trench.response || ' - ' || unit.response
from (select uuid, response from identifierasspreadsheet join latestnondeletedarchent using (uuid) join aenttype using (aenttypeid) where aenttypename = 'Trench') trench join latestnondeletedaentreln parent using (uuid) join latestnondeletedaentreln child using (relationshipid) join 
(select uuid as childuuid, response from identifierasspreadsheet join latestnondeletedarchent using (uuid) join aenttype using (aenttypeid) where aenttypename = 'Unit') unit on (child.uuid = childuuid);
