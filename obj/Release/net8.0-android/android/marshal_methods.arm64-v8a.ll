; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [139 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [278 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 50
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 138
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 54
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 107
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 64
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 81
	i64 545109961164950392, ; 6: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 750875890346172408, ; 7: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 129
	i64 799765834175365804, ; 8: System.ComponentModel.dll => 0xb1956c9f18442ac => 97
	i64 849051935479314978, ; 9: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 870603111519317375, ; 10: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 58
	i64 872800313462103108, ; 11: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 69
	i64 1120440138749646132, ; 12: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 85
	i64 1121665720830085036, ; 13: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1268860745194512059, ; 14: System.Drawing.dll => 0x119be62002c19ebb => 104
	i64 1301485588176585670, ; 15: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 57
	i64 1369545283391376210, ; 16: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 77
	i64 1476839205573959279, ; 17: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 113
	i64 1486715745332614827, ; 18: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 51
	i64 1513467482682125403, ; 19: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 137
	i64 1518315023656898250, ; 20: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 59
	i64 1537168428375924959, ; 21: System.Threading.Thread.dll => 0x15551e8a954ae0df => 129
	i64 1556147632182429976, ; 22: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 23: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 62
	i64 1628611045998245443, ; 24: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 74
	i64 1672383392659050004, ; 25: Microsoft.Data.Sqlite.dll => 0x17357fd5bfb48e14 => 35
	i64 1743969030606105336, ; 26: System.Memory.dll => 0x1833d297e88f2af8 => 110
	i64 1767386781656293639, ; 27: System.Private.Uri.dll => 0x188704e9f5582107 => 117
	i64 1795316252682057001, ; 28: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 61
	i64 1825687700144851180, ; 29: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 119
	i64 1835311033149317475, ; 30: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 31: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 81
	i64 1875417405349196092, ; 32: System.Drawing.Primitives => 0x1a06d2319b6c713c => 103
	i64 1881198190668717030, ; 33: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 34: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 52
	i64 1959996714666907089, ; 35: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1981742497975770890, ; 36: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 73
	i64 1983698669889758782, ; 37: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 38: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2102659300918482391, ; 39: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 103
	i64 2192948757939169934, ; 40: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 37
	i64 2262844636196693701, ; 41: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 69
	i64 2287834202362508563, ; 42: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 89
	i64 2302323944321350744, ; 43: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 44: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 72
	i64 2335503487726329082, ; 45: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 126
	i64 2470498323731680442, ; 46: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 65
	i64 2497223385847772520, ; 47: System.Runtime => 0x22a7eb7046413568 => 124
	i64 2547086958574651984, ; 48: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 60
	i64 2602673633151553063, ; 49: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2656907746661064104, ; 50: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 44
	i64 2662981627730767622, ; 51: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2895129759130297543, ; 52: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 53: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 85
	i64 3289520064315143713, ; 54: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 71
	i64 3311221304742556517, ; 55: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 115
	i64 3325875462027654285, ; 56: System.Runtime.Numerics => 0x2e27e21c8958b48d => 122
	i64 3344514922410554693, ; 57: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 87
	i64 3429672777697402584, ; 58: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 54
	i64 3494946837667399002, ; 59: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 42
	i64 3522470458906976663, ; 60: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 82
	i64 3523004241079211829, ; 61: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 41
	i64 3551103847008531295, ; 62: System.Private.CoreLib.dll => 0x31480e226177735f => 135
	i64 3567343442040498961, ; 63: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 64: System.Runtime.dll => 0x319037675df7e556 => 124
	i64 3638003163729360188, ; 65: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 43
	i64 3647754201059316852, ; 66: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 132
	i64 3655542548057982301, ; 67: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 42
	i64 3716579019761409177, ; 68: netstandard.dll => 0x3393f0ed5c8c5c99 => 134
	i64 3727469159507183293, ; 69: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 80
	i64 3869221888984012293, ; 70: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 47
	i64 3890352374528606784, ; 71: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 52
	i64 3933965368022646939, ; 72: System.Net.Requests => 0x369840a8bfadc09b => 114
	i64 3966267475168208030, ; 73: System.Memory => 0x370b03412596249e => 110
	i64 4073500526318903918, ; 74: System.Private.Xml.dll => 0x3887fb25779ae26e => 118
	i64 4120493066591692148, ; 75: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 76: System.ComponentModel => 0x39a7562737acb67e => 97
	i64 4187479170553454871, ; 77: System.Linq.Expressions => 0x3a1cea1e912fa117 => 107
	i64 4205801962323029395, ; 78: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 96
	i64 4337444564132831293, ; 79: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 56
	i64 4356591372459378815, ; 80: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4513320955448359355, ; 81: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 38
	i64 4612482779465751747, ; 82: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 37
	i64 4679594760078841447, ; 83: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4743821336939966868, ; 84: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 94
	i64 4794310189461587505, ; 85: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 60
	i64 4795410492532947900, ; 86: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 82
	i64 4809057822547766521, ; 87: System.Drawing => 0x42bd349c3145ecf9 => 104
	i64 4853321196694829351, ; 88: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 121
	i64 5103417709280584325, ; 89: System.Collections.Specialized => 0x46d2fb5e161b6285 => 92
	i64 5129462924058778861, ; 90: Microsoft.Data.Sqlite => 0x472f835a350f5ced => 35
	i64 5182934613077526976, ; 91: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 92
	i64 5290786973231294105, ; 92: System.Runtime.Loader => 0x496ca6b869b72699 => 121
	i64 5423376490970181369, ; 93: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 119
	i64 5471532531798518949, ; 94: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 95: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 96: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 105
	i64 5573260873512690141, ; 97: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 125
	i64 5692067934154308417, ; 98: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 84
	i64 6068057819846744445, ; 99: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6183170893902868313, ; 100: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 56
	i64 6200764641006662125, ; 101: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 102: System.Text.Json.dll => 0x565a67a0ffe264a7 => 127
	i64 6251069312384999852, ; 103: System.Transactions.Local => 0x56c0426b870da1ac => 131
	i64 6357457916754632952, ; 104: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 105: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 72
	i64 6478287442656530074, ; 106: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 107: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 68
	i64 6560151584539558821, ; 108: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 49
	i64 6743165466166707109, ; 109: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 110: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 111: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 101
	i64 6894844156784520562, ; 112: System.Numerics.Vectors => 0x5faf683aead1ad72 => 115
	i64 7220009545223068405, ; 113: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 114: System.Linq => 0x64e71ccf51a90a5a => 109
	i64 7377312882064240630, ; 115: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 96
	i64 7489048572193775167, ; 116: System.ObjectModel => 0x67ee71ff6b419e3f => 116
	i64 7654504624184590948, ; 117: System.Net.Http => 0x6a3a4366801b8264 => 111
	i64 7708790323521193081, ; 118: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 119: System.Private.CoreLib => 0x6b0ff375198b9c17 => 135
	i64 7735352534559001595, ; 120: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 86
	i64 7836164640616011524, ; 121: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 62
	i64 7906140706387110155, ; 122: MovieAppHHRU => 0x6db841157c75a90b => 88
	i64 7972383140441761405, ; 123: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 40
	i64 8064050204834738623, ; 124: System.Collections.dll => 0x6fe942efa61731bf => 93
	i64 8083354569033831015, ; 125: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 71
	i64 8087206902342787202, ; 126: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 100
	i64 8167236081217502503, ; 127: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 136
	i64 8185542183669246576, ; 128: System.Collections => 0x7198e33f4794aa70 => 93
	i64 8246048515196606205, ; 129: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 55
	i64 8368701292315763008, ; 130: System.Security.Cryptography => 0x7423997c6fd56140 => 125
	i64 8400357532724379117, ; 131: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 79
	i64 8518412311883997971, ; 132: System.Collections.Immutable => 0x76377add7c28e313 => 90
	i64 8563666267364444763, ; 133: System.Private.Uri => 0x76d841191140ca5b => 117
	i64 8614108721271900878, ; 134: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 135: Java.Interop => 0x77b654e585b55834 => 136
	i64 8639588376636138208, ; 136: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 78
	i64 8677882282824630478, ; 137: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 138: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 100
	i64 9045785047181495996, ; 139: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9111603110219107042, ; 140: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 41
	i64 9250544137016314866, ; 141: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 36
	i64 9312692141327339315, ; 142: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 84
	i64 9324707631942237306, ; 143: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 61
	i64 9659729154652888475, ; 144: System.Text.RegularExpressions => 0x860e407c9991dd9b => 128
	i64 9678050649315576968, ; 145: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 65
	i64 9702891218465930390, ; 146: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 91
	i64 9808709177481450983, ; 147: Mono.Android.dll => 0x881f890734e555e7 => 138
	i64 9864956466380592553, ; 148: Microsoft.EntityFrameworkCore.Sqlite => 0x88e75da3af4ed5a9 => 39
	i64 9933555792566666578, ; 149: System.Linq.Queryable.dll => 0x89db145cf475c552 => 108
	i64 9956195530459977388, ; 150: Microsoft.Maui => 0x8a2b8315b36616ac => 53
	i64 9991543690424095600, ; 151: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 152: System.Net.Http.dll => 0x8b50e941206af13b => 111
	i64 10051358222726253779, ; 153: System.Private.Xml => 0x8b7d990c97ccccd3 => 118
	i64 10092835686693276772, ; 154: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 51
	i64 10143853363526200146, ; 155: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10229024438826829339, ; 156: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 68
	i64 10406448008575299332, ; 157: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 87
	i64 10430153318873392755, ; 158: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 66
	i64 10506226065143327199, ; 159: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10785150219063592792, ; 160: System.Net.Primitives => 0x95ac8cfb68830758 => 113
	i64 10811915265162633087, ; 161: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 38
	i64 10822644899632537592, ; 162: System.Linq.Queryable => 0x9631c23204ca5ff8 => 108
	i64 10964653383833615866, ; 163: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 102
	i64 11002576679268595294, ; 164: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 48
	i64 11009005086950030778, ; 165: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 53
	i64 11103970607964515343, ; 166: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 167: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 83
	i64 11220793807500858938, ; 168: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 169: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 49
	i64 11340910727871153756, ; 170: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 67
	i64 11398376662953476300, ; 171: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x9e2f2b2f0b71c0cc => 39
	i64 11485890710487134646, ; 172: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 120
	i64 11518296021396496455, ; 173: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 174: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 83
	i64 11530571088791430846, ; 175: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 47
	i64 11597940890313164233, ; 176: netstandard => 0xa0f429ca8d1805c9 => 134
	i64 11705530742807338875, ; 177: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 12145679461940342714, ; 178: System.Text.Json => 0xa88e1f1ebcb62fba => 127
	i64 12269460666702402136, ; 179: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 90
	i64 12279246230491828964, ; 180: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 59
	i64 12451044538927396471, ; 181: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 70
	i64 12466513435562512481, ; 182: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 75
	i64 12475113361194491050, ; 183: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 184: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 101
	i64 12538491095302438457, ; 185: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 63
	i64 12550732019250633519, ; 186: System.IO.Compression => 0xae2d28465e8e1b2f => 106
	i64 12681088699309157496, ; 187: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 188: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 64
	i64 12823819093633476069, ; 189: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12843321153144804894, ; 190: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 50
	i64 13068258254871114833, ; 191: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 123
	i64 13221551921002590604, ; 192: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 193: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13343850469010654401, ; 194: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 137
	i64 13381594904270902445, ; 195: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13465488254036897740, ; 196: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 86
	i64 13467053111158216594, ; 197: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 198: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 199: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 200: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 80
	i64 13717397318615465333, ; 201: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 95
	i64 13755568601956062840, ; 202: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 203: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 204: System.Console.dll => 0xc0a5f3cade5c6774 => 98
	i64 13955418299340266673, ; 205: Microsoft.Extensions.DependencyModel.dll => 0xc1ab9b0118299cb1 => 46
	i64 13959074834287824816, ; 206: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 70
	i64 14100563506285742564, ; 207: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 208: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 63
	i64 14125464355221830302, ; 209: System.Threading.dll => 0xc407bafdbc707a9e => 130
	i64 14133832980772275001, ; 210: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 36
	i64 14461014870687870182, ; 211: System.Net.Requests.dll => 0xc8afd8683afdece6 => 114
	i64 14464374589798375073, ; 212: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 213: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 214: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 126
	i64 14589814408413825078, ; 215: MovieAppHHRU.dll => 0xca796ee78061c836 => 88
	i64 14622043554576106986, ; 216: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 123
	i64 14669215534098758659, ; 217: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 44
	i64 14705122255218365489, ; 218: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 219: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14852515768018889994, ; 220: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 67
	i64 14892012299694389861, ; 221: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 222: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 223: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 45
	i64 14987728460634540364, ; 224: System.IO.Compression.dll => 0xcfff1ba06622494c => 106
	i64 15076659072870671916, ; 225: System.ObjectModel.dll => 0xd13b0d8c1620662c => 116
	i64 15111608613780139878, ; 226: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 227: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 105
	i64 15133485256822086103, ; 228: System.Linq.dll => 0xd204f0a9127dd9d7 => 109
	i64 15227001540531775957, ; 229: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 43
	i64 15370334346939861994, ; 230: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 66
	i64 15391712275433856905, ; 231: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 45
	i64 15527772828719725935, ; 232: System.Console => 0xd77dbb1e38cd3d6f => 98
	i64 15536481058354060254, ; 233: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15582737692548360875, ; 234: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 74
	i64 15609085926864131306, ; 235: System.dll => 0xd89e9cf3334914ea => 133
	i64 15620595871140898079, ; 236: Microsoft.Extensions.DependencyModel => 0xd8c7812eef49651f => 46
	i64 15661133872274321916, ; 237: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 132
	i64 15664356999916475676, ; 238: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 239: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15783653065526199428, ; 240: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 16018552496348375205, ; 241: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 112
	i64 16154507427712707110, ; 242: System => 0xe03056ea4e39aa26 => 133
	i64 16288847719894691167, ; 243: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 244: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 48
	i64 16454459195343277943, ; 245: System.Net.NetworkInformation => 0xe459fb756d988f77 => 112
	i64 16649148416072044166, ; 246: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 55
	i64 16677317093839702854, ; 247: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 79
	i64 16755018182064898362, ; 248: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 57
	i64 16856067890322379635, ; 249: System.Data.Common.dll => 0xe9ecc87060889373 => 99
	i64 16890310621557459193, ; 250: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 128
	i64 16942731696432749159, ; 251: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 252: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 77
	i64 17008137082415910100, ; 253: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 91
	i64 17031351772568316411, ; 254: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 76
	i64 17062143951396181894, ; 255: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 95
	i64 17089008752050867324, ; 256: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17187273293601214786, ; 257: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 94
	i64 17234219099804750107, ; 258: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 131
	i64 17260702271250283638, ; 259: System.Data.Common => 0xef8a5543bba6bc76 => 99
	i64 17333249706306540043, ; 260: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 102
	i64 17342750010158924305, ; 261: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17438153253682247751, ; 262: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17514990004910432069, ; 263: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 264: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17702523067201099846, ; 265: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 266: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 75
	i64 17710060891934109755, ; 267: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 73
	i64 17712670374920797664, ; 268: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 120
	i64 17777860260071588075, ; 269: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 122
	i64 18017743553296241350, ; 270: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 40
	i64 18025913125965088385, ; 271: System.Threading => 0xfa28e87b91334681 => 130
	i64 18099568558057551825, ; 272: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 273: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 76
	i64 18245806341561545090, ; 274: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 89
	i64 18305135509493619199, ; 275: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 78
	i64 18324163916253801303, ; 276: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18370042311372477656 ; 277: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 58
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [278 x i32] [
	i32 50, ; 0
	i32 138, ; 1
	i32 54, ; 2
	i32 107, ; 3
	i32 64, ; 4
	i32 81, ; 5
	i32 7, ; 6
	i32 129, ; 7
	i32 97, ; 8
	i32 10, ; 9
	i32 58, ; 10
	i32 69, ; 11
	i32 85, ; 12
	i32 18, ; 13
	i32 104, ; 14
	i32 57, ; 15
	i32 77, ; 16
	i32 113, ; 17
	i32 51, ; 18
	i32 137, ; 19
	i32 59, ; 20
	i32 129, ; 21
	i32 16, ; 22
	i32 62, ; 23
	i32 74, ; 24
	i32 35, ; 25
	i32 110, ; 26
	i32 117, ; 27
	i32 61, ; 28
	i32 119, ; 29
	i32 6, ; 30
	i32 81, ; 31
	i32 103, ; 32
	i32 28, ; 33
	i32 52, ; 34
	i32 28, ; 35
	i32 73, ; 36
	i32 2, ; 37
	i32 20, ; 38
	i32 103, ; 39
	i32 37, ; 40
	i32 69, ; 41
	i32 89, ; 42
	i32 24, ; 43
	i32 72, ; 44
	i32 126, ; 45
	i32 65, ; 46
	i32 124, ; 47
	i32 60, ; 48
	i32 27, ; 49
	i32 44, ; 50
	i32 2, ; 51
	i32 7, ; 52
	i32 85, ; 53
	i32 71, ; 54
	i32 115, ; 55
	i32 122, ; 56
	i32 87, ; 57
	i32 54, ; 58
	i32 42, ; 59
	i32 82, ; 60
	i32 41, ; 61
	i32 135, ; 62
	i32 22, ; 63
	i32 124, ; 64
	i32 43, ; 65
	i32 132, ; 66
	i32 42, ; 67
	i32 134, ; 68
	i32 80, ; 69
	i32 47, ; 70
	i32 52, ; 71
	i32 114, ; 72
	i32 110, ; 73
	i32 118, ; 74
	i32 33, ; 75
	i32 97, ; 76
	i32 107, ; 77
	i32 96, ; 78
	i32 56, ; 79
	i32 30, ; 80
	i32 38, ; 81
	i32 37, ; 82
	i32 0, ; 83
	i32 94, ; 84
	i32 60, ; 85
	i32 82, ; 86
	i32 104, ; 87
	i32 121, ; 88
	i32 92, ; 89
	i32 35, ; 90
	i32 92, ; 91
	i32 121, ; 92
	i32 119, ; 93
	i32 26, ; 94
	i32 29, ; 95
	i32 105, ; 96
	i32 125, ; 97
	i32 84, ; 98
	i32 23, ; 99
	i32 56, ; 100
	i32 23, ; 101
	i32 127, ; 102
	i32 131, ; 103
	i32 34, ; 104
	i32 72, ; 105
	i32 11, ; 106
	i32 68, ; 107
	i32 49, ; 108
	i32 19, ; 109
	i32 22, ; 110
	i32 101, ; 111
	i32 115, ; 112
	i32 26, ; 113
	i32 109, ; 114
	i32 96, ; 115
	i32 116, ; 116
	i32 111, ; 117
	i32 17, ; 118
	i32 135, ; 119
	i32 86, ; 120
	i32 62, ; 121
	i32 88, ; 122
	i32 40, ; 123
	i32 93, ; 124
	i32 71, ; 125
	i32 100, ; 126
	i32 136, ; 127
	i32 93, ; 128
	i32 55, ; 129
	i32 125, ; 130
	i32 79, ; 131
	i32 90, ; 132
	i32 117, ; 133
	i32 21, ; 134
	i32 136, ; 135
	i32 78, ; 136
	i32 21, ; 137
	i32 100, ; 138
	i32 31, ; 139
	i32 41, ; 140
	i32 36, ; 141
	i32 84, ; 142
	i32 61, ; 143
	i32 128, ; 144
	i32 65, ; 145
	i32 91, ; 146
	i32 138, ; 147
	i32 39, ; 148
	i32 108, ; 149
	i32 53, ; 150
	i32 6, ; 151
	i32 111, ; 152
	i32 118, ; 153
	i32 51, ; 154
	i32 3, ; 155
	i32 68, ; 156
	i32 87, ; 157
	i32 66, ; 158
	i32 1, ; 159
	i32 113, ; 160
	i32 38, ; 161
	i32 108, ; 162
	i32 102, ; 163
	i32 48, ; 164
	i32 53, ; 165
	i32 12, ; 166
	i32 83, ; 167
	i32 15, ; 168
	i32 49, ; 169
	i32 67, ; 170
	i32 39, ; 171
	i32 120, ; 172
	i32 13, ; 173
	i32 83, ; 174
	i32 47, ; 175
	i32 134, ; 176
	i32 9, ; 177
	i32 127, ; 178
	i32 90, ; 179
	i32 59, ; 180
	i32 70, ; 181
	i32 75, ; 182
	i32 34, ; 183
	i32 101, ; 184
	i32 63, ; 185
	i32 106, ; 186
	i32 14, ; 187
	i32 64, ; 188
	i32 27, ; 189
	i32 50, ; 190
	i32 123, ; 191
	i32 1, ; 192
	i32 15, ; 193
	i32 137, ; 194
	i32 9, ; 195
	i32 86, ; 196
	i32 29, ; 197
	i32 30, ; 198
	i32 13, ; 199
	i32 80, ; 200
	i32 95, ; 201
	i32 8, ; 202
	i32 11, ; 203
	i32 98, ; 204
	i32 46, ; 205
	i32 70, ; 206
	i32 3, ; 207
	i32 63, ; 208
	i32 130, ; 209
	i32 36, ; 210
	i32 114, ; 211
	i32 24, ; 212
	i32 5, ; 213
	i32 126, ; 214
	i32 88, ; 215
	i32 123, ; 216
	i32 44, ; 217
	i32 16, ; 218
	i32 32, ; 219
	i32 67, ; 220
	i32 33, ; 221
	i32 0, ; 222
	i32 45, ; 223
	i32 106, ; 224
	i32 116, ; 225
	i32 17, ; 226
	i32 105, ; 227
	i32 109, ; 228
	i32 43, ; 229
	i32 66, ; 230
	i32 45, ; 231
	i32 98, ; 232
	i32 4, ; 233
	i32 74, ; 234
	i32 133, ; 235
	i32 46, ; 236
	i32 132, ; 237
	i32 4, ; 238
	i32 12, ; 239
	i32 5, ; 240
	i32 112, ; 241
	i32 133, ; 242
	i32 18, ; 243
	i32 48, ; 244
	i32 112, ; 245
	i32 55, ; 246
	i32 79, ; 247
	i32 57, ; 248
	i32 99, ; 249
	i32 128, ; 250
	i32 25, ; 251
	i32 77, ; 252
	i32 91, ; 253
	i32 76, ; 254
	i32 95, ; 255
	i32 32, ; 256
	i32 94, ; 257
	i32 131, ; 258
	i32 99, ; 259
	i32 102, ; 260
	i32 10, ; 261
	i32 25, ; 262
	i32 8, ; 263
	i32 20, ; 264
	i32 31, ; 265
	i32 75, ; 266
	i32 73, ; 267
	i32 120, ; 268
	i32 122, ; 269
	i32 40, ; 270
	i32 130, ; 271
	i32 19, ; 272
	i32 76, ; 273
	i32 89, ; 274
	i32 78, ; 275
	i32 14, ; 276
	i32 58 ; 277
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
