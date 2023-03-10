<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
  /**
   * Run the migrations.
   *
   * @return void
   */
  public function up()
  {
    if (!Schema::hasTable('users')) {
      Schema::create('users', function (Blueprint $table) {
        $table->increments('id');
        $table->string('role', 20)->nullable();
        $table->string('name', 100)->nullable();
        $table->string('surname', 200)->nullable();
        $table->string('nick', 100)->nullable();
        $table->string('email', 255)->nullable();
        $table->string('password', 255)->nullable();
        $table->string('image', 255)->nullable();
        $table->timestamps();
        $table->string('remember_token', 255)->nullable();
        $table->engine = 'InnoDB';
        $table->charset = 'utf8';
        $table->collation = 'utf8_general_ci';
      });
    }
  }

  /**
   * Reverse the migrations.
   *
   * @return void
   */
  public function down()
  {
    Schema::dropIfExists('users');
  }
};
