@extends('template')
@push('css')
    <style>
        .static ul{
            list-style-type: disc !important;
            margin-left:40px;
        }
        .static strong{
            font-weight: bold;
        }
        .static a{
            text-decoration: underline;
        }
    </style>   
@endpush

@section('main')
<main role="main" id="site-content" class="margin-top-85">
    <div class="container-fluid container-fluid-90 min-height static">
        {!! $content !!}
    </div>   
    <br>
</main>
@stop


<style>
    img {
        width:100%;
        height: auto;
    }
</style>