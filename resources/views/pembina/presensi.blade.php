@extends('layouts.app')
@section('title', 'Presensi Siswa')
@section('content')
<div class="col-md-12 p-2"> 

    {{-- Tombol Tambah Presensi --}}
    <div class="mb-3">
        <a href="{{ route('presensi.create') }}" class="btn btn-success">
            <i class="fas fa-plus"></i> Tambah Presensi
        </a>
    </div>

    {{-- Card Presensi --}}
    <div class="card shadow-sm mb-4">
        <div class="card-header bg-white">
            <h5 class="mb-0">Siswa Yang Telah Mengisi Data Presensi</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered align-middle">
                    <thead class="table ">
                        <tr>
                            <th>Nama</th>
                            <th>Tanggal</th>
                            <th>Nama Kegiatan</th>
                            <th>Foto Selfie</th>
                            <th>Waktu Presensi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($presensi as $pre)
                            @foreach ($pre->presensiSiswa as $presensiSiswa)
                                <tr>
                                    <td>{{ $presensiSiswa->siswa->user->name ?? '-' }}</td>
                                    <td>{{ \Carbon\Carbon::parse($pre->tanggal)->translatedFormat('d-m-Y') }}</td>
                                    <td>{{ $pre->kegiatan->name ?? 'Kegiatan Tidak Diketahui' }}</td>
                                    <td>
                                        @if ($presensiSiswa->foto_selfie)
                                            <img src="{{ Storage::url($presensiSiswa->foto_selfie) }}" alt="Foto Selfie" width="80">
                                        @else
                                            Tidak ada foto
                                        @endif
                                    </td>
                                    <td>{{ $presensiSiswa->time ?? \Carbon\Carbon::parse($presensiSiswa->created_at)->format('H:i:s') ?? '-' }}</td>
                                </tr>
                            @endforeach
                        @empty
                            <tr>
                                <td colspan="5" class="text-center">Tidak ada data presensi siswa hari ini.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
@endsection
