select uuid, aenttypename, freetext from latestnondeletedarchentidentifiers;
select max(cast(freetext as integer)) from latestnondeletedaentvalue join attributekey using (attributeid) where attributename = 'Unit ID' and uuid in (
select child.uuid from latestnondeletedaentreln parent join latestnondeletedaentreln child using (relationshipid)
where parent.uuid != child.uuid
and parent.uuid = 1000011408066189727);