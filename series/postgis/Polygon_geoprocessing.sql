INSERT INTO public.poly VALUES ('Connecticut', ST_GeomFromText('POLYGON  ((-73.48 42.05, -71.8 42.02, -71.85 41.32, -73.64 40.99, -73.48 42.05))', 4326))
INSERT INTO public.poly VALUES ('Westerly', ST_GeomFromText('POLYGON  ((-71.88 41.42, -71.88 41.33, -71.69 41.32, -71.68 41.43, -71.88 41.42))', 4326))

INSERT INTO public.poly VALUES ('My house', ST_GeomFromText('POLYGON  ((-71.83 41.42, -71.80 41.36, -71.69 41.38, -71.69 41.41, -71.83 41.42))', 4326))

SELECT ST_Collect(ARRAY[c.geom, w.geom, mh.geom]) from public.poly as c, public.poly as w, public.poly as mh WHERE c.name = 'Connecticut' AND w.name = 'Westerly' AND mh.name = 'My house'
SELECT ST_Union(ARRAY[c.geom, w.geom, mh.geom]) from public.poly as c, public.poly as w, public.poly as mh WHERE c.name = 'Connecticut' AND w.name = 'Westerly' AND mh.name = 'My house'
SELECT ST_Centroid (c.geom) from public.poly as c WHERE c.name = 'Connecticut'
SELECT ST_Buffer (c.geom, 0.5) from public.poly as c WHERE c.name = 'Connecticut'
SELECT ST_Area(c.geom) from public.poly as c WHERE c.name = 'Connecticut'
SELECT ST_Contains(c.geom, w.geom) from public.poly as c, public.poly as w WHERE c.name = 'Connecticut' AND w.name = 'Westerly'
SELECT ST_Contains(w.geom, mh.geom) from public.poly as w, public.poly as mh WHERE w.name = 'Westerly' AND mh.name = 'My house'
SELECT ST_Intersects(c.geom, w.geom) from public.poly as c, public.poly as w WHERE c.name = 'Connecticut' AND w.name = 'Westerly'
SELECT ST_Intersection(c.geom, w.geom) from public.poly as c, public.poly as w WHERE c.name = 'Connecticut' AND w.name = 'Westerly'
