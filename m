Return-Path: <linux-gpio+bounces-7792-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F94F91C1BC
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D85F71F24E18
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 14:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8087A1C0DE6;
	Fri, 28 Jun 2024 14:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="btmnLP3Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EF41C0DEE
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586436; cv=none; b=WBI3tZPV+c93pP+6xmn2aF1kptbFr0N5unl8RWAjzpvXnmV6REjydsPDGaWpYrCcWhwwzJ+bsZOS4Cl8BYDHtUghSaQ37MGFH3VivWHEOb/rVh/c+RJgE4556BDEMC8Ng8GKVo/QfT0K3rr47snjc1UIcoZuB367sSU14LreSbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586436; c=relaxed/simple;
	bh=12WLLf11vHaGYUlNSI4OwRQi/+2kHPE8Pe20WHXjABA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFwqjzxrUMoLtfd77qzvY856mfn7N0pBEFAJ3YJ/yYf9NsaKb/MTOnnSDMfKpRqHYxNr8J2/SSUfyTGClU/pGLwOyCZkrVGzV8WCBpAVSCeWF2NzVNZQJ90vpj4Izw8mQkvxHE69eBbveEuIqPM32eMhpG2ovMSef5fcSJzzAxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=btmnLP3Q; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-364c9ec17d1so401437f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 07:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719586433; x=1720191233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fr78fWiEH3X+jXUcAWkuN6d8PZAgF7LiprLtGRT8qbU=;
        b=btmnLP3Q0OW6HxYV50+mdmkf7jOC30thNhEgJKIi58iIahvMOwSIbk2G+NF/VBqjvX
         QfjwLqQSrUcu2zeKch7ANW8f4o61Xv6m30vxj7UQQrT+bxuJqqAh6ljb9jaGCaWJ2n+U
         IzJrmySbSjNYwpqHVJwf2Vc3d7oWk9HAw0aTJMY8Twavpzsuzge85q2Ns4/zrdBgxnvw
         Ns/pvVIiacOdbdCHeDC36gUizqMwsqPjTNe312pQ7xiKwAHGrJzCWrzLppqUm3KStw1I
         yJgOv47RumO7WTyeQTGxW7mj/1OhjGyT2nRHWoUF3kPHoO9ITNz06z0wFnwngWotWtYm
         /vYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586433; x=1720191233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fr78fWiEH3X+jXUcAWkuN6d8PZAgF7LiprLtGRT8qbU=;
        b=XFQklz3R1Khiasy/JWXRUr/8h0eRr0oWcLy1+Xv4lnCQ7dS5+iEcSI1qmxeH3+Tn4N
         8vroYiOp82AAYOI5TlmnDTJQ2B7g8rI4Roc/xFZB6u1HD9GXMR3Yr04k5u4gO+9F6iGz
         fQZxjnjw8h6uHPti+zAf9WrfaOwky0oNC62cZmEglMGVJBpEFNRbu6dZuRVZgbBaZvXs
         9mG1/AARVmrUvCTU+AHlsDVaMSndpBgjUVjgA5F6j6tOq6RcN8RGh+Cy9rnUcTgUonbo
         AGRJCvueOT2nuw7hVA4n7yGJZImeph3De/he902FatN9eVEo1WQfEn0BA75OuqClWQ0Q
         VKfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVL3DfPpMqvyjib7CGuVtKy9yosrI6av+K6gfTqxrdOghDquz3NGkEMjzAkRW/Q1rW69RUo7+8yKk49cVitOEAEjCLfNx8Kb8fzw==
X-Gm-Message-State: AOJu0YxktP1jUT5lVrkT1MfVaevyFoy8vIIF3ZoNon9hZfpcEK3j2yLC
	9y2lPDu+HNfj86AvK78aCFpV/n/auacqG6mcYP2nviGSeWaFnD5nkGO6QCH284Q=
X-Google-Smtp-Source: AGHT+IEkWgIHGlfezBOXsQn816YRRoBodQrmo0gCdIxfsHXWdI3Ly08i1XPnESULhD3uU7AwEMrPFA==
X-Received: by 2002:a05:6000:178a:b0:360:7887:31ae with SMTP id ffacd0b85a97d-366e95d37d3mr15874989f8f.54.1719586433055;
        Fri, 28 Jun 2024 07:53:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba4fsm2518124f8f.85.2024.06.28.07.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:53:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 16:53:25 +0200
Subject: [PATCH libgpiod v2 09/18] dbus: add build files
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-9-e42336efe2d3@linaro.org>
References: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfs5yRLzbDeIIe2ow8T5Qc9OnkE7NliDsRm2Hp
 flPrwVDZeyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn7OcgAKCRARpy6gFHHX
 co66EAC/CIlIVkRSaF5FsxOiec8kaOvKOqN8lrRx4NA3yRsugIfw3EBFNwtMqY3AoBt+BNSppJq
 xIQEpCeu7oC9uXNhZHNQqnOuvjFLwEI83PAaX9BIyggFkHIO1BZnQz1Vt7bjXYWYwXpnCovVGae
 fqxP92Mke2voty8fNOGdrdjX6YJ5FHqV9Q6QXH0847TZbEfjPztiw7N6VuBQrm0Ye/V8r2E/Rhr
 pHdqAICbRnM0LocIv+fGm5SeGQeR21GHClpADTEMFADcrJMne9ShCbdvGeyxrbhxhX1GRxfl2Sj
 iz198V9tau/2GDiQ5/POMIp7w0tHi+e0ayILfz8sHkv61Kih4tYE3DxlXTXXVSxKKGe5P4B6I71
 7OXQ0ZPBlfqNQgiLtuTp4pitXGKkbCbN8cV/y0UdONseMmrEC6xg9rWSHBq84F2fhvBHePO1QIi
 73ziGCTpKb07RlOX4CNsbMcnexyiNBucRP1D1KJofXbz5Eiz9xHt4+kWgvrzFZ66N32nn3Rpz7V
 HSNgF+isKF9GqgoW65ksLeMa5J6j0zbt9R/5jAc550b8J5uE9Eb+9ZiZcQ/4QSj+hjSrHBqYhxn
 ux3ITT37qiWzlcbF/AOrfyICFSHNEQkHPAZHwz7ZjHlOUssRAO4O8tZir3iz+LccHiDMyC/U0fm
 JJmfo9z8Q+BDDxA==
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


