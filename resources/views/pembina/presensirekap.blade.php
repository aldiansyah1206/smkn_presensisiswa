@extends('layouts.app')
@section('title', 'Rekap Presensi Siswa')
@section('content')
<div class="col-md-12 p-3"> 
    <div class="card shadow-sm mb-4">
        <div class="card-header bg-white ">
            <div class="d-flex justify-content-between align-items-center flex-wrap">
                <h5 class="mb-0">Rekap Presensi Siswa</h5>
                <form action="{{ route('presensi.rekap') }}" method="get" class="d-flex gap-2 align-items-center mt-2 mt-md-2 flex-wrap">
                    <div class="form-group mb-0 ">
                        <select name="month" id="month" class="form-control" onchange="this.form.submit()">   
                            <option value="1" {{ $selectedMonth == 1 ? 'selected' : '' }}>Januari</option>
                            <option value="2" {{ $selectedMonth == 2 ? 'selected' : '' }}>Februari</option>
                            <option value="3" {{ $selectedMonth == 3 ? 'selected' : '' }}>Maret</option>
                            <option value="4" {{ $selectedMonth == 4 ? 'selected' : '' }}>April</option>
                            <option value="5" {{ $selectedMonth == 5 ? 'selected' : '' }}>Mei</option>
                            <option value="6" {{ $selectedMonth == 6 ? 'selected' : '' }}>Juni</option>
                            <option value="7" {{ $selectedMonth == 7 ? 'selected' : '' }}>Juli</option>
                            <option value="8" {{ $selectedMonth == 8 ? 'selected' : '' }}>Agustus</option>
                            <option value="9" {{ $selectedMonth == 9 ? 'selected' : '' }}>September</option>
                            <option value="10" {{ $selectedMonth == 10 ? 'selected' : '' }}>Oktober</option>
                            <option value="11" {{ $selectedMonth == 11 ? 'selected' : '' }}>November</option>
                            <option value="12" {{ $selectedMonth == 12 ? 'selected' : '' }}>Desember</option>
                        </select>
                    </div>
                    <div class="ml-2 mb-2 mb-md-0">
                        <a href="{{ route('presensi.rekap', ['month' => $selectedMonth, 'export' => 'pdf']) }}" class="btn btn-success">
                            <i class="fas fa-file-pdf me-1"></i> Ekspor PDF
                        </a>
                    </div>
                </form>
            </div>
        </div>
        
        
        <div class="card-body">
            <div class="table-responsive">
                @if($presensi->isEmpty())
                    <p class="text-center"><strong>Belum ada data presensi bulan ini.</strong></p>
                @else
                    <table class="table table-bordered text-center align-middle">
                        <thead class="table ">
                            <tr> 
                                <th>No</th>
                                <th>Nama Siswa</th>
                                @foreach ($dates as $date)
                                    <th>{{ \Carbon\Carbon::parse($date)->translatedFormat('d F') }}</th>
                                @endforeach
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($siswa as $index => $s)
                                <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{{ $s->user->name }}</td>
                                    @foreach ($dates as $date)
                                        <td>
                                            @php
                                                $isPresent = '✘'; // Default to absent
                                                if ($s->presensi) {
                                                    foreach ($s->presensi as $presensiItem) {
                                                        if (\Carbon\Carbon::parse($presensiItem->pivot->tanggal)->isSameDay($date)) {
                                                            $isPresent = '✔'; // Mark as present
                                                            break;
                                                        }
                                                    }
                                                }
                                            @endphp
                                            {{ $isPresent }}
                                        </td>
                                    @endforeach
                                </tr> 
                            @endforeach
                        </tbody>
                    </table>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection

<style>
    .btn-success:hover { background-color: #218838; border-color: #1e7e34; }
    .card { transition: transform 0.2s ease; }
    .card:hover { transform: translateY(0px); }
</style>