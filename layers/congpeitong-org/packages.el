;;; packages.el --- congpeitong-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2022 Sylvain Benner & Contributors
;;
;; Author:  <congp@CONGPEITONG>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `congpeitong-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `congpeitong-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `congpeitong-org/pre-init-PACKAGE' and/or
;;   `congpeitong-org/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code: aaaa
(defconst congpeitong-org-packages
  '(
    (org :location built-in)
    org-superstar)
  )




(defun congpeitong-org/post-init-org-superstar ()
  (progn
    (setq org-superstar-headline-bullets-list '("☯" "☭" "◉" "○" "✸" "✿"))
    (setq org-ellipsis " ▼ ")
    ))
(defun congpeitong-org/post-init-org()
  (add-hook 'org-mode-hook (lambda() (spacemacs/toggle-line-numbers-off)) 'append)
  (with-eval-after-load 'org))

