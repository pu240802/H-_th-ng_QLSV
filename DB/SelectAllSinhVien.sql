USE [QLSV]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllSinhVien]    Script Date: 10/23/2019 9:16:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectAllSinhVien]
	@tukhoa nvarchar(50)
as
	set @tukhoa = lower(ltrim(rtrim(@tukhoa)));
	select 
		masinhvien,
		case when len(tendem)>0 then concat(ho,' ',ten)
		else concat(ho,' ',tendem,' ',ten) end as hoten,
		convert(varchar(10),ngaysinh,103) as nsinh,
		case when gioitinh = 1 then 'Nam' else N'Nữ' end as gt,
		quequan,diachi,dienthoai,email
	from tblSinhVien
	where lower(ho) like '%'+@tukhoa+'%'
	or lower(tendem) like '%'+@tukhoa+'%'
	or lower(ten) like '%'+@tukhoa+'%'
	or lower(email) like '%'+@tukhoa+'%'
	or lower(diachi) like '%'+@tukhoa+'%'
	order by ten;

 SelectAllSinhVien 'Quá'

 update tblsinhvien set quequan = diachi