SELECT
toFloat64('inf'),
toFloat64('-inf'),
toFloat64('INF'),
toFloat64('-INF'),
toFloat64('Infinity'),
toFloat64('-Infinity'),
toFloat64('nan'),
toFloat64('-nan'),
toFloat64('NAN'),
toFloat64('-NAN'),
toFloat64('NaN'),
toFloat64('-NaN'),

toFloat64OrZero('in'),
toFloat64OrZero('-in'),
toFloat64OrZero('INFi'),
toFloat64OrZero('-INFi'),
toFloat64OrZero('Infinit'),
toFloat64OrZero('-Infinit'),
toFloat64OrZero('na'),
toFloat64OrZero('-na'),
toFloat64OrZero('NANo'),
toFloat64OrZero('-NANo'),
toFloat64OrZero('NaN+'),
toFloat64OrZero('-NaNa'),
toFloat64OrZero('+Na'),

toFloat32('inf'),
toFloat32('-inf'),
toFloat32('INF'),
toFloat32('-INF'),
toFloat32('Infinity'),
toFloat32('-Infinity'),
toFloat32('nan'),
toFloat32('-nan'),
toFloat32('NAN'),
toFloat32('-NAN'),
toFloat32('NaN'),
toFloat32('-NaN'),

toFloat32OrZero('in'),
toFloat32OrZero('-in'),
toFloat32OrZero('INFi'),
toFloat32OrZero('-INFi'),
toFloat32OrZero('Infinit'),
toFloat32OrZero('-Infinit'),
toFloat32OrZero('na'),
toFloat32OrZero('-na'),
toFloat32OrZero('NANo'),
toFloat32OrZero('-NANo'),
toFloat32OrZero('NaN+'),
toFloat32OrZero('-NaNa'),
toFloat32OrZero('+Na')

FORMAT TabSeparated;
