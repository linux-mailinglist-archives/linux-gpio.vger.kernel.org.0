Return-Path: <linux-gpio+bounces-15754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE4A30C56
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 14:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFDE01666B7
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337AA221DBC;
	Tue, 11 Feb 2025 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tYD6ehRE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA9D21E0A6
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278796; cv=none; b=RGFQUEtwe51BH57dfu45X/DxvUEw4Pyn0O8bqJBAO7DfGy2GfU1KmAJJlaEy90npe0xgzeclAd1LO/Ctjh3eEdM7XN28uKwIE6nWjE5OVE9wQ/9U/o+yxOcJrGe944Jm0vaCH0VoRqFt4P3l56lkuwLa/cQvBz31Ab+wr0uOXZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278796; c=relaxed/simple;
	bh=p911NYjePCvIy4unFKbNijnZ/wrz7z1YubSGlF53/nI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Anv6tCte7mNXUTvI4QH+Fb30tVx01dr0DJuvxUsTKHKKRfQjErBDt8BAboLWv6LF9d/nNu1ONosQLP+ZMi0/slYZe5AtjO8cFmfZHrvDLoF85utqCb7UD+YMRZHGowEYOCPEdnd5bA7IKdX0ppoBlU3zc7GkIEm0M2FJ0ha0Qw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tYD6ehRE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso55627765e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278793; x=1739883593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dbvm9ZUkmh1TMfOZuNbEptwzOSI59vlfaRilfSxDrlA=;
        b=tYD6ehRE86PmIxBUzLTgEqIxTt9tLGATToYTLFzsi+0xBxvvIcZhmcz0BtRDYP5NX5
         7g7PWX9kfjB+XwONzj+box0yhzAX0aKL/zV1V+GRWJfrcH2lCETt0jYe2t8FLwt7PEfW
         r8ZQL44Fy/N7NKN9CRaohLzvNdsOeUo+tuEcw5ZglglD0tmpjua8Btt+gCVlZftidk6j
         +QdiQUabjpo15/YBNy/XCTI7DUh5Jybv0/WS1P5hA8KmwofR5PW+aZ2EsH/zJyrfO4V6
         A94vwQEyPCDDiSvvwazEHNZrOQcFfp0QHf0jidaEhss8y0+vKVKgbvYgYFk8YpAE6WPp
         32pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278793; x=1739883593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dbvm9ZUkmh1TMfOZuNbEptwzOSI59vlfaRilfSxDrlA=;
        b=RoaBadkMfrcPbQdfUwJSv1k2rBLGg+WX2LUmDRerpC9nn+rZ8/3UBBLvDV90xnhuQH
         zlCPCd3mHocRc7/znrNsFsKomg2CkPo2KtNUEaLcaRnDqLElX9nQZ+Kpa+f5xnQeqdjk
         JrlWo0V9b5v0YU0gjhxiffIjTJIzvFWGbeduqhlQVxYPFUxPgEFAwRp/tANWW4TfHPbA
         DkV0Vto3ZrUzkZ4e0zoahBxm84KpxZDZLWrtTVx0G04DY9IgZDrI2IUnHAdIb9V1gbE7
         7eUiH5bxCbFqoeI7Fa4IKyza5pzDmKic7cIuSp3qEGVu91+WYP3oVvb58J2eSDSXzVsc
         a8Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWFm5zshzf9STY6HMxK0Qdmu2A5AAZZD14Q6OIbGJ1T8wDvzGQ3HYBBczN6IdCfv6IXtFSPG1xAbLbW@vger.kernel.org
X-Gm-Message-State: AOJu0YxUzehsKviQ/x9vrBQcKvcKqbD1LZiYIXCmjMl895AdlR09icWC
	MVXsaJqEMO1D5lqYUjHh5krxJ22DazbqgPCdNBNLWrHRcCAyc6CUQlCxPbIj9UA=
X-Gm-Gg: ASbGncs/fk+2RY4mTnbsGEn5PwY2A61tk0djIuAG36m+RKs2d+C2drp8Gl0e5FMbs32
	9WBo5DJNr4VNJemli4bYRmDPBnb7/0kLm+1vC9KKynpndaXdXD04ZA2Y66WMoTwXkt4B2nzlEmm
	pP1IOTevYnCLeiDctbjEb1Eqs+VXDWZ4N+E+2QiCsvePSRrUODaXB96DXLjeDsMRltici23Zl/c
	HQH2w9qPUTRJ6tJ0MBOlrB0MxBhUohL1hHwKzJ2x5+3JoCTIPMsAHbVw2BUreDJqCQepmPOBi71
	jC/DA3I=
X-Google-Smtp-Source: AGHT+IEbG4vCKNMOsBCIm2MSlTCCABTVjXd0hdIK9/6/0r8h/umWaqxq+bZWgJbI7fk32AjbzhvTtg==
X-Received: by 2002:a05:600c:4451:b0:439:4c83:2b8b with SMTP id 5b1f17b1804b1-4394c832cc2mr32944925e9.19.1739278793345;
        Tue, 11 Feb 2025 04:59:53 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:36 +0100
Subject: [PATCH libgpiod v4 15/17] doc: add documentation for gpio-tools
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-15-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5206;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9PAQCU4EfRjqJRUASzq50a8SnFgx0AaBDmM7QTHUeNo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m3dCw4YVMRm+8L3/2QiYWOoSV9tiy69MeXp
 /Y6OQyYvFKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtwAKCRARpy6gFHHX
 cn44D/sG7a3diSI5gDyeELsywifKHI56AqiNtmEmVvhxeh8++AuHozP0AHUxgVndccEtizTRCla
 8j6+fZxrkKpMZfVuJHz/KM+rWnGnPLlh6Epg/CtdQ+D/oDQJs9rHyKCCTQKc8+OzvmAa3jIrm2A
 M9Mx4yOT3FGQomRsbUtWB1rN8QhP03eeFmeT3UO2H1hnhMLWLyw7J3SJbQBeegDgg8cPh641Q5o
 zYndZLfGWujELq4ULYwUg3cg1CEgQv6zBHSlZHlRTRBBkAC+wbxJYzJrvStllzhJgdSB3knE/tU
 GQGOZzY8TI2rV3Thtli22rHQ0fK5MvAzDBzA2sniCAOOyvwGBX3QDmC7TROhWB1MCdiODCjS2JM
 2NKO9GBjmrU3nfpeiyuMmTWmQkiwtLsIb1qXe4xowitOUY+c10HFKtgVWtAbeW47EY/i434HTqE
 W8/Ai5lT8CmYVqrCH6VPhws3xsu+KnjmuRlvC1xVvanfKq5gU+FMuaFMK9q9Pz1eJQ7G/q146dR
 GqkfQsOUrCInl8LMYPrl8DbHi2RForFKtDGgmDOdhFDdLt9Gard1h86wTIpUB+qZKJcjNYetnsW
 mTh1j030t/hKqXZy65WHiAbC6Yl6k2KA0cpcP4g4hwgM7Cxa8rFYTrxjk5QQ91q7DLhg/NZ7bjI
 TwxRXpxLl11tBCQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We already generate man pages for gpio-tools. Let's use man2html to make
them part of the sphinx docs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .readthedocs.yaml   |  2 ++
 configure.ac        | 32 +++++++++++++++++++-------------
 docs/.gitignore     |  8 ++++++++
 docs/Makefile.am    |  1 +
 docs/conf.py        | 22 ++++++++++++++++++++++
 docs/gpio_tools.rst | 25 +++++++++++++++++++++++++
 docs/index.rst      |  1 +
 7 files changed, 78 insertions(+), 13 deletions(-)

diff --git a/.readthedocs.yaml b/.readthedocs.yaml
index 97086fa..c2b0a7f 100644
--- a/.readthedocs.yaml
+++ b/.readthedocs.yaml
@@ -19,11 +19,13 @@ build:
       - autoconf-archive
       # doxygen is available by default, but just in case.
       - doxygen
+      - help2man
       - gi-docgen
       - gir1.2-glib-2.0-dev
       - gobject-introspection
       - graphviz
       - libtool
+      - pandoc
       - pkg-config
 
 sphinx:
diff --git a/configure.ac b/configure.ac
index 8eec855..af5d53d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -327,18 +327,6 @@ then
 		      AC_MSG_ERROR([systemdsystemunitdir not found - needed to enable systemd support]))
 fi
 
-AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
-AC_CHECK_PROG([has_sphinx], [sphinx-build], [true], [false])
-AM_CONDITIONAL([WITH_DOCS], [test "x$has_doxygen" = xtrue && test "x$has_sphinx" = xtrue])
-if test "x$has_doxygen" = xfalse
-then
-	AC_MSG_NOTICE([doxygen not found - documentation cannot be generated])
-fi
-if test "x$has_sphinx" = xfalse
-then
-	AC_MSG_NOTICE([sphinx-build not found - documentation cannot be generated])
-fi
-
 if test "x$cross_compiling" = xno
 then
 	AC_CHECK_PROG([has_help2man], [help2man], [true], [false])
@@ -346,7 +334,25 @@ fi
 AM_CONDITIONAL([WITH_MANPAGES], [test "x$has_help2man" = xtrue])
 if test "x$has_help2man" = xfalse
 then
-	AC_MSG_NOTICE([help2man not found - man pages cannot be generated automatically])
+	AC_MSG_NOTICE([help2man not found - man pages and documentation cannot be generated])
+fi
+
+AC_DEFUN([DOC_PROG_NOT_FOUND], [AC_MSG_NOTICE([$1 not found - documentation cannot be generated])])
+AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
+AC_CHECK_PROG([has_sphinx], [sphinx-build], [true], [false])
+AC_CHECK_PROG([has_pandoc], [pandoc], [true], [false])
+AM_CONDITIONAL([WITH_DOCS], [test "x$has_doxygen" = xtrue && test "x$has_sphinx" = xtrue && test "x$has_pandoc" = xtrue && test "x$has_help2man" = xtrue])
+if test "x$has_doxygen" = xfalse
+then
+	DOC_PROG_NOT_FOUND(["doxygen"])
+fi
+if test "x$has_sphinx" = xfalse
+then
+	DOC_PROG_NOT_FOUND(["sphinx-build"])
+fi
+if test "x$has_pandoc" = xfalse
+then
+	DOC_PROG_NOT_FOUND(["pandoc"])
 fi
 
 AC_CONFIG_FILES([Makefile
diff --git a/docs/.gitignore b/docs/.gitignore
index 86f8cfd..c9ffb90 100644
--- a/docs/.gitignore
+++ b/docs/.gitignore
@@ -3,3 +3,11 @@
 
 doxygen-output
 sphinx-output
+
+# Automatically generated .rst
+gpiodetect.rst
+gpioinfo.rst
+gpioget.rst
+gpioset.rst
+gpiomon.rst
+gpionotify.rst
diff --git a/docs/Makefile.am b/docs/Makefile.am
index 3d5c1e4..1b5a46c 100644
--- a/docs/Makefile.am
+++ b/docs/Makefile.am
@@ -33,6 +33,7 @@ DOCS_DEPS = \
 	Doxyfile \
 	index.rst \
 	glib_api.rst \
+	gpio_tools.rst \
 	python_api.rst \
 	python_chip_info.rst \
 	python_chip.rst \
diff --git a/docs/conf.py b/docs/conf.py
index 9d80bde..06fe932 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -91,8 +91,30 @@ subprocess.run(
         "--enable-tools",
         "--enable-bindings-glib",
         "--enable-introspection",
+        "--enable-tools",
     ],
     check=True,
 )
 subprocess.run(["make", "-j"], check=True)
 os.chdir(cwd)
+
+for page in [
+    "gpiodetect",
+    "gpioinfo",
+    "gpioget",
+    "gpioset",
+    "gpiomon",
+    "gpionotify",
+]:
+    subprocess.run(
+        [
+            "pandoc",
+            "--from=man",
+            "--to=rst",
+            "--standalone",
+            "--wrap=none",
+            f"--output={page}.rst",
+            f"../man/{page}.man",
+        ],
+        check=True,
+    )
diff --git a/docs/gpio_tools.rst b/docs/gpio_tools.rst
new file mode 100644
index 0000000..7372de4
--- /dev/null
+++ b/docs/gpio_tools.rst
@@ -0,0 +1,25 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   GPIO tools documentation
+
+Command-line tools
+==================
+
+The **libgpiod** project includes a suite of **command-line tools** to
+facilitate GPIO manipulation from console and shell scripts.
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Manual entries
+
+   gpiodetect<gpiodetect>
+   gpioinfo<gpioinfo>
+   gpioget<gpioget>
+   gpioset<gpioset>
+   gpiomon<gpiomon>
+   gpionotify<gpionotify>
diff --git a/docs/index.rst b/docs/index.rst
index 8dcea20..a52cc3a 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -26,3 +26,4 @@ this interface.
 
    core_api
    bindings
+   gpio_tools

-- 
2.45.2


