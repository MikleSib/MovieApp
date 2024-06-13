; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [139 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [278 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 112
	i32 26230656, ; 1: Microsoft.Extensions.DependencyModel => 0x1903f80 => 46
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 129
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 55
	i32 117431740, ; 5: System.Runtime.InteropServices => 0x6ffddbc => 120
	i32 159306688, ; 6: System.ComponentModel.Annotations => 0x97ed3c0 => 94
	i32 165246403, ; 7: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 64
	i32 182336117, ; 8: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 82
	i32 195452805, ; 9: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 10: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 11: System.ComponentModel => 0xc38ff48 => 97
	i32 272562913, ; 12: MovieAppHHRU.dll => 0x103efae1 => 88
	i32 280992041, ; 13: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 14: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 15: Xamarin.AndroidX.Activity.dll => 0x13031348 => 60
	i32 336156722, ; 16: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 17: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 71
	i32 347068432, ; 18: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 58
	i32 356389973, ; 19: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 374914964, ; 20: System.Transactions.Local => 0x1658bf94 => 131
	i32 379916513, ; 21: System.Threading.Thread.dll => 0x16a510e1 => 129
	i32 385762202, ; 22: System.Memory.dll => 0x16fe439a => 110
	i32 395744057, ; 23: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 24: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 25: System.Collections => 0x1a61054f => 93
	i32 450948140, ; 26: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 70
	i32 469710990, ; 27: System.dll => 0x1bff388e => 133
	i32 498788369, ; 28: System.ObjectModel => 0x1dbae811 => 116
	i32 500358224, ; 29: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 30: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 31: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 50
	i32 530272170, ; 32: System.Linq.Queryable => 0x1f9b4faa => 108
	i32 539058512, ; 33: Microsoft.Extensions.Logging => 0x20216150 => 47
	i32 592146354, ; 34: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 627609679, ; 35: Xamarin.AndroidX.CustomView => 0x2568904f => 68
	i32 627931235, ; 36: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 37: System.Text.Encodings.Web.dll => 0x27787397 => 126
	i32 672442732, ; 38: System.Collections.Concurrent => 0x2814a96c => 89
	i32 688181140, ; 39: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 706645707, ; 40: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 41: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 42: System.Runtime.Loader.dll => 0x2b15ed29 => 121
	i32 748832960, ; 43: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 56
	i32 759454413, ; 44: System.Net.Requests => 0x2d445acd => 114
	i32 775507847, ; 45: System.IO.Compression => 0x2e394f87 => 106
	i32 777317022, ; 46: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 47: Microsoft.Extensions.Options => 0x2f0980eb => 49
	i32 804715423, ; 48: System.Data.Common => 0x2ff6fb9f => 99
	i32 823281589, ; 49: System.Private.Uri.dll => 0x311247b5 => 117
	i32 830298997, ; 50: System.IO.Compression.Brotli => 0x317d5b75 => 105
	i32 904024072, ; 51: System.ComponentModel.Primitives.dll => 0x35e25008 => 95
	i32 926902833, ; 52: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 967690846, ; 53: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 71
	i32 975236339, ; 54: System.Diagnostics.Tracing => 0x3a20ecf3 => 102
	i32 992768348, ; 55: System.Collections.dll => 0x3b2c715c => 93
	i32 1012816738, ; 56: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 81
	i32 1019214401, ; 57: System.Drawing => 0x3cbffa41 => 104
	i32 1028951442, ; 58: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 45
	i32 1029334545, ; 59: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 60: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 61
	i32 1036536393, ; 61: System.Drawing.Primitives.dll => 0x3dc84a49 => 103
	i32 1044663988, ; 62: System.Linq.Expressions.dll => 0x3e444eb4 => 107
	i32 1052210849, ; 63: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 73
	i32 1082857460, ; 64: System.ComponentModel.TypeConverter => 0x408b17f4 => 96
	i32 1084122840, ; 65: Xamarin.Kotlin.StdLib => 0x409e66d8 => 86
	i32 1098259244, ; 66: System => 0x41761b2c => 133
	i32 1118262833, ; 67: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1157931901, ; 68: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 37
	i32 1168523401, ; 69: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 70: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 78
	i32 1202000627, ; 71: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 37
	i32 1203215381, ; 72: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1204575371, ; 73: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 41
	i32 1234928153, ; 74: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 75: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1292207520, ; 76: SQLitePCLRaw.core.dll => 0x4d0585a0 => 57
	i32 1293217323, ; 77: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 69
	i32 1324164729, ; 78: System.Linq => 0x4eed2679 => 109
	i32 1373134921, ; 79: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 80: Xamarin.AndroidX.SavedState => 0x52114ed3 => 81
	i32 1406073936, ; 81: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 65
	i32 1408764838, ; 82: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 123
	i32 1430672901, ; 83: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 84: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 85: System.Collections.Immutable.dll => 0x5718a9ef => 90
	i32 1462112819, ; 86: System.IO.Compression.dll => 0x57261233 => 106
	i32 1469204771, ; 87: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 62
	i32 1470490898, ; 88: Microsoft.Extensions.Primitives => 0x57a5e912 => 50
	i32 1479771757, ; 89: System.Collections.Immutable => 0x5833866d => 90
	i32 1480492111, ; 90: System.IO.Compression.Brotli.dll => 0x583e844f => 105
	i32 1490351284, ; 91: Microsoft.Data.Sqlite.dll => 0x58d4f4b4 => 35
	i32 1493001747, ; 92: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 93: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 94: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 128
	i32 1551623176, ; 95: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 96: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 75
	i32 1624863272, ; 97: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 84
	i32 1636350590, ; 98: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 67
	i32 1639515021, ; 99: System.Net.Http.dll => 0x61b9038d => 111
	i32 1639986890, ; 100: System.Text.RegularExpressions => 0x61c036ca => 128
	i32 1657153582, ; 101: System.Runtime => 0x62c6282e => 124
	i32 1658251792, ; 102: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 85
	i32 1677501392, ; 103: System.Net.Primitives.dll => 0x63fca3d0 => 113
	i32 1679769178, ; 104: System.Security.Cryptography => 0x641f3e5a => 125
	i32 1688112883, ; 105: Microsoft.Data.Sqlite => 0x649e8ef3 => 35
	i32 1689493916, ; 106: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 36
	i32 1711441057, ; 107: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 58
	i32 1729485958, ; 108: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 63
	i32 1736233607, ; 109: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 110: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1744735666, ; 111: System.Transactions.Local.dll => 0x67fe8db2 => 131
	i32 1763938596, ; 112: System.Diagnostics.TraceSource.dll => 0x69239124 => 101
	i32 1766324549, ; 113: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 82
	i32 1770582343, ; 114: Microsoft.Extensions.Logging.dll => 0x6988f147 => 47
	i32 1780572499, ; 115: Mono.Android.Runtime.dll => 0x6a216153 => 137
	i32 1782862114, ; 116: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 117: Xamarin.AndroidX.Fragment => 0x6a96652d => 70
	i32 1793755602, ; 118: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 119: Xamarin.AndroidX.Loader => 0x6bcd3296 => 75
	i32 1813058853, ; 120: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 86
	i32 1813201214, ; 121: Xamarin.Google.Android.Material => 0x6c13413e => 85
	i32 1818569960, ; 122: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 79
	i32 1824722060, ; 123: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 123
	i32 1828688058, ; 124: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 48
	i32 1842015223, ; 125: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 126: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 127: System.Linq.Expressions => 0x6ec71a65 => 107
	i32 1875935024, ; 128: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1886040351, ; 129: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x706ab11f => 39
	i32 1910275211, ; 130: System.Collections.NonGeneric.dll => 0x71dc7c8b => 91
	i32 1968388702, ; 131: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 42
	i32 2003115576, ; 132: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2014489277, ; 133: Microsoft.EntityFrameworkCore.Sqlite => 0x7812aabd => 39
	i32 2019465201, ; 134: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 73
	i32 2025202353, ; 135: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 136: System.Private.Xml => 0x79eb68ee => 118
	i32 2055257422, ; 137: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 72
	i32 2066184531, ; 138: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 139: System.Diagnostics.TraceSource => 0x7b6f419e => 101
	i32 2079903147, ; 140: System.Runtime.dll => 0x7bf8cdab => 124
	i32 2090596640, ; 141: System.Numerics.Vectors => 0x7c9bf920 => 115
	i32 2103459038, ; 142: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 59
	i32 2127167465, ; 143: System.Console => 0x7ec9ffe9 => 98
	i32 2142473426, ; 144: System.Collections.Specialized => 0x7fb38cd2 => 92
	i32 2159891885, ; 145: Microsoft.Maui => 0x80bd55ad => 53
	i32 2169148018, ; 146: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 147: Microsoft.Extensions.Options.dll => 0x820d22b3 => 49
	i32 2192057212, ; 148: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 48
	i32 2193016926, ; 149: System.ObjectModel.dll => 0x82b6c85e => 116
	i32 2197979891, ; 150: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 46
	i32 2201107256, ; 151: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 87
	i32 2201231467, ; 152: System.Net.Http => 0x8334206b => 111
	i32 2207618523, ; 153: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2252897993, ; 154: Microsoft.EntityFrameworkCore => 0x86487ec9 => 36
	i32 2266799131, ; 155: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 43
	i32 2270573516, ; 156: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 157: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 80
	i32 2303942373, ; 158: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 159: System.Private.CoreLib.dll => 0x896b7878 => 135
	i32 2340441535, ; 160: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 119
	i32 2353062107, ; 161: System.Net.Primitives => 0x8c40e0db => 113
	i32 2368005991, ; 162: System.Xml.ReaderWriter.dll => 0x8d24e767 => 132
	i32 2371007202, ; 163: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 42
	i32 2395872292, ; 164: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 165: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 166: System.Console.dll => 0x912896e5 => 98
	i32 2465273461, ; 167: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 56
	i32 2471841756, ; 168: netstandard.dll => 0x93554fdc => 134
	i32 2475788418, ; 169: Java.Interop.dll => 0x93918882 => 136
	i32 2480646305, ; 170: Microsoft.Maui.Controls => 0x93dba8a1 => 51
	i32 2550873716, ; 171: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 172: System.Text.Encodings.Web => 0x9930ee42 => 126
	i32 2593496499, ; 173: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 174: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 87
	i32 2617129537, ; 175: System.Private.Xml.dll => 0x9bfe3a41 => 118
	i32 2620871830, ; 176: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 67
	i32 2626831493, ; 177: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2634653062, ; 178: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 38
	i32 2663698177, ; 179: System.Runtime.Loader => 0x9ec4cf01 => 121
	i32 2665622720, ; 180: System.Drawing.Primitives => 0x9ee22cc0 => 103
	i32 2676780864, ; 181: System.Data.Common.dll => 0x9f8c6f40 => 99
	i32 2724373263, ; 182: System.Runtime.Numerics.dll => 0xa262a30f => 122
	i32 2732626843, ; 183: Xamarin.AndroidX.Activity => 0xa2e0939b => 60
	i32 2737747696, ; 184: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 62
	i32 2752995522, ; 185: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 186: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 52
	i32 2764765095, ; 187: Microsoft.Maui.dll => 0xa4caf7a7 => 53
	i32 2778768386, ; 188: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 83
	i32 2785988530, ; 189: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 190: Microsoft.Maui.Graphics => 0xa7008e0b => 55
	i32 2806116107, ; 191: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 192: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 65
	i32 2831556043, ; 193: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2847789619, ; 194: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 38
	i32 2853208004, ; 195: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 83
	i32 2861189240, ; 196: Microsoft.Maui.Essentials => 0xaa8a4878 => 54
	i32 2909740682, ; 197: System.Private.CoreLib => 0xad6f1e8a => 135
	i32 2916838712, ; 198: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 84
	i32 2919462931, ; 199: System.Numerics.Vectors.dll => 0xae037813 => 115
	i32 2959614098, ; 200: System.ComponentModel.dll => 0xb0682092 => 97
	i32 2978675010, ; 201: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 69
	i32 3038032645, ; 202: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 203: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 76
	i32 3059408633, ; 204: Mono.Android.Runtime => 0xb65adef9 => 137
	i32 3059793426, ; 205: System.ComponentModel.Primitives => 0xb660be12 => 95
	i32 3069363400, ; 206: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 40
	i32 3077302341, ; 207: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3147165239, ; 208: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 102
	i32 3178803400, ; 209: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 77
	i32 3195844289, ; 210: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 40
	i32 3220365878, ; 211: System.Threading => 0xbff2e236 => 130
	i32 3258312781, ; 212: Xamarin.AndroidX.CardView => 0xc235e84d => 63
	i32 3265493905, ; 213: System.Linq.Queryable.dll => 0xc2a37b91 => 108
	i32 3280506390, ; 214: System.ComponentModel.Annotations.dll => 0xc3888e16 => 94
	i32 3305363605, ; 215: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 216: System.Net.Requests.dll => 0xc5b097e4 => 114
	i32 3317135071, ; 217: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 68
	i32 3346324047, ; 218: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 78
	i32 3357674450, ; 219: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 220: System.Text.Json => 0xc82afec1 => 127
	i32 3360279109, ; 221: SQLitePCLRaw.core => 0xc849ca45 => 57
	i32 3362522851, ; 222: Xamarin.AndroidX.Core => 0xc86c06e3 => 66
	i32 3366347497, ; 223: Java.Interop => 0xc8a662e9 => 136
	i32 3374999561, ; 224: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 80
	i32 3381016424, ; 225: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 226: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 44
	i32 3430777524, ; 227: netstandard => 0xcc7d82b4 => 134
	i32 3463511458, ; 228: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 229: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 96
	i32 3476120550, ; 230: Mono.Android => 0xcf3163e6 => 138
	i32 3479583265, ; 231: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 232: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 233: System.Text.Json.dll => 0xcfbaacae => 127
	i32 3580758918, ; 234: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 235: System.Linq.dll => 0xd715a361 => 109
	i32 3624195450, ; 236: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 119
	i32 3626707018, ; 237: MovieAppHHRU => 0xd82b284a => 88
	i32 3641597786, ; 238: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 72
	i32 3643446276, ; 239: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 240: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 77
	i32 3657292374, ; 241: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 43
	i32 3660523487, ; 242: System.Net.NetworkInformation => 0xda2f27df => 112
	i32 3672681054, ; 243: Mono.Android.dll => 0xdae8aa5e => 138
	i32 3697841164, ; 244: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 245: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 76
	i32 3748608112, ; 246: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 100
	i32 3754567612, ; 247: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 59
	i32 3786282454, ; 248: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 64
	i32 3792276235, ; 249: System.Collections.NonGeneric => 0xe2098b0b => 91
	i32 3802395368, ; 250: System.Collections.Specialized.dll => 0xe2a3f2e8 => 92
	i32 3823082795, ; 251: System.Security.Cryptography.dll => 0xe3df9d2b => 125
	i32 3841636137, ; 252: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 45
	i32 3849253459, ; 253: System.Runtime.InteropServices.dll => 0xe56ef253 => 120
	i32 3889960447, ; 254: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 255: System.Collections.Concurrent.dll => 0xe839deed => 89
	i32 3896760992, ; 256: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 66
	i32 3928044579, ; 257: System.Xml.ReaderWriter => 0xea213423 => 132
	i32 3931092270, ; 258: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 79
	i32 3955647286, ; 259: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 61
	i32 3980434154, ; 260: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 261: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 262: System.Memory => 0xeff49a63 => 110
	i32 4046471985, ; 263: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 52
	i32 4073602200, ; 264: System.Threading.dll => 0xf2ce3c98 => 130
	i32 4094352644, ; 265: Microsoft.Maui.Essentials.dll => 0xf40add04 => 54
	i32 4099507663, ; 266: System.Drawing.dll => 0xf45985cf => 104
	i32 4100113165, ; 267: System.Private.Uri => 0xf462c30d => 117
	i32 4101842092, ; 268: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 41
	i32 4102112229, ; 269: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 270: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 271: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 44
	i32 4150914736, ; 272: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 273: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 74
	i32 4213026141, ; 274: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 100
	i32 4271975918, ; 275: Microsoft.Maui.Controls.dll => 0xfea12dee => 51
	i32 4274976490, ; 276: System.Runtime.Numerics => 0xfecef6ea => 122
	i32 4292120959 ; 277: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 74
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [278 x i32] [
	i32 112, ; 0
	i32 46, ; 1
	i32 129, ; 2
	i32 33, ; 3
	i32 55, ; 4
	i32 120, ; 5
	i32 94, ; 6
	i32 64, ; 7
	i32 82, ; 8
	i32 30, ; 9
	i32 31, ; 10
	i32 97, ; 11
	i32 88, ; 12
	i32 2, ; 13
	i32 30, ; 14
	i32 60, ; 15
	i32 15, ; 16
	i32 71, ; 17
	i32 58, ; 18
	i32 14, ; 19
	i32 131, ; 20
	i32 129, ; 21
	i32 110, ; 22
	i32 34, ; 23
	i32 26, ; 24
	i32 93, ; 25
	i32 70, ; 26
	i32 133, ; 27
	i32 116, ; 28
	i32 13, ; 29
	i32 7, ; 30
	i32 50, ; 31
	i32 108, ; 32
	i32 47, ; 33
	i32 21, ; 34
	i32 68, ; 35
	i32 19, ; 36
	i32 126, ; 37
	i32 89, ; 38
	i32 1, ; 39
	i32 16, ; 40
	i32 4, ; 41
	i32 121, ; 42
	i32 56, ; 43
	i32 114, ; 44
	i32 106, ; 45
	i32 25, ; 46
	i32 49, ; 47
	i32 99, ; 48
	i32 117, ; 49
	i32 105, ; 50
	i32 95, ; 51
	i32 28, ; 52
	i32 71, ; 53
	i32 102, ; 54
	i32 93, ; 55
	i32 81, ; 56
	i32 104, ; 57
	i32 45, ; 58
	i32 3, ; 59
	i32 61, ; 60
	i32 103, ; 61
	i32 107, ; 62
	i32 73, ; 63
	i32 96, ; 64
	i32 86, ; 65
	i32 133, ; 66
	i32 16, ; 67
	i32 37, ; 68
	i32 22, ; 69
	i32 78, ; 70
	i32 37, ; 71
	i32 20, ; 72
	i32 41, ; 73
	i32 18, ; 74
	i32 2, ; 75
	i32 57, ; 76
	i32 69, ; 77
	i32 109, ; 78
	i32 32, ; 79
	i32 81, ; 80
	i32 65, ; 81
	i32 123, ; 82
	i32 0, ; 83
	i32 6, ; 84
	i32 90, ; 85
	i32 106, ; 86
	i32 62, ; 87
	i32 50, ; 88
	i32 90, ; 89
	i32 105, ; 90
	i32 35, ; 91
	i32 10, ; 92
	i32 5, ; 93
	i32 128, ; 94
	i32 25, ; 95
	i32 75, ; 96
	i32 84, ; 97
	i32 67, ; 98
	i32 111, ; 99
	i32 128, ; 100
	i32 124, ; 101
	i32 85, ; 102
	i32 113, ; 103
	i32 125, ; 104
	i32 35, ; 105
	i32 36, ; 106
	i32 58, ; 107
	i32 63, ; 108
	i32 23, ; 109
	i32 1, ; 110
	i32 131, ; 111
	i32 101, ; 112
	i32 82, ; 113
	i32 47, ; 114
	i32 137, ; 115
	i32 17, ; 116
	i32 70, ; 117
	i32 9, ; 118
	i32 75, ; 119
	i32 86, ; 120
	i32 85, ; 121
	i32 79, ; 122
	i32 123, ; 123
	i32 48, ; 124
	i32 29, ; 125
	i32 26, ; 126
	i32 107, ; 127
	i32 8, ; 128
	i32 39, ; 129
	i32 91, ; 130
	i32 42, ; 131
	i32 5, ; 132
	i32 39, ; 133
	i32 73, ; 134
	i32 0, ; 135
	i32 118, ; 136
	i32 72, ; 137
	i32 4, ; 138
	i32 101, ; 139
	i32 124, ; 140
	i32 115, ; 141
	i32 59, ; 142
	i32 98, ; 143
	i32 92, ; 144
	i32 53, ; 145
	i32 12, ; 146
	i32 49, ; 147
	i32 48, ; 148
	i32 116, ; 149
	i32 46, ; 150
	i32 87, ; 151
	i32 111, ; 152
	i32 14, ; 153
	i32 36, ; 154
	i32 43, ; 155
	i32 8, ; 156
	i32 80, ; 157
	i32 18, ; 158
	i32 135, ; 159
	i32 119, ; 160
	i32 113, ; 161
	i32 132, ; 162
	i32 42, ; 163
	i32 13, ; 164
	i32 10, ; 165
	i32 98, ; 166
	i32 56, ; 167
	i32 134, ; 168
	i32 136, ; 169
	i32 51, ; 170
	i32 11, ; 171
	i32 126, ; 172
	i32 20, ; 173
	i32 87, ; 174
	i32 118, ; 175
	i32 67, ; 176
	i32 15, ; 177
	i32 38, ; 178
	i32 121, ; 179
	i32 103, ; 180
	i32 99, ; 181
	i32 122, ; 182
	i32 60, ; 183
	i32 62, ; 184
	i32 21, ; 185
	i32 52, ; 186
	i32 53, ; 187
	i32 83, ; 188
	i32 27, ; 189
	i32 55, ; 190
	i32 6, ; 191
	i32 65, ; 192
	i32 19, ; 193
	i32 38, ; 194
	i32 83, ; 195
	i32 54, ; 196
	i32 135, ; 197
	i32 84, ; 198
	i32 115, ; 199
	i32 97, ; 200
	i32 69, ; 201
	i32 34, ; 202
	i32 76, ; 203
	i32 137, ; 204
	i32 95, ; 205
	i32 40, ; 206
	i32 12, ; 207
	i32 102, ; 208
	i32 77, ; 209
	i32 40, ; 210
	i32 130, ; 211
	i32 63, ; 212
	i32 108, ; 213
	i32 94, ; 214
	i32 7, ; 215
	i32 114, ; 216
	i32 68, ; 217
	i32 78, ; 218
	i32 24, ; 219
	i32 127, ; 220
	i32 57, ; 221
	i32 66, ; 222
	i32 136, ; 223
	i32 80, ; 224
	i32 3, ; 225
	i32 44, ; 226
	i32 134, ; 227
	i32 11, ; 228
	i32 96, ; 229
	i32 138, ; 230
	i32 24, ; 231
	i32 23, ; 232
	i32 127, ; 233
	i32 31, ; 234
	i32 109, ; 235
	i32 119, ; 236
	i32 88, ; 237
	i32 72, ; 238
	i32 28, ; 239
	i32 77, ; 240
	i32 43, ; 241
	i32 112, ; 242
	i32 138, ; 243
	i32 33, ; 244
	i32 76, ; 245
	i32 100, ; 246
	i32 59, ; 247
	i32 64, ; 248
	i32 91, ; 249
	i32 92, ; 250
	i32 125, ; 251
	i32 45, ; 252
	i32 120, ; 253
	i32 32, ; 254
	i32 89, ; 255
	i32 66, ; 256
	i32 132, ; 257
	i32 79, ; 258
	i32 61, ; 259
	i32 27, ; 260
	i32 9, ; 261
	i32 110, ; 262
	i32 52, ; 263
	i32 130, ; 264
	i32 54, ; 265
	i32 104, ; 266
	i32 117, ; 267
	i32 41, ; 268
	i32 22, ; 269
	i32 17, ; 270
	i32 44, ; 271
	i32 29, ; 272
	i32 74, ; 273
	i32 100, ; 274
	i32 51, ; 275
	i32 122, ; 276
	i32 74 ; 277
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

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
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
