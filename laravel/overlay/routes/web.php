<?php

use Illuminate\Support\Facades\Route;

Route::get('/hello', fn () => response()->json(['hello' => 'watchtower']));
Route::get('/boom', fn () => throw new RuntimeException('boom from the Laravel example'));
