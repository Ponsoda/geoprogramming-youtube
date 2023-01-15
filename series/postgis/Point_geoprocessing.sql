INSERT INTO public.dacia VALUES ('Tapae', ST_GeomFromText('Point(22.7252 45.5077)', 4326))
INSERT INTO public.dacia VALUES ('Sarmizegetusa', ST_GeomFromText('Point(23.310278 45.622778)', 4326))
INSERT INTO public.dacia VALUES ('Traiana', ST_GeomFromText('Point(22.7881 45.5158)', 4326))
INSERT INTO public.dacia VALUES ('Oltenia', ST_GeomFromText('Point(23.5 44.5)', 4326))

SELECT ST_Buffer(t.location, 0.1) from public.dacia as t WHERE t.name = 'Tapae'
SELECT ST_Distance(t.location, s.location) from public.dacia as t, public.dacia as s WHERE t.name = 'Tapae' AND s.name = 'Sarmizegetusa'
SELECT ST_MakeLine(t.location, s.location) from public.dacia as t, public.dacia as s WHERE t.name = 'Tapae' AND s.name = 'Sarmizegetusa'
SELECT ST_MakePolygon(ST_MakeLine(ARRAY[t.location, s.location, tr.location, t.location])) from public.dacia as t, public.dacia as s, public.dacia as tr WHERE t.name = 'Tapae' AND s.name = 'Sarmizegetusa' AND tr.name = 'Traiana'
SELECT ST_Collect(ARRAY[t.location, s.location, tr.location, o.location]) from public.dacia as t, public.dacia as s, public.dacia as tr, public.dacia as o WHERE t.name = 'Tapae' AND s.name = 'Sarmizegetusa' AND tr.name = 'Traiana' AND o.name = 'Oltenia'
SELECT ST_ConcaveHull(ST_Collect(ARRAY[t.location, s.location, tr.location, o.location]), 5) from public.dacia as t, public.dacia as s, public.dacia as tr, public.dacia as o WHERE t.name = 'Tapae' AND s.name = 'Sarmizegetusa' AND tr.name = 'Traiana' AND o.name = 'Oltenia'
SELECT ST_ConvexHull(ST_Collect(ARRAY[t.location, s.location, tr.location, o.location])) from public.dacia as t, public.dacia as s, public.dacia as tr, public.dacia as o WHERE t.name = 'Tapae' AND s.name = 'Sarmizegetusa' AND tr.name = 'Traiana' AND o.name = 'Oltenia'
SELECT ST_DelaunayTriangles(ST_Collect(ARRAY[t.location, s.location, tr.location, o.location]),0.001,1) from public.dacia as t, public.dacia as s, public.dacia as tr, public.dacia as o WHERE t.name = 'Tapae' AND s.name = 'Sarmizegetusa' AND tr.name = 'Traiana' AND o.name = 'Oltenia'
SELECT ST_MinimumBoundingCircle(ST_Collect(ARRAY[t.location, s.location, tr.location, o.location])) from public.dacia as t, public.dacia as s, public.dacia as tr, public.dacia as o WHERE t.name = 'Tapae' AND s.name = 'Sarmizegetusa' AND tr.name = 'Traiana' AND o.name = 'Oltenia'
SELECT ST_VoronoiLines(ST_Collect(ARRAY[t.location, s.location, tr.location, o.location])) from public.dacia as t, public.dacia as s, public.dacia as tr, public.dacia as o WHERE t.name = 'Tapae' AND s.name = 'Sarmizegetusa' AND tr.name = 'Traiana' AND o.name = 'Oltenia'
SELECT ST_VoronoiPolygons(ST_Collect(ARRAY[t.location, s.location, tr.location, o.location])) from public.dacia as t, public.dacia as s, public.dacia as tr, public.dacia as o WHERE t.name = 'Tapae' AND s.name = 'Sarmizegetusa' AND tr.name = 'Traiana' AND o.name = 'Oltenia'
