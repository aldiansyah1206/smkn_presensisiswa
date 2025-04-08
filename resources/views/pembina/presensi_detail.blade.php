@extends('layouts.app')
@section('title', 'Detail Presensi Siswa')
@section('content')
<div class="container">
    <div class="card shadow-sm mb-2">
        <div class="card-header bg-white">
            <h5 class="mb-0">Detail Presensi Siswa</h5>
        </div> 
        <div class="card-body">
            @if (empty($presensiSiswa) || $presensiSiswa->isEmpty())
                <p class="text-muted">Tidak ada siswa yang mengisi presensi pada tanggal ini.</p>
            @else
            <div class="table-responsive">
                <table class="table table-bordered text-center align-middle">
                    <thead class="table ">
                        <tr>
                            <th>No</th>
                            <th>Nama Siswa</th>
                            <th>Foto Selfie</th>
                            <th>Waktu Presensi</th>
                            <th>Aksi</th>  
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($presensiSiswa as $index => $ps)
                            <tr>
                                <td>{{ $index + 1 }}</td>
                                <td>{{ $ps->siswa->user->name }}</td> 
                                <td>
                                    @if ($ps->foto_selfie)
                                        <img src="{{ Storage::url($ps->foto_selfie) }}" alt="Foto Selfie" width="100">
                                    @else
                                        Tidak ada foto
                                    @endif
                                </td>
                                <td>{{ $ps->time ?? \Carbon\Carbon::parse($ps->created_at)->format('H:i:s') }}</td>
                                <td>
                                    <!-- Tombol Hapus -->
                                    <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal{{ $ps->id }}">
                                        Hapus
                                    </button>
                                </td>
                            </tr>

                            <!-- Modal Hapus -->
                            <div class="modal fade" id="deleteModal{{ $ps->id }}" tabindex="-1" aria-labelledby="deleteModalLabel{{ $ps->id }}" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Konfirmasi Hapus</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Tutup"></button>
                                        </div>
                                        <div class="modal-body">
                                            Yakin ingin menghapus presensi dari <strong>{{ $ps->siswa->user->name }}</strong>?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                            <form action="{{ route('pembina.presensi.siswa.delete', $ps->id) }}" method="POST">
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
        </div>
        @endif  
    </div>
</div>
@endsection
