# Data Mart-based Dashboard untuk Kickstarter

Proyek ini merupakan bagian dari mata kuliah **12S3202 – Gudang Data dan Kecerdasan Bisnis** di **Institut Teknologi Del**. Proyek ini bertujuan untuk mengembangkan **Data Mart** dan **Dashboard Business Intelligence** untuk menganalisis data crowdfunding dari platform **Kickstarter**. Tujuannya adalah untuk memberikan wawasan mengenai ekosistem crowdfunding, dengan fokus pada kategori proyek, performa pendanaan, dan tren geografis.

## Anggota Tim
- **Bintang Margaretha Situmorang** 
- **Marudut Budiman Tampubolon** 
- **Naomi Elena Lumbanraja** 
- **Daniel Augustin Girsang** 

## Ikhtisar Proyek

Kickstarter menyediakan banyak data tentang proyek kreatif, termasuk kategori proyek, tujuan pendanaan, jumlah pendukung, dan lokasi geografis. Namun, menganalisis data ini bisa menjadi tantangan karena kompleksitas dan keberagaman format informasi yang ada. Dalam proyek ini, kami mengembangkan **Data Mart** dan **Dashboard Business Intelligence** untuk memfasilitasi pengambilan keputusan yang lebih baik dan memberikan wawasan yang lebih mendalam tentang proyek di Kickstarter.

### Fitur Utama:
- **Data Mart:** Sebuah subset dari data warehouse yang berfokus pada area bisnis tertentu, memungkinkan analisis yang lebih efisien dan terarah.
- **Proses ETL:** Data diekstraksi, ditransformasikan, dan dimuat (ETL) menggunakan alat seperti **Pentaho** untuk membersihkan dan mengintegrasikan data dari **Kickstarter**.
- **Dashboard Business Intelligence:** Dibangun menggunakan **Tableau** untuk memvisualisasikan metrik dan tren utama, menyediakan laporan dan grafik interaktif untuk analisis.
- **Metrik Utama:** Tingkat keberhasilan proyek, tren pendanaan, kategori proyek terpopuler, distribusi geografis proyek, dan lainnya.

## Sumber Data

Data untuk proyek ini diambil dari platform Kickstarter, khususnya dari **Kickstarter Crowdfunding Dataset** (2022) yang mencakup data proyek, pendukung, tujuan pendanaan, dan lokasi. Data diambil dalam format **CSV** dan **JSON**.

## Teknologi yang Digunakan

- **Backend:**
  - SQL, Python, Pentaho (ETL)
  - MySQL, PostgreSQL untuk penyimpanan data

- **Frontend:**
  - Tableau untuk Dashboard Business Intelligence

## Implementasi Proyek

1. **Pengumpulan Data:**
   - Data dikumpulkan dari platform Kickstarter dan disimpan dalam database relasional untuk analisis lebih lanjut.
   
2. **Proses ETL:**
   - Data dibersihkan, ditransformasikan, dan dimuat menggunakan **Pentaho** dan **SQL**.
   
3. **Model Dimensional:**
   - Merancang **Star Schema** untuk penyimpanan data dan mempermudah query.

4. **Dashboard BI:**
   - Dibangun menggunakan **Tableau** untuk menampilkan analisis interaktif.

## Fitur dari Dashboard:
- **Top Project Categories by Pledged Amount:** Memvisualisasikan kategori proyek dengan dana terkumpul tertinggi.
- **Top 5 Project Categories by Backers:** Menampilkan kategori proyek terpopuler berdasarkan jumlah pendukung.
- **Time to Reach Funding Target:** Menunjukkan waktu rata-rata yang diperlukan untuk proyek mencapai target pendanaan.
- **Geographical Distribution:** Memvisualisasikan distribusi proyek di berbagai negara.
- **Project Status per Category:** Diagram donat yang menunjukkan status proyek berdasarkan kategori.
- **Annual Trends:** Wawasan mengenai tren tahunan proyek yang berhasil dan kategori terpopuler.

## Link Dashboard

Anda dapat melihat dashboard interaktif di sini:  
[Kickstarter Dashboard](https://public.tableau.com/app/profile/bintang.margaretha.situmorang/viz/KickstarterDashboard-DWBIProjectKELOMPOK6DWBI/Dashboard1?publish=yes)

## Tantangan dan Peningkatan

- **Masalah Visualisasi:** Kami menerima masukan bahwa dashboard bisa lebih baik dengan variasi warna yang lebih banyak untuk memperjel
- **Beban Informasi Berlebihan:** Dashboard saat ini menampilkan banyak informasi dalam satu halaman, yang bisa membuat pengguna kesulitan mencari data yang dibutuhkan. Kami berencana untuk memecah informasi menjadi beberapa bagian.
- **Desain Responsif:** Kami berencana untuk meningkatkan responsivitas dan kenyamanan pengguna dengan menyesuaikan elemen visual untuk tampilan yang lebih jelas.

## Kesimpulan

Proyek ini berhasil mengembangkan Data Mart dan Dashboard BI yang memberikan wawasan berguna tentang proyek crowdfunding di Kickstarter. Dashboard ini menampilkan metrik utama mengenai performa proyek, tren, dan distribusi geografis, yang dapat membantu investor dan pencipta proyek dalam membuat keputusan yang lebih informasional.

## Lisensi

Proyek ini dilisensikan di bawah **MIT License** - lihat file [LICENSE](LICENSE) untuk detail lebih lanjut.

