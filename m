Return-Path: <linux-gpio+bounces-8634-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7550F94A3E7
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D630B28988
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732991D173C;
	Wed,  7 Aug 2024 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="b7oZC9Hd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7291CB316
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021883; cv=none; b=LAPdEjTjcsgtbDyKbKkpPKXPBiISkmyWjXRyDtgT3jc9CCJKrxH9DY5dBClrkge4xcJp0OwjDmzn0W+SVjZXtiytr+aMoVdCOSNJTAy/wKs6uzHi4QjLpc0usPCRZeX0dD6U8/JL3GVwtP1z1gCuOn7XkH4LCNCLlqYU+Z83pK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021883; c=relaxed/simple;
	bh=cbNt9OxgthpfxTg18kku9Y82rWjbfvwDP6lLleKNJco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/YBnP5aY2ZvWTkxt17Cz6PH9IU3AGZY+VzxwnNYxyA0UwuhwJijnEOQKD1EFRVaTFBmbHK5I6ldU+mM1vyEJtjFhkdVcVPVzBxYz6ssmv2Oz3HoNuiD+bcCYWesyregmM9NVhiwuaMmVLFjsmjTp+ij4zkPRNp3ZBTuJ00vBJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=b7oZC9Hd; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so16467701fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 02:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723021879; x=1723626679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fZLAUxOQUoiH0tEm871oLxFyTLck29UFSWzCSGp/FM=;
        b=b7oZC9HdBuQhEeTcxfl8bJavZ6eRnihbTHbRsiMy3LeVQ39nOVJusycFeHhikbLh8U
         vbFRdJ6EEkkqSMQIFrKPaOKHBB3LhAwtxZJ3Bn8EgTvn9UfMt0WIY34Bixj8CbiM/d7W
         tjec8FgPTXV0Qgiqe1f42hX8FcpqMMYN9NwDTsx03jT0Fu7EhokdAj5XLj6/fQGejpcp
         2atpDccIb4U9lzgf2hi7J4SZYGVP3fq57Bo41SfjWBReNk8xPfNW2hRANG97m8qcJLmh
         MpwTIjU7BYboEayxnxystWcbWKctSOOx/rIoqkbRJenRAPJggqYzm5eumnFeVdNn/1jH
         IIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021879; x=1723626679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fZLAUxOQUoiH0tEm871oLxFyTLck29UFSWzCSGp/FM=;
        b=tY1BB7NA+5RqU929/GLQy5ji+qrL3J2HCx6a26rZDSElUD6oNf88xwytlz94lAaRr8
         kPj3JCCZmvfnMFYmYmPvGkzsXzD0patxQsbfti6i3QcRkHIv+5Z9AYN9+Aq2CnQ/IDu3
         kk9MA7tHzhIrhzc2H4fcYxnIHHvzCcJic5/Ftt8rU6Inhlgkvl0hnUWCARuvZ12s1GZf
         BugcP7okbM0LeOVaL7ehXZX00MbzOMMwKO2m1Qxbe9WM9r2cLW8YJCLUnrpAlzB0kgjM
         Dq++lg0x8D2SC2ZilHmmxXgClUXoCtbm1sTY9Mbpj0hN+0Qu3EG3ZxBMclfwFdh0RGXt
         b3Qw==
X-Gm-Message-State: AOJu0Yx2e9UT6c8DPI+GiUyRUY6YXyJdRnM4jj+CLk4+RdGgrk7ZzpZ4
	kumCeKNtMGyiA/sWHnALpmnhZBsa0zDGGN3OIY/zG1PGdtrbLkQVkrgqEsIX0v6dsBHHxtaBgRa
	ckhU=
X-Google-Smtp-Source: AGHT+IFOKxbhBs0gzpbGACG5ShzMuzP3aZUc9k5g05styj1XlIL+0W99QMJqBuUCL92ole6mWAc7/g==
X-Received: by 2002:a2e:97ce:0:b0:2ef:205d:4847 with SMTP id 38308e7fff4ca-2f15ab24d1cmr129513001fa.46.1723021879414;
        Wed, 07 Aug 2024 02:11:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a3e7:be71:fe4f:c360])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cd2b3sm18936355e9.44.2024.08.07.02.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:11:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 07 Aug 2024 11:10:40 +0200
Subject: [PATCH libgpiod v4 09/18] dbus: add build files
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-dbus-v4-9-64ea80169e51@linaro.org>
References: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
In-Reply-To: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9871;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xHp8/YOd8WNMHGZcr9P6Q0+fxlBiviRb8MGjLMP9bBs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmszoRZN7z9e169L+nf6o4oa0xQrNIs0LQPk6oy
 iK5C6OiaeyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrM6EQAKCRARpy6gFHHX
 co68D/9HrWqRmyKhv7HbTD02Fpo9SRLZikRBl7223qMj6d+Mz85UxcqF4EAaGuCMH2FY/4JPFtN
 4kC6G0L0ThpudAiJddzQwA7lhxL7hWYa5JvyDQ0G2XZwnZEGgLSduY42QcTrRnrFOQunFHnc7vy
 Wl30G+Gl9kfVwMrXPIUKUZhp0sbFj3dZGdeIo6aFY0H9OLaV82hYZKFsw3/JQxpLBh1goktb2Of
 8pW5zbvparxUGvtB+HbFGCXadhpPOk8M65mj95zQQRK0inF9ko6tKcX8afCviFCiqMGVywNKQIk
 DDVzW8AJvxnxRzmAfjxI7xZ38Gk0n10h+3tcOor4b+qMAszOup5o7NUrKvz5lRF3wHlGGW8kIXp
 nITQ9R4jaZXUTz/7gMKijtus9J8imKLGiMLeQWcJv8mZwpC4jFRdzYIPtxN4AK7ViN9srpGnxTt
 0CspicCfIUTRN7aUgSlXkZOgetyO/4jkNfBPAkrJd0oYHUCfkW7F1+e8gB00LDh/EXDr90UwMtF
 w9s8/CXyz8zjotEeHmqWZZrtsxYJlBqtgB+eswkP/yzcswiHngBK7viCKzl9yVyLIhZ38Q4HZnG
 d8pHLPbJodRZ+hUuk5wnmO5C3f4iSSu2JUv+mV42NJUnTOu+qs4p/aj0zhJklRNXjd1O+W6NkuC
 skhzVPKRKjxvc3Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the directory structure and build files as well as changes to
.gitignore for the DBus API.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Makefile.am              |  7 +++++++
 configure.ac             | 45 +++++++++++++++++++++++++++++++++++++++++++++
 dbus/Makefile.am         | 10 ++++++++++
 dbus/client/.gitignore   |  4 ++++
 dbus/client/Makefile.am  | 31 +++++++++++++++++++++++++++++++
 dbus/data/Makefile.am    | 16 ++++++++++++++++
 dbus/lib/Makefile.am     | 29 +++++++++++++++++++++++++++++
 dbus/manager/.gitignore  |  4 ++++
 dbus/manager/Makefile.am | 21 +++++++++++++++++++++
 dbus/tests/.gitignore    |  4 ++++
 dbus/tests/Makefile.am   | 25 +++++++++++++++++++++++++
 11 files changed, 196 insertions(+)

diff --git a/Makefile.am b/Makefile.am
index 2ace901..c824dc4 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
 ACLOCAL_AMFLAGS = -I m4
 AUTOMAKE_OPTIONS = foreign
@@ -37,6 +38,12 @@ endif
 # libgpiosim to be already present.
 SUBDIRS += bindings
 
+if WITH_DBUS
+
+SUBDIRS += dbus
+
+endif
+
 if HAS_DOXYGEN
 
 doc: Doxyfile
diff --git a/configure.ac b/configure.ac
index 31cb8d1..cbe9e13 100644
--- a/configure.ac
+++ b/configure.ac
@@ -280,6 +280,45 @@ m4_ifdef([GOBJECT_INTROSPECTION_CHECK],
 	[GOBJECT_INTROSPECTION_CHECK([0.6.2])],
 	[AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")])
 
+# Depends on GLib bindings so must come after
+AC_ARG_ENABLE([dbus],
+	[AS_HELP_STRING([--enable-dbus], [build dbus daemon [default=no]])],
+	[if test "x$enableval" == xyes; then with_dbus=true; fi],
+	[with_dbus=false])
+AM_CONDITIONAL([WITH_DBUS], [test "x$with_dbus" = xtrue])
+
+AC_DEFUN([FUNC_NOT_FOUND_DBUS],
+	[ERR_NOT_FOUND([$1()], [dbus daemon])])
+
+if test "x$with_dbus" = xtrue && test "x$with_bindings_glib" != xtrue
+then
+	AC_MSG_ERROR([GLib bindings are required to build the dbus daemon - use --enable-bindings-glib])
+fi
+
+if test "x$with_dbus" = xtrue
+then
+	AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_DBUS([daemon])])
+	AC_CHECK_FUNC([strverscmp], [], [FUNC_NOT_FOUND_DBUS([strverscmp])])
+	PKG_CHECK_MODULES([GUDEV], [gudev-1.0 >= 230])
+	AC_CHECK_PROG([has_gdbus_codegen], [gdbus-codegen], [true], [false])
+	if test "x$has_gdbus_codegen" = xfalse
+	then
+		AC_MSG_ERROR([gdbus-codegen not found - needed to build dbus daemon])
+	fi
+fi
+
+AC_ARG_ENABLE([systemd],
+	[AS_HELP_STRING([--enable-systemd], [enable systemd support [default=no]])],
+	[if test "x$enableval" == xyes; then with_systemd=true; fi],
+	[with_systemd=false])
+AM_CONDITIONAL([WITH_SYSTEMD], [test "x$with_systemd" = xtrue])
+
+if test "x$with_systemd" = xtrue
+then
+	PKG_CHECK_VAR([systemdsystemunitdir], [systemd], [systemdsystemunitdir], [],
+		      AC_MSG_ERROR([systemdsystemunitdir not found - needed to enable systemd support]))
+fi
+
 AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
 AM_CONDITIONAL([HAS_DOXYGEN], [test "x$has_doxygen" = xtrue])
 if test "x$has_doxygen" = xfalse
@@ -337,6 +376,12 @@ AC_CONFIG_FILES([Makefile
 		 bindings/rust/Makefile
 		 bindings/rust/gpiosim-sys/src/Makefile
 		 bindings/rust/gpiosim-sys/Makefile
+		 dbus/Makefile
+		 dbus/client/Makefile
+		 dbus/data/Makefile
+		 dbus/lib/Makefile
+		 dbus/manager/Makefile
+		 dbus/tests/Makefile
 		 man/Makefile])
 
 AC_OUTPUT
diff --git a/dbus/Makefile.am b/dbus/Makefile.am
new file mode 100644
index 0000000..7868a96
--- /dev/null
+++ b/dbus/Makefile.am
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+SUBDIRS = data lib manager client
+
+if WITH_TESTS
+
+SUBDIRS += tests
+
+endif
diff --git a/dbus/client/.gitignore b/dbus/client/.gitignore
new file mode 100644
index 0000000..08ec6c8
--- /dev/null
+++ b/dbus/client/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+gpiocli
diff --git a/dbus/client/Makefile.am b/dbus/client/Makefile.am
new file mode 100644
index 0000000..1f99daf
--- /dev/null
+++ b/dbus/client/Makefile.am
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+AM_CFLAGS = -include $(top_builddir)/config.h
+AM_CFLAGS += -I$(top_builddir)/dbus/lib/ -I$(top_srcdir)/dbus/lib/
+AM_CFLAGS += -Wall -Wextra -g
+AM_CFLAGS += $(GLIB_CFLAGS) $(GIO_CFLAGS) $(GIO_UNIX_CFLAGS)
+AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiocli\"
+AM_LDFLAGS = $(GLIB_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS)
+LDADD = $(top_builddir)/dbus/lib/libgpiodbus.la
+
+bin_PROGRAMS = gpiocli
+
+gpiocli_SOURCES = \
+	common.c \
+	common.h \
+	detect.c \
+	find.c \
+	get.c \
+	gpiocli.c \
+	info.c \
+	monitor.c \
+	notify.c \
+	reconfigure.c \
+	release.c \
+	request.c \
+	requests.c \
+	set.c \
+	wait.c
+
+noinst_SCRIPTS = gpiocli-test.bash
diff --git a/dbus/data/Makefile.am b/dbus/data/Makefile.am
new file mode 100644
index 0000000..f3f7ba3
--- /dev/null
+++ b/dbus/data/Makefile.am
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+EXTRA_DIST = gpio-manager.service
+
+dbusdir = $(sysconfdir)/dbus-1/system.d/
+dbus_DATA = io.gpiod1.conf
+
+if WITH_SYSTEMD
+
+systemdsystemunit_DATA = gpio-manager.service
+
+udevdir = $(libdir)/udev/rules.d/
+udev_DATA = 90-gpio.rules
+
+endif
diff --git a/dbus/lib/Makefile.am b/dbus/lib/Makefile.am
new file mode 100644
index 0000000..8e722ad
--- /dev/null
+++ b/dbus/lib/Makefile.am
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+libgpiodbus_la_CFLAGS = -include $(top_builddir)/config.h -Wall -Wextra -g
+libgpiodbus_la_CFLAGS += $(GLIB_CFLAGS) $(GIO_CFLAGS)
+libgpiodbus_la_CFLAGS += -DG_LOG_DOMAIN=\"gpiodbus\"
+libgpiodbus_la_LDFLAGS = -version-info 1
+
+generated-gpiodbus.h generated-gpiodbus.c: io.gpiod1.xml
+	$(AM_V_GEN)gdbus-codegen \
+		--interface-prefix io.gpiod1 \
+		--c-namespace Gpiodbus \
+		--generate-c-code generated-gpiodbus \
+		--c-generate-object-manager \
+		--c-generate-autocleanup=all \
+		--glib-min-required 2.74.0 \
+		$(srcdir)/io.gpiod1.xml
+
+lib_LTLIBRARIES = libgpiodbus.la
+include_HEADERS = \
+	generated-gpiodbus.h \
+	gpiodbus.h
+libgpiodbus_la_SOURCES = generated-gpiodbus.c
+
+BUILT_SOURCES = generated-gpiodbus.c generated-gpiodbus.h
+CLEANFILES = $(BUILT_SOURCES)
+
+dbusdir = $(datadir)/dbus-1/interfaces
+dbus_DATA = io.gpiod1.xml
diff --git a/dbus/manager/.gitignore b/dbus/manager/.gitignore
new file mode 100644
index 0000000..5507c6d
--- /dev/null
+++ b/dbus/manager/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+gpio-manager
diff --git a/dbus/manager/Makefile.am b/dbus/manager/Makefile.am
new file mode 100644
index 0000000..d1cef8e
--- /dev/null
+++ b/dbus/manager/Makefile.am
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+AM_CFLAGS = -I$(top_srcdir)/bindings/glib/ -include $(top_builddir)/config.h
+AM_CFLAGS += -Wall -Wextra -g
+AM_CFLAGS += -I$(top_builddir)/dbus/lib/ -I$(top_srcdir)/dbus/lib/
+AM_CFLAGS += $(GLIB_CFLAGS) $(GIO_CFLAGS) $(GIO_UNIX_CFLAGS) $(GUDEV_CFLAGS)
+AM_CFLAGS += -DG_LOG_DOMAIN=\"gpio-manager\"
+AM_CFLAGS += $(PROFILING_CFLAGS)
+AM_LDFLAGS = $(GLIB_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS) $(GUDEV_LIBS)
+AM_LDFLAGS += $(PROFILING_LDFLAGS)
+LDADD = $(top_builddir)/bindings/glib/libgpiod-glib.la
+LDADD += $(top_builddir)/dbus/lib/libgpiodbus.la
+
+bin_PROGRAMS = gpio-manager
+gpio_manager_SOURCES = \
+	daemon.c \
+	daemon.h \
+	helpers.c \
+	helpers.h \
+	gpio-manager.c
diff --git a/dbus/tests/.gitignore b/dbus/tests/.gitignore
new file mode 100644
index 0000000..19f64af
--- /dev/null
+++ b/dbus/tests/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+gpiodbus-test
diff --git a/dbus/tests/Makefile.am b/dbus/tests/Makefile.am
new file mode 100644
index 0000000..ec4e26c
--- /dev/null
+++ b/dbus/tests/Makefile.am
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+noinst_PROGRAMS = gpiodbus-test
+gpiodbus_test_SOURCES = \
+	daemon-process.c \
+	daemon-process.h \
+	helpers.c \
+	helpers.h \
+	tests-chip.c \
+	tests-line.c \
+	tests-request.c
+
+AM_CFLAGS = -I$(top_srcdir)/tests/gpiosim-glib/
+AM_CFLAGS += -I$(top_builddir)/dbus/lib/ -I$(top_srcdir)/dbus/lib/
+AM_CFLAGS += -I$(top_srcdir)/tests/harness/
+AM_CFLAGS += -include $(top_builddir)/config.h
+AM_CFLAGS += -Wall -Wextra -g -std=gnu89
+AM_CFLAGS += $(GLIB_CFLAGS) $(GIO_CFLAGS)
+AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiodbus-test\"
+LDADD = $(top_builddir)/tests/gpiosim/libgpiosim.la
+LDADD += $(top_builddir)/tests/gpiosim-glib/libgpiosim-glib.la
+LDADD += $(top_builddir)/tests/harness/libgpiod-test-harness.la
+LDADD += $(top_builddir)/dbus/lib/libgpiodbus.la
+LDADD += $(GLIB_LIBS) $(GIO_LIBS)

-- 
2.43.0


