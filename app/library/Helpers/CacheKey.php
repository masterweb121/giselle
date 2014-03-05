<?php namespace Giselle\Helpers;

class CacheKey
{

	/**
	 * Create a unique key used to store cached data into cache backend
	 *
	 * @param  array $params values used to generate key
	 * @return string unique key
	 */
	public static function create($parameters = null) {

        $uniqueKey = array();

        if ( ! is_array($parameters)){
            // null, false, empty values are not allowed
            $parameters = array_filter(func_get_args());
            $parameters = array_flip($parameters);

            if (empty($parameters))
                throw new \InvalidArgumentException;
        }
        foreach ($parameters as $key => $value) {
            if (is_scalar($value)) {
                $uniqueKey[] = $key . ':' . $value;
            } else {
                if (is_array($value)) {
                    $uniqueKey[] = $key . ':[' . static::create($value) .']';
                }
            }
        }
        return join(',', $uniqueKey);
	}

}