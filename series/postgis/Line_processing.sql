INSERT INTO public.lines VALUES ('Mexico-Venezuela', ST_GeomFromText('LINESTRING (-102 23, -66 7)', 4326))
INSERT INTO public.lines VALUES ('Colombia-Cuba', ST_GeomFromText('LINESTRING (-75 2, -79 21)', 4326))

SELECT ST_Collect(mv.geom, cc.geom) from public.lines as mv, public.lines as cc WHERE mv.name = 'Mexico-Venezuela' AND cc.name = 'Colombia-Cuba'

SELECT geom from public.lines

SELECT ST_Length(mv.geom) from public.lines as mv WHERE mv.name = 'Mexico-Venezuela'

SELECT ST_Intersects(mv.geom, cc.geom) from public.lines as mv, public.lines as cc WHERE mv.name = 'Mexico-Venezuela' AND cc.name = 'Colombia-Cuba'

SELECT ST_Intersection(mv.geom, cc.geom) from public.lines as mv, public.lines as cc WHERE mv.name = 'Mexico-Venezuela' AND cc.name = 'Colombia-Cuba'

SELECT ST_Buffer(mv.geom, 0.5) from public.lines as mv WHERE mv.name = 'Mexico-Venezuela'

SELECT ST_Centroid(mv.geom) from public.lines as mv WHERE mv.name = 'Mexico-Venezuela'

SELECT ST_Segmentize(mv.geom, 10) from public.lines as mv WHERE mv.name = 'Mexico-Venezuela'

SELECT ST_Segmentize(mv.geom::geometry, 0.5) from public.lines as mv WHERE mv.name = 'Mexico-Venezuela'

SELECT ST_AsText(ST_Segmentize(mv.geom::geometry, 0.5)) from public.lines as mv WHERE mv.name = 'Mexico-Venezuela'
