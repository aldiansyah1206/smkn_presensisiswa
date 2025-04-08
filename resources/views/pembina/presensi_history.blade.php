@extends('layouts.app')
@section('title', 'Riwayat Presensi Siswa')
@section('content')
    <div class="container">
        <div class="card shadow-sm mb-4">
            <div class="card-header bg-white">
                <h5 class="mb-0">Riwayat Presensi</h5>
            </div>

            <div class="card-body">
                @if ($presensi->isEmpty())
                    <div class="text-center">Tidak ada riwayat presensi.</div>
                @else
                    <div class="table-responsive">
                        <table class="table table-bordered align-middle">
                            <thead class="table">
                                <tr>
                                    <th>No</th>
                                    <th>Tanggal</th>
                                    <th>Kegiatan</th>
                                    <th style="width: 20%;">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($presensi as $index => $pres)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $pres->tanggal }}</td>
                                        <td>{{ $pres->kegiatan->name ?? 'Tidak ada kegiatan' }}</td>
                                        <td>
                                            <div class="action-buttons d-flex align-items-center">
                                                <a href="{{ route('presensi.show', $pres->id) }}" class="btn btn-info btn-sm ml-2">Detail</a>
                                                <!-- Tombol untuk membuka modal -->
                                                <button type="button" class="btn btn-danger btn-sm ml-2" data-toggle="modal" data-target="#deleteModal{{ $pres->id }}">
                                                    Hapus
                                                </button>
                                            </div>
                                        </td>
                                    </tr>

                                    <!-- Modal konfirmasi hapus -->
                                    <div class="modal fade" id="deleteModal{{ $pres->id }}" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel{{ $pres->id }}" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="deleteModalLabel{{ $pres->id }}">Konfirmasi Penghapusan</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    Apakah Anda yakin ingin menghapus presensi ini?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                                                    <form action="{{ route('presensi.destroy', $pres->id) }}" method="POST" style="display:inline;">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger">Hapus</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection
