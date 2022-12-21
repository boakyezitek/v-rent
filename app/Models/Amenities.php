<?php

/**
 * Amenities Model
 *
 * Amenities Model manages Amenities operation.
 *
 * @category   Language
 * @package    vRent
 * @author     Techvillage Dev Team
 * @copyright  2020 Techvillage
 * @license
 * @version    2.7
 * @link       http://techvill.net
 * @since      Version 1.3
 * @deprecated None
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class Amenities extends Model
{
    protected $table    = 'amenities';
    public $timestamps  = false;

    public function amenity_type()
    {
        return $this->belongsTo('App\Models\AmenityType', 'type_id', 'id');
    }

    
    public static function normal($property_id,$type_id)
    {
        $result = DB::select("select amenities.title as title, amenities.id as id, amenities.symbol, properties.id as status from amenities left join properties on find_in_set(amenities.id, properties.amenities) and properties.id = $property_id where type_id in (1, $type_id)");
        return $result;
    }

    public static function security($property_id)
    {
        $result = DB::select("select amenities.title as title, amenities.id as id, amenities.symbol, properties.id as status from amenities left join properties on find_in_set(amenities.id, properties.amenities) and properties.id = $property_id where type_id = 2");
        return $result;
    }
    public static function otherAmenitiesType() 
    {
        $value = count(AmenityType::all());
        $value = $value -2;
        $result = AmenityType::select('id')->orderBy('id')->offset(2)->limit($value)->get();

        foreach ($result as $type) {
           $type_id[] = $type->id;
        }

        $result = implode(',',$type_id);
        return $result;
    } 
}
