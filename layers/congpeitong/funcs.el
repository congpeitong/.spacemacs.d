;; 定义一些layer层次的函数， 即全局函数

;; 删除当前的文件
(defun cong/delete-this-file ()
"Delete the current file, and kill the buffer."
(interactive)
(unless (buffer-file-name)
  (error "No file is currently being edited"))
(when (yes-or-no-p (format "Really delete '%s'?"
                           (file-name-nondirectory buffer-file-name)))
  (delete-file (buffer-file-name))
  (kill-this-buffer)))

;; 重命名当前的文件和buffer
(defun cong/rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (progn
      (when (file-exists-p filename)
        (rename-file filename new-name 1))
      (set-visited-file-name new-name)
      (rename-buffer new-name))))

;; 打开配置文件
(defun cong/doc-open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 打开工作文件
(defun cong-open-work-file ()
  (interactive)
  (find-file "e:/work_open_source"))

;; 打开笔记目录
(defun cong/dir-open-note-file ()
  (interactive)
  (find-file "e:/my_source_code/notes"))

;; 打开工作日志文件
(defun cong/doc-open-work-record ()
  (interactive)
  (find-file "e:/work_open_source/work_record/工作日志.org")
)
