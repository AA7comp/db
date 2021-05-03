<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAndroidGamesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('android-games', function (Blueprint $table) {
            $table->id();
            $table->integer('ii');
            $table->integer('rank');
            $table->string('title');
            $table->integer('total_ratings');
            $table->string('installs');
            $table->double('avarage_rating',8,2);
            $table->double('growth_30_days',8,2);
            $table->double('growth_60_days',8,2);
            $table->double('price',8,2);
            $table->string('category');
            $table->integer('5_star_ratings');
            $table->integer('4_star_ratings');
            $table->integer('3_star_ratings');
            $table->integer('2_star_ratings');
            $table->integer('1_star_ratings');
            $table->boolean('paid');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('android-games');
    }
}
