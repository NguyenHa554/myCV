# Workspace CV LaTeX

Workspace dùng XeLaTeX với template CV đã cung cấp: khổ Letter, cỡ chữ 12pt, font Charter, tiêu đề xanh và đường kẻ cam.
Nội dung CV được nhập từ template của người dùng. Đặt ảnh tại `assets/shot.png` để thay chữ HMN trong khung ảnh.

## Bắt đầu

1. Mở thư mục `C:\nguyen\CV` bằng VS Code (File > Open Folder).
2. Sửa `content/cv.tex` bằng thông tin của bạn, lưu UTF-8.
3. Nhấn `Ctrl+Shift+B` để chạy task **Build CV**.
4. Mở `main.tex`, nhấn `Ctrl+Alt+V` để xem PDF bằng LaTeX Workshop.

Cũng có thể mở `main.tex` và nhấn `Ctrl+Alt+B` để biên dịch.
PDF đầu ra nằm tại `build/main.pdf`. Build đang được kích hoạt thủ công.

## Biên dịch từ PowerShell

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\build.ps1
```

Script tự tìm XeLaTeX trong PATH hoặc thư mục MiKTeX mặc định,
chạy hai lượt để cập nhật liên kết và tham chiếu. Không cần latexmk/Perl.
Lần đầu MiKTeX có thể cần tải các gói còn thiếu.

## Các file chính

- `main.tex`: khổ giấy, lề, font và thiết lập tài liệu.
- `content/cv.tex`: thông tin và các mục của CV.
- `scripts/build.ps1`: lệnh biên dịch.
- `.vscode/`: cấu hình extension và task cho VS Code.
- `build/`: PDF và file phụ sinh tự động, được bỏ qua bởi Git.

## Khi chỉnh nội dung

LaTeX yêu cầu viết `\&`, `\%`, `\_`, `\#`, `\$` để hiển thị các ký tự đặc biệt tương ứng trong văn bản.
Giữ các lệnh định dạng như `\section*`, `\textbf`, `\item` khi thay nội dung.
Nếu build lỗi, xem `build/main.log` và mục Output > LaTeX Workshop trong VS Code.

## Công cụ cần có

- MiKTeX hoặc bản phân phối có lệnh `xelatex`.
- VS Code và extension LaTeX Workshop để soạn thảo và xem PDF.

Workspace chưa khởi tạo kho Git. Nội dung hiện tại có thông tin cá nhân từ template; hãy kiểm tra trước khi chia sẻ công khai.
