Return-Path: <linux-gpio+bounces-8271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A61F934AEC
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 11:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0E8E1F2144F
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 09:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF333823A9;
	Thu, 18 Jul 2024 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G9T0TdHe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A9382495
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721294938; cv=none; b=fsOjDzJaAY3dHivVUYWEOS9XSSzNF0dbDm1DKH2y9aRl6FVDXA9qLlofu2N2PfhYd0N6KsBJSsoSAQtg/oplSsks9bOPIlETApq6Z+7GRxbdinlZ876U6RKV/hy+UbDx3mZpHW0sLz9uaIzmORV79Nsg3uEVgvVB6JTrt4OfbfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721294938; c=relaxed/simple;
	bh=B7jVqCaCecbSRVg9lIFAO/m2oQRIKYZ/lm4gjiUfqMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AgYQNIn/LjWhpbU6tsKIbAb+sTvjjCyD7OnpG0XLyi3F6oKhMi80yI/A6C7L02JW1LPF/VF39yIBoir8FNf+YSXsqOOlVR2pATwj51LQTmRe5AU/cF87rebFK2OoAtAHpsXppmiOT4uVA67eEkLvSSUe4uRhRyedTd/kgQBjr04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G9T0TdHe; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-367940c57ddso296690f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 02:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721294935; x=1721899735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLheQ4eTb7PKVqWAN9aZx/Md0cCPeSSFhta/sF6ZHPY=;
        b=G9T0TdHeJTZVWhlGUThPoBShWJxVeZH/fciR/Ku8UrSqT50CyWCx9wvxCFNhbMKeen
         cZjtL3ZKeUvZRztw9oxWxkgz0MlEw+3YVuuqiP8H0Nzk3wA/uWEHd6EwYv1bxpCENcrk
         9OhvrKLGfeFP/zdJrD/GyF0pdbyCQFWDPfK5FEzYMFsbN1tR4YN66lqBpf/4UF0BlXS+
         x3VxSVg2zU4anbEbrrDn7E79p/NWekISy+SjSVHaLWHOoqqou2+NXkesUaLEWn23ZQUk
         tEDkkusVJPw6TYQF0O4pEusYTmfZRI3QZIK8+yM8iERh6iKvSw+rVbN7/in2/BFRKoPa
         KvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294935; x=1721899735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLheQ4eTb7PKVqWAN9aZx/Md0cCPeSSFhta/sF6ZHPY=;
        b=MsCvmLZXQ355c/x6rhon7Aj+GEdVp9yxov99YoxyKumuUFVREaoIE6rdTiAWnNPzIz
         PkNSJ/OvKNQHJo0tEhscEMqV2Xtkcb0LWajULcVED3VMzy35ZrRZUbf2VpyiV2GSh2iE
         2nCqMspuamXenWEYD8k9K9ggKjA71RFFZ5jXoJ6dq/t91MZHNOQIFGcB/47DD+hMSzqa
         zoKTuGOBePKBXITFqgu3ajZMBY5dgoN24aQqmFD10zRv87LCre+t1h/YMsDgGFlT1HzL
         l0vIM2fUCcG/CA6NNTRp9zIWICPiFpJOk+c2TVwHFcMcc9+EMgL6pAcg4TDGohvq4Dve
         FElQ==
X-Gm-Message-State: AOJu0YzxyC3qh69JUn1vwEdXdiRanFpjGhy8dFl3mGnnyhNZq42acWTj
	vWpMwE4Xm1A69P17clQxQyjsxvVF/pH8PEFxjJMilUupX9bJQZXopL4ayY4Giv0=
X-Google-Smtp-Source: AGHT+IFa9QE9V1e7McVcL10KL9yZQ2g6fb0qy/nWKCCvtpRWdM4xf+/pLSGGCrSE4t1GNgpUpb5JqQ==
X-Received: by 2002:a05:6000:178b:b0:367:943e:f45e with SMTP id ffacd0b85a97d-36831655727mr3363946f8f.34.1721294934837;
        Thu, 18 Jul 2024 02:28:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:58d4:2f84:5fcd:8259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm13792849f8f.104.2024.07.18.02.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:28:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 11:28:03 +0200
Subject: [PATCH libgpiod v3 09/18] dbus: add build files
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-dbus-v3-9-c9ea2604f082@linaro.org>
References: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
In-Reply-To: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9871;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=u9zUNPxSfLIUDRIb43EvASKFoCPl9/WubMKq3yE7tV4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmmOBApSp2f8jIDeK8YvdKHIdn+A/RcAi3actUT
 Fxy+3k7WdiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZpjgQAAKCRARpy6gFHHX
 cmNkEACGT1g8K74kB1YbutGkeV7tPwKmLPdNcuauH89IwFNj1sQFSFHOVxnR1x18fTld7GvMrYv
 yqDj1JbmXcJAqYAYvwumUsaA8dg2lhYwyxZStC+RRy4UzScS6/QOAjmiggC2fKnO1HqpOu3oyuO
 wcP2AJuCJwikYgUTmzuQoDGKmOM4lbwKmCkQIwGLMlUiVDDGu6WX8rnHY7TtXcFHvC/zzJkJcgq
 yVSMlFJ1YKx2dcvUaS1/DZFAPw0g2IKpAr+hrH2E21VzDJ+XmUtlLGNjOfN879Oi2SDh6kF+Lap
 pr/Eodc7tiJBNOsEyhi2EdZHeiDE+ZfA4UrDKkZZMg3W788TETqTNF5XSFZZ1bb1Lr7RjYue7lo
 rOgMoJncxD+EueJXvYYkLTs1R9sW0MuB0PoKdGOPV4u+se30RK5X0lGWbPxrzp6vo4dCPf3u/oD
 WlE8zH49/Bhp9o4lGUgHhcOd0rlQuCndBMy9IByzK9trsC43KNJC7Lu8lSEGy00jFnekLSk13es
 Fe3rAGKj/Px9OoChjJXjm63bkIBu8vSettUKUT/wvyyZWiRQjOZK0W9HbQWWCHXmY8e+kE+9W5V
 7FReFBxr61yaYyOh1lmK8HI/mYong4rNOAmhvaL6c8k9H7NckD1vrXFbTqYFxTrLaTkrr16Nrjd
 i6AXlZxXcQ8o3SQ==
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
index 85d6984..19a58f3 100644
--- a/configure.ac
+++ b/configure.ac
@@ -273,6 +273,45 @@ m4_ifdef([GOBJECT_INTROSPECTION_CHECK],
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
@@ -331,6 +370,12 @@ AC_CONFIG_FILES([Makefile
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


