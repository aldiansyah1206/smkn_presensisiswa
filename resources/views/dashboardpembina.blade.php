@extends('layouts.app')
@section('title', 'Dashboard Pembina')
@section('content')
<div class="row">
    <div class="col-lg-12">
        <div class="card mb-4">
            <div class="card-header">
                <h3 class="text-dark">Dashboard Pembina</h3>
            </div>
            <div class="card-body">
                <div class="row">
                   <!-- Data Siswa Card Example -->
                   <div class="col-xl-4 col-md-6 mb-4">
                    <a href="{{ route('pembina.kegiatan.index') }}" class="text-decoration-none">
                        <div class="card border-left-success shadow h-100 py-2 clickable-card">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xl font-weight-bold text-success text-capitalize mb-2">
                                            Jumlah Siswa
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            {{ $countSiswaKegiatan }}
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-user-friends fa-2x text-success"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <!-- Jadwal Kegiatan Card Example -->
                <div class="col-xl-4 col-md-6 mb-4">
                    <div class="card border-left-secondary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2"> 
                                    <div class="text-xl font-weight-bold text-secondary text-capitalize mb-2">
                                            Jadwal Kegiatan
                                    </div>
                                    <div class="text-xl mt-2">
                                        <a href="/jadwalpembina" class="btn btn-light btn-icon-split">
                                            <span class="icon text-gray-600">
                                                <i class="fas fa-arrow-right"></i>
                                            </span>
                                            <span class="text">Lihat Detail..</span>
                                        </a>
                                    </div>
                                </div>
                                    <div class="col-auto">
                                        <i class="fas fa-calendar fa-2x text-secondary"></i>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div> 
                </div>
            </div>
        </div>
    </div> 
</div>
 
@endsection