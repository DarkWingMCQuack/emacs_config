
;;compilation buffer should be vertical
(defadvice compile (around split-horizontally activate)
  "This takes care that new compilation buffers is verticaly."
  (let ((split-width-threshold nil)
        (split-height-threshold 10)
        (compilation-window-height 15))
    ad-do-it))

;;scroll with the output to the first error
(setq compilation-scroll-output 'first-error)

(defun run-cmake (build_type)
  "run cmake for the current project"
  (interactive)
  (progn
    (setq compile-command
          (concat "cmake "
                  "-DCMAKE_EXPORT_COMPILE_COMMANDS=1 "
                  "-DUSE_CLANG=1 "
                  "-DCMAKE_BUILD_TYPE="
                  build_type
                  " -DBUILD_TESTS=1 "
                  "-S "
                  (projectile-project-root)
                  " -B "
                  (projectile-project-root)
                  "build"))
    (call-interactively 'compile)))

(defun set-release-compile-command ()
  "set compile command to release build"
  (setq compile-command
        (concat "cmake --build "
                (projectile-project-root)
                "build/ -j4")))

(defun set-debug-compile-command ()
  "set compile command to debug build"
  (setq compile-command
        (concat "cmake --build "
                (projectile-project-root)
                "build/ -j4")))

(defun set-run-command ()
  "set compile command to debug build"
  (setq run-command
        (concat "./"
                (projectile-project-root)
                "build/")))

(defun compile-debug ()
  "compile project with debug flags"
  (interactive)
  (progn
    (call-interactively '(lambda () (interactive) (run-cmake "Debug")))
    (set-debug-compile-command)
    (call-interactively 'compile)))

(defun run-project ()
  "compile project with debug flags"
  (interactive)
  (progn
    (set-run-command)
    (call-interactively 'compile)))

(defun compile-release ()
  "compile project with release flags"
  (interactive)
  (progn
    (call-interactively '(lambda () (interactive) (run-cmake "Release")))
    (set-release-compile-command)
    (call-interactively 'compile)))

(defun my-c-c++-mode-hook-fn ()
  (evil-leader/set-key
    "pd"    'compile-debug
    "pr"    'compile-release))

(add-hook 'c-mode-hook #'my-c-c++-mode-hook-fn)
(add-hook 'c++-mode-hook #'my-c-c++-mode-hook-fn)
(add-hook 'c++-mode-hook 'font-lock-debug-fontify)

(defun bury-compile-buffer-if-successful (buffer string)
  "Bury a compilation buffer if succeeded without warnings "
  (when (and
         (buffer-live-p buffer)
         (string-match "compilation" (buffer-name buffer))
         (string-match "finished" string)
         (not
          (with-current-buffer buffer
            (goto-char (point-min))
            (search-forward "warning" nil t))))
    (progn
      (run-at-time
       "1 sec" nil 'delete-windows-on
       (get-buffer-create "*compilation*"))
      (message "No Compilation Errors or Warnings!"))))

(add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)
