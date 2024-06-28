Return-Path: <linux-gpio+bounces-7817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A8691C636
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 20:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B327286750
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D380C57CB1;
	Fri, 28 Jun 2024 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lPjc8MU3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC01B55E58
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601152; cv=none; b=fo5oJ+QHEZgV5cFrfGxGLwtleNFT1qcSYaXELjUMrEOiNfNjYDfjatBQEzmEgc5NR6Ryd+bVPLyep9+xvAocEnC05ugRjhZnf6siu32zRJdpX7sAwfINHWdYPUS/afMpklWoHFLshJlF+ivn35/BEwWRk9lhYdVR7hgZrWRtIBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601152; c=relaxed/simple;
	bh=12WLLf11vHaGYUlNSI4OwRQi/+2kHPE8Pe20WHXjABA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lMca19nk20Ej1C+kZv6GDQXv/ZPk1OGLrhEbfQjei82W4jMl3fkPQSuAIPeKEFM0AlW7O2Yx1j9ibCjXY58hmp2I8pvGsUrg2P2o1hE+nJkUavjDR2IJtUzgthhq8A8hHoEEKPlQ0FhE9aaOxkD47eKklf1SOVr3DvP7Y70zezY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lPjc8MU3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-424acfff613so9366015e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719601149; x=1720205949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fr78fWiEH3X+jXUcAWkuN6d8PZAgF7LiprLtGRT8qbU=;
        b=lPjc8MU3AXop+df4NyBaqUuDOmOdIg0zh28ACnNAp3xgRVlhMWzmqsI9TN+g0EaqdR
         ixEJOK6HMMdbTH71gSny+8UZtgs1qI9MB2ljfwWR7VgO520oqBmol6uQe0GkJO1P/rts
         3Uor5EkBxw5hgAjjlPuOiFQL4Y+I6ftDF/G0UmFexcgee0xY1CeN4aD8F+vuw/NHTlrw
         1+cz5yr+w7qLVasPBW5Lru78n8l0dPYqQMTMtZTh12cT2pADmUVKR8HO5SKAnvYHE1On
         FtuN87Me7n1K44gUnE4P9xEmhrH5w9fcShiWhNMzvbEeioYifDHfq8CsIbAenkQYvg1m
         5sMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719601149; x=1720205949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fr78fWiEH3X+jXUcAWkuN6d8PZAgF7LiprLtGRT8qbU=;
        b=tpytJs7Woqu5vASXrjQur91xPwYTmkMnxNbLYeT0sfeZEYQ5vX5finpdTN1yJyXaCy
         7ceQK9eXjg5yIIiPHbFdPTsoFzgZmc8twPNmqLwtqOy+nnogrhOv8V8EWYUaTfe8PcnQ
         Odp1PCBYeYqALFp6SgpBBWBMqlkS5JOrbjI+kI8jA590BY4XsyPOs01jbKYwd/+DEcpo
         4n1dNBU7FA4xpdBGqnCfVRhIyTP7zBVBf58/iNN5ixwvH3sct27rXjzI9korRSWB7vvD
         k8qRik66JNiawD7VamWeMJ8Vgd0QM2sB23YBQld4RbVf/bATeAaZ1XTSFnxaZK74DXEx
         NUmw==
X-Forwarded-Encrypted: i=1; AJvYcCX8wRINR3xN4ekGWZk11zTqoP1TwNLcEqKlAO+ffOeuJSVfWWE/ZzJ2KDEqgPXn3wZPV6YoWWWA/flD/ER+VHyDBzVm3N/LoL3J/g==
X-Gm-Message-State: AOJu0YxYZNwWCx9ro+MriCF/jTSuJ/LKvhEowRR5ed5XsWRjvvnM6LzQ
	CuMNUP9DGqv9rGyrCUWT87oKZ1TC1R802qeQXIMXZGWuZCMA9X7T8jAgam08p5g=
X-Google-Smtp-Source: AGHT+IHu+IFNIB5hS7Jc6mAe7JutHHPV4EP+kiNLs8SnPWPCE1fiw7VVTZedvtcmZ5zyjdtvBf0NPQ==
X-Received: by 2002:a5d:6dae:0:b0:367:4337:3b35 with SMTP id ffacd0b85a97d-36743373cabmr6837370f8f.63.1719601149219;
        Fri, 28 Jun 2024 11:59:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d00sm3097336f8f.99.2024.06.28.11.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:59:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 20:58:28 +0200
Subject: [PATCH RESEND libgpiod v2 09/18] dbus: add build files
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-9-c1331ac17cb8@linaro.org>
References: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "As advised by Dan Carpenter - I'm CC'ing dbus"@lists.freedesktop.orgto, 
 linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9626;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=p2WgCOijJiXb3jPeXwEP5qvNWIHa5FbcqmlFZm3DyaQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfwfsIdjRvEckmObNLsZ+3kp49iql9l8A0XtfZ
 ziQkv+z5IWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn8H7AAKCRARpy6gFHHX
 cnZoD/4om8sCGABvjptb0L9O8xgR35ijhA6fO+8TIifIBjdsYYMv4aNgYhQdc4qkTANm0f6KMwv
 /+7h0SbkQLNUlJoVVaMJ46/6U8PJUQ2ICBFIEdzf+ypW0ECp/APct085ClAUn/bdDad0p1MqNac
 wdg79AlXscssw8wJUykwPIETbqTrlzJ5LkMnjSJWxQtSPT9fKn2B6DFEXYi+dvUav3FfwjIlmnJ
 YvR67uAu7kME+i7KlyyUbSvGCyg9TXWgMBJ1/hS21AMdu6uyfDwIEqMzfQSVJdfxfKD0+YGx7MU
 BCX3zQsdEFUWIDnhsydmBI2su6Gksgaar6x4kHJRPWtYD5nff/XhLEPvOdkOp1WPQp23GtuD7za
 RGUyiiqke6TTZ28vgpJL9vqu21oyj5Vd5yTOQ4BHK2f6A1NsPTmO+FllV/7cs9X2jJaDa1xzPjd
 E64D5botSgxiCEXVNIueZIQYXsKGet0GG5SSjPms57Djnj7Ct3CVb6llDyrX4nJjz7pDtIg5UjT
 IipRC4nHSxQWeKWxcSnEt3Uqya2awqF80zMF0O3W4Pbsx1S10+31+u0VD8FTKuHsjm/7/y3Y1zj
 xpNa8Mys0nrB2+X9YFKONLBgjobLDkPprwyi/f89EfmqLt799hkebp9oXmNp56hjdYiB7ctNYYw
 6TPzcx8bRXILr9A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the directory structure and build files as well as changes to
.gitignore for the DBus API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Makefile.am              |  7 +++++++
 configure.ac             | 45 +++++++++++++++++++++++++++++++++++++++++++++
 dbus/Makefile.am         | 10 ++++++++++
 dbus/client/.gitignore   |  4 ++++
 dbus/client/Makefile.am  | 31 +++++++++++++++++++++++++++++++
 dbus/data/Makefile.am    | 13 +++++++++++++
 dbus/lib/Makefile.am     | 28 ++++++++++++++++++++++++++++
 dbus/manager/.gitignore  |  4 ++++
 dbus/manager/Makefile.am | 21 +++++++++++++++++++++
 dbus/tests/.gitignore    |  4 ++++
 dbus/tests/Makefile.am   | 25 +++++++++++++++++++++++++
 11 files changed, 192 insertions(+)

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
index 74ba004..0b6a9f9 100644
--- a/configure.ac
+++ b/configure.ac
@@ -267,6 +267,45 @@ then
 		AC_MSG_ERROR([glib-mkenums not found - needed to build GLib bindings]))
 fi
 
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
@@ -325,6 +364,12 @@ AC_CONFIG_FILES([Makefile
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
index 0000000..3d5c2e1
--- /dev/null
+++ b/dbus/data/Makefile.am
@@ -0,0 +1,13 @@
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
+endif
diff --git a/dbus/lib/Makefile.am b/dbus/lib/Makefile.am
new file mode 100644
index 0000000..c7cbc13
--- /dev/null
+++ b/dbus/lib/Makefile.am
@@ -0,0 +1,28 @@
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
+		--c-namespace GPIODBus \
+		--generate-c-code generated-gpiodbus \
+		--c-generate-object-manager \
+		--c-generate-autocleanup=all \
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


