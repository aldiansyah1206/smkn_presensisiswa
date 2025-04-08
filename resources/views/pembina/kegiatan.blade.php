@extends('layouts.app') 
@section('title', 'Data Siswa') 
@section('content')
<div class="row">
    <div class="col-lg-12">
        @if ($kegiatan->isNotEmpty())
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                    <h4 class="text-bold m-0">Data Siswa</h4>
                    <a href="{{ route('pembina.siswaPdf') }}" class="btn btn-primary">Export PDF</a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr> 
                                    <th>Nama</th>
                                    <th>Kelas</th>
                                    <th>Jurusan</th>
                                    <th>Jenis Kelamin</th>
                                    <th>Kegiatan</th>
                                    <th>No HP</th>
                                    <th>Alamat</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($siswa as $index => $s)
                                    <tr> 
                                        <td>{{ $s->user->name }}</td>
                                        <td>{{ $s->kelas->name }}</td>
                                        <td>{{ $s->jurusan->name }}</td>
                                        <td>{{ $s->jenis_kelamin }}</td>
                                        <td>{{ $s->kegiatan->name }}</td>
                                        <td>{{ $s->no_hp }}</td>
                                        <td>{{ $s->alamat }}</td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="8" class="text-center">Tidak ada siswa yang terdaftar.</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        @else
            <div class="alert alert-info text-center">
                Tidak ada data yang dikelola.
            </div>
        @endif
    </div>
</div>
@endsection

