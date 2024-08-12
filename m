Return-Path: <linux-gpio+bounces-8716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A894E86A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 10:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5980F1F220F3
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 08:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4BE16726E;
	Mon, 12 Aug 2024 08:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nVR/3K6J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DB8166F30
	for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2024 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723450970; cv=none; b=fuJfwopSInI+g71mqz+7hot6Rdo1kGtbNSA/oFq1r9HkjsR9U0L/Mpq5YkumVMEsR6naj3qmK9/UrTjW+IffsEw22cGGwKowRPZiP9UaKoRAcyku6K338Lb9QFIymrAymhWGssRMn8wnKmlYTRCKgsc4lZLlnpnQgXxCSB1rlrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723450970; c=relaxed/simple;
	bh=ux7q08xQDjQOaGHYIwqoc4yw8StYAzd2bizw3g1Z4VY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BnuLMmj7cG1wNY5BihN/OxJp9mEBPUxBTVP2vEL4Zk4vzvrrNwluf6imhHwcsTIjBc2MbyWYqfTNTVFWsomLCpuQ8ioxIeI3PP+KgS/Oi2A780bjJUeJZKJ8GISmcq10rW4Abt9ASu7liuxarfie8TLW7z8g90RPZIc36WPH3hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nVR/3K6J; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so30657075e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2024 01:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723450959; x=1724055759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qm03yFCTDVcPPS4i0ebn+XiSqPyYgX6491zlFrxD/Zw=;
        b=nVR/3K6JaZzJJNNC+KTayPtwyr0y0S5ustiJ8O17KzDuDYqs/vgFr6KqlqFI+Or5c3
         Ir8m4KSpIHvkPr9wqUqo3n+1YrPIKADASsNbTvpR4mozSzT0pyGfC1S6zqBtGQlFdjIN
         PvLq3SE9cbrnlgbd3NDUHAixU+hFf8mBX1vN1h8zae39+1fBDhk5h1K5y91Or3S7exfW
         APNaSI4+FnAjtVV/IH48rc69+8hkyMMgezNSmYfw8ZfSlE5VIPydSnVOfRPP57dk39VF
         eE5gqPjT8obyLpFmaDR2weg8OWe6ttDbm4DhwKhe6FISN+1R5VJU41sV3PbgTDicQwex
         +7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723450959; x=1724055759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qm03yFCTDVcPPS4i0ebn+XiSqPyYgX6491zlFrxD/Zw=;
        b=bgNvfK3evLyVzOm2N/JPGXwzok7sdWRAVlhyV+Z0kW/ZySdZHiVVDHWCzInbkytjas
         SQsfDC331rWZ0xAj+x1Wfip6rpMZoBwTkrwWVnGwrV5Fv32rpezZ4FGzb2Ich2uM65yR
         1DjiVca/CZm+Lxy1XA7SlTd/X0LMB2XP0+AspfUjGKkKImCpeaN2H9ZXg6aVEXvST7Hy
         h1wUb9YFf2HuTtw2zfR1Rp3GbhaatUoEf2tMwyzKJAk7N5yqYbYWTzbdsEdskl+6W6qM
         jNdjMg1VtYz0x4Swp3LtWa254bEevc1Nodzl45ZlpNI96segm3w3sVKGXNGtvMP4Fk49
         I4zQ==
X-Gm-Message-State: AOJu0YywdyYsPZVzJwfPaG19JhogH64Qhc28uhdYG24qb0bznaae5e2y
	j1BFsD6hcw0aTGKUghOdl1UG8f+gVnLKvTpwUvTicRJ9K7djnZe0m9HQX7jkM2I=
X-Google-Smtp-Source: AGHT+IEGOIUGgoV8yQZK4iveE0ON5S9908X89QAmBzGGa6asQzEDi7lqIBQpLuXSrF9HaBny3cz6Iw==
X-Received: by 2002:a05:600c:17c7:b0:428:1608:831e with SMTP id 5b1f17b1804b1-429c3a28fffmr63243455e9.22.1723450958654;
        Mon, 12 Aug 2024 01:22:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d7d3:597b:b219:7ba5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c74ff9fsm179059555e9.28.2024.08.12.01.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 01:22:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 12 Aug 2024 10:22:25 +0200
Subject: [PATCH libgpiod v5 4/4] dbus: add the D-Bus daemon, command-line
 client and tests
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-dbus-v5-4-ead288509217@linaro.org>
References: <20240812-dbus-v5-0-ead288509217@linaro.org>
In-Reply-To: <20240812-dbus-v5-0-ead288509217@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=232371;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=be1Ail6aSUDWB4YiVS7FyknCDKj+hqxlK0eH4OZBJQo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmucZJxWCRKNRzB61MuSVbp82rbcFc8nOhdYxdF
 iwzHJv1TZ6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrnGSQAKCRARpy6gFHHX
 cshFEACsDze8Goiy/rXurr8FAqRZVQE9leBpBGRRHETmC7DQsq8l5FowIHZXApr0ZxWtfqGTV73
 xuGu52a2KyVy4UvblwrPgrHRMF+I6q2tA/X1AVfqw0Za5DMZhx7scLlNkbvMrlPlrcc5efslFzj
 GOSS/MLTAJBUUemDfZmSiOBHKexvNhXFXtCDTiv1SPqY4kYGAzIUBocfp3TZ+t6Wot5DepCLmvj
 kkG39PXTjal2ovas7v3HrCtTI9kfouAX5dwN0BH0CGnKCvdDHP4Sdc8MEaexpUzcVaKU5zsM/bc
 h6IQBlF/3qidHLhf9ChxyDIez/sKYZNurGSHZcWKAgL8MOF62koMO8jP2lbNomfQoslu+2XyYHq
 iP2uDZp9lAANZJekFkfTfDZJe3CCQ8Eb4cHu9uVeY7QngbT26dwKho+zuMSQCApPKenLxGorBN2
 AtEpqXhbuklBWlNzMwRrUj2Duvam127No+sgQVebayHxLjQLmB4wLnsCvuOOXOO72S7qYo7G7O/
 bw8n/H59937FS96IwjKqgtXABIfMqH18Da4O5DhAE4bJeBqz413v+IwhWqiQ0WeqCfUCYHe1zFa
 pLtUxgDRlvNf9Bk/ezeIdxl3Pizjm7MAB5cyxC2xkQku/Dgp096bb117fV3YMM+9UKOxeuT7+56
 URd6oklTp0YdekQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the D-Bus API definition and its implementation in the form of a GPIO
manager daemon and a companion command-line client as well as some
additional configuration and data files (systemd service, example udev
configuration, etc.) and test suites.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Makefile.am                    |    7 +
 README                         |   64 ++
 TODO                           |   17 -
 configure.ac                   |   45 ++
 dbus/Makefile.am               |   10 +
 dbus/client/.gitignore         |    4 +
 dbus/client/Makefile.am        |   31 +
 dbus/client/common.c           |  646 ++++++++++++++++++
 dbus/client/common.h           |  203 ++++++
 dbus/client/detect.c           |   53 ++
 dbus/client/find.c             |   66 ++
 dbus/client/get.c              |  212 ++++++
 dbus/client/gpiocli-test.bash  | 1443 ++++++++++++++++++++++++++++++++++++++++
 dbus/client/gpiocli.c          |  174 +++++
 dbus/client/info.c             |  184 +++++
 dbus/client/monitor.c          |  191 ++++++
 dbus/client/notify.c           |  295 ++++++++
 dbus/client/reconfigure.c      |   76 +++
 dbus/client/release.c          |   64 ++
 dbus/client/request.c          |  250 +++++++
 dbus/client/requests.c         |   71 ++
 dbus/client/set.c              |  173 +++++
 dbus/client/wait.c             |  188 ++++++
 dbus/data/90-gpio.rules        |    4 +
 dbus/data/Makefile.am          |   16 +
 dbus/data/gpio-manager.service |   50 ++
 dbus/data/io.gpiod1.conf       |   41 ++
 dbus/lib/Makefile.am           |   29 +
 dbus/lib/gpiodbus.h            |    9 +
 dbus/lib/io.gpiod1.xml         |  324 +++++++++
 dbus/manager/.gitignore        |    4 +
 dbus/manager/Makefile.am       |   21 +
 dbus/manager/daemon.c          |  821 +++++++++++++++++++++++
 dbus/manager/daemon.h          |   22 +
 dbus/manager/gpio-manager.c    |  173 +++++
 dbus/manager/helpers.c         |  431 ++++++++++++
 dbus/manager/helpers.h         |   26 +
 dbus/tests/.gitignore          |    4 +
 dbus/tests/Makefile.am         |   25 +
 dbus/tests/daemon-process.c    |  129 ++++
 dbus/tests/daemon-process.h    |   20 +
 dbus/tests/helpers.c           |  107 +++
 dbus/tests/helpers.h           |  114 ++++
 dbus/tests/tests-chip.c        |  133 ++++
 dbus/tests/tests-line.c        |  231 +++++++
 dbus/tests/tests-request.c     |  116 ++++
 46 files changed, 7300 insertions(+), 17 deletions(-)

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
diff --git a/README b/README
index 658a77e..80ad939 100644
--- a/README
+++ b/README
@@ -229,6 +229,70 @@ C library using make, they will be automatically configured to build against the
 build results of the C library. Please refer to bindings/rust/libgpiod/README.md
 for more information.
 
+DBUS
+----
+
+A commonly requested feature for the GPIO character device was state persistence
+after releasing the lines (as a kernel feature) or providing a central authority
+(in user-space) that would be in charge of keeping the lines requested and in a
+certain state (similarily to how the sysfs ABI works). DBus API has been
+provided to address this requirement. We define an interface covering the
+majority of the GPIO chardev's functionality and implement it from both the
+server and client sides in the form of the gpio-manager daemon and the gpiocli
+command-line utility for talking to the manager.
+
+DBus support can be built by passing --enable-dbus to configure. The daemon
+is bundled with a systemd unit file and an example configuration file for the
+io.gpiod1 interface that allows all users to access basic information about the
+GPIOs in the system but only root to request lines or change their values.
+
+With the manager running the user can run gpiocli to control GPIOs by asking
+gpio-manager to act on their behalf:
+
+    # Detect chips in the system.
+    $ gpiocli detect
+    gpiochip0 [INT34C6:00] (463 lines)
+
+    # Request a set of lines. Note that gpiocli exits immediately but the
+    # state of the lines is retained because it's the gpio-manager that
+    # requested them.
+    $ gpiocli request --output foo=active
+    request0
+
+    # Previous invocation printed out the name of the request by which the
+    # caller can refer to it later. All active requests can also be inspected
+    # at any time.
+    $ gpiocli requests
+    request0 (gpiochip1) Offsets: [5]
+
+    # We can print the information about the requested line using the
+    # information above.
+    $ gpiocli info --chip=gpiochip1 5
+    gpiochip1   5:	"foo"		[used,consumer="gpiocli request",managed="request0",output,push-pull]
+
+    # We can now change the value of the line.
+    $ gpiocli set foo=inactive
+
+    # And read it.
+    $ gpiocli get foo
+    "foo"=inactive
+
+    # We can even reconfigure it to input and enable edge-detection.
+    $ gpiocli reconfigure --input --both-edges request0
+
+    # And wait for edge events.
+    $ gpiocli monitor cos
+    21763952894920 rising  "foo"
+
+    # And finally release the request.
+    $ gpiocli release request0
+
+For more information please refer to the output of gpiocli --help as well as
+gpiocli <command> --help which prints detailed info on every available command.
+
+Of course - this being DBus - users can talk to gpio-manager using any DBus
+library available and are not limited to the provided client.
+
 TESTING
 -------
 
diff --git a/TODO b/TODO
index 79a6246..5092f3f 100644
--- a/TODO
+++ b/TODO
@@ -11,23 +11,6 @@ serve as the starting point.
 
 ==========
 
-* implement dbus API for controlling GPIOs
-
-A common complaint from users about gpioset is that the state of a line is not
-retained once the program exits. While this is precisely the way linux
-character devices work, it's understandable that most users will want some
-centralized way of controlling GPIOs - similar to how sysfs worked.
-
-One of the possible solutions is a DBus API. We need a daemon exposing chips
-and lines as dbus objects and allowing to control and inspect lines using
-dbus methods and monitor them using signals.
-
-As of writing of this document some of the work has already been done and the
-skeleton of the dbus daemon written in C using GLib has already been developed
-and is partially functional.
-
-----------
-
 * implement a simple daemon for controlling GPIOs in C together with a client
   program
 
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
diff --git a/dbus/client/common.c b/dbus/client/common.c
new file mode 100644
index 0000000..912c1ad
--- /dev/null
+++ b/dbus/client/common.c
@@ -0,0 +1,646 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <glib/gprintf.h>
+#include <stdarg.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+
+#include "common.h"
+
+static void print_err_msg(GError *err, const gchar *fmt, va_list va)
+{
+	g_printerr("%s: ", g_get_prgname());
+	g_vfprintf(stderr, fmt, va);
+	if (err)
+		g_printerr(": %s", err->message);
+	g_printerr("\n");
+}
+
+void die(const gchar *fmt, ...)
+{
+	va_list va;
+
+	va_start(va, fmt);
+	print_err_msg(NULL, fmt, va);
+	va_end(va);
+
+	exit(EXIT_FAILURE);
+}
+
+void die_gerror(GError *err, const gchar *fmt, ...)
+{
+	va_list va;
+
+	va_start(va, fmt);
+	print_err_msg(err, fmt, va);
+	va_end(va);
+
+	exit(EXIT_FAILURE);
+}
+
+void die_parsing_opts(const char *fmt, ...)
+{
+	va_list va;
+
+	va_start(va, fmt);
+	print_err_msg(NULL, fmt, va);
+	va_end(va);
+	g_printerr("\nSee %s --help\n", g_get_prgname());
+
+	exit(EXIT_FAILURE);
+}
+
+void parse_options(const GOptionEntry *opts, const gchar *summary,
+		   const gchar *description, int *argc, char ***argv)
+{
+	g_autoptr(GOptionContext) ctx = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	ctx = g_option_context_new(NULL);
+	g_option_context_set_summary(ctx, summary);
+	g_option_context_set_description(ctx, description);
+	g_option_context_add_main_entries(ctx, opts, NULL);
+	g_option_context_set_strict_posix(ctx, TRUE);
+
+	ret = g_option_context_parse(ctx, argc, argv, &err);
+	if (!ret) {
+		g_printerr("%s: Option parsing failed: %s\nSee %s --help\n",
+			   g_get_prgname(), err->message, g_get_prgname());
+		exit(EXIT_FAILURE);
+	}
+}
+
+void check_manager(void)
+{
+	g_autoptr(GDBusProxy) proxy = NULL;
+	g_autoptr(GVariant) result = NULL;
+	g_autoptr(GError) err = NULL;
+
+	proxy = g_dbus_proxy_new_for_bus_sync(
+			G_BUS_TYPE_SYSTEM, G_DBUS_PROXY_FLAGS_NONE, NULL,
+			"io.gpiod1", "/io/gpiod1", "org.freedesktop.DBus.Peer",
+			NULL, &err);
+	if (!proxy)
+		die_gerror(err, "Unable to create a proxy to '/io/gpiod1'");
+
+	result = g_dbus_proxy_call_sync(proxy, "Ping", NULL,
+					G_DBUS_CALL_FLAGS_NONE, -1, NULL,
+					&err);
+	if (!result) {
+		if (err->domain == G_DBUS_ERROR) {
+			switch (err->code) {
+			case G_DBUS_ERROR_ACCESS_DENIED:
+				die("Access to gpio-manager denied, check your permissions");
+			case G_DBUS_ERROR_SERVICE_UNKNOWN:
+				die("gpio-manager not running");
+			}
+		}
+
+		die_gerror(err, "Failed trying to contect the gpio manager");
+	}
+}
+
+gboolean quit_main_loop_on_signal(gpointer user_data)
+{
+	GMainLoop *loop = user_data;
+
+	g_main_loop_quit(loop);
+
+	return G_SOURCE_REMOVE;
+}
+
+void die_on_name_vanished(GDBusConnection *con G_GNUC_UNUSED,
+			  const gchar *name G_GNUC_UNUSED,
+			  gpointer user_data G_GNUC_UNUSED)
+{
+	die("gpio-manager exited unexpectedly");
+}
+
+GList *strv_to_gstring_list(GStrv lines)
+{
+	gsize llen = g_strv_length(lines);
+	GList *list = NULL;
+	guint i;
+
+	for (i = 0; i < llen; i++)
+		list = g_list_append(list, g_string_new(lines[i]));
+
+	return list;
+}
+
+gint output_value_from_str(const gchar *value_str)
+{
+	if ((g_strcmp0(value_str, "active") == 0) ||
+	    (g_strcmp0(value_str, "1") == 0))
+		return 1;
+	else if ((g_strcmp0(value_str, "inactive") == 0) ||
+		 (g_strcmp0(value_str, "0") == 0))
+		return 0;
+
+	die_parsing_opts("invalid output value: '%s'", value_str);
+}
+
+static gboolean str_is_all_digits(const gchar *str)
+{
+	for (; *str; str++) {
+		if (!g_ascii_isdigit(*str))
+			return FALSE;
+	}
+
+	return TRUE;
+}
+
+static gint compare_objs_by_path(GDBusObject *a, GDBusObject *b)
+{
+	return strverscmp(g_dbus_object_get_object_path(a),
+			  g_dbus_object_get_object_path(b));
+}
+
+GDBusObjectManager *get_object_manager_client(const gchar *obj_path)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GError) err = NULL;
+
+	manager = gpiodbus_object_manager_client_new_for_bus_sync(
+				G_BUS_TYPE_SYSTEM,
+				G_DBUS_OBJECT_MANAGER_CLIENT_FLAGS_NONE,
+				"io.gpiod1", obj_path, NULL, &err);
+	if (!manager)
+		die_gerror(err,
+			   "failed to create the object manager client for %s",
+			   obj_path);
+
+	return g_object_ref(manager);
+}
+
+static gchar *make_chip_obj_path(const gchar *chip)
+{
+	return g_strdup_printf(
+		str_is_all_digits(chip) ?
+			"/io/gpiod1/chips/gpiochip%s" :
+			"/io/gpiod1/chips/%s",
+		chip);
+}
+
+GpiodbusObject *get_chip_obj_by_path(const gchar *obj_path)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+
+	manager = get_object_manager_client("/io/gpiod1/chips");
+
+	chip_obj = GPIODBUS_OBJECT(g_dbus_object_manager_get_object(manager,
+								    obj_path));
+	if (!chip_obj)
+		die("No such chip object: '%s'", obj_path);
+
+	return g_object_ref(chip_obj);
+}
+
+GpiodbusObject *get_chip_obj(const gchar *chip_name)
+{
+	g_autofree gchar *chip_path = make_chip_obj_path(chip_name);
+
+	return get_chip_obj_by_path(chip_path);
+}
+
+GList *get_chip_objs(GStrv chip_names)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	GList *objs = NULL;
+	gint i;
+
+	manager = get_object_manager_client("/io/gpiod1/chips");
+
+	if (!chip_names)
+		return g_list_sort(g_dbus_object_manager_get_objects(manager),
+				   (GCompareFunc)compare_objs_by_path);
+
+	for (i = 0; chip_names[i]; i++) {
+		g_autofree gchar *obj_path = make_chip_obj_path(chip_names[i]);
+		g_autoptr(GpiodbusObject) obj = NULL;
+
+		obj = GPIODBUS_OBJECT(
+			g_dbus_object_manager_get_object(manager, obj_path));
+		if (!obj)
+			die("No such chip: '%s'", chip_names[i]);
+
+		objs = g_list_insert_sorted(objs, g_object_ref(obj),
+					    (GCompareFunc)compare_objs_by_path);
+	}
+
+	return objs;
+}
+
+gchar *make_request_obj_path(const gchar *request)
+{
+	return g_strdup_printf(
+		str_is_all_digits(request) ?
+			"/io/gpiod1/requests/request%s" :
+			"/io/gpiod1/requests/%s",
+		request);
+}
+
+GpiodbusObject *get_request_obj(const gchar *request_name)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GpiodbusObject) req_obj = NULL;
+	g_autofree gchar *obj_path = NULL;
+
+	manager = get_object_manager_client("/io/gpiod1/requests");
+	obj_path = make_request_obj_path(request_name);
+
+	req_obj = GPIODBUS_OBJECT(g_dbus_object_manager_get_object(manager,
+								   obj_path));
+	if (!req_obj)
+		die("No such request: '%s'", request_name);
+
+	return g_object_ref(req_obj);
+}
+
+GList *get_request_objs(void)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	GList *objs = NULL;
+
+	manager = get_object_manager_client("/io/gpiod1/requests");
+	objs = g_dbus_object_manager_get_objects(manager);
+
+	return g_list_sort(objs, (GCompareFunc)compare_objs_by_path);
+}
+
+GArray *get_request_offsets(GpiodbusRequest *request)
+{
+	const gchar *chip_path, *line_path, *const *line_paths;
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	GpiodbusLine *line;
+	guint i, offset;
+
+	chip_path = gpiodbus_request_get_chip_path(request);
+	line_paths = gpiodbus_request_get_line_paths(request);
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	manager = get_object_manager_client(chip_path);
+
+	for (i = 0, line_path = line_paths[i];
+	     line_path;
+	     line_path = line_paths[++i]) {
+		g_autoptr(GDBusObject) line_obj = NULL;
+
+		line_obj = g_dbus_object_manager_get_object(manager, line_path);
+		line = gpiodbus_object_peek_line(GPIODBUS_OBJECT(line_obj));
+		offset = gpiodbus_line_get_offset(line);
+		g_array_append_val(offsets, offset);
+	}
+
+	return g_array_ref(offsets);
+}
+
+gboolean get_line_obj_by_name(const gchar *name, GpiodbusObject **line_obj,
+			      GpiodbusObject **chip_obj)
+{
+	g_autolist(GpiodbusObject) chip_objs = NULL;
+	GList *pos;
+
+	if (str_is_all_digits(name))
+		die("Refusing to use line offsets if chip is not specified");
+
+	chip_objs = get_chip_objs(NULL);
+
+	for (pos = g_list_first(chip_objs); pos; pos = g_list_next(pos)) {
+		*line_obj = get_line_obj_by_name_for_chip(pos->data, name);
+		if (*line_obj) {
+			if (chip_obj)
+				*chip_obj = g_object_ref(pos->data);
+			return TRUE;
+		}
+	}
+
+	return FALSE;
+}
+
+GpiodbusObject *
+get_line_obj_by_name_for_chip(GpiodbusObject *chip_obj, const gchar *line_name)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autolist(GpiodbusObject) line_objs = NULL;
+	const gchar *chip_path;
+	GpiodbusLine *line;
+	guint64 offset;
+	GList *pos;
+
+	chip_path = g_dbus_object_get_object_path(G_DBUS_OBJECT(chip_obj));
+	manager = get_object_manager_client(chip_path);
+	line_objs = g_dbus_object_manager_get_objects(manager);
+
+	for (pos = g_list_first(line_objs); pos; pos = g_list_next(pos)) {
+		line = gpiodbus_object_peek_line(pos->data);
+
+		if (g_strcmp0(gpiodbus_line_get_name(line), line_name) == 0)
+			return g_object_ref(pos->data);
+
+		if (str_is_all_digits(line_name)) {
+			offset = g_ascii_strtoull(line_name, NULL, 10);
+			if (offset == gpiodbus_line_get_offset(line))
+				return g_object_ref(pos->data);
+		}
+	}
+
+	return NULL;
+}
+
+GList *get_all_line_objs_for_chip(GpiodbusObject *chip_obj)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	const gchar *chip_path;
+
+	chip_path = g_dbus_object_get_object_path(G_DBUS_OBJECT(chip_obj));
+	manager = get_object_manager_client(chip_path);
+
+	return g_list_sort(g_dbus_object_manager_get_objects(manager),
+			   (GCompareFunc)compare_objs_by_path);
+}
+
+static gchar *sanitize_str(const gchar *str)
+{
+	if (!strlen(str))
+		return NULL;
+
+	return g_strdup(str);
+}
+
+static const gchar *sanitize_direction(const gchar *direction)
+{
+	if ((g_strcmp0(direction, "input") == 0) ||
+	    (g_strcmp0(direction, "output") == 0))
+		return direction;
+
+	die("invalid direction value received from manager: '%s'", direction);
+}
+
+static const gchar *sanitize_drive(const gchar *drive)
+{
+	if ((g_strcmp0(drive, "push-pull") == 0) ||
+	    (g_strcmp0(drive, "open-source") == 0) ||
+	    (g_strcmp0(drive, "open-drain") == 0))
+		return drive;
+
+	die("invalid drive value received from manager: '%s'", drive);
+}
+
+static const gchar *sanitize_bias(const gchar *bias)
+{
+	if ((g_strcmp0(bias, "pull-up") == 0) ||
+	    (g_strcmp0(bias, "pull-down") == 0) ||
+	    (g_strcmp0(bias, "disabled") == 0))
+		return bias;
+
+	if (g_strcmp0(bias, "unknown") == 0)
+		return NULL;
+
+	die("invalid bias value received from manager: '%s'", bias);
+}
+
+static const gchar *sanitize_edge(const gchar *edge)
+{
+	if ((g_strcmp0(edge, "rising") == 0) ||
+	    (g_strcmp0(edge, "falling") == 0) ||
+	    (g_strcmp0(edge, "both") == 0))
+		return edge;
+
+	if (g_strcmp0(edge, "none") == 0)
+		return NULL;
+
+	die("invalid edge value received from manager: '%s'", edge);
+}
+
+static const gchar *sanitize_clock(const gchar *event_clock)
+{
+	if ((g_strcmp0(event_clock, "monotonic") == 0) ||
+	    (g_strcmp0(event_clock, "realtime") == 0) ||
+	    (g_strcmp0(event_clock, "hte") == 0))
+		return event_clock;
+
+	die("invalid clock value received from manager: '%s'", event_clock);
+}
+
+gchar *sanitize_object_path(const gchar *path)
+{
+	if (g_strcmp0(path, "/") == 0)
+		return g_strdup("N/A");
+
+	return g_path_get_basename(path);
+}
+
+LineProperties *get_line_properties(GpiodbusLine *line)
+{
+	LineProperties *props;
+
+	props = g_malloc0(sizeof(*props));
+	props->name = sanitize_str(gpiodbus_line_get_name(line));
+	props->offset = gpiodbus_line_get_offset(line);
+	props->used = gpiodbus_line_get_used(line);
+	props->consumer = sanitize_str(gpiodbus_line_get_consumer(line));
+	props->direction = sanitize_direction(
+				gpiodbus_line_get_direction(line));
+	props->drive = sanitize_drive(gpiodbus_line_get_drive(line));
+	props->bias = sanitize_bias(gpiodbus_line_get_bias(line));
+	props->active_low = gpiodbus_line_get_active_low(line);
+	props->edge = sanitize_edge(gpiodbus_line_get_edge_detection(line));
+	props->debounced = gpiodbus_line_get_debounced(line);
+	props->debounce_period = gpiodbus_line_get_debounce_period_us(line);
+	props->event_clock = sanitize_clock(
+				gpiodbus_line_get_event_clock(line));
+	props->managed = gpiodbus_line_get_managed(line);
+	props->request_name = sanitize_object_path(
+			gpiodbus_line_get_request_path(line));
+
+	return props;
+}
+
+void free_line_properties(LineProperties *props)
+{
+	g_free(props->name);
+	g_free(props->consumer);
+	g_free(props->request_name);
+	g_free(props);
+}
+
+void validate_line_config_opts(LineConfigOpts *opts)
+{
+	gint counter;
+
+	if (opts->input && opts->output)
+		die_parsing_opts("--input and --output are mutually exclusive");
+
+	if (opts->both_edges)
+		opts->rising_edge = opts->falling_edge = TRUE;
+
+	if (!opts->input && (opts->rising_edge || opts->falling_edge))
+		die_parsing_opts("monitoring edges is only possible in input mode");
+
+	counter = 0;
+	if (opts->push_pull)
+		counter++;
+	if (opts->open_drain)
+		counter++;
+	if (opts->open_source)
+		counter++;
+
+	if (counter > 1)
+		die_parsing_opts("--push-pull, --open-drain and --open-source are mutually exclusive");
+
+	if (!opts->output && (counter > 0))
+		die_parsing_opts("--push-pull, --open-drain and --open-source are only available in output mode");
+
+	counter = 0;
+	if (opts->pull_up)
+		counter++;
+	if (opts->pull_down)
+		counter++;
+	if (opts->bias_disabled)
+		counter++;
+
+	if (counter > 1)
+		die_parsing_opts("--pull-up, --pull-down and --bias-disabled are mutually exclusive");
+
+	counter = 0;
+	if (opts->clock_monotonic)
+		counter++;
+	if (opts->clock_realtime)
+		counter++;
+	if (opts->clock_hte)
+		counter++;
+
+	if (counter > 1)
+		die_parsing_opts("--clock-monotonic, --clock-realtime and --clock-hte are mutually exclusive");
+
+	if (counter > 0 && (!opts->rising_edge && !opts->falling_edge))
+		die_parsing_opts("--clock-monotonic, --clock-realtime and --clock-hte can only be used with edge detection enabled");
+
+	if (opts->debounce_period && (!opts->rising_edge && !opts->falling_edge))
+		die_parsing_opts("--debounce-period can only be used with edge-detection enabled");
+}
+
+GVariant *make_line_config(GArray *offsets, LineConfigOpts *opts)
+{
+	const char *direction, *edge = NULL, *bias = NULL, *drive = NULL,
+		   *clock = NULL;
+	g_autoptr(GVariant) output_values = NULL;
+	g_autoptr(GVariant) line_settings = NULL;
+	g_autoptr(GVariant) line_offsets = NULL;
+	g_autoptr(GVariant) line_configs = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	GVariantBuilder builder;
+	guint i;
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	for (i = 0; i < offsets->len; i++)
+		g_variant_builder_add_value(&builder,
+			g_variant_new_uint32(g_array_index(offsets, guint, i)));
+	line_offsets = g_variant_builder_end(&builder);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+
+	if (opts->input)
+		direction = "input";
+	else if (opts->output)
+		direction = "output";
+	else
+		direction = "as-is";
+
+	if (direction)
+		g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "direction",
+				      g_variant_new_string(direction)));
+
+	if (opts->rising_edge && opts->falling_edge)
+		edge = "both";
+	else if (opts->falling_edge)
+		edge = "falling";
+	else if (opts->rising_edge)
+		edge = "rising";
+
+	if (edge)
+		g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "edge",
+				      g_variant_new_string(edge)));
+
+	if (opts->pull_up)
+		bias = "pull-up";
+	else if (opts->pull_down)
+		bias = "pull-down";
+	else if (opts->bias_disabled)
+		bias = "disabled";
+
+	if (bias)
+		g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "bias",
+				      g_variant_new_string(bias)));
+
+	if (opts->push_pull)
+		drive = "push-pull";
+	else if (opts->open_drain)
+		drive = "open-drain";
+	else if (opts->open_source)
+		drive = "open-source";
+
+	if (drive)
+		g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "drive",
+				      g_variant_new_string(drive)));
+
+	if (opts->active_low)
+		g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "active-low",
+				      g_variant_new_boolean(TRUE)));
+
+	if (opts->debounce_period)
+		g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "debounce-period",
+				g_variant_new_int64(opts->debounce_period)));
+
+	if (opts->clock_monotonic)
+		clock = "monotonic";
+	else if (opts->clock_realtime)
+		clock = "realtime";
+	else if (opts->clock_hte)
+		clock = "hte";
+
+	if (clock)
+		g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "event-clock",
+				      g_variant_new_string(clock)));
+
+	line_settings = g_variant_builder_end(&builder);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_TUPLE);
+	g_variant_builder_add_value(&builder, g_variant_ref(line_offsets));
+	g_variant_builder_add_value(&builder, g_variant_ref(line_settings));
+	line_config = g_variant_builder_end(&builder);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	g_variant_builder_add_value(&builder, g_variant_ref(line_config));
+	line_configs = g_variant_builder_end(&builder);
+
+	if (opts->output_values) {
+		g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+		for (i = 0; i < opts->output_values->len; i++) {
+			g_variant_builder_add(&builder, "i",
+					g_array_index(opts->output_values,
+						      gint, i));
+		}
+		output_values = g_variant_builder_end(&builder);
+	} else {
+		output_values = g_variant_new("ai", opts->output_values);
+	}
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_TUPLE);
+	g_variant_builder_add_value(&builder, g_variant_ref(line_configs));
+	g_variant_builder_add_value(&builder, g_variant_ref(output_values));
+
+	return g_variant_ref_sink(g_variant_builder_end(&builder));
+}
diff --git a/dbus/client/common.h b/dbus/client/common.h
new file mode 100644
index 0000000..772e94a
--- /dev/null
+++ b/dbus/client/common.h
@@ -0,0 +1,203 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIOCLI_COMMON_H__
+#define __GPIOCLI_COMMON_H__
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <gpiodbus.h>
+
+void die(const gchar *fmt, ...) G_NORETURN G_GNUC_PRINTF(1, 2);
+void
+die_gerror(GError *err, const gchar *fmt, ...) G_NORETURN G_GNUC_PRINTF(2, 3);
+void die_parsing_opts(const char *fmt, ...) G_NORETURN G_GNUC_PRINTF(1, 2);
+
+void parse_options(const GOptionEntry *opts, const gchar *summary,
+		   const gchar *description, int *argc, char ***argv);
+void check_manager(void);
+
+gboolean quit_main_loop_on_signal(gpointer user_data);
+void die_on_name_vanished(GDBusConnection *con, const gchar *name,
+			  gpointer user_data);
+
+GList *strv_to_gstring_list(GStrv lines);
+gint output_value_from_str(const gchar *value_str);
+
+GDBusObjectManager *get_object_manager_client(const gchar *obj_path);
+GpiodbusObject *get_chip_obj_by_path(const gchar *obj_path);
+GpiodbusObject *get_chip_obj(const gchar *chip_name);
+GList *get_chip_objs(GStrv chip_names);
+gchar *make_request_obj_path(const gchar *request);
+GpiodbusObject *get_request_obj(const gchar *request_name);
+GList *get_request_objs(void);
+GArray *get_request_offsets(GpiodbusRequest *request);
+gboolean get_line_obj_by_name(const gchar *name, GpiodbusObject **line_obj,
+			      GpiodbusObject **chip_obj);
+GpiodbusObject *
+get_line_obj_by_name_for_chip(GpiodbusObject *chip_obj, const gchar *name_line);
+GList *get_all_line_objs_for_chip(GpiodbusObject *chip_obj);
+
+gchar *sanitize_object_path(const gchar *path);
+
+typedef struct {
+	gchar *name;
+	guint offset;
+	gboolean used;
+	gchar *consumer;
+	const gchar *direction;
+	const gchar *drive;
+	const gchar *bias;
+	gboolean active_low;
+	const gchar *edge;
+	gboolean debounced;
+	guint64 debounce_period;
+	const gchar *event_clock;
+	gboolean managed;
+	gchar *request_name;
+} LineProperties;
+
+LineProperties *get_line_properties(GpiodbusLine *line);
+void free_line_properties(LineProperties *props);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(LineProperties, free_line_properties);
+
+typedef struct {
+	gboolean input;
+	gboolean output;
+	gboolean active_low;
+	gboolean rising_edge;
+	gboolean falling_edge;
+	gboolean both_edges;
+	gboolean push_pull;
+	gboolean open_source;
+	gboolean open_drain;
+	gboolean pull_up;
+	gboolean pull_down;
+	gboolean bias_disabled;
+	gboolean clock_monotonic;
+	gboolean clock_realtime;
+	gboolean clock_hte;
+	GTimeSpan debounce_period;
+	GArray *output_values;
+} LineConfigOpts;
+
+#define LINE_CONFIG_OPTIONS(opts) \
+		{ \
+			.long_name		= "input", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->input, \
+			.description		= "Set direction to input.", \
+		}, \
+		{ \
+			.long_name		= "output", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->output, \
+			.description		= "Set direction to output.", \
+		}, \
+		{ \
+			.long_name		= "rising-edge", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->rising_edge, \
+			.description		= "Monitor rising edges." \
+		}, \
+		{ \
+			.long_name		= "falling-edge", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->falling_edge, \
+			.description		= "Monitor falling edges." \
+		}, \
+		{ \
+			.long_name		= "both-edges", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->both_edges, \
+			.description		= "Monitor rising and falling edges." \
+		}, \
+		{ \
+			.long_name		= "push-pull", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->push_pull, \
+			.description		= "Drive the line in push-pull mode.", \
+		}, \
+		{ \
+			.long_name		= "open-drain", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->open_drain, \
+			.description		= "Drive the line in open-drain mode.", \
+		}, \
+		{ \
+			.long_name		= "open-source", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->open_source, \
+			.description		= "Drive the line in open-source mode.", \
+		}, \
+		{ \
+			.long_name		= "pull-up", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->pull_up, \
+			.description		= "Enable internal pull-up bias.", \
+		}, \
+		{ \
+			.long_name		= "pull-down", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->pull_down, \
+			.description		= "Enable internal pull-down bias.", \
+		}, \
+		{ \
+			.long_name		= "bias-disabled", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->bias_disabled, \
+			.description		= "Disable internal pull-up/down bias.", \
+		}, \
+		{ \
+			.long_name		= "active-low", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->active_low, \
+			.description		= "Treat the lines as active low.", \
+		}, \
+		{ \
+			.long_name		= "debounce-period", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_INT64, \
+			.arg_data		= &(opts)->debounce_period, \
+			.arg_description	= "<period in miliseconds>", \
+			.description		= "Enable debouncing and set the period", \
+		}, \
+		{ \
+			.long_name		= "clock-monotonic", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->clock_monotonic, \
+			.description		= "Use monotonic clock for edge event timestamps", \
+		}, \
+		{ \
+			.long_name		= "clock-realtime", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->clock_realtime, \
+			.description		= "Use realtime clock for edge event timestamps", \
+		}, \
+		{ \
+			.long_name		= "clock-hte", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->clock_hte, \
+			.description		= "Use HTE clock (if available) for edge event timestamps", \
+		}
+
+void validate_line_config_opts(LineConfigOpts *opts);
+GVariant *make_line_config(GArray *offsets, LineConfigOpts *cfg_opts);
+
+#endif /* __GPIOCLI_COMMON_H__ */
diff --git a/dbus/client/detect.c b/dbus/client/detect.c
new file mode 100644
index 0000000..a98c3d3
--- /dev/null
+++ b/dbus/client/detect.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+static void show_chip(gpointer elem, gpointer user_data G_GNUC_UNUSED)
+{
+	GpiodbusObject *chip_obj = elem;
+	GpiodbusChip *chip;
+
+	chip = gpiodbus_object_peek_chip(chip_obj);
+
+	g_print("%s [%s] (%u lines)\n",
+		gpiodbus_chip_get_name(chip),
+		gpiodbus_chip_get_label(chip),
+		gpiodbus_chip_get_num_lines(chip));
+}
+
+int gpiocli_detect_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"List GPIO chips, print their labels and number of GPIO lines.";
+
+	static const gchar *const description =
+"Chips may be identified by name or number. e.g. '0' and 'gpiochip0' refer to\n"
+"the same chip.\n"
+"\n"
+"If no chips are specified - display information for all chips in the system.";
+
+	g_autolist(GpiodbusObject) chip_objs = NULL;
+	g_auto(GStrv) chip_names = NULL;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &chip_names,
+			.arg_description	= "[chip]...",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+	check_manager();
+
+	chip_objs = get_chip_objs(chip_names);
+	g_list_foreach(chip_objs, show_chip, NULL);
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/find.c b/dbus/client/find.c
new file mode 100644
index 0000000..9fe4c1a
--- /dev/null
+++ b/dbus/client/find.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+static void find_line_in_chip(gpointer elem, gpointer user_data)
+{
+	g_autoptr(GpiodbusObject) line_obj = NULL;
+	GpiodbusObject *chip_obj = elem;
+	const gchar *name = user_data;
+	GpiodbusChip *chip;
+	GpiodbusLine *line;
+
+	line_obj = get_line_obj_by_name_for_chip(chip_obj, name);
+	if (!line_obj)
+		return;
+
+	chip = gpiodbus_object_peek_chip(chip_obj);
+	line = gpiodbus_object_peek_line(line_obj);
+
+	g_print("%s %u\n",
+		gpiodbus_chip_get_name(chip),
+		gpiodbus_line_get_offset(line));
+
+	exit(EXIT_SUCCESS);
+}
+
+int gpiocli_find_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Gicen a line name, find the name of the parent chip and offset of the line within that chip.";
+
+	static const gchar *const description =
+"As line names are not guaranteed to be unique, this command finds the first line with given name.";
+
+	g_autolist(GpiodbusObject) objs = NULL;
+	g_auto(GStrv) line_name = NULL;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &line_name,
+			.arg_description	= "<line name>",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+	check_manager();
+
+	if (!line_name)
+		die_parsing_opts("line name must be specified");
+	if (g_strv_length(line_name) != 1)
+		die_parsing_opts("only one line can be mapped");
+
+	objs = get_chip_objs(NULL);
+	g_list_foreach(objs, find_line_in_chip, line_name[0]);
+
+	/* If we got here, the line was not found. */
+	die("line '%s' not found", line_name[0]);
+	return EXIT_FAILURE;
+}
diff --git a/dbus/client/get.c b/dbus/client/get.c
new file mode 100644
index 0000000..4ca6f3c
--- /dev/null
+++ b/dbus/client/get.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+int gpiocli_get_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Get values of one or more GPIO lines.";
+
+	static const gchar *const description =
+"If -r/--request is specified then all the lines must belong to the same\n"
+"request (and - by extension - the same chip).\n"
+"\n"
+"If no lines are specified but -r/--request was passed then all lines within\n"
+"the request will be used.";
+
+	const gchar *request_name = NULL, *chip_path, *req_path;
+	gboolean ret, unquoted = FALSE, numeric = FALSE;
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+	g_autoptr(GpiodbusObject) req_obj = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	g_auto(GStrv) lines = NULL;
+	GpiodbusRequest *request;
+	GVariantBuilder builder;
+	GpiodbusLine *line;
+	gsize num_lines, i;
+	GVariantIter iter;
+	guint offset;
+	gint value;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "request",
+			.short_name		= 'r',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &request_name,
+			.description		= "restrict scope to a particular request",
+			.arg_description	= "<request>",
+		},
+		{
+			.long_name		= "unquoted",
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_NONE,
+			.arg_data		= &unquoted,
+			.description		= "don't quote line names",
+		},
+		{
+			.long_name		= "numeric",
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_NONE,
+			.arg_data		= &numeric,
+			.description		= "display line values as '0' (inactive) or '1' (active)",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &lines,
+			.arg_description	= "[line0] [line1]...",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+	check_manager();
+
+	if (!lines && !request_name)
+		die_parsing_opts("either at least one line or the request must be specified");
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	num_lines = lines ? g_strv_length(lines) : 0;
+
+	if (!request_name) {
+		/*
+		 * TODO Limit the number of D-Bus calls by gathering the requests
+		 * and their relevant lines into a container of some kind first.
+		 */
+
+		values = g_array_sized_new(FALSE, TRUE, sizeof(gint),
+					   num_lines);
+
+		for (i = 0; i < num_lines; i++) {
+			g_autoptr(GpiodbusRequest) req_proxy = NULL;
+			g_autoptr(GpiodbusObject) line_obj = NULL;
+			g_autoptr(GVariant) arg_offsets = NULL;
+			g_autoptr(GVariant) arg_values = NULL;
+
+			ret = get_line_obj_by_name(lines[i], &line_obj, NULL);
+			if (!ret)
+				die("Line not found: %s\n", lines[i]);
+
+			line = gpiodbus_object_peek_line(line_obj);
+			req_path = gpiodbus_line_get_request_path(line);
+
+			if (!gpiodbus_line_get_managed(line))
+				die("Line '%s' not managed by gpio-manager, must be requested first",
+				    lines[i]);
+
+			req_proxy = gpiodbus_request_proxy_new_for_bus_sync(
+							G_BUS_TYPE_SYSTEM,
+							G_DBUS_PROXY_FLAGS_NONE,
+							"io.gpiod1", req_path,
+							NULL, &err);
+			if (err)
+				die_gerror(err,
+					   "Failed to get D-Bus proxy for '%s'",
+					   req_path);
+
+			offset = gpiodbus_line_get_offset(line);
+			g_array_append_val(offsets, offset);
+
+			g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+			g_variant_builder_add(&builder, "u", offset);
+			arg_offsets = g_variant_ref_sink(
+					g_variant_builder_end(&builder));
+
+			ret = gpiodbus_request_call_get_values_sync(
+							req_proxy, arg_offsets,
+							G_DBUS_CALL_FLAGS_NONE,
+							-1, &arg_values, NULL,
+							&err);
+			if (!ret)
+				die_gerror(err, "Failed to get line values");
+
+			g_variant_iter_init(&iter, arg_values);
+			while (g_variant_iter_next(&iter, "i", &value))
+				g_array_append_val(values, value);
+		}
+	} else {
+		g_autoptr(GVariant) arg_offsets = NULL;
+		g_autoptr(GVariant) arg_values = NULL;
+
+		req_obj = get_request_obj(request_name);
+		request = gpiodbus_object_peek_request(req_obj);
+		chip_path = gpiodbus_request_get_chip_path(request);
+		chip_obj = get_chip_obj_by_path(chip_path);
+
+		if (lines) {
+			for (i = 0; i < num_lines; i++) {
+				g_autoptr(GpiodbusObject) line_obj = NULL;
+
+				line_obj = get_line_obj_by_name_for_chip(
+							chip_obj, lines[i]);
+				if (!line_obj)
+					die("Line not found: %s\n", lines[i]);
+
+				line = gpiodbus_object_peek_line(line_obj);
+
+				if (!gpiodbus_line_get_managed(line))
+					die("Line '%s' not managed by gpio-manager, must be requested first",
+					    lines[i]);
+
+				offset = gpiodbus_line_get_offset(line);
+				g_array_append_val(offsets, offset);
+			}
+		} else {
+			offsets = get_request_offsets(request);
+			num_lines = offsets->len;
+		}
+
+		g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+		for (i = 0; i < offsets->len; i++)
+			g_variant_builder_add(&builder, "u",
+					      g_array_index(offsets, guint, i));
+		arg_offsets = g_variant_ref_sink(
+					g_variant_builder_end(&builder));
+
+		ret = gpiodbus_request_call_get_values_sync(
+							request, arg_offsets,
+							G_DBUS_CALL_FLAGS_NONE,
+							-1, &arg_values, NULL,
+							&err);
+		if (!ret)
+			die_gerror(err, "Failed to get line values");
+
+		values = g_array_sized_new(FALSE, TRUE, sizeof(gint),
+					   g_variant_n_children(arg_values));
+
+		g_variant_iter_init(&iter, arg_values);
+		while (g_variant_iter_next(&iter, "i", &value))
+			g_array_append_val(values, value);
+	}
+
+	for (i = 0; i < num_lines; i++) {
+		if (!unquoted)
+			g_print("\"");
+
+		if (lines)
+			g_print("%s", lines[i]);
+		else
+			g_print("%u", g_array_index(offsets, guint, i));
+
+		if (!unquoted)
+			g_print("\"");
+
+		g_print("=%s", g_array_index(values, guint, i) ?
+					numeric ? "1" : "active" :
+					numeric ? "0" : "inactive");
+
+		if (i != (num_lines - 1))
+			g_print(" ");
+	}
+	g_print("\n");
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/gpiocli-test.bash b/dbus/client/gpiocli-test.bash
new file mode 100755
index 0000000..f210183
--- /dev/null
+++ b/dbus/client/gpiocli-test.bash
@@ -0,0 +1,1443 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#
+# Test cases for gpiocli utility. This test-suite assumes that gpio-manager
+# is already running.
+#
+
+SOURCE_DIR="$(dirname "${BASH_SOURCE[0]}")"
+
+wait_for_sim() {
+	COUNTER=100
+
+	while true
+	do
+		gdbus call --system --dest io.gpiod1 \
+			--object-path /io/gpiod1/chips/"$1" \
+			--method org.freedesktop.DBus.Peer.Ping > /dev/null 2>&1 && break
+		sleep 0.01
+		COUNTER=$($COUNTER - 1)
+		if [ "$COUNTER" -eq 0 ]
+		then
+			fail "error waiting for the GPIO sim chip to be exported on the bus"
+			return 1
+		fi
+	done
+}
+
+# Create a simulated GPIO chip and wait until it's exported by the gpio-manager.
+gpiosim_chip_dbus() {
+	gpiosim_chip "$@"
+	wait_for_sim "${GPIOSIM_CHIP_NAME[$1]}"
+}
+
+gpiodbus_release_request() {
+	run_prog gpiocli release "$1"
+	status_is 0
+}
+
+gpiodbus_check_request() {
+	run_prog gpiocli requests
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$1"
+}
+
+#
+# gpiocli wait test cases
+#
+
+test_wait_for_manager() {
+	run_prog gpiocli wait
+	status_is 0
+	num_lines_is 0
+}
+
+test_wait_for_chip() {
+	dut_run gpiocli wait --chip=foobar
+	sleep 0.01
+
+	gpiosim_chip_dbus sim0 label=foobar
+	dut_flush
+	dut_read
+
+	status_is 0
+	num_lines_is 0
+}
+
+test_wait_timeout() {
+	run_prog gpiocli wait --chip=foobar --timeout=100ms
+	status_is 1
+	num_lines_is 1
+	output_regex_match ".*: wait timed out!"
+}
+
+#
+# gpiocli detect test cases
+#
+
+test_detect_all_chips() {
+	gpiosim_chip_dbus sim0 num_lines=4
+	gpiosim_chip_dbus sim1 num_lines=8
+	gpiosim_chip_dbus sim2 num_lines=16
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+	local sim2=${GPIOSIM_CHIP_NAME[sim2]}
+	local sim0dev=${GPIOSIM_DEV_NAME[sim0]}
+	local sim1dev=${GPIOSIM_DEV_NAME[sim1]}
+	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
+
+	run_prog gpiocli detect
+
+	status_is 0
+	output_regex_match "$sim0 \[${sim0dev}[-:]node0\] \(4 lines\)"
+	output_regex_match "$sim1 \[${sim1dev}[-:]node0\] \(8 lines\)"
+	output_regex_match "$sim2 \[${sim2dev}[-:]node0\] \(16 lines\)"
+
+	# ignoring symlinks
+	local initial_output=$output
+	gpiosim_chip_symlink sim1 /dev
+
+	run_prog gpiocli detect
+
+	status_is 0
+	output_is "$initial_output"
+}
+
+test_detect_one_chip() {
+	gpiosim_chip_dbus sim0 num_lines=4
+	gpiosim_chip_dbus sim1 num_lines=8
+	gpiosim_chip_dbus sim2 num_lines=16
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim2=${GPIOSIM_CHIP_NAME[sim2]}
+	local sim0dev=${GPIOSIM_DEV_NAME[sim0]}
+	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
+
+	# by name
+	run_prog gpiocli detect "$sim0"
+
+	status_is 0
+	output_regex_match "$sim0 \[${sim0dev}[-:]node0\] \(4 lines\)"
+	num_lines_is 1
+
+	# by number
+	run_prog gpiocli detect "$(gpiosim_chip_number sim2)"
+
+	status_is 0
+	output_regex_match "$sim2 \[${sim2dev}[-:]node0\] \(16 lines\)"
+	num_lines_is 1
+}
+
+test_detect_multiple_chips() {
+	gpiosim_chip_dbus sim0 num_lines=4
+	gpiosim_chip_dbus sim1 num_lines=8
+	gpiosim_chip_dbus sim2 num_lines=16
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+	local sim2=${GPIOSIM_CHIP_NAME[sim2]}
+	local sim0dev=${GPIOSIM_DEV_NAME[sim0]}
+	local sim1dev=${GPIOSIM_DEV_NAME[sim1]}
+	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
+
+	run_prog gpiocli detect "$sim0" "$sim1" "$sim2"
+
+	status_is 0
+	output_regex_match "$sim0 \[${sim0dev}[-:]node0\] \(4 lines\)"
+	output_regex_match "$sim1 \[${sim1dev}[-:]node0\] \(8 lines\)"
+	output_regex_match "$sim2 \[${sim2dev}[-:]node0\] \(16 lines\)"
+	num_lines_is 3
+}
+
+test_detect_with_nonexistent_chip() {
+	run_prog gpiocli detect nonexistent_chip
+
+	status_is 1
+	output_regex_match ".*: No such chip: 'nonexistent_chip'"
+}
+
+#
+# gpiocli info test cases
+#
+
+test_info_all_chips() {
+	gpiosim_chip_dbus sim0 num_lines=4
+	gpiosim_chip_dbus sim1 num_lines=8
+
+	run_prog gpiocli info
+
+	status_is 0
+	output_contains_line "${GPIOSIM_CHIP_NAME[sim0]} - 4 lines:"
+	output_contains_line "${GPIOSIM_CHIP_NAME[sim1]} - 8 lines:"
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+\[input\]"
+	output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+\[input\]"
+}
+
+test_info_one_chip() {
+	gpiosim_chip_dbus sim0 num_lines=4
+	gpiosim_chip_dbus sim1 num_lines=8
+	gpiosim_chip_dbus sim2 num_lines=12
+
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	# by name
+	run_prog gpiocli info -c "$sim1"
+
+	status_is 0
+	output_contains_line "$sim1 - 8 lines:"
+	output_regex_match "\\s+line\\s+2:\\s+unnamed\\s+\[input\]"
+	num_lines_is 9
+
+	# by number
+	run_prog gpiocli info -c "$(gpiosim_chip_number sim1)"
+
+	status_is 0
+	output_contains_line "$sim1 - 8 lines:"
+	output_regex_match "\\s+line\\s+2:\\s+unnamed\\s+\[input\]"
+	num_lines_is 9
+}
+
+test_info_one_line_by_name() {
+	gpiosim_chip_dbus sim0 num_lines=8 line_name=3:foo line_name=5:bar
+	gpiosim_chip_dbus sim1 num_lines=8 line_name=2:baz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli info bar
+
+	status_is 0
+	output_regex_match "$sim0\\s+5:\\s+\"bar\"\\s+\[input\]"
+	num_lines_is 1
+}
+
+test_info_one_line_by_chip_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=8
+	gpiosim_chip_dbus sim1 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli info -c "$sim0" 3
+
+	status_is 0
+	output_regex_match "$sim0\\s+3:\\s+unnamed\\s+\[input\]"
+	num_lines_is 1
+}
+
+test_info_two_lines_by_chip_offset_and_name() {
+	gpiosim_chip_dbus sim0 num_lines=8 line_name=3:foo line_name=5:bar
+	gpiosim_chip_dbus sim1 num_lines=8 line_name=2:baz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli info -c "$sim0" 3 bar
+
+	status_is 0
+	output_regex_match "$sim0\\s+3:\\s+\"foo\"\\s+\[input\]"
+	output_regex_match "$sim0\\s+5:\\s+\"bar\"\\s+\[input\]"
+	num_lines_is 2
+}
+
+test_info_two_lines() {
+	gpiosim_chip_dbus sim0 num_lines=8 line_name=3:foo line_name=5:bar
+	gpiosim_chip_dbus sim1 num_lines=8 line_name=2:baz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	run_prog gpiocli info bar baz
+
+	status_is 0
+	output_regex_match "$sim0\\s+5:\\s+\"bar\"\\s+\[input\]"
+	output_regex_match "$sim1\\s+2:\\s+\"baz\"\\s+\[input\]"
+	num_lines_is 2
+}
+
+test_info_repeating_lines() {
+	gpiosim_chip_dbus sim0 num_lines=8 line_name=3:foo line_name=5:bar
+	gpiosim_chip_dbus sim1 num_lines=8 line_name=2:baz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	run_prog gpiocli info baz bar baz
+
+	status_is 0
+	output_regex_match "$sim1\\s+2:\\s+\"baz\"\\s+\[input\]"
+	output_regex_match "$sim0\\s+5:\\s+\"bar\"\\s+\[input\]"
+	output_regex_match "$sim1\\s+2:\\s+\"baz\"\\s+\[input\]"
+	num_lines_is 3
+}
+
+#
+# gpiocli find test cases
+#
+
+test_map_existing_line() {
+	gpiosim_chip_dbus sim0 num_lines=4 line_name=3:baz
+	gpiosim_chip_dbus sim1 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli find bar
+
+	status_is 0
+	num_lines_is 1
+	output_is "${GPIOSIM_CHIP_NAME[sim1]} 5"
+}
+
+test_map_nonexistent_line() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli find foobar
+
+	status_is 1
+	num_lines_is 1
+	output_regex_match ".*: line 'foobar' not found"
+}
+
+#
+# gpiocli request test cases
+#
+
+test_request_invalid_arguments() {
+	gpiosim_chip_dbus sim0 num_lines=8 line_name=3:foo
+
+	run_prog gpiocli request --input --output foo
+	status_is 1
+	output_regex_match ".*: --input and --output are mutually exclusive"
+
+	run_prog gpiocli request --output --both-edges foo
+	status_is 1
+	output_regex_match ".*: monitoring edges is only possible in input mode"
+
+	run_prog gpiocli request --output --open-source --open-drain foo
+	status_is 1
+	output_regex_match ".*: --push-pull, --open-drain and --open-source are mutually exclusive"
+
+	run_prog gpiocli request --input --open-source foo
+	status_is 1
+	output_regex_match ".*: --push-pull, --open-drain and --open-source are only available in output mode"
+
+	run_prog gpiocli request --input --bias-disabled --pull-down foo
+	status_is 1
+	output_regex_match ".*: --pull-up, --pull-down and --bias-disabled are mutually exclusive"
+
+	run_prog gpiocli request --input --debounce-period=3000 foo
+	status_is 1
+	output_regex_match ".*: --debounce-period can only be used with edge-detection enabled"
+
+	run_prog gpiocli request --input --clock-monotonic foo
+	status_is 1
+	output_regex_match ".*: --clock-monotonic, --clock-realtime and --clock-hte can only be used with edge detection enabled"
+
+	run_prog gpiocli request --input --clock-monotonic --clock-realtime foo
+	status_is 1
+	output_regex_match ".*: --clock-monotonic, --clock-realtime and --clock-hte are mutually exclusive"
+}
+
+test_request_one_line_by_name() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input bar
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiodbus_check_request "$request\\s+\(${GPIOSIM_CHIP_NAME[sim0]}\)\\s+Offsets:\\s+\[5\]"
+	gpiodbus_release_request "$request"
+}
+
+test_request_one_line_by_chip_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --chip="$sim0" 4
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiodbus_check_request "$request\\s+\(${GPIOSIM_CHIP_NAME[sim0]}\)\\s+Offsets:\\s+\[4\]"
+	gpiodbus_release_request "$request"
+}
+
+test_request_from_different_chips() {
+	gpiosim_chip_dbus sim0 num_lines=8 line_name=1:foo line_name=5:bar
+	gpiosim_chip_dbus sim1 num_lines=4 line_name=1:xyz
+
+	run_prog gpiocli request --input foo xyz
+	status_is 1
+	output_regex_match ".*: all requested lines must belong to the same chip"
+}
+
+test_multiple_requests() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --chip="$sim0" 0
+	status_is 0
+	num_lines_is 1
+	local request0=$output
+
+	run_prog gpiocli request --output --chip="$sim0" 1 2
+	status_is 0
+	num_lines_is 1
+	local request1=$output
+
+	run_prog gpiocli request --chip="$sim0" 5
+	status_is 0
+	num_lines_is 1
+	local request2=$output
+
+	run_prog gpiocli requests
+	status_is 0
+	num_lines_is 3
+	output_contains_line "$request0 ($sim0) Offsets: [0]"
+	output_contains_line "$request1 ($sim0) Offsets: [1, 2]"
+	output_contains_line "$request2 ($sim0) Offsets: [5]"
+
+	gpiodbus_release_request "$request"0
+	gpiodbus_release_request "$request"1
+	gpiodbus_release_request "$request"2
+}
+
+test_request_multiple_lines_by_names() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo xyz bar
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiodbus_check_request "$request\\s+\(${GPIOSIM_CHIP_NAME[sim0]}\)\\s+Offsets:\\s+\[1, 11, 5\]"
+	gpiodbus_release_request "$request"
+}
+
+test_request_multiple_lines_by_chip_number_by_name_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input -c "$(gpiosim_chip_number sim0)" xyz 0 foo 15
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiodbus_check_request "$request\\s+\(${GPIOSIM_CHIP_NAME[sim0]}\)\\s+Offsets:\\s+\[11, 0, 1, 15\]"
+	gpiodbus_release_request "$request"
+}
+
+test_request_with_consumer_name() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --consumer='foobar' foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"foobar\",managed=\"request0\",input\]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_with_consumer_name_with_whitespaces() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --consumer='foo bar' foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"foo bar\",managed=\"request0\",input\]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_active_low() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --active-low foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",active-low,input\]"
+
+	run_prog gpiocli get foo
+	status_is 0
+	num_lines_is 1
+	output_is "\"foo\"=active"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_pull_up() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --pull-up foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",bias=pull-up,input\]"
+
+	run_prog gpiocli get foo
+	status_is 0
+	num_lines_is 1
+	output_is "\"foo\"=active"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_pull_down() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --pull-down foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",bias=pull-down,input\]"
+
+	run_prog gpiocli get foo
+	status_is 0
+	num_lines_is 1
+	output_is "\"foo\"=inactive"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_pull_bias_disabled() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --bias-disabled foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",bias=disabled,input\]"
+
+	run_prog gpiocli get foo
+	status_is 0
+	num_lines_is 1
+	output_is "\"foo\"=inactive"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_drive_push_pull() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --output --push-pull foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",output,push-pull\]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_drive_open_drain() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --output --open-drain foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",output,open-drain\]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_drive_open_source() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --output --open-source foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",output,open-source\]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_edge_falling() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --falling-edge foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",edges=falling,event-clock=monotonic,input\]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_edge_rising() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --rising-edge foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",edges=rising,event-clock=monotonic,input\]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_edge_both() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --both-edges foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",edges=both,event-clock=monotonic,input\]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_edge_falling_and_rising() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --falling-edge --rising-edge foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",edges=both,event-clock=monotonic,input\]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_edge_with_debounce_period() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --falling-edge --rising-edge --debounce-period=4000 foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",edges=both,event-clock=monotonic,debounce-period=4000,input\]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_edge_with_realtime_clock() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --falling-edge --rising-edge --clock-realtime foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",edges=both,event-clock=realtime,input\]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_with_output_values() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz line_name=9:abc
+
+	run_prog gpiocli request --output foo=active bar=inactive xyz=1
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli get -r "$request"
+	status_is 0
+	num_lines_is 1
+	output_regex_match "\"1\"=active \"5\"=inactive \"11\"=active"
+
+	gpiodbus_release_request "$request"
+}
+
+test_request_output_values_input_mode() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo=active bar=inactive xyz=1
+	status_is 1
+	num_lines_is 3
+	output_regex_match ".*: Output values can only be set in output mode"
+}
+
+test_request_output_values_invalid_format() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo=active bar=foobar xyz=1
+	status_is 1
+	num_lines_is 3
+	output_regex_match ".*: invalid output value: 'foobar'"
+}
+
+#
+# gpiocli reconfigure test cases
+#
+
+test_reconfigure_from_output_to_input() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo=active bar=inactive xyz=1
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",output,push-pull\]"
+
+	run_prog gpiocli reconfigure --input "$request"
+	status_is 0
+	num_lines_is 1
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",input\]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_reconfigure_from_input_to_output_with_values() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",input\]"
+
+	run_prog gpiocli reconfigure --output "$request" 1 0 active
+	status_is 0
+	num_lines_is 1
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",output,push-pull\]"
+
+	run_prog gpiocli get foo bar xyz
+	status_is 0
+	num_lines_is 1
+	output_is "\"foo\"=active \"bar\"=inactive \"xyz\"=active"
+
+	gpiodbus_release_request "$request"
+}
+
+test_reconfigure_fails_with_wrong_number_of_output_values() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",input\]"
+
+	run_prog gpiocli reconfigure --output "$request" 1 0
+	status_is 1
+	num_lines_is 3
+	output_regex_match ".*: The number of output values must correspond to the number of lines in the request"
+
+	run_prog gpiocli reconfigure --output "$request" 1 0 1 0
+	status_is 1
+	num_lines_is 3
+
+	gpiodbus_release_request "$request"
+}
+
+#
+# gpiocli release test cases
+#
+
+test_release_nonexistent_request() {
+	run_prog gpiocli release request0
+	status_is 1
+	output_regex_match ".*: No such request: 'request0'"
+}
+
+#
+# gpiocli get test cases
+#
+
+test_get_value_for_unmanaged_line() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli get foo
+	status_is 1
+	num_lines_is 1
+	output_regex_match ".*: Line 'foo' not managed by gpio-manager, must be requested first"
+}
+
+test_get_one_value_by_name() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	run_prog gpiocli get foo
+	status_is 0
+	num_lines_is 1
+	output_is "\"foo\"=active"
+
+	gpiodbus_release_request "$request"
+}
+
+test_get_multiple_values_by_names() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo xyz bar
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 11 pull-down
+
+	run_prog gpiocli get xyz bar foo
+	status_is 0
+	num_lines_is 1
+	output_is "\"xyz\"=inactive \"bar\"=active \"foo\"=active"
+
+	gpiodbus_release_request "$request"
+}
+
+test_get_one_value_by_request_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input xyz foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	run_prog gpiocli get --request="$request" 1
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=active"
+
+	gpiodbus_release_request "$request"
+}
+
+test_get_multiple_values_by_request_and_offsets() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 5 pull-down
+	gpiosim_set_pull sim0 11 pull-up
+
+	run_prog gpiocli get --request="$request" 11 1 5
+	status_is 0
+	num_lines_is 1
+	output_is "\"11\"=active \"1\"=active \"5\"=inactive"
+
+	gpiodbus_release_request "$request"
+}
+
+test_get_multiple_values_by_request_names_and_offsets() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 5 pull-down
+	gpiosim_set_pull sim0 11 pull-up
+
+	run_prog gpiocli get --request="$request" xyz 1 5
+	status_is 0
+	num_lines_is 1
+	output_is "\"xyz\"=active \"1\"=active \"5\"=inactive"
+
+	gpiodbus_release_request "$request"
+}
+
+test_get_all_values_for_request() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 5 pull-down
+	gpiosim_set_pull sim0 11 pull-up
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=active \"5\"=inactive \"11\"=active"
+
+	gpiodbus_release_request "$request"
+}
+
+test_get_unquoted_output() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 5 pull-down
+	gpiosim_set_pull sim0 11 pull-up
+
+	run_prog gpiocli get --unquoted --request="$request" xyz 1 5
+	status_is 0
+	num_lines_is 1
+	output_is "xyz=active 1=active 5=inactive"
+
+	gpiodbus_release_request "$request"
+}
+
+test_get_numeric_output() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 5 pull-down
+	gpiosim_set_pull sim0 11 pull-up
+
+	run_prog gpiocli get --numeric --request="$request" xyz 1 5
+	status_is 0
+	num_lines_is 1
+	output_is "\"xyz\"=1 \"1\"=1 \"5\"=0"
+
+	gpiodbus_release_request "$request"
+}
+
+#
+# gpiocli set test cases
+#
+
+test_set_value_for_unmanaged_line() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli set foo=active
+	status_is 1
+	num_lines_is 1
+	output_regex_match ".*: Line 'foo' not managed by gpio-manager, must be requested first"
+}
+
+test_set_one_value_with_invalid_arguments() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli set bar=wrong
+	status_is 1
+	num_lines_is 3
+	output_regex_match ".*: invalid output value: 'wrong'"
+
+	run_prog gpiocli set bar=
+	status_is 1
+	num_lines_is 3
+	output_regex_match ".*: invalid output value: ''"
+
+	run_prog gpiocli set bar
+	status_is 1
+	num_lines_is 3
+	output_regex_match ".*: line must have a single value assigned"
+
+	gpiodbus_release_request "$request"
+}
+
+test_set_one_value_by_name() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set bar=active
+	status_is 0
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=active \"11\"=inactive"
+
+	gpiodbus_release_request "$request"
+}
+
+test_set_multiple_values_by_names() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set bar=active foo=active xyz=0
+	status_is 0
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=active \"5\"=active \"11\"=inactive"
+
+	gpiodbus_release_request "$request"
+}
+
+test_set_one_value_by_request_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set -r "$request" 5=1
+	status_is 0
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=active \"11\"=inactive"
+
+	gpiodbus_release_request "$request"
+}
+
+test_set_multiple_values_by_request_and_offsets() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set --request="$request" 11=active 5=1 1=0
+	status_is 0
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=active \"11\"=active"
+
+	gpiodbus_release_request "$request"
+}
+
+test_set_multiple_values_by_request_names_and_offsets() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set --request="$request" xyz=active 5=1 foo=0
+	status_is 0
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=active \"11\"=active"
+
+	gpiodbus_release_request "$request"
+}
+
+#
+# gpiocli notify test cases
+#
+
+test_notify_print_initial_info_by_name() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --both-edges --clock-realtime --debounce-period=5000 foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli notify foo
+	dut_read
+
+	output_is "$sim0 - 1 (\"foo\"): [input,used,consumer=\"gpio-manager\",both-edges,realtime-clockdebounced,debounce-period=5000,managed,request=\"request0\"]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_notify_print_initial_info_by_chip_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --output --open-drain --active-low foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli notify --chip="$sim0" 5
+	dut_read
+
+	output_is "$sim0 - 5 (\"bar\"): [output,used,consumer=\"gpio-manager\",open-drain,active-low,managed,request=\"request0\"]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_notify_print_initial_info_by_chip_name_and_offset_for_multiple_lines() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --output --open-drain --active-low foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli notify --chip="$sim0" 5 foo 11
+
+	dut_read
+	output_regex_match ".*$sim0 - 5 \(\"bar\"\): \[output,used,consumer=\"gpio-manager\",open-drain,active-low,managed,request=\"request0\"\].*"
+	output_regex_match ".*$sim0 - 1 \(\"foo\"\): \[output,used,consumer=\"gpio-manager\",open-drain,active-low,managed,request=\"request0\"\].*"
+	output_regex_match ".*$sim0 - 11 \(\"xyz\"\): \[output,used,consumer=\"gpio-manager\",open-drain,active-low,managed,request=\"request0\"\].*"
+
+	gpiodbus_release_request "$request"
+}
+
+test_notify_request_event() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiocli notify foo bar
+	dut_flush
+
+	run_prog gpiocli request --output --open-drain --active-low foo bar
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_read
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[active-low=>True\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[drive=>open-drain\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[direction=>output\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[consumer=>\"gpio-manager\"\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[used=>True\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[request=>request0\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[managed=>True\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[request=>request0\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[managed=>True\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[active-low=>True\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[drive=>open-drain\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[direction=>output\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[consumer=>\"gpio-manager\"\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[used=>True\]"
+
+	gpiodbus_release_request "$request"
+}
+
+test_notify_release_event() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiocli notify foo bar
+
+	run_prog gpiocli request --output --open-drain --active-low foo bar
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_flush
+
+	gpiodbus_release_request "$request"
+
+	dut_read
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[active-low=>False\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[drive=>push-pull\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[consumer=>\"unused\"\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[used=>False\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[request=>N/A\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[managed=>False\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[request=>N/A\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[managed=>False\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[active-low=>False\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[drive=>push-pull\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[consumer=>\"unused\"\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[used=>False\]"
+}
+
+test_notify_reconfigure_event() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiocli notify foo bar
+
+	run_prog gpiocli request --output --open-drain --active-low foo bar
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_flush
+
+	run_prog gpiocli reconfigure --input --pull-up --rising-edge "$request"
+	status_is 0
+
+	dut_read
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[active-low=>False\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[drive=>push-pull\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[bias=>pull-up\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[edge=>rising\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[direction=>input\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[active-low=>False\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[drive=>push-pull\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[bias=>pull-up\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[edge=>rising\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[direction=>input\]"
+
+	gpiodbus_release_request "$request"
+}
+
+#
+# gpiocli monitor test cases
+#
+
+test_monitor_unmanaged_line() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli monitor foo
+
+	output_regex_match ".*: Line must be managed by gpio-manager in order to be monitored"
+}
+
+test_monitor_one_line_by_name() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --both-edges foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli monitor foo
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	dut_read
+	output_regex_match "[0-9]+ rising\\s+\"foo\""
+
+	gpiodbus_release_request "$request"
+}
+
+test_monitor_multiple_lines_by_name() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --both-edges foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli monitor foo xyz
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 5 pull-up # This should be ignored
+	gpiosim_set_pull sim0 11 pull-up
+	gpiosim_set_pull sim0 1 pull-down
+
+	dut_read
+	output_regex_match "[0-9]+ rising\\s+\"foo\""
+	output_regex_match "[0-9]+ rising\\s+\"xyz\""
+	output_regex_match "[0-9]+ falling\\s+\"foo\""
+
+	gpiodbus_release_request "$request"
+}
+
+test_monitor_one_line_by_request_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --both-edges foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli monitor --request="$request" 1
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	dut_read
+	output_regex_match "[0-9]+ rising\\s+\"foo\""
+
+	gpiodbus_release_request "$request"
+}
+
+test_monitor_all_lines_on_request() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --both-edges --chip="$sim0" foo bar xyz 4
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli monitor -r "$request"
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 1 pull-down
+
+	dut_read
+	output_regex_match "[0-9]+ rising\\s+\"foo\""
+	output_regex_match "[0-9]+ rising\\s+4"
+	output_regex_match "[0-9]+ falling\\s+\"foo\""
+
+	gpiodbus_release_request "$request"
+}
+
+# shellcheck source=tests/scripts/gpiod-bash-test-helper.inc
+source gpiod-bash-test-helper.inc
+
+check_prog gdbus
+
+# shellcheck source=/dev/null
+source shunit2
diff --git a/dbus/client/gpiocli.c b/dbus/client/gpiocli.c
new file mode 100644
index 0000000..fbd1bbe
--- /dev/null
+++ b/dbus/client/gpiocli.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <glib/gstdio.h>
+
+#include "common.h"
+
+typedef struct {
+	gchar *name;
+	int (*main_func)(int argc, char **argv);
+	gchar *descr;
+} GPIOCliCmd;
+
+int gpiocli_detect_main(int argc, char **argv);
+int gpiocli_find_main(int argc, char **argv);
+int gpiocli_info_main(int argc, char **argv);
+int gpiocli_get_main(int argc, char **argv);
+int gpiocli_monitor_main(int argc, char **argv);
+int gpiocli_notify_main(int argc, char **argv);
+int gpiocli_reconfigure_main(int argc, char **argv);
+int gpiocli_release_main(int argc, char **argv);
+int gpiocli_request_main(int argc, char **argv);
+int gpiocli_requests_main(int argc, char **argv);
+int gpiocli_set_main(int argc, char **argv);
+int gpiocli_wait_main(int argc, char **argv);
+
+static const GPIOCliCmd cli_cmds[] = {
+	{
+		.name = "detect",
+		.main_func = gpiocli_detect_main,
+		.descr = "list GPIO chips and print their properties",
+	},
+	{
+		.name = "find",
+		.main_func = gpiocli_find_main,
+		.descr = "take a line name and find its parent chip's name and offset within it",
+	},
+	{
+		.name = "info",
+		.main_func = gpiocli_info_main,
+		.descr = "print information about GPIO lines",
+	},
+	{
+		.name = "get",
+		.main_func = gpiocli_get_main,
+		.descr = "get values of GPIO lines",
+	},
+	{
+		.name = "monitor",
+		.main_func = gpiocli_monitor_main,
+		.descr = "notify the user about edge events",
+	},
+	{
+		.name = "notify",
+		.main_func = gpiocli_notify_main,
+		.descr = "notify the user about line property changes",
+	},
+	{
+		.name = "reconfigure",
+		.main_func = gpiocli_reconfigure_main,
+		.descr = "change the line configuration for an existing request",
+	},
+	{
+		.name = "release",
+		.main_func = gpiocli_release_main,
+		.descr = "release one of the line requests controlled by the manager",
+	},
+	{
+		.name = "request",
+		.main_func = gpiocli_request_main,
+		.descr = "request a set of GPIO lines for exclusive usage by the manager",
+	},
+	{
+		.name = "requests",
+		.main_func = gpiocli_requests_main,
+		.descr = "list all line requests controlled by the manager",
+	},
+	{
+		.name = "set",
+		.main_func = gpiocli_set_main,
+		.descr = "set values of GPIO lines",
+	},
+	{
+		.name = "wait",
+		.main_func = gpiocli_wait_main,
+		.descr = "wait for the gpio-manager interface to appear",
+	},
+	{ }
+};
+
+static GHashTable *make_cmd_table(void)
+{
+	GHashTable *cmd_table = g_hash_table_new_full(g_str_hash, g_str_equal,
+						      NULL, NULL);
+	const GPIOCliCmd *cmd;
+
+	for (cmd = &cli_cmds[0]; cmd->name; cmd++)
+		g_hash_table_insert(cmd_table, cmd->name, cmd->main_func);
+
+	return cmd_table;
+}
+
+static gchar *make_description(void)
+{
+	g_autoptr(GString) descr = g_string_new("Available commands:\n");
+	const GPIOCliCmd *cmd;
+
+	for (cmd = &cli_cmds[0]; cmd->name; cmd++)
+		g_string_append_printf(descr, "  %s - %s\n",
+				       cmd->name, cmd->descr);
+
+	g_string_truncate(descr, descr->len - 1);
+	return g_strdup(descr->str);
+}
+
+static void show_version_and_exit(void)
+{
+	g_print("gpiocli v%s\n", GPIOD_VERSION_STR);
+
+	exit(EXIT_SUCCESS);
+}
+
+int main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Simple command-line client for controlling gpio-manager.";
+
+	g_autoptr(GHashTable) cmd_table = make_cmd_table();
+	g_autofree gchar *description = make_description();
+	g_autofree gchar *basename = NULL;
+	g_autofree gchar *cmd_name = NULL;
+	gint (*cmd_func)(gint, gchar **);
+	g_auto(GStrv) cmd_args = NULL;
+	gboolean show_version = FALSE;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "version",
+			.short_name		= 'v',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_NONE,
+			.arg_data		= &show_version,
+			.description		= "Show version and exit.",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &cmd_args,
+			.arg_description	= "CMD [ARGS?] ...",
+		},
+		{ }
+	};
+
+	basename = g_path_get_basename(argv[0]);
+	g_set_prgname(basename);
+
+	parse_options(opts, summary, description, &argc, &argv);
+
+	if (show_version)
+		show_version_and_exit();
+
+	if (!cmd_args)
+		die_parsing_opts("Command must be specified.");
+
+	cmd_func = g_hash_table_lookup(cmd_table, cmd_args[0]);
+	if (!cmd_func)
+		die_parsing_opts("Unknown command: %s.", cmd_args[0]);
+
+	cmd_name = g_strdup_printf("%s %s", basename, cmd_args[0]);
+	g_set_prgname(cmd_name);
+
+	return cmd_func(g_strv_length(cmd_args), cmd_args);
+}
diff --git a/dbus/client/info.c b/dbus/client/info.c
new file mode 100644
index 0000000..fa08a3f
--- /dev/null
+++ b/dbus/client/info.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+#include <string.h>
+
+#include "common.h"
+
+static gchar *make_line_name(const gchar *name)
+{
+	if (!name)
+		return g_strdup("unnamed");
+
+	return g_strdup_printf("\"%s\"", name);
+}
+
+static void do_print_line_info(GpiodbusObject *line_obj,
+			       GpiodbusObject *chip_obj)
+{
+	g_autoptr(LineProperties) props = NULL;
+	g_autoptr(GString) attributes = NULL;
+	g_autofree gchar *line_name = NULL;
+	GpiodbusChip *chip;
+
+	props = get_line_properties(gpiodbus_object_peek_line(line_obj));
+	line_name = make_line_name(props->name);
+
+	attributes = g_string_new("[");
+
+	if (props->used)
+		g_string_append_printf(attributes, "used,consumer=\"%s\",",
+				       props->consumer);
+
+	if (props->managed)
+		g_string_append_printf(attributes, "managed=\"%s\",",
+				       props->request_name);
+
+	if (props->edge) {
+		g_string_append_printf(attributes, "edges=%s,event-clock=%s,",
+				       props->edge, props->event_clock);
+		if (props->debounced)
+			g_string_append_printf(attributes,
+					       "debounce-period=%lu,",
+					       props->debounce_period);
+	}
+
+	if (props->bias)
+		g_string_append_printf(attributes, "bias=%s,", props->bias);
+
+	if (props->active_low)
+		attributes = g_string_append(attributes, "active-low,");
+
+	g_string_append_printf(attributes, "%s", props->direction);
+
+	if (g_strcmp0(props->direction, "output") == 0)
+		g_string_append_printf(attributes, ",%s", props->drive);
+
+	attributes = g_string_append(attributes, "]");
+
+	if (chip_obj) {
+		chip = gpiodbus_object_peek_chip(chip_obj);
+		g_print("%s ", gpiodbus_chip_get_name(chip));
+	} else {
+		g_print("\tline ");
+	}
+
+	g_print("%3u:\t%s\t\t%s\n", props->offset, line_name, attributes->str);
+}
+
+static void print_line_info(gpointer elem, gpointer user_data G_GNUC_UNUSED)
+{
+	GpiodbusObject *line_obj = elem;
+
+	do_print_line_info(line_obj, NULL);
+}
+
+static void do_show_chip(GpiodbusObject *chip_obj)
+{
+	GpiodbusChip *chip = gpiodbus_object_peek_chip(chip_obj);
+	g_autolist(GpiodbusObject) line_objs = NULL;
+
+	g_print("%s - %u lines:\n",
+		gpiodbus_chip_get_name(chip),
+		gpiodbus_chip_get_num_lines(chip));
+
+	line_objs = get_all_line_objs_for_chip(chip_obj);
+	g_list_foreach(line_objs, print_line_info, NULL);
+}
+
+static void show_chip(gpointer elem, gpointer user_data G_GNUC_UNUSED)
+{
+	GpiodbusObject *chip_obj = elem;
+
+	do_show_chip(chip_obj);
+}
+
+static void show_line_with_chip(gpointer elem, gpointer user_data)
+{
+	g_autoptr(GpiodbusObject) line_obj = NULL;
+	GpiodbusObject *chip_obj = user_data;
+	g_autofree gchar *chip_name = NULL;
+	GString *line_name = elem;
+
+	line_obj = get_line_obj_by_name_for_chip(chip_obj, line_name->str);
+	if (!line_obj) {
+		chip_name = g_path_get_basename(
+			g_dbus_object_get_object_path(G_DBUS_OBJECT(chip_obj)));
+		die("no line '%s' on chip '%s'", line_name->str, chip_name);
+	}
+
+	do_print_line_info(line_obj, chip_obj);
+}
+
+static void show_line(gpointer elem, gpointer user_data G_GNUC_UNUSED)
+{
+	g_autoptr(GpiodbusObject) line_obj = NULL;
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+	GString *line_name = elem;
+	gboolean ret;
+
+	ret = get_line_obj_by_name(line_name->str, &line_obj, &chip_obj);
+	if (!ret)
+		die("line '%s' not found", line_name->str);
+
+	do_print_line_info(line_obj, chip_obj);
+}
+
+int gpiocli_info_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Print information about GPIO lines.";
+
+	static const gchar *const description =
+"Lines are specified by name, or optionally by offset if the chip option\n"
+"is provided.\n";
+
+	g_autolist(GpiodbusObject) chip_objs = NULL;
+	g_autolist(GString) line_name_list = NULL;
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+	g_auto(GStrv) line_names = NULL;
+	const gchar *chip_name = NULL;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "chip",
+			.short_name		= 'c',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &chip_name,
+			.description		= "restrict scope to a particular chip",
+			.arg_description	= "<chip>",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &line_names,
+			.arg_description	= "[line1] [line2] ...",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+	check_manager();
+
+	if (chip_name)
+		chip_obj = get_chip_obj(chip_name);
+
+	if (line_names) {
+		line_name_list = strv_to_gstring_list(line_names);
+		if (chip_obj)
+			g_list_foreach(line_name_list, show_line_with_chip,
+				       chip_obj);
+		else
+			g_list_foreach(line_name_list, show_line, NULL);
+	} else if (chip_obj) {
+		do_show_chip(chip_obj);
+	} else {
+		chip_objs = get_chip_objs(NULL);
+		g_list_foreach(chip_objs, show_chip, NULL);
+	}
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/monitor.c b/dbus/client/monitor.c
new file mode 100644
index 0000000..292b2bf
--- /dev/null
+++ b/dbus/client/monitor.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <glib-unix.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "common.h"
+
+typedef struct {
+	GList *lines;
+} MonitorData;
+
+static void on_edge_event(GpiodbusLine *line, GVariant *args,
+			  gpointer user_data G_GNUC_UNUSED)
+{
+	const char *name = gpiodbus_line_get_name(line);
+	gulong global_seqno, line_seqno;
+	guint64 timestamp;
+	gint edge;
+
+	g_variant_get(args, "(ittt)", &edge, &timestamp,
+		      &global_seqno, &line_seqno);
+
+	g_print("%lu %s ", timestamp, edge ? "rising " : "falling");
+	if (strlen(name))
+		g_print("\"%s\"\n", name);
+	else
+		g_print("%u\n", gpiodbus_line_get_offset(line));
+}
+
+static void connect_edge_event(gpointer elem, gpointer user_data)
+{
+	GpiodbusObject *line_obj = elem;
+	MonitorData *data = user_data;
+	g_autoptr(GError) err = NULL;
+	const gchar *line_obj_path;
+	GpiodbusLine *line;
+
+	line_obj_path = g_dbus_object_get_object_path(G_DBUS_OBJECT(line_obj));
+
+	line = gpiodbus_line_proxy_new_for_bus_sync(G_BUS_TYPE_SYSTEM,
+						    G_DBUS_PROXY_FLAGS_NONE,
+						    "io.gpiod1", line_obj_path,
+						    NULL, &err);
+	if (err)
+		die_gerror(err, "Failed to get D-Bus proxy for '%s'",
+			   line_obj_path);
+
+	if (!gpiodbus_line_get_managed(line))
+		die("Line must be managed by gpio-manager in order to be monitored");
+
+	if (g_strcmp0(gpiodbus_line_get_edge_detection(line), "none") == 0)
+		die("Edge detection must be enabled for monitored lines");
+
+	data->lines = g_list_append(data->lines, line);
+
+	g_signal_connect(line, "edge-event", G_CALLBACK(on_edge_event), NULL);
+}
+
+int gpiocli_monitor_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Get values of one or more GPIO lines.";
+
+	static const gchar *const description =
+"If -r/--request is specified then all the lines must belong to the same\n"
+"request (and - by extension - the same chip).\n"
+"\n"
+"If no lines are specified but -r/--request was passed then all lines within\n"
+"the request will be used.";
+
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	const gchar *request_name = NULL, *chip_path;
+	g_autolist(GpiodbusObject) line_objs = NULL;
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+	g_autoptr(GpiodbusObject) req_obj = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_auto(GStrv) lines = NULL;
+	GpiodbusRequest *request;
+	MonitorData data = { };
+	gsize num_lines, i;
+	guint watch_id;
+	gboolean ret;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "request",
+			.short_name		= 'r',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &request_name,
+			.description		= "restrict scope to a particular request",
+			.arg_description	= "<request>",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &lines,
+			.arg_description	= "[line0] [line1]...",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+
+	watch_id = g_bus_watch_name(G_BUS_TYPE_SYSTEM, "io.gpiod1",
+				    G_BUS_NAME_WATCHER_FLAGS_NONE,
+				    NULL, die_on_name_vanished, NULL, NULL);
+	check_manager();
+
+	if (!lines && !request_name)
+		die_parsing_opts("either at least one line or the request must be specified");
+
+	if (request_name) {
+		req_obj = get_request_obj(request_name);
+		request = gpiodbus_object_peek_request(req_obj);
+		chip_path = gpiodbus_request_get_chip_path(request);
+		chip_obj = get_chip_obj_by_path(chip_path);
+		offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+
+		if (lines) {
+			num_lines = g_strv_length(lines);
+
+			for (i = 0; i < num_lines; i++) {
+				g_autoptr(GpiodbusObject) line_obj = NULL;
+
+				line_obj = get_line_obj_by_name_for_chip(
+							chip_obj, lines[i]);
+				if (!line_obj)
+					die("Line not found: %s\n", lines[i]);
+
+				line_objs = g_list_append(line_objs,
+							g_object_ref(line_obj));
+			}
+		} else {
+			offsets = get_request_offsets(request);
+			manager = get_object_manager_client(chip_path);
+
+			for (i = 0; i < offsets->len; i++) {
+				g_autoptr(GpiodbusObject) line_obj = NULL;
+				g_autofree char *obj_path = NULL;
+
+				obj_path = g_strdup_printf("%s/line%u",
+							   chip_path,
+							   g_array_index(
+								offsets,
+								guint, i));
+
+				line_obj = GPIODBUS_OBJECT(
+					g_dbus_object_manager_get_object(
+								manager,
+								obj_path));
+				if (!line_obj)
+					die("Line not found: %u\n",
+					    g_array_index(offsets, guint, i));
+
+				line_objs = g_list_append(line_objs,
+							g_object_ref(line_obj));
+			}
+		}
+	} else {
+		num_lines = g_strv_length(lines);
+
+		for (i = 0; i < num_lines; i++) {
+			g_autoptr(GpiodbusObject) line_obj = NULL;
+
+			ret = get_line_obj_by_name(lines[i], &line_obj, NULL);
+			if (!ret)
+				die("Line not found: %s\n", lines[i]);
+
+			line_objs = g_list_append(line_objs,
+						  g_object_ref(line_obj));
+		}
+	}
+
+	g_list_foreach(line_objs, connect_edge_event, &data);
+
+	loop = g_main_loop_new(NULL, FALSE);
+	g_unix_signal_add(SIGTERM, quit_main_loop_on_signal, loop);
+	g_unix_signal_add(SIGINT, quit_main_loop_on_signal, loop);
+
+	g_main_loop_run(loop);
+
+	g_bus_unwatch_name(watch_id);
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/notify.c b/dbus/client/notify.c
new file mode 100644
index 0000000..f5a8e5d
--- /dev/null
+++ b/dbus/client/notify.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <glib-unix.h>
+#include <stdlib.h>
+
+#include "common.h"
+
+/*
+ * Used to keep line proxies and chip interfaces alive for the duration of the
+ * program, which is required for signals to work.
+ */
+typedef struct {
+	GList *lines;
+	GList *chips;
+	GpiodbusObject *scoped_chip;
+} NotifyData;
+
+static void clear_notify_data(NotifyData *data)
+{
+	g_list_free_full(data->lines, g_object_unref);
+	g_list_free_full(data->chips, g_object_unref);
+
+	if (data->scoped_chip)
+		g_clear_object(&data->scoped_chip);
+}
+
+G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(NotifyData, clear_notify_data);
+
+static const gchar *bool_to_str(gboolean val)
+{
+	return val ? "True" : "False";
+}
+
+static const gchar *bool_variant_to_str(GVariant *val)
+{
+	return bool_to_str(g_variant_get_boolean(val));
+}
+
+static void
+on_properties_changed(GpiodbusLine *line, GVariant *changed_properties,
+		      GStrv invalidated_properties G_GNUC_UNUSED,
+		      gpointer user_data)
+{
+	GpiodbusChip *chip = user_data;
+	g_autofree gchar *name = NULL;
+	const gchar *consumer, *tmp;
+	GVariantIter iter;
+	GVariant *v;
+	gsize len;
+	gchar *k;
+
+	if (g_variant_n_children(changed_properties) == 0)
+		return;
+
+	tmp = gpiodbus_line_get_name(line);
+	name = tmp ? g_strdup_printf("\"%s\"", tmp) : g_strdup("unnamed");
+
+	g_variant_iter_init(&iter, changed_properties);
+	while (g_variant_iter_next(&iter, "{sv}", &k, &v)) {
+		g_autoptr(GString) change = g_string_new(NULL);
+		g_autofree gchar *req_name = NULL;
+		g_autoptr(GVariant) val = v;
+		g_autofree gchar *key = k;
+
+		if (g_strcmp0(key, "Consumer") == 0) {
+			consumer = g_variant_get_string(val, &len);
+			g_string_printf(change, "consumer=>\"%s\"",
+					len ? consumer : "unused");
+		} else if (g_strcmp0(key, "Used") == 0) {
+			g_string_printf(change, "used=>%s",
+					       bool_variant_to_str(val));
+		} else if (g_strcmp0(key, "Debounced") == 0) {
+			g_string_printf(change, "debounced=>%s",
+					       bool_variant_to_str(val));
+		} else if (g_strcmp0(key, "ActiveLow") == 0) {
+			g_string_printf(change, "active-low=>%s",
+					       bool_variant_to_str(val));
+		} else if (g_strcmp0(key, "Direction") == 0) {
+			g_string_printf(change, "direction=>%s",
+					       g_variant_get_string(val, NULL));
+		} else if (g_strcmp0(key, "Drive") == 0) {
+			g_string_printf(change, "drive=>%s",
+					       g_variant_get_string(val, NULL));
+		} else if (g_strcmp0(key, "Bias") == 0) {
+			g_string_printf(change, "bias=>%s",
+					       g_variant_get_string(val, NULL));
+		} else if (g_strcmp0(key, "EdgeDetection") == 0) {
+			g_string_printf(change, "edge=>%s",
+					       g_variant_get_string(val, NULL));
+		} else if (g_strcmp0(key, "EventClock") == 0) {
+			g_string_printf(change, "event-clock=>%s",
+					       g_variant_get_string(val, NULL));
+		} else if (g_strcmp0(key, "DebouncePeriodUs") == 0) {
+			g_string_printf(change, "debounce-period=>%ld",
+					       g_variant_get_uint64(val));
+		} else if (g_strcmp0(key, "Managed") == 0) {
+			g_string_printf(change, "managed=>%s",
+					       bool_variant_to_str(val));
+		} else if (g_strcmp0(key, "RequestPath") == 0) {
+			req_name = sanitize_object_path(
+					g_variant_get_string(val, NULL));
+			g_string_printf(change, "request=>%s",
+					       req_name);
+		} else {
+			die("unexpected property update received from manager: '%s'",
+			    key);
+		}
+
+		g_print("%s - %u (%s): [%s]\n", gpiodbus_chip_get_name(chip),
+			gpiodbus_line_get_offset(line), name ?: "unnamed",
+			change->str);
+	}
+}
+
+static void print_line_info(GpiodbusLine *line, GpiodbusChip *chip)
+{
+	g_autoptr(LineProperties) props = get_line_properties(line);
+	g_autoptr(GString) attrs = g_string_new(props->direction);
+	g_autofree gchar *name = NULL;
+
+	if (props->used)
+		g_string_append(attrs, ",used");
+
+	if (props->consumer)
+		g_string_append_printf(attrs, ",consumer=\"%s\"",
+				       props->consumer);
+
+	if (props->drive && g_strcmp0(props->direction, "output") == 0)
+		g_string_append_printf(attrs, ",%s", props->drive);
+
+	if (props->bias) {
+		if (g_strcmp0(props->bias, "disabled") == 0)
+			g_string_append(attrs, ",bias-disabled");
+		else
+			g_string_append_printf(attrs, ",%s", props->bias);
+	}
+
+	if (props->active_low)
+		g_string_append(attrs, ",active-low");
+
+	if (props->edge) {
+		if (g_strcmp0(props->edge, "both") == 0)
+			g_string_append(attrs, ",both-edges");
+		else
+			g_string_append_printf(attrs, ",%s-edge", props->edge);
+
+		g_string_append_printf(attrs, ",%s-clock", props->event_clock);
+
+		if (props->debounced)
+			g_string_append_printf(attrs,
+					       "debounced,debounce-period=%lu",
+					       props->debounce_period);
+	}
+
+	if (props->managed)
+		g_string_append_printf(attrs, ",managed,request=\"%s\"",
+				       props->request_name);
+
+	name = props->name ? g_strdup_printf("\"%s\"", props->name) :
+			     g_strdup("unnamed");
+
+	g_print("%s - %u (%s): [%s]\n", gpiodbus_chip_get_name(chip),
+		props->offset, name ?: "unnamed", attrs->str);
+}
+
+static void connect_line(gpointer elem, gpointer user_data)
+{
+	g_autoptr(GpiodbusObject) line_obj = NULL;
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+	g_autoptr(GpiodbusLine) line = NULL;
+	g_autoptr(GpiodbusChip) chip = NULL;
+	g_autofree gchar *chip_name = NULL;
+	g_autoptr(GError) err = NULL;
+	NotifyData *data = user_data;
+	const gchar *line_obj_path;
+	GString *line_name = elem;
+	gboolean ret;
+
+	if (data->scoped_chip) {
+		chip_obj = g_object_ref(data->scoped_chip);
+		line_obj = get_line_obj_by_name_for_chip(chip_obj,
+							 line_name->str);
+		if (!line_obj) {
+			chip_name = g_path_get_basename(
+				g_dbus_object_get_object_path(
+					G_DBUS_OBJECT(chip_obj)));
+			die("no line '%s' on chip '%s'",
+			    line_name->str, chip_name);
+		}
+	} else {
+		ret = get_line_obj_by_name(line_name->str,
+					   &line_obj, &chip_obj);
+		if (!ret)
+			die("line '%s' not found", line_name->str);
+	}
+
+	line_obj_path = g_dbus_object_get_object_path(G_DBUS_OBJECT(line_obj));
+
+	line = gpiodbus_line_proxy_new_for_bus_sync(G_BUS_TYPE_SYSTEM,
+						    G_DBUS_PROXY_FLAGS_NONE,
+						    "io.gpiod1", line_obj_path,
+						    NULL, &err);
+	if (err)
+		die_gerror(err, "Failed to get D-Bus proxy for '%s'",
+			   line_obj_path);
+
+	data->lines = g_list_append(data->lines, g_object_ref(line));
+
+	if (data->scoped_chip) {
+		if (g_list_length(data->chips) == 0) {
+			chip = gpiodbus_object_get_chip(chip_obj);
+			data->chips = g_list_append(data->chips,
+						    g_object_ref(chip));
+		} else {
+			chip = g_list_first(data->chips)->data;
+		}
+	} else {
+		chip = gpiodbus_object_get_chip(chip_obj);
+		data->chips = g_list_append(data->chips, g_object_ref(chip));
+	}
+
+	print_line_info(line, chip);
+
+	g_signal_connect(line, "g-properties-changed",
+			 G_CALLBACK(on_properties_changed), chip);
+}
+
+int gpiocli_notify_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Monitor a set of lines for property changes.";
+
+	static const gchar *const description =
+"Lines are specified by name, or optionally by offset if the chip option\n"
+"is provided.\n";
+
+	g_autolist(GString) line_name_list = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_auto(GStrv) line_names = NULL;
+	const gchar *chip_name = NULL;
+	/*
+	 * FIXME: data internals must be freed but there's some issue with
+	 * unrefing the GpiodbusObject here. For now it's leaking memory.
+	 */
+	NotifyData data = { };
+	guint watch_id;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "chip",
+			.short_name		= 'c',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &chip_name,
+			.description		= "restrict scope to a particular chip",
+			.arg_description	= "<chip>",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &line_names,
+			.arg_description	= "<line1> [line2] ...",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+
+	watch_id = g_bus_watch_name(G_BUS_TYPE_SYSTEM, "io.gpiod1",
+				    G_BUS_NAME_WATCHER_FLAGS_NONE,
+				    NULL, die_on_name_vanished, NULL, NULL);
+	check_manager();
+
+	if (!line_names)
+		die_parsing_opts("at least one line must be specified");
+
+	if (chip_name)
+		data.scoped_chip = get_chip_obj(chip_name);
+
+	line_name_list = strv_to_gstring_list(line_names);
+	g_list_foreach(line_name_list, connect_line, &data);
+
+	loop = g_main_loop_new(NULL, FALSE);
+	g_unix_signal_add(SIGTERM, quit_main_loop_on_signal, loop);
+	g_unix_signal_add(SIGINT, quit_main_loop_on_signal, loop);
+
+	g_main_loop_run(loop);
+
+	g_bus_unwatch_name(watch_id);
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/reconfigure.c b/dbus/client/reconfigure.c
new file mode 100644
index 0000000..cb22f58
--- /dev/null
+++ b/dbus/client/reconfigure.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+int gpiocli_reconfigure_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Change the line configuration for an existing request.";
+
+	g_autoptr(GpiodbusObject) req_obj = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	g_autoptr(GArray) output_values = NULL;
+	LineConfigOpts line_cfg_opts = { };
+	g_autoptr(GArray) offsets = NULL;
+	g_auto(GStrv) remaining = NULL;
+	g_autoptr(GError) err = NULL;
+	GpiodbusRequest *request;
+	gsize num_values;
+	gboolean ret;
+	gint val;
+	guint i;
+
+	const GOptionEntry opts[] = {
+		LINE_CONFIG_OPTIONS(&line_cfg_opts),
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &remaining,
+			.arg_description	= "<request> [value1] [value2]...",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, NULL, &argc, &argv);
+	validate_line_config_opts(&line_cfg_opts);
+
+	if (!remaining || g_strv_length(remaining) == 0)
+		die_parsing_opts("Exactly one request to reconfigure must be specified.");
+
+	num_values = g_strv_length(remaining) - 1;
+
+	check_manager();
+
+	req_obj = get_request_obj(remaining[0]);
+	request = gpiodbus_object_peek_request(req_obj);
+	offsets = get_request_offsets(request);
+
+	if (num_values) {
+		if (num_values != offsets->len)
+			die_parsing_opts("The number of output values must correspond to the number of lines in the request");
+
+		output_values = g_array_sized_new(FALSE, TRUE, sizeof(gint),
+						  num_values);
+
+		for (i = 0; i < num_values; i++) {
+			val = output_value_from_str(remaining[i + 1]);
+			g_array_append_val(output_values, val);
+		}
+	}
+
+	line_cfg_opts.output_values = output_values;
+	line_config = make_line_config(offsets, &line_cfg_opts);
+
+	ret = gpiodbus_request_call_reconfigure_lines_sync(
+						request, line_config,
+						G_DBUS_CALL_FLAGS_NONE,
+						-1, NULL, &err);
+	if (!ret)
+		die_gerror(err, "Failed to reconfigure lines");
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/release.c b/dbus/client/release.c
new file mode 100644
index 0000000..84e364f
--- /dev/null
+++ b/dbus/client/release.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+int gpiocli_release_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Release one of the line requests controlled by the manager.";
+
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GpiodbusObject) obj = NULL;
+	g_autofree gchar *obj_path = NULL;
+	g_auto(GStrv) remaining = NULL;
+	g_autoptr(GError) err = NULL;
+	const gchar *request_name;
+	GpiodbusRequest *request;
+	gboolean ret;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &remaining,
+			.arg_description	= "<request>",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, NULL, &argc, &argv);
+
+	if (!remaining || g_strv_length(remaining) != 1)
+		die_parsing_opts("Exactly one request to release must be specified.");
+
+	check_manager();
+
+	request_name = remaining[0];
+
+	obj_path = make_request_obj_path(request_name);
+	manager = get_object_manager_client("/io/gpiod1/requests");
+	obj = GPIODBUS_OBJECT(g_dbus_object_manager_get_object(manager,
+							       obj_path));
+	if (!obj)
+		goto no_request;
+
+	request = gpiodbus_object_peek_request(obj);
+	if (!request)
+		goto no_request;
+
+	ret = gpiodbus_request_call_release_sync(request,
+						 G_DBUS_CALL_FLAGS_NONE,
+						 -1, NULL, &err);
+	if (!ret)
+		die_gerror(err, "Failed to release request '%s': %s",
+			   request_name, err->message);
+
+	return EXIT_SUCCESS;
+
+no_request:
+	die("No such request: '%s'", request_name);
+}
diff --git a/dbus/client/request.c b/dbus/client/request.c
new file mode 100644
index 0000000..f12d903
--- /dev/null
+++ b/dbus/client/request.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+typedef struct {
+	LineConfigOpts line_cfg_opts;
+	const gchar *consumer;
+} RequestOpts;
+
+typedef struct {
+	const gchar *request_path;
+	gboolean done;
+} RequestWaitData;
+
+static GVariant *make_request_config(RequestOpts *opts)
+{
+	GVariantBuilder builder;
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "consumer",
+				      g_variant_new_string(opts->consumer)));
+
+	return g_variant_ref_sink(g_variant_builder_end(&builder));
+}
+
+static gboolean on_timeout(gpointer user_data G_GNUC_UNUSED)
+{
+	die("wait for request to appear timed out!");
+}
+
+static void obj_match_request_path(GpiodbusObject *obj, RequestWaitData *data)
+{
+	if (g_strcmp0(g_dbus_object_get_object_path(G_DBUS_OBJECT(obj)),
+		      data->request_path) == 0)
+		data->done = TRUE;
+}
+
+static void match_request_path(gpointer elem, gpointer user_data)
+{
+	RequestWaitData *data = user_data;
+	GpiodbusObject *obj = elem;
+
+	obj_match_request_path(obj, data);
+}
+
+static void on_object_added(GDBusObjectManager *manager G_GNUC_UNUSED,
+			    GpiodbusObject *obj, gpointer user_data)
+{
+	RequestWaitData *data = user_data;
+
+	obj_match_request_path(GPIODBUS_OBJECT(obj), data);
+}
+
+static void wait_for_request(const gchar *request_path)
+{
+	RequestWaitData data = { .request_path = request_path };
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autolist(GpiodbusObject) objs = NULL;
+
+	manager = get_object_manager_client("/io/gpiod1/requests");
+
+	g_signal_connect(manager, "object-added",
+			 G_CALLBACK(on_object_added), &data);
+
+	objs = g_dbus_object_manager_get_objects(manager);
+	g_list_foreach(objs, match_request_path, &data);
+
+	g_timeout_add(5000, on_timeout, NULL);
+
+	while (!data.done)
+		g_main_context_iteration(NULL, TRUE);
+}
+
+static int
+request_lines(GList *line_names, const gchar *chip_name, RequestOpts *req_opts)
+{
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+	g_autoptr(GVariant) request_config = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	g_autofree gchar *request_path = NULL;
+	g_autofree gchar *request_name = NULL;
+	g_autofree gchar *dyn_name = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	GpiodbusLine *line;
+	GpiodbusChip *chip;
+	GString *line_name;
+	guint i, *offset;
+	gboolean ret;
+	GList *pos;
+	gsize llen;
+
+	llen = g_list_length(line_names);
+	offsets = g_array_sized_new(FALSE, TRUE, sizeof(guint), llen);
+	g_array_set_size(offsets, llen);
+
+	if (chip_name)
+		chip_obj = get_chip_obj(chip_name);
+
+	for (i = 0, pos = g_list_first(line_names);
+	     i < llen;
+	     i++, pos = g_list_next(pos)) {
+		g_autoptr(GpiodbusObject) line_obj = NULL;
+
+		line_name = pos->data;
+
+		if (chip_obj) {
+			line_obj = get_line_obj_by_name_for_chip(chip_obj,
+								line_name->str);
+			if (!line_obj) {
+				if (dyn_name) {
+					ret = get_line_obj_by_name(
+							line_name->str,
+							&line_obj, NULL);
+					if (ret)
+						/*
+						 * This means the line exists
+						 * but on a different chip.
+						 */
+						die("all requested lines must belong to the same chip");
+				}
+
+				die("no line '%s' on chip '%s'",
+				    line_name->str, chip_name);
+			}
+		} else {
+			ret = get_line_obj_by_name(line_name->str, &line_obj,
+						   &chip_obj);
+			if (!ret)
+				die("line '%s' not found", line_name->str);
+
+			dyn_name = g_path_get_basename(
+					g_dbus_object_get_object_path(
+						G_DBUS_OBJECT(chip_obj)));
+			chip_name = dyn_name;
+		}
+
+		line = gpiodbus_object_peek_line(line_obj);
+		offset = &g_array_index(offsets, guint, i);
+		*offset = gpiodbus_line_get_offset(line);
+	}
+
+	chip = gpiodbus_object_peek_chip(chip_obj);
+	line_config = make_line_config(offsets, &req_opts->line_cfg_opts);
+	request_config = make_request_config(req_opts);
+
+	ret = gpiodbus_chip_call_request_lines_sync(chip, line_config,
+						    request_config,
+						    G_DBUS_CALL_FLAGS_NONE, -1,
+						    &request_path, NULL, &err);
+	if (err)
+		die_gerror(err, "failed to request lines from chip '%s'",
+			   chip_name);
+
+	wait_for_request(request_path);
+
+	request_name = g_path_get_basename(request_path);
+	g_print("%s\n", request_name);
+
+	return EXIT_SUCCESS;
+}
+
+int gpiocli_request_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Request a set of GPIO lines for exclusive usage by the gpio-manager.";
+
+	g_autoptr(GArray) output_values = NULL;
+	g_autolist(GString) line_names = NULL;
+	const gchar *chip_name = NULL;
+	g_auto(GStrv) lines = NULL;
+	RequestOpts req_opts = {};
+	gsize llen;
+	gint val;
+	guint i;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "chip",
+			.short_name		= 'c',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &chip_name,
+			.description		=
+"Explicitly specify the chip_name on which to resolve the lines which allows to use raw offsets instead of line names.",
+			.arg_description	= "<chip name>",
+		},
+		{
+			.long_name		= "consumer",
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &req_opts.consumer,
+			.description		= "Consumer string (defaults to program name)",
+			.arg_description	= "<consumer name>",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &lines,
+			.arg_description	= "<line1>[=value1] [line2[=value2]] ...",
+		},
+		LINE_CONFIG_OPTIONS(&req_opts.line_cfg_opts),
+		{ }
+	};
+
+	parse_options(opts, summary, NULL, &argc, &argv);
+	validate_line_config_opts(&req_opts.line_cfg_opts);
+
+	if (!lines)
+		die_parsing_opts("At least one line must be specified");
+
+	if (!req_opts.consumer)
+		req_opts.consumer = "gpio-manager";
+
+	for (i = 0, llen = g_strv_length(lines); i < llen; i++) {
+		g_auto(GStrv) tokens = NULL;
+
+		tokens = g_strsplit(lines[i], "=", 2);
+		line_names = g_list_append(line_names, g_string_new(tokens[0]));
+		if (g_strv_length(tokens) == 2) {
+			if (!req_opts.line_cfg_opts.output)
+				die_parsing_opts("Output values can only be set in output mode");
+
+			if (!output_values)
+				output_values = g_array_sized_new(FALSE, TRUE,
+								  sizeof(gint),
+								  llen);
+			val = output_value_from_str(tokens[1]);
+			g_array_append_val(output_values, val);
+		}
+	}
+
+	if (output_values && req_opts.line_cfg_opts.input)
+		die_parsing_opts("cannot set output values in input mode");
+
+	if (output_values &&
+	    (g_list_length(line_names) != output_values->len))
+		die_parsing_opts("if values are set, they must be set for all lines");
+
+	req_opts.line_cfg_opts.output_values = output_values;
+
+	check_manager();
+
+	return request_lines(line_names, chip_name, &req_opts);
+}
diff --git a/dbus/client/requests.c b/dbus/client/requests.c
new file mode 100644
index 0000000..be25823
--- /dev/null
+++ b/dbus/client/requests.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+static void show_request(gpointer elem, gpointer user_data G_GNUC_UNUSED)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autofree gchar *request_name = NULL;
+	g_autofree gchar *offsets_str = NULL;
+	g_autoptr(GVariant) voffsets = NULL;
+	g_autofree gchar *chip_name = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	GpiodbusObject *obj = elem;
+	GpiodbusRequest *request;
+	GVariantBuilder builder;
+	const gchar *chip_path;
+	gsize i;
+
+	request_name = g_path_get_basename(
+			g_dbus_object_get_object_path(G_DBUS_OBJECT(obj)));
+	request = gpiodbus_object_peek_request(obj);
+	chip_path = gpiodbus_request_get_chip_path(request);
+	manager = get_object_manager_client(chip_path);
+	/* FIXME: Use chip proxy? */
+	chip_name = g_path_get_basename(chip_path);
+
+	offsets = get_request_offsets(request);
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	for (i = 0; i < offsets->len; i++)
+		g_variant_builder_add(&builder, "u",
+				      g_array_index(offsets, guint, i));
+	voffsets = g_variant_ref_sink(g_variant_builder_end(&builder));
+	offsets_str = g_variant_print(voffsets, FALSE);
+
+	g_print("%s (%s) Offsets: %s\n",
+		request_name, chip_name, offsets_str);
+}
+
+int gpiocli_requests_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"List all line requests controlled by the manager.";
+
+	g_autolist(GpiodbusObject) request_objs = NULL;
+	g_auto(GStrv) remaining = NULL;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &remaining,
+			.arg_description	= NULL,
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, NULL, &argc, &argv);
+	check_manager();
+
+	if (remaining)
+		die_parsing_opts("command doesn't take additional arguments");
+
+	request_objs = get_request_objs();
+	g_list_foreach(request_objs, show_request, NULL);
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/set.c b/dbus/client/set.c
new file mode 100644
index 0000000..6460dd5
--- /dev/null
+++ b/dbus/client/set.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+static void free_str(gpointer data)
+{
+	GString *str = data;
+
+	g_string_free(str, TRUE);
+}
+
+int gpiocli_set_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Set values of one or more GPIO lines.";
+
+	static const gchar *const description =
+"If -r/--request is specified then all the lines must belong to the same\n"
+"request (and - by extension - the same chip).";
+
+	const gchar *request_name = NULL, *chip_path, *req_path;
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+	g_autoptr(GpiodbusObject) req_obj = NULL;
+	g_autoptr(GPtrArray) line_names = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	g_auto(GStrv) lines = NULL;
+	GpiodbusRequest *request;
+	GVariantBuilder builder;
+	GpiodbusLine *line;
+	gsize num_lines, i;
+	GString *line_name;
+	gboolean ret;
+	guint offset;
+	gint val;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "request",
+			.short_name		= 'r',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &request_name,
+			.description		= "restrict scope to a particular request",
+			.arg_description	= "<request>",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &lines,
+			.arg_description	= "<line1=value1> [line2=value2] ...",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+
+	if (!lines)
+		die_parsing_opts("at least one line value must be specified");
+
+	num_lines = g_strv_length(lines);
+	line_names = g_ptr_array_new_full(num_lines, free_str);
+	values = g_array_sized_new(FALSE, TRUE, sizeof(gint), num_lines);
+
+	for (i = 0; i < num_lines; i++) {
+		g_auto(GStrv) tokens = NULL;
+
+		tokens = g_strsplit(lines[i], "=", 2);
+		if (g_strv_length(tokens) != 2)
+			die_parsing_opts("line must have a single value assigned");
+
+		g_ptr_array_add(line_names, g_string_new(tokens[0]));
+		val = output_value_from_str(tokens[1]);
+		g_array_append_val(values, val);
+	}
+
+	check_manager();
+
+	if (request_name) {
+		g_autoptr(GVariant) arg_values = NULL;
+		g_autoptr(GArray) offsets = NULL;
+
+		req_obj = get_request_obj(request_name);
+		request = gpiodbus_object_peek_request(req_obj);
+		chip_path = gpiodbus_request_get_chip_path(request);
+		chip_obj = get_chip_obj_by_path(chip_path);
+		offsets = g_array_sized_new(FALSE, TRUE, sizeof(guint),
+					    num_lines);
+
+		for (i = 0; i < num_lines; i++) {
+			g_autoptr(GpiodbusObject) line_obj = NULL;
+
+			line_name = g_ptr_array_index(line_names, i);
+
+			line_obj = get_line_obj_by_name_for_chip(chip_obj,
+								line_name->str);
+			if (!line_obj)
+				die("Line not found: %s\n", line_name->str);
+
+			line = gpiodbus_object_peek_line(line_obj);
+			offset = gpiodbus_line_get_offset(line);
+			g_array_append_val(offsets, offset);
+		}
+
+		g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+		for (i = 0; i < num_lines; i++) {
+			g_variant_builder_add(&builder, "{ui}",
+					      g_array_index(offsets, guint, i),
+					      g_array_index(values, gint, i));
+		}
+
+		arg_values = g_variant_ref_sink(
+				g_variant_builder_end(&builder));
+
+		ret = gpiodbus_request_call_set_values_sync(
+							request, arg_values,
+							G_DBUS_CALL_FLAGS_NONE,
+							-1, NULL, &err);
+		if (!ret)
+			die_gerror(err, "Failed to set line values");
+
+		return EXIT_SUCCESS;
+	}
+
+	for (i = 0; i < num_lines; i++) {
+		g_autoptr(GpiodbusRequest) req_proxy = NULL;
+		g_autoptr(GpiodbusObject) line_obj = NULL;
+		g_autoptr(GVariant) arg_values = NULL;
+
+		line_name = g_ptr_array_index(line_names, i);
+
+		ret = get_line_obj_by_name(line_name->str, &line_obj, NULL);
+		if (!ret)
+			die("Line not found: %s\n", line_name->str);
+
+		line = gpiodbus_object_peek_line(line_obj);
+		req_path = gpiodbus_line_get_request_path(line);
+
+		if (!gpiodbus_line_get_managed(line))
+			die("Line '%s' not managed by gpio-manager, must be requested first",
+			    line_name->str);
+
+		req_proxy = gpiodbus_request_proxy_new_for_bus_sync(
+						G_BUS_TYPE_SYSTEM,
+						G_DBUS_PROXY_FLAGS_NONE,
+						"io.gpiod1", req_path,
+						NULL, &err);
+		if (err)
+			die_gerror(err, "Failed to get D-Bus proxy for '%s'",
+				   req_path);
+
+		offset = gpiodbus_line_get_offset(line);
+
+		g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+		g_variant_builder_add(&builder, "{ui}", offset,
+				      g_array_index(values, gint, i));
+		arg_values = g_variant_ref_sink(
+				g_variant_builder_end(&builder));
+
+		ret = gpiodbus_request_call_set_values_sync(
+						req_proxy, arg_values,
+						G_DBUS_CALL_FLAGS_NONE, -1,
+						NULL, &err);
+		if (!ret)
+			die_gerror(err, "Failed to set line values");
+	}
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/wait.c b/dbus/client/wait.c
new file mode 100644
index 0000000..d65c4e7
--- /dev/null
+++ b/dbus/client/wait.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+typedef struct {
+	gboolean name_done;
+	gboolean chip_done;
+	const gchar *label;
+} WaitData;
+
+static void obj_match_label(GpiodbusObject *chip_obj, WaitData *data)
+{
+	GpiodbusChip *chip = gpiodbus_object_peek_chip(chip_obj);
+
+	if (g_strcmp0(gpiodbus_chip_get_label(chip), data->label) == 0)
+		data->chip_done = TRUE;
+}
+
+static void check_label(gpointer elem, gpointer user_data)
+{
+	WaitData *data = user_data;
+	GpiodbusObject *obj = elem;
+
+	obj_match_label(obj, data);
+}
+
+static void on_object_added(GDBusObjectManager *manager G_GNUC_UNUSED,
+			    GpiodbusObject *obj, gpointer user_data)
+{
+	WaitData *data = user_data;
+
+	obj_match_label(GPIODBUS_OBJECT(obj), data);
+}
+
+static void wait_for_chip(WaitData *data)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autolist(GpiodbusObject) objs = NULL;
+
+	manager = get_object_manager_client("/io/gpiod1/chips");
+
+	g_signal_connect(manager, "object-added",
+			 G_CALLBACK(on_object_added), data);
+
+	objs = g_dbus_object_manager_get_objects(manager);
+	g_list_foreach(objs, check_label, data);
+
+	while (!data->chip_done)
+		g_main_context_iteration(NULL, TRUE);
+}
+
+static void on_name_appeared(GDBusConnection *con G_GNUC_UNUSED,
+			     const gchar *name G_GNUC_UNUSED,
+			     const gchar *name_owner G_GNUC_UNUSED,
+			     gpointer user_data)
+{
+	WaitData *data = user_data;
+
+	data->name_done = TRUE;
+}
+
+static void on_name_vanished(GDBusConnection *con G_GNUC_UNUSED,
+			     const gchar *name G_GNUC_UNUSED,
+			     gpointer user_data)
+{
+	WaitData *data = user_data;
+
+	if (data->label && data->chip_done)
+		die("gpio-manager vanished while waiting for chip");
+}
+
+static gboolean on_timeout(gpointer user_data G_GNUC_UNUSED)
+{
+	die("wait timed out!");
+}
+
+static guint schedule_timeout(const gchar *timeout)
+{
+	gint64 period, multiplier = 0;
+	gchar *end;
+
+	period = g_ascii_strtoll(timeout, &end, 10);
+
+	switch (*end) {
+	case 'm':
+		multiplier = 1;
+		end++;
+		break;
+	case 's':
+		multiplier = 1000;
+		break;
+	case '\0':
+		break;
+	default:
+		goto invalid_timeout;
+	}
+
+	if (multiplier) {
+		if (*end != 's')
+			goto invalid_timeout;
+
+		end++;
+	} else {
+		/* Default to miliseconds. */
+		multiplier = 1;
+	}
+
+	period *= multiplier;
+	if (period > G_MAXUINT)
+		die("timeout must not exceed %u miliseconds\n", G_MAXUINT);
+
+	return g_timeout_add(period, on_timeout, NULL);
+			
+invalid_timeout:
+	die("invalid timeout value: %s", timeout);
+}
+
+int gpiocli_wait_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Wait for the gpio-manager interface to appear.";
+
+	static const gchar *const description =
+"Timeout period defaults to miliseconds but can be given in seconds or miliseconds\n"
+"explicitly .e.g: --timeout=1000, --timeout=1000ms and --timeout=1s all specify\n"
+"the same period.";
+
+	const gchar *timeout_str = NULL;
+	guint watch_id, timeout_id = 0;
+	g_auto(GStrv) remaining = NULL;
+	WaitData data = {};
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "chip",
+			.short_name		= 'c',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &data.label,
+			.description		= "Wait for a specific chip to appear.",
+			.arg_description	= "<label>",
+		},
+		{
+			.long_name		= "timeout",
+			.short_name		= 't',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &timeout_str,
+			.description		= "Bail-out if timeout expires.",
+			.arg_description	= "<timeout_str>",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &remaining,
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+
+	if (remaining)
+		die_parsing_opts("command doesn't take additional arguments");
+
+	watch_id = g_bus_watch_name(G_BUS_TYPE_SYSTEM, "io.gpiod1",
+				    G_BUS_NAME_WATCHER_FLAGS_NONE,
+				    on_name_appeared, on_name_vanished,
+				    &data, NULL);
+
+	if (timeout_str)
+		timeout_id = schedule_timeout(timeout_str);
+
+	while (!data.name_done)
+		g_main_context_iteration(NULL, TRUE);
+
+	if (data.label)
+		wait_for_chip(&data);
+
+	g_bus_unwatch_name(watch_id);
+	if (timeout_str)
+		g_source_remove(timeout_id);
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/data/90-gpio.rules b/dbus/data/90-gpio.rules
new file mode 100644
index 0000000..41961e8
--- /dev/null
+++ b/dbus/data/90-gpio.rules
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+SUBSYSTEM=="gpio", KERNEL=="gpiochip[0-9]*", GROUP="gpio", MODE="0660"
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
diff --git a/dbus/data/gpio-manager.service b/dbus/data/gpio-manager.service
new file mode 100644
index 0000000..f93a6fa
--- /dev/null
+++ b/dbus/data/gpio-manager.service
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+[Unit]
+Description=Centralized GPIO manager daemon
+
+[Service]
+Type=dbus
+BusName=io.gpiod1
+ExecStart=/usr/bin/gpio-manager
+Restart=always
+User=gpio-manager
+
+CapabilityBoundingSet=
+ReadOnlyDirectories=/
+NoNewPrivileges=yes
+RemoveIPC=yes
+PrivateTmp=yes
+PrivateUsers=yes
+ProtectControlGroups=yes
+ProtectHome=yes
+ProtectKernelModules=yes
+ProtectKernelTunables=yes
+ProtectSystem=strict
+ProtectClock=yes
+Delegate=no
+IPAddressDeny=any
+KeyringMode=private
+LockPersonality=yes
+MemoryDenyWriteExecute=yes
+NotifyAccess=main
+PrivateMounts=no
+PrivateNetwork=no
+ProtectHostname=yes
+RestrictNamespaces=yes
+RestrictRealtime=yes
+RestrictSUIDSGID=yes
+SystemCallFilter=~@clock
+SystemCallFilter=~@cpu-emulation
+SystemCallFilter=~@debug
+SystemCallFilter=~@module
+SystemCallFilter=~@mount
+SystemCallFilter=~@obsolete
+SystemCallFilter=~@privileged
+SystemCallFilter=~@raw-io
+SystemCallFilter=~@reboot
+SystemCallFilter=~@swap
+
+[Install]
+WantedBy=multi-user.target
diff --git a/dbus/data/io.gpiod1.conf b/dbus/data/io.gpiod1.conf
new file mode 100644
index 0000000..99b470f
--- /dev/null
+++ b/dbus/data/io.gpiod1.conf
@@ -0,0 +1,41 @@
+<!-- SPDX-License-Identifier: CC-BY-SA-4.0.txt -->
+<!-- SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> -->
+
+<!-- This configuration file specifies the required security policies
+     for the gpio-dbus daemon to work. -->
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+
+<busconfig>
+
+  <!-- Everyone can list GPIO devices and see their properties. -->
+  <policy context="default">
+    <allow send_destination="io.gpiod1"
+           send_interface="org.freedesktop.DBus.Peer"
+           send_member="Ping"/>
+    <allow send_destination="io.gpiod1"
+           send_interface="org.freedesktop.DBus.Introspectable"/>
+    <allow send_destination="io.gpiod1"
+           send_interface="org.freedesktop.DBus.Properties"/>
+    <allow send_destination="io.gpiod1"
+           send_interface="org.freedesktop.DBus.ObjectManager"/>
+  </policy>
+
+  <!-- Daemon must run as the `gpio-manager` user. -->
+  <policy user="gpio-manager">
+    <allow own="io.gpiod1"/>
+  </policy>
+
+  <!-- Members of the `gpio` group can request and manipulate GPIO lines. -->
+  <policy group="gpio">
+    <allow send_destination="io.gpiod1"/>
+  </policy>
+
+  <!-- Root can do anything. -->
+  <policy user="root">
+    <allow own="io.gpiod1"/>
+    <allow send_destination="io.gpiod1"/>
+  </policy>
+
+</busconfig>
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
diff --git a/dbus/lib/gpiodbus.h b/dbus/lib/gpiodbus.h
new file mode 100644
index 0000000..69362f0
--- /dev/null
+++ b/dbus/lib/gpiodbus.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODBUS_H__
+#define __GPIODBUS_H__
+
+#include "generated-gpiodbus.h"
+
+#endif /* __GPIODBUS_H__ */
diff --git a/dbus/lib/io.gpiod1.xml b/dbus/lib/io.gpiod1.xml
new file mode 100644
index 0000000..ace7d72
--- /dev/null
+++ b/dbus/lib/io.gpiod1.xml
@@ -0,0 +1,324 @@
+<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->
+<!-- SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> -->
+
+<!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object Introspection 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
+
+<node>
+
+  <!--
+    io.gpiod1.Chip:
+    @short_description: Represents a single GPIO chip in the system.
+  -->
+  <interface name='io.gpiod1.Chip'>
+
+    <!--
+      Name:
+
+      Name of the chip as represented in the kernel.
+    -->
+    <property name='Name' type='s' access='read'/>
+
+    <!--
+      Label:
+
+      Label of the chip as represented in the kernel.
+    -->
+    <property name='Label' type='s' access='read'/>
+
+    <!--
+      NumLines:
+
+      Number of GPIO lines exposed by this chip.
+    -->
+    <property name='NumLines' type='u' access='read'/>
+
+    <!--
+      Path:
+
+      Filesystem path used to open this chip.
+    -->
+    <property name='Path' type='ay' access='read'/>
+
+    <!--
+      RequestLines:
+      @line_config: Line configuration. See below for details.
+      @request_config: Request configuration. See below for details.
+      @request_path: Object path pointing to the newly added request.
+
+      Requests a set of lines and makes it possible for the users of this API
+      to manipulate them depending on the line configuration.
+
+      Line configuration is a tuple of two arrays. The first one contains
+      mappings of arrays of line offsets to sets of line settings. The second
+      contains the list of default output values which are only used in output
+      mode.
+
+      Available line config options:
+
+        "direction" => String representing the line direction. Accepts the
+                       following values: "input", "output".
+        "edge" => String representing the edge detection setting. Accepts the
+                  following values: "falling", "rising", "both".
+        "active-low" => Boolean representing the active-low setting.
+        "drive" => String representing the drive settings. Accepts the
+                   following values: "push-pull", "open-drain", "open-source".
+        "bias" => String representing the internal bias settings. Accepts the
+                  following values: "disabled", "pull-up", "pull-down", "as-is".
+        "debounce-period" => Debounce period in microseconds represented as a
+                             signed, 64-bit integer.
+        "event-clock" => String representing the clock used to timestamp edge
+                         events. Accepts the following values: "monotonic",
+                         "realtime", "hte".
+
+      Output values are applied to the lines in the order they appear in the
+      settings mappings.
+
+      Example variant that allows to request lines at offsets 1, 5 and 11 in
+      output, push-pull and active-low modes and specifies the output values
+      as active (as visualized with g_variant_print()):
+
+        // Line config tuple
+        (
+          // Array of line settings mappings
+          [
+            // Single mapping tuple
+            (
+              // Offsets to map
+              [1, 5, 11],
+              // Line settings dict
+              {
+                'direction': <'output'>,
+                'drive': <'push-pull'>,
+                'active-low': <true>
+              }
+            )
+          ],
+          // Output values
+          [1, 1, 1]
+        )
+
+      Request configuration is a hashmap mapping names of the available config
+      options to their values wrapped in a variant.
+
+      Available request config options:
+
+        "consumer" => Consumer name as a string
+        "event-buffer-size" => Requested size of the in-kernel edge event
+                               buffer as an unsigned 32-bit integer.
+
+      The object path to the new request is returned on success. The user
+      should wait for it to appear before trying to use the requested lines in
+      any way.
+    -->
+    <method name='RequestLines'>
+      <arg name='line_config' direction='in' type='(a(aua{sv})ai)'/>
+      <arg name='request_config' direction='in' type='a{sv}'/>
+      <arg name='request_path' direction='out' type='o'/>
+    </method>
+
+  </interface>
+
+  <!--
+    io.gpiod1.Line:
+    @short_description: Represents a single GPIO line on a chip.
+  -->
+  <interface name='io.gpiod1.Line'>
+
+    <!--
+      Offset:
+
+      Uniquely identifies the line on the chip.
+    -->
+    <property name='Offset' type='u' access='read'/>
+
+    <!--
+      Name:
+
+      Name of the GPIO line as represented in the kernel.
+    -->
+    <property name='Name' type='s' access='read'/>
+
+    <!--
+      Used:
+
+      True if line is busy.
+
+      Line can be used by gpio-manager, another user-space process, a kernel
+      driver or is hogged. The exact reason a line is busy cannot be determined
+      from user-space unless it's known to be managed by gpio-manager (see:
+      the Managed property of this interface).
+    -->
+    <property name='Used' type='b' access='read'/>
+
+    <!--
+      Consumer:
+
+      Name of the consumer of the line.
+    -->
+    <property name='Consumer' type='s' access='read'/>
+
+    <!--
+      Direction:
+
+      Direction of the line. Returns "input" or "output".
+    -->
+    <property name='Direction' type='s' access='read'/>
+
+    <!--
+      EdgeDetection:
+
+      Edge detection settings of the line. Returns: "none", "falling",
+      "rising" or "both".
+    -->
+    <property name='EdgeDetection' type='s' access='read'/>
+
+    <!--
+      Bias:
+
+      Bias setting of the line. Returns: "unknown", "disabled, "pull-up" or
+      "pull-down".
+    -->
+    <property name='Bias' type='s' access='read'/>
+
+    <!--
+      Drive:
+
+      Drive setting of the line. Returns "push-pull", "open-source" or
+      "open-drain".
+    -->
+    <property name='Drive' type='s' access='read'/>
+
+    <!--
+      ActiveLow:
+
+      True if the line is active-low. False for active-high.
+    -->
+    <property name='ActiveLow' type='b' access='read'/>
+
+    <!--
+      Debounced:
+
+      True if line is being debounced on interrupts. Can only be true with
+      edge-detection enabled.
+    -->
+    <property name='Debounced' type='b' access='read'/>
+
+    <!--
+      DebouncePeriodUs:
+
+      Debounce period in microseconds. 0 if the line is not debounced. Can
+      only be non-zero with edge-detection enabled.
+    -->
+    <property name='DebouncePeriodUs' type='t' access='read'/>
+
+    <!--
+      EventClock:
+
+      System clock used to timestamp edge events on this line. Returns:
+      "monotonic", "realtime", "hte" or "unknown". New types may be added in
+      the future. Clients should interpret other types they don't recognize as
+      "unknown".
+    -->
+    <property name='EventClock' type='s' access='read'/>
+
+    <!--
+      Managed:
+
+      True if the line is managed by gpio-manager.
+    -->
+    <property name='Managed' type='b' access='read'/>
+
+    <!--
+      RequestPath:
+
+      If this line is managed by gpio-manager then this property will contain
+      the DBus object path pointing to the managing request object.
+    -->
+    <property name='RequestPath' type='o' access='read'/>
+
+    <!--
+      EdgeEvent:
+      @event_data: Contains the edge (1 for rising, 0 for falling), timestamp
+                   in nanoseconds and the global & line-local sequence numbers.
+
+      If the line is managed by the gpio-manager and is requested with edge
+      detection enabled then this signal will be emitted for every edge event
+      registered on this line.
+
+      D-Bus EdgeEvent signals are designed for low-to-medium frequency
+      interrupts. If you performance better than the order of tens of HZ, you
+      should probably access the line directly using the kernel uAPI.
+    -->
+    <signal name='EdgeEvent'>
+      <arg name='event_data' type='(ittt)'/>
+    </signal>
+
+  </interface>
+
+  <!--
+    io.gpiod1.Request:
+    @short_description: Represents a set of requested GPIO lines.
+  -->
+  <interface name='io.gpiod1.Request'>
+
+    <!--
+      ChipPath:
+
+      DBus object path pointing to the chip exposing the lines held by this
+      request.
+    -->
+    <property name='ChipPath' type='o' access='read'/>
+
+    <!--
+      LinePaths:
+
+      Array of DBus object paths pointing to the lines held by this request.
+    -->
+    <property name='LinePaths' type='ao' access='read'/>
+
+    <!--
+      Release:
+
+      Release the requested lines. After this method returns, the request
+      object on which it was called will be destroyed.
+    -->
+    <method name='Release'/>
+
+    <!--
+      ReconfigureLines:
+      @line_config: Line configuration. Refer to the RequestLines method of
+                    the io.gpiod1.Chip interface for details.
+
+      Change the configuration of lines held by this request object without
+      releasing them.
+    -->
+    <method name='ReconfigureLines'>
+      <arg name='line_config' direction='in' type='(a(aua{sv})ai)'/>
+    </method>
+
+    <!--
+      GetValues:
+      @offsets: Array of line offsets within the request to read values for.
+      @values: Array of values in the order lines were specified in @offsets.
+
+      Read the values for a set of lines held by the request.
+    -->
+    <method name='GetValues'>
+      <arg name='offsets' direction='in' type='au'/>
+      <arg name='values' direction='out' type='ai'/>
+    </method>
+
+    <!--
+      SetValues:
+      @values: Array of mappings from line offsets to desired output values.
+
+      Set the values for a set of lines held by the request.
+    -->
+    <method name='SetValues'>
+      <arg name='values' direction='in' type='a{ui}'/>
+    </method>
+
+  </interface>
+
+</node>
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
diff --git a/dbus/manager/daemon.c b/dbus/manager/daemon.c
new file mode 100644
index 0000000..d6eb4a5
--- /dev/null
+++ b/dbus/manager/daemon.c
@@ -0,0 +1,821 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod-glib.h>
+#include <gpiodbus.h>
+#include <gudev/gudev.h>
+
+#include "daemon.h"
+#include "helpers.h"
+
+struct _GpiodbusDaemon {
+	GObject parent;
+	GDBusConnection *con;
+	GUdevClient *udev;
+	GDBusObjectManagerServer *chip_manager;
+	GDBusObjectManagerServer *request_manager;
+	GHashTable *chips;
+	GHashTable *requests;
+	GTree *req_id_root;
+};
+
+G_DEFINE_TYPE(GpiodbusDaemon, gpiodbus_daemon, G_TYPE_OBJECT);
+
+typedef struct {
+	GpiodglibChip *chip;
+	GpiodbusChip *dbus_chip;
+	GpiodbusDaemon *daemon;
+	GDBusObjectManagerServer *line_manager;
+	GHashTable *lines;
+} GpiodbusDaemonChipData;
+
+typedef struct {
+	GpiodglibLineRequest *request;
+	GpiodbusRequest *dbus_request;
+	gint id;
+	GpiodbusDaemonChipData *chip_data;
+} GpiodbusDaemonRequestData;
+
+typedef struct {
+	GpiodbusLine *dbus_line;
+	GpiodbusDaemonChipData *chip_data;
+	GpiodbusDaemonRequestData *req_data;
+} GpiodbusDaemonLineData;
+
+static const gchar* const gpiodbus_daemon_udev_subsystems[] = { "gpio", NULL };
+
+static void gpiodbus_daemon_dispose(GObject *obj)
+{
+	GpiodbusDaemon *self = GPIODBUS_DAEMON(obj);
+
+	g_debug("disposing of the GPIO daemon");
+
+	g_clear_pointer(&self->chips, g_hash_table_unref);
+	/*
+	 * REVISIT: Do we even need to unref the request hash table here at
+	 * all? All requests should have been freed when removing their parent
+	 * chips.
+	 */
+	g_clear_pointer(&self->requests, g_hash_table_unref);
+	g_clear_pointer(&self->req_id_root, g_tree_destroy);
+	g_clear_object(&self->con);
+
+	G_OBJECT_CLASS(gpiodbus_daemon_parent_class)->dispose(obj);
+}
+
+static void gpiodbus_daemon_finalize(GObject *obj)
+{
+	GpiodbusDaemon *self = GPIODBUS_DAEMON(obj);
+
+	g_debug("finalizing GPIO daemon");
+
+	g_clear_object(&self->request_manager);
+	g_clear_object(&self->chip_manager);
+	g_clear_object(&self->udev);
+
+	G_OBJECT_CLASS(gpiodbus_daemon_parent_class)->finalize(obj);
+}
+
+static void gpiodbus_daemon_class_init(GpiodbusDaemonClass *daemon_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(daemon_class);
+
+	class->dispose = gpiodbus_daemon_dispose;
+	class->finalize = gpiodbus_daemon_finalize;
+}
+
+static gboolean
+gpiodbus_remove_request_if_chip_matches(gpointer key G_GNUC_UNUSED,
+					gpointer value, gpointer user_data)
+{
+	GpiodbusDaemonChipData *chip_data = user_data;
+	GpiodbusDaemonRequestData *req_data = value;
+
+	return req_data->chip_data == chip_data;
+}
+
+static void gpiodbus_daemon_chip_data_free(gpointer data)
+{
+	GpiodbusDaemonChipData *chip_data = data;
+	const gchar *obj_path;
+
+	obj_path = g_dbus_interface_skeleton_get_object_path(
+			G_DBUS_INTERFACE_SKELETON(chip_data->dbus_chip));
+
+	g_debug("unexporting object for GPIO chip: '%s'", obj_path);
+
+	g_hash_table_foreach_remove(chip_data->daemon->requests,
+				    gpiodbus_remove_request_if_chip_matches,
+				    chip_data);
+
+	g_dbus_object_manager_server_unexport(chip_data->daemon->chip_manager,
+					      obj_path);
+
+	g_hash_table_unref(chip_data->lines);
+	g_object_unref(chip_data->line_manager);
+	g_object_unref(chip_data->chip);
+	g_object_unref(chip_data->dbus_chip);
+	g_free(chip_data);
+}
+
+static void gpiodbus_daemon_line_data_free(gpointer data)
+{
+	GpiodbusDaemonLineData *line_data = data;
+	const gchar *obj_path;
+
+	obj_path = g_dbus_interface_skeleton_get_object_path(
+			G_DBUS_INTERFACE_SKELETON(line_data->dbus_line));
+
+	g_debug("unexporting object for GPIO line: '%s'",
+		obj_path);
+
+	g_dbus_object_manager_server_unexport(
+				line_data->chip_data->line_manager, obj_path);
+
+	g_object_unref(line_data->dbus_line);
+	g_free(line_data);
+}
+
+static void gpiodbus_lines_set_managed(GpiodbusDaemonRequestData *req_data,
+				       gboolean managed)
+{
+	g_autoptr(GDBusObject) obj = NULL;
+	const gchar *const *line_paths;
+	GpiodbusLine *line;
+	const gchar *path;
+	guint i;
+
+	line_paths = gpiodbus_request_get_line_paths(req_data->dbus_request);
+
+	for (path = line_paths[0], i = 0; path; path = line_paths[++i]) {
+		obj = g_dbus_object_manager_get_object(
+			G_DBUS_OBJECT_MANAGER(
+				req_data->chip_data->line_manager), path);
+		line = gpiodbus_object_peek_line(GPIODBUS_OBJECT(obj));
+
+		g_debug("Setting line %u on chip object '%s' to '%s'",
+			gpiodbus_line_get_offset(line),
+			g_dbus_interface_skeleton_get_object_path(
+				G_DBUS_INTERFACE_SKELETON(
+					req_data->chip_data->dbus_chip)),
+			managed ? "managed" : "unmanaged");
+
+		gpiodbus_line_set_managed(line, managed);
+		gpiodbus_line_set_request_path(line,
+			managed ? g_dbus_interface_skeleton_get_object_path(
+				G_DBUS_INTERFACE_SKELETON(
+					req_data->dbus_request)) : NULL);
+		g_dbus_interface_skeleton_flush(
+					G_DBUS_INTERFACE_SKELETON(line));
+	}
+}
+
+static void gpiodbus_daemon_request_data_free(gpointer data)
+{
+	GpiodbusDaemonRequestData *req_data = data;
+	const gchar *obj_path;
+
+	obj_path = g_dbus_interface_skeleton_get_object_path(
+			G_DBUS_INTERFACE_SKELETON(req_data->dbus_request));
+
+	g_debug("unexporting object for GPIO request: '%s'", obj_path);
+
+	g_dbus_object_manager_server_unexport(
+		req_data->chip_data->daemon->request_manager, obj_path);
+
+	gpiodbus_lines_set_managed(req_data, FALSE);
+	gpiodbus_id_free(req_data->chip_data->daemon->req_id_root,
+			 req_data->id);
+	g_object_unref(req_data->request);
+	g_object_unref(req_data->dbus_request);
+	g_free(req_data);
+}
+
+static void gpiodbus_daemon_init(GpiodbusDaemon *self)
+{
+	g_debug("initializing GPIO D-Bus daemon");
+
+	self->con = NULL;
+	self->udev = g_udev_client_new(gpiodbus_daemon_udev_subsystems);
+	self->chip_manager =
+			g_dbus_object_manager_server_new("/io/gpiod1/chips");
+	self->request_manager =
+			g_dbus_object_manager_server_new("/io/gpiod1/requests");
+	self->chips = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
+					    gpiodbus_daemon_chip_data_free);
+	self->requests = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
+					gpiodbus_daemon_request_data_free);
+	self->req_id_root = g_tree_new_full(gpiodbus_id_cmp, NULL,
+					    g_free, NULL);
+}
+
+GpiodbusDaemon *gpiodbus_daemon_new(void)
+{
+	return GPIODBUS_DAEMON(g_object_new(GPIODBUS_DAEMON_TYPE, NULL));
+}
+
+static void gpiodbus_daemon_on_info_event(GpiodglibChip *chip G_GNUC_UNUSED,
+					  GpiodglibInfoEvent *event,
+					  gpointer data)
+{
+	GpiodbusDaemonChipData *chip_data = data;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	GpiodbusDaemonLineData *line_data;
+	guint offset;
+
+	info = gpiodglib_info_event_get_line_info(event);
+	offset = gpiodglib_line_info_get_offset(info);
+
+	g_debug("line info event received for offset %u on chip '%s'",
+		offset,
+		g_dbus_interface_skeleton_get_object_path(
+			G_DBUS_INTERFACE_SKELETON(chip_data->dbus_chip)));
+
+	line_data = g_hash_table_lookup(chip_data->lines,
+					GINT_TO_POINTER(offset));
+	if (!line_data)
+		g_error("failed to retrieve line data - programming bug?");
+
+	gpiodbus_line_set_props(line_data->dbus_line, info);
+}
+
+static void gpiodbus_daemon_export_line(GpiodbusDaemon *self,
+					GpiodbusDaemonChipData *chip_data,
+					GpiodglibLineInfo *info)
+{
+	g_autofree GpiodbusDaemonLineData *line_data = NULL;
+	g_autoptr(GpiodbusObjectSkeleton) skeleton = NULL;
+	g_autoptr(GpiodbusLine) dbus_line = NULL;
+	g_autofree gchar *obj_path = NULL;
+	const gchar *obj_prefix;
+	guint line_offset;
+	gboolean ret;
+
+	obj_prefix = g_dbus_object_manager_get_object_path(
+				G_DBUS_OBJECT_MANAGER(chip_data->line_manager));
+	line_offset = gpiodglib_line_info_get_offset(info);
+	dbus_line = gpiodbus_line_skeleton_new();
+	obj_path = g_strdup_printf("%s/line%u", obj_prefix, line_offset);
+
+	gpiodbus_line_set_props(dbus_line, info);
+
+	skeleton = gpiodbus_object_skeleton_new(obj_path);
+	gpiodbus_object_skeleton_set_line(skeleton, GPIODBUS_LINE(dbus_line));
+
+	g_debug("exporting object for GPIO line: '%s'", obj_path);
+
+	g_dbus_object_manager_server_export(chip_data->line_manager,
+					    G_DBUS_OBJECT_SKELETON(skeleton));
+	g_dbus_object_manager_server_set_connection(chip_data->line_manager,
+						    self->con);
+
+	line_data = g_malloc0(sizeof(*line_data));
+	line_data->dbus_line = g_steal_pointer(&dbus_line);
+	line_data->chip_data = chip_data;
+
+	ret = g_hash_table_insert(chip_data->lines,
+				  GUINT_TO_POINTER(line_offset),
+				  g_steal_pointer(&line_data));
+	/* It's a programming bug if the line is already in the hashmap. */
+	g_assert(ret);
+}
+
+static gboolean gpiodbus_daemon_export_lines(GpiodbusDaemon *self,
+					     GpiodbusDaemonChipData *chip_data)
+{
+	g_autoptr(GpiodglibChipInfo) chip_info = NULL;
+	GpiodglibChip *chip = chip_data->chip;
+	g_autoptr(GError) err = NULL;
+	guint i, num_lines;
+	gint j;
+
+	chip_info = gpiodglib_chip_get_info(chip, &err);
+	if (!chip_info) {
+		g_critical("failed to read chip info: %s", err->message);
+		return FALSE;
+	}
+
+	num_lines = gpiodglib_chip_info_get_num_lines(chip_info);
+
+	g_signal_connect(chip, "info-event",
+			 G_CALLBACK(gpiodbus_daemon_on_info_event), chip_data);
+
+	for (i = 0; i < num_lines; i++) {
+		g_autoptr(GpiodglibLineInfo) linfo = NULL;
+
+		linfo = gpiodglib_chip_watch_line_info(chip, i, &err);
+		if (!linfo) {
+			g_critical("failed to setup a line-info watch: %s",
+				   err->message);
+			for (j = i; j >= 0; j--)
+				gpiodglib_chip_unwatch_line_info(chip, i, NULL);
+			return FALSE;
+		}
+
+		gpiodbus_daemon_export_line(self, chip_data, linfo);
+	}
+
+	return TRUE;
+}
+
+static gboolean
+gpiodbus_daemon_handle_release_lines(GpiodbusRequest *request,
+				     GDBusMethodInvocation *invocation,
+				     gpointer user_data)
+{
+	GpiodbusDaemonRequestData *req_data = user_data;
+	g_autofree gchar *obj_path = NULL;
+	gboolean ret;
+
+	obj_path = g_strdup(g_dbus_interface_skeleton_get_object_path(
+					G_DBUS_INTERFACE_SKELETON(request)));
+
+	g_debug("release call received on request '%s'", obj_path);
+
+	ret = g_hash_table_remove(req_data->chip_data->daemon->requests,
+				  obj_path);
+	/* It's a programming bug if the request was not in the hashmap. */
+	if (!ret)
+		g_warning("request '%s' is not registered - logic error?",
+			  obj_path);
+
+	g_dbus_method_invocation_return_value(invocation, NULL);
+
+	return G_SOURCE_CONTINUE;
+}
+
+static gboolean
+gpiodbus_daemon_handle_reconfigure_lines(GpiodbusRequest *request,
+					 GDBusMethodInvocation *invocation,
+					 GVariant *arg_line_cfg,
+					 gpointer user_data)
+{
+	GpiodbusDaemonRequestData *req_data = user_data;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autofree gchar *line_cfg_str = NULL;
+	g_autoptr(GError) err = NULL;
+	const gchar *obj_path;
+	gboolean ret;
+
+	obj_path = g_dbus_interface_skeleton_get_object_path(
+					G_DBUS_INTERFACE_SKELETON(request));
+	line_cfg_str = g_variant_print(arg_line_cfg, FALSE);
+
+	g_debug("reconfigure call received on request '%s', line config: %s",
+		obj_path, line_cfg_str);
+
+	line_cfg = gpiodbus_line_config_from_variant(arg_line_cfg);
+	if (!line_cfg) {
+		g_critical("failed to convert method call arguments '%s' to line config",
+			   line_cfg_str);
+		g_dbus_method_invocation_return_error(invocation, G_DBUS_ERROR,
+						      G_DBUS_ERROR_INVALID_ARGS,
+						      "Invalid line configuration");
+		goto out;
+	}
+
+	ret = gpiodglib_line_request_reconfigure_lines(req_data->request,
+						       line_cfg, &err);
+	if (!ret) {
+		g_critical("failed to reconfigure GPIO lines on request '%s': %s",
+			   obj_path, err->message);
+		g_dbus_method_invocation_return_dbus_error(invocation,
+						"io.gpiod1.ReconfigureFailed",
+						err->message);
+		goto out;
+	}
+
+	g_dbus_method_invocation_return_value(invocation, NULL);
+
+out:
+	return G_SOURCE_CONTINUE;
+}
+
+static gboolean
+gpiodbus_daemon_handle_get_values(GpiodbusRequest *request,
+				  GDBusMethodInvocation *invocation,
+				  GVariant *arg_offsets, gpointer user_data)
+{
+	GpiodbusDaemonRequestData *req_data = user_data;
+	g_autoptr(GVariant) out_values = NULL;
+	g_autofree gchar *offsets_str = NULL;
+	g_autoptr(GVariant) response = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	GVariantBuilder builder;
+	const gchar *obj_path;
+	GVariantIter iter;
+	gsize num_offsets;
+	guint offset, i;
+	gboolean ret;
+
+	obj_path = g_dbus_interface_skeleton_get_object_path(
+					G_DBUS_INTERFACE_SKELETON(request));
+	offsets_str = g_variant_print(arg_offsets, FALSE);
+	num_offsets = g_variant_n_children(arg_offsets);
+
+	g_debug("get-values call received on request '%s' for offsets: %s",
+		obj_path, offsets_str);
+
+	if (num_offsets == 0) {
+		ret = gpiodglib_line_request_get_values(req_data->request,
+							&values, &err);
+	} else {
+		offsets = g_array_sized_new(FALSE, TRUE, sizeof(offset),
+					    num_offsets);
+		g_variant_iter_init(&iter, arg_offsets);
+		while (g_variant_iter_next(&iter, "u", &offset))
+			g_array_append_val(offsets, offset);
+
+		ret = gpiodglib_line_request_get_values_subset(
+				req_data->request, offsets, &values, &err);
+	}
+	if (!ret) {
+		g_critical("failed to get GPIO line values on request '%s': %s",
+			   obj_path, err->message);
+		g_dbus_method_invocation_return_dbus_error(invocation,
+						"io.gpiod1.GetValuesFailed",
+						err->message);
+		goto out;
+	}
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	for (i = 0; i < values->len; i++)
+		g_variant_builder_add(&builder, "i",
+				      g_array_index(values, gint, i));
+	out_values = g_variant_ref_sink(g_variant_builder_end(&builder));
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_TUPLE);
+	g_variant_builder_add_value(&builder, out_values);
+	response = g_variant_ref_sink(g_variant_builder_end(&builder));
+
+	g_dbus_method_invocation_return_value(invocation, response);
+
+out:
+	return G_SOURCE_CONTINUE;
+}
+
+static gboolean
+gpiodbus_daemon_handle_set_values(GpiodbusRequest *request,
+				  GDBusMethodInvocation *invocation,
+				  GVariant *arg_values, gpointer user_data)
+{
+	GpiodbusDaemonRequestData *req_data = user_data;
+	g_autofree gchar *values_str = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	const gchar *obj_path;
+	GVariantIter iter;
+	gsize num_values;
+	guint offset;
+	gboolean ret;
+	gint value;
+
+	obj_path = g_dbus_interface_skeleton_get_object_path(
+					G_DBUS_INTERFACE_SKELETON(request));
+	values_str = g_variant_print(arg_values, FALSE);
+	num_values = g_variant_n_children(arg_values);
+
+	g_debug("set-values call received on request '%s': %s",
+		obj_path, values_str);
+
+	if (num_values == 0) {
+		g_critical("Client passed no offset to value mappings");
+		g_dbus_method_invocation_return_error(invocation, G_DBUS_ERROR,
+						      G_DBUS_ERROR_INVALID_ARGS,
+						      "No offset <-> value mappings specified");
+		goto out;
+	}
+
+	offsets = g_array_sized_new(FALSE, TRUE, sizeof(offset), num_values);
+	values = g_array_sized_new(FALSE, TRUE, sizeof(value), num_values);
+
+	g_variant_iter_init(&iter, arg_values);
+	while (g_variant_iter_next(&iter, "{ui}", &offset, &value)) {
+		g_array_append_val(offsets, offset);
+		g_array_append_val(values, value);
+	}
+
+	ret = gpiodglib_line_request_set_values_subset(req_data->request,
+						       offsets, values, &err);
+	if (!ret) {
+		g_critical("failed to set GPIO line values on request '%s': %s",
+			   obj_path, err->message);
+		g_dbus_method_invocation_return_dbus_error(invocation,
+						"io.gpiod1.SetValuesFailed",
+						err->message);
+		goto out;
+	}
+
+	g_dbus_method_invocation_return_value(invocation, NULL);
+
+out:
+	return G_SOURCE_CONTINUE;
+}
+
+static void
+gpiodbus_daemon_on_edge_event(GpiodglibLineRequest *request G_GNUC_UNUSED,
+			      GpiodglibEdgeEvent *event, gpointer user_data)
+{
+	GpiodbusDaemonRequestData *req_data = user_data;
+	GpiodbusDaemonLineData *line_data;
+	gulong line_seqno, global_seqno;
+	GpiodglibEdgeEventType edge;
+	guint64 timestamp;
+	guint offset;
+	gint val;
+
+	edge = gpiodglib_edge_event_get_event_type(event);
+	offset = gpiodglib_edge_event_get_line_offset(event);
+	timestamp = gpiodglib_edge_event_get_timestamp_ns(event);
+	global_seqno = gpiodglib_edge_event_get_global_seqno(event);
+	line_seqno = gpiodglib_edge_event_get_line_seqno(event);
+
+	val = edge == GPIODGLIB_EDGE_EVENT_RISING_EDGE ? 1 : 0;
+
+	g_debug("%s edge event received for offset %u on request '%s'",
+		val ? "rising" : "falling", offset,
+		g_dbus_interface_skeleton_get_object_path(
+			G_DBUS_INTERFACE_SKELETON(req_data->dbus_request)));
+
+	line_data = g_hash_table_lookup(req_data->chip_data->lines,
+					GINT_TO_POINTER(offset));
+	if (!line_data)
+		g_error("failed to retrieve line data - programming bug?");
+
+	gpiodbus_line_emit_edge_event(line_data->dbus_line,
+				      g_variant_new("(ittt)", val, timestamp,
+						    global_seqno, line_seqno));
+}
+
+static void
+gpiodbus_daemon_export_request(GpiodbusDaemon *self,
+			       GpiodglibLineRequest *request,
+			       GpiodbusDaemonChipData *chip_data, gint id)
+{
+	g_autofree GpiodbusDaemonRequestData *req_data = NULL;
+	g_autoptr(GpiodbusObjectSkeleton) skeleton = NULL;
+	g_autoptr(GpiodbusRequest) dbus_req = NULL;
+	g_autofree gchar *obj_path = NULL;
+	gboolean ret;
+
+	dbus_req = gpiodbus_request_skeleton_new();
+	obj_path = g_strdup_printf("/io/gpiod1/requests/request%d", id);
+
+	gpiodbus_request_set_props(dbus_req, request, chip_data->dbus_chip,
+				G_DBUS_OBJECT_MANAGER(chip_data->line_manager));
+
+	skeleton = gpiodbus_object_skeleton_new(obj_path);
+	gpiodbus_object_skeleton_set_request(skeleton,
+					     GPIODBUS_REQUEST(dbus_req));
+
+	g_debug("exporting object for GPIO request: '%s'", obj_path);
+
+	g_dbus_object_manager_server_export(self->request_manager,
+					    G_DBUS_OBJECT_SKELETON(skeleton));
+
+	req_data = g_malloc0(sizeof(*req_data));
+	req_data->chip_data = chip_data;
+	req_data->dbus_request = g_steal_pointer(&dbus_req);
+	req_data->id = id;
+	req_data->request = g_object_ref(request);
+
+	g_signal_connect(req_data->dbus_request, "handle-release",
+			 G_CALLBACK(gpiodbus_daemon_handle_release_lines),
+			 req_data);
+	g_signal_connect(req_data->dbus_request, "handle-reconfigure-lines",
+			 G_CALLBACK(gpiodbus_daemon_handle_reconfigure_lines),
+			 req_data);
+	g_signal_connect(req_data->dbus_request, "handle-get-values",
+			 G_CALLBACK(gpiodbus_daemon_handle_get_values),
+			 req_data);
+	g_signal_connect(req_data->dbus_request, "handle-set-values",
+			 G_CALLBACK(gpiodbus_daemon_handle_set_values),
+			 req_data);
+	g_signal_connect(req_data->request, "edge-event",
+			 G_CALLBACK(gpiodbus_daemon_on_edge_event), req_data);
+
+	gpiodbus_lines_set_managed(req_data, TRUE);
+
+	ret = g_hash_table_insert(self->requests, g_steal_pointer(&obj_path),
+				  g_steal_pointer(&req_data));
+	/* It's a programming bug if the request is already in the hashmap. */
+	g_assert(ret);
+}
+
+static gboolean
+gpiodbus_daemon_handle_request_lines(GpiodbusChip *chip,
+				     GDBusMethodInvocation *invocation,
+				     GVariant *arg_line_cfg,
+				     GVariant *arg_req_cfg,
+				     gpointer user_data)
+{
+	GpiodbusDaemonChipData *chip_data = user_data;
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autofree gchar *line_cfg_str = NULL;
+	g_autofree gchar *req_cfg_str = NULL;
+	g_autofree gchar *response = NULL;
+	g_autoptr(GError) err = NULL;
+	const gchar *obj_path;
+	guint id;
+
+	obj_path = g_dbus_interface_skeleton_get_object_path(
+			G_DBUS_INTERFACE_SKELETON(chip));
+	line_cfg_str = g_variant_print(arg_line_cfg, FALSE);
+	req_cfg_str = g_variant_print(arg_req_cfg, FALSE);
+
+	g_debug("line request received on chip '%s', line config: %s, request_config: %s",
+		obj_path, line_cfg_str, req_cfg_str);
+
+	line_cfg = gpiodbus_line_config_from_variant(arg_line_cfg);
+	if (!line_cfg) {
+		g_critical("failed to convert method call arguments '%s' to line config",
+			   line_cfg_str);
+		g_dbus_method_invocation_return_error(invocation, G_DBUS_ERROR,
+						      G_DBUS_ERROR_INVALID_ARGS,
+						      "Invalid line configuration");
+		goto out;
+	}
+
+	req_cfg = gpiodbus_request_config_from_variant(arg_req_cfg);
+	if (!req_cfg) {
+		g_critical("failed to convert method call arguments '%s' to request config",
+			   req_cfg_str);
+		g_dbus_method_invocation_return_error(invocation, G_DBUS_ERROR,
+						      G_DBUS_ERROR_INVALID_ARGS,
+						      "Invalid request configuration");
+		goto out;
+	}
+
+	request = gpiodglib_chip_request_lines(chip_data->chip, req_cfg,
+					      line_cfg, &err);
+	if (err) {
+		g_critical("failed to request GPIO lines on chip '%s': %s",
+			   obj_path, err->message);
+		g_dbus_method_invocation_return_dbus_error(invocation,
+				"io.gpiod1.RequestFailed", err->message);
+		goto out;
+	}
+
+	g_debug("line request succeeded on chip '%s'", obj_path);
+
+	id = gpiodbus_id_alloc(chip_data->daemon->req_id_root);
+	gpiodbus_daemon_export_request(chip_data->daemon, request,
+				       chip_data, id);
+
+	response = g_strdup_printf("/io/gpiod1/requests/request%d", id);
+	g_dbus_method_invocation_return_value(invocation,
+					      g_variant_new("(o)", response));
+
+out:
+	return G_SOURCE_CONTINUE;
+}
+
+static void gpiodbus_daemon_export_chip(GpiodbusDaemon *self, GUdevDevice *dev)
+{
+	g_autofree GpiodbusDaemonChipData *chip_data = NULL;
+	g_autoptr(GDBusObjectManagerServer) manager = NULL;
+	g_autoptr(GpiodbusObjectSkeleton) skeleton = NULL;
+	const gchar *devname, *devpath, *obj_prefix;
+	g_autoptr(GpiodbusChip) dbus_chip = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GHashTable) lines = NULL;
+	g_autofree gchar *obj_path = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	devname = g_udev_device_get_name(dev);
+	devpath = g_udev_device_get_device_file(dev);
+	obj_prefix = g_dbus_object_manager_get_object_path(
+				G_DBUS_OBJECT_MANAGER(self->chip_manager));
+
+	chip = gpiodglib_chip_new(devpath, &err);
+	if (!chip) {
+		g_critical("failed to open GPIO chip %s: %s",
+			   devpath, err->message);
+		return;
+	}
+
+	dbus_chip = gpiodbus_chip_skeleton_new();
+	obj_path = g_strdup_printf("%s/%s", obj_prefix, devname);
+
+	ret = gpiodbus_chip_set_props(dbus_chip, chip, &err);
+	if (!ret) {
+		g_critical("failed to set chip properties: %s", err->message);
+		return;
+	}
+
+	skeleton = gpiodbus_object_skeleton_new(obj_path);
+	gpiodbus_object_skeleton_set_chip(skeleton, GPIODBUS_CHIP(dbus_chip));
+
+	g_debug("exporting object for GPIO chip: '%s'", obj_path);
+
+	g_dbus_object_manager_server_export(self->chip_manager,
+					    G_DBUS_OBJECT_SKELETON(skeleton));
+
+	lines = g_hash_table_new_full(g_direct_hash, g_direct_equal, NULL,
+				      gpiodbus_daemon_line_data_free);
+	manager = g_dbus_object_manager_server_new(obj_path);
+
+	chip_data = g_malloc0(sizeof(*chip_data));
+	chip_data->daemon = self;
+	chip_data->chip = g_steal_pointer(&chip);
+	chip_data->dbus_chip = g_steal_pointer(&dbus_chip);
+	chip_data->lines = g_steal_pointer(&lines);
+	chip_data->line_manager = g_steal_pointer(&manager);
+
+	ret = gpiodbus_daemon_export_lines(self, chip_data);
+	if (!ret) {
+		g_dbus_object_manager_server_unexport(self->chip_manager,
+						      obj_path);
+		return;
+	}
+
+	g_signal_connect(chip_data->dbus_chip, "handle-request-lines",
+			 G_CALLBACK(gpiodbus_daemon_handle_request_lines),
+			 chip_data);
+
+	ret = g_hash_table_insert(self->chips, g_strdup(devname),
+				  g_steal_pointer(&chip_data));
+	/* It's a programming bug if the chip is already in the hashmap. */
+	g_assert(ret);
+}
+
+static void gpiodbus_daemon_unexport_chip(GpiodbusDaemon *self,
+					  GUdevDevice *dev)
+{
+	const gchar *name = g_udev_device_get_name(dev);
+	gboolean ret;
+
+	ret = g_hash_table_remove(self->chips, name);
+	/* It's a programming bug if the chip was not in the hashmap. */
+	if (!ret)
+		g_warning("chip '%s' is not registered - exporting failed?",
+			  name);
+}
+
+/*
+ * We can get two uevents per action per gpiochip. One is for the new-style
+ * character device, the other for legacy sysfs devices. We are only concerned
+ * with the former, which we can tell from the latter by the presence of
+ * the device file.
+ */
+static gboolean gpiodbus_daemon_is_gpiochip_device(GUdevDevice *dev)
+{
+	return g_udev_device_get_device_file(dev) != NULL;
+}
+
+static void gpiodbus_daemon_on_uevent(GUdevClient *udev G_GNUC_UNUSED,
+				      const gchar *action, GUdevDevice *dev,
+				      gpointer data)
+{
+	GpiodbusDaemon *self = data;
+
+	if (!gpiodbus_daemon_is_gpiochip_device(dev))
+		return;
+
+	g_debug("uevent: %s action on %s device",
+		action, g_udev_device_get_name(dev));
+
+	if (g_strcmp0(action, "bind") == 0)
+		gpiodbus_daemon_export_chip(self, dev);
+	else if (g_strcmp0(action, "unbind") == 0)
+		gpiodbus_daemon_unexport_chip(self, dev);
+}
+
+static void gpiodbus_daemon_process_chip_dev(gpointer data, gpointer user_data)
+{
+	GpiodbusDaemon *daemon = user_data;
+	GUdevDevice *dev = data;
+
+	if (gpiodbus_daemon_is_gpiochip_device(dev))
+		gpiodbus_daemon_export_chip(daemon, dev);
+}
+
+void gpiodbus_daemon_start(GpiodbusDaemon *self, GDBusConnection *con)
+{
+	g_autolist(GUdevDevice) devs = NULL;
+
+	g_assert(self);
+	g_assert(!self->con); /* Don't allow to call this twice. */
+
+	self->con = g_object_ref(con);
+
+	/* Subscribe for GPIO uevents. */
+	g_signal_connect(self->udev, "uevent",
+			 G_CALLBACK(gpiodbus_daemon_on_uevent), self);
+
+	devs = g_udev_client_query_by_subsystem(self->udev, "gpio");
+	g_list_foreach(devs, gpiodbus_daemon_process_chip_dev, self);
+
+	g_dbus_object_manager_server_set_connection(self->chip_manager,
+						    self->con);
+	g_dbus_object_manager_server_set_connection(self->request_manager,
+						    self->con);
+
+	g_debug("GPIO daemon now listening");
+}
diff --git a/dbus/manager/daemon.h b/dbus/manager/daemon.h
new file mode 100644
index 0000000..716396d
--- /dev/null
+++ b/dbus/manager/daemon.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODBUS_DAEMON_H__
+#define __GPIODBUS_DAEMON_H__
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <glib-object.h>
+
+G_DECLARE_FINAL_TYPE(GpiodbusDaemon, gpiodbus_daemon,
+		     GPIODBUS, DAEMON, GObject);
+
+#define GPIODBUS_DAEMON_TYPE (gpiodbus_daemon_get_type())
+#define GPIODBUS_DAEMON(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), \
+	 GPIODBUS_DAEMON_TYPE, GpiodbusDaemon))
+
+GpiodbusDaemon *gpiodbus_daemon_new(void);
+void gpiodbus_daemon_start(GpiodbusDaemon *daemon, GDBusConnection *con);
+
+#endif /* __GPIODBUS_DAEMON_H__ */
diff --git a/dbus/manager/gpio-manager.c b/dbus/manager/gpio-manager.c
new file mode 100644
index 0000000..e07641d
--- /dev/null
+++ b/dbus/manager/gpio-manager.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <glib-unix.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+#include "daemon.h"
+
+static const gchar *const debug_domains[] = {
+	"gpio-manager",
+	"gpiodglib",
+	NULL
+};
+
+static gboolean stop_main_loop_on_sig(gpointer data, const gchar *signame)
+{
+	GMainLoop *loop = data;
+
+	g_debug("%s received", signame);
+
+	g_main_loop_quit(loop);
+
+	return G_SOURCE_REMOVE;
+}
+
+static gboolean on_sigterm(gpointer data)
+{
+	return stop_main_loop_on_sig(data, "SIGTERM");
+}
+
+static gboolean on_sigint(gpointer data)
+{
+	return stop_main_loop_on_sig(data, "SIGINT");
+}
+
+static gboolean on_sighup(gpointer data G_GNUC_UNUSED)
+{
+	g_debug("SIGHUB received, ignoring");
+
+	return G_SOURCE_CONTINUE;
+}
+
+static void on_bus_acquired(GDBusConnection *con,
+			    const gchar *name G_GNUC_UNUSED,
+			    gpointer data)
+{
+	GpiodbusDaemon *daemon = data;
+
+	g_debug("D-Bus connection acquired");
+
+	gpiodbus_daemon_start(daemon, con);
+}
+
+static void on_name_acquired(GDBusConnection *con G_GNUC_UNUSED,
+			     const gchar *name, gpointer data G_GNUC_UNUSED)
+{
+	g_debug("D-Bus name acquired: '%s'", name);
+}
+
+static void on_name_lost(GDBusConnection *con,
+			 const gchar *name, gpointer data G_GNUC_UNUSED)
+{
+	g_debug("D-Bus name lost: '%s'", name);
+
+	if (!con)
+		g_error("unable to make connection to the bus");
+
+	if (g_dbus_connection_is_closed(con))
+		g_error("connection to the bus closed");
+
+	g_error("name '%s' lost on the bus", name);
+}
+
+static void print_version_and_exit(void)
+{
+	g_print("%s (libgpiod) v%s\n", g_get_prgname(), gpiodglib_api_version());
+
+	exit(EXIT_SUCCESS);
+}
+
+static void parse_opts(int argc, char **argv)
+{
+	gboolean ret, opt_debug = FALSE, opt_version = FALSE;
+	g_autoptr(GOptionContext) ctx = NULL;
+	g_auto(GStrv) remaining = NULL;
+	g_autoptr(GError) err = NULL;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "debug",
+			.short_name		= 'd',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_NONE,
+			.arg_data		= &opt_debug,
+			.description		= "Emit additional debug log messages.",
+		},
+		{
+			.long_name		= "version",
+			.short_name		= 'v',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_NONE,
+			.arg_data		= &opt_version,
+			.description		= "Print version and exit.",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &remaining,
+		},
+		{ }
+	};
+
+	ctx = g_option_context_new(NULL);
+	g_option_context_set_summary(ctx, "D-Bus daemon managing GPIOs.");
+	g_option_context_add_main_entries(ctx, opts, NULL);
+
+	ret = g_option_context_parse(ctx, &argc, &argv, &err);
+	if (!ret) {
+		g_printerr("Option parsing failed: %s\n\nUse %s --help\n",
+			   err->message, g_get_prgname());
+		exit(EXIT_FAILURE);
+	}
+
+	if (remaining) {
+		g_printerr("Option parsing failed: additional arguments are not allowed\n");
+		exit(EXIT_FAILURE);
+	}
+
+	if (opt_version)
+		print_version_and_exit();
+
+	if (opt_debug)
+		g_log_writer_default_set_debug_domains(debug_domains);
+}
+
+int main(int argc, char **argv)
+{
+	g_autoptr(GpiodbusDaemon) daemon = NULL;
+	g_autofree gchar *basename = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	guint bus_id;
+
+	basename = g_path_get_basename(argv[0]);
+	g_set_prgname(basename);
+	parse_opts(argc, argv);
+
+	g_message("initializing %s", g_get_prgname());
+
+	loop = g_main_loop_new(NULL, FALSE);
+	daemon = gpiodbus_daemon_new();
+
+	g_unix_signal_add(SIGTERM, on_sigterm, loop);
+	g_unix_signal_add(SIGINT, on_sigint, loop);
+	g_unix_signal_add(SIGHUP, on_sighup, NULL); /* Ignore SIGHUP. */
+
+	bus_id = g_bus_own_name(G_BUS_TYPE_SYSTEM, "io.gpiod1",
+				G_BUS_NAME_OWNER_FLAGS_NONE, on_bus_acquired,
+				on_name_acquired, on_name_lost, daemon, NULL);
+
+	g_message("%s started", g_get_prgname());
+
+	g_main_loop_run(loop);
+
+	g_bus_unown_name(bus_id);
+
+	g_message("%s exiting", g_get_prgname());
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/manager/helpers.c b/dbus/manager/helpers.c
new file mode 100644
index 0000000..6e90460
--- /dev/null
+++ b/dbus/manager/helpers.c
@@ -0,0 +1,431 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include "helpers.h"
+
+gint gpiodbus_id_cmp(gconstpointer a, gconstpointer b,
+		     gpointer user_data G_GNUC_UNUSED)
+{
+	const gint *id_a = a;
+	const gint *id_b = b;
+
+	if (*id_a < *id_b)
+		return -1;
+	else if (*id_a > *id_b)
+		return 1;
+
+	return 0;
+}
+
+static gboolean find_lowest(gpointer key, gpointer value G_GNUC_UNUSED,
+			    gpointer data)
+{
+	gint *lowest = data, *curr = key;
+
+	if (*lowest == *curr)
+		(*lowest)++;
+
+	return FALSE;
+}
+
+gint gpiodbus_id_alloc(GTree *id_root)
+{
+	gint lowest = 0, *key;
+
+	g_tree_foreach(id_root, find_lowest, &lowest);
+
+	key = g_malloc(sizeof(*key));
+	*key = lowest;
+	g_tree_insert(id_root, key, NULL);
+
+	return lowest;
+}
+
+void gpiodbus_id_free(GTree *id_root, gint id)
+{
+	g_assert(g_tree_remove(id_root, &id));
+}
+
+gboolean
+gpiodbus_chip_set_props(GpiodbusChip *skeleton, GpiodglibChip *chip,
+			GError **err)
+{
+	g_autoptr(GpiodglibChipInfo) info = NULL;
+	g_autofree gchar *label = NULL;
+	g_autofree gchar *path = NULL;
+	g_autofree gchar *name = NULL;
+
+	info = gpiodglib_chip_get_info(chip, err);
+	if (!info)
+		return FALSE;
+
+	name = gpiodglib_chip_info_dup_name(info);
+	label = gpiodglib_chip_info_dup_label(info);
+
+	gpiodbus_chip_set_name(skeleton, name);
+	gpiodbus_chip_set_label(skeleton, label);
+	gpiodbus_chip_set_num_lines(skeleton,
+				    gpiodglib_chip_info_get_num_lines(info));
+	path = gpiodglib_chip_dup_path(chip);
+	gpiodbus_chip_set_path(skeleton, path);
+	g_dbus_interface_skeleton_flush(G_DBUS_INTERFACE_SKELETON(skeleton));
+
+	return TRUE;
+}
+
+static const gchar *map_direction(GpiodglibLineDirection direction)
+{
+	switch (direction) {
+	case GPIODGLIB_LINE_DIRECTION_INPUT:
+		return "input";
+	case GPIODGLIB_LINE_DIRECTION_OUTPUT:
+		return "output";
+	default:
+		g_error("invalid direction value returned by libgpiod-glib");
+	}
+}
+
+static const gchar *map_edge(GpiodglibLineEdge edge)
+{
+	switch (edge) {
+	case GPIODGLIB_LINE_EDGE_NONE:
+		return "none";
+	case GPIODGLIB_LINE_EDGE_FALLING:
+		return "falling";
+	case GPIODGLIB_LINE_EDGE_RISING:
+		return "rising";
+	case GPIODGLIB_LINE_EDGE_BOTH:
+		return "both";
+	default:
+		g_error("invalid edge value returned by libgpiod-glib");
+	}
+}
+
+static const gchar *map_bias(GpiodglibLineBias bias)
+{
+	switch (bias) {
+	case GPIODGLIB_LINE_BIAS_UNKNOWN:
+		return "unknown";
+	case GPIODGLIB_LINE_BIAS_DISABLED:
+		return "disabled";
+	case GPIODGLIB_LINE_BIAS_PULL_UP:
+		return "pull-up";
+	case GPIODGLIB_LINE_BIAS_PULL_DOWN:
+		return "pull-down";
+	default:
+		g_error("invalid bias value returned by libgpiod-glib");
+	}
+}
+
+static const gchar *map_drive(GpiodglibLineDrive drive)
+{
+	switch (drive) {
+	case GPIODGLIB_LINE_DRIVE_PUSH_PULL:
+		return "push-pull";
+	case GPIODGLIB_LINE_DRIVE_OPEN_DRAIN:
+		return "open-drain";
+	case GPIODGLIB_LINE_DRIVE_OPEN_SOURCE:
+		return "open-source";
+	default:
+		g_error("invalid drive value returned by libgpiod-glib");
+	}
+}
+
+static const gchar *map_clock(GpiodglibLineClock event_clock)
+{
+	switch (event_clock) {
+	case GPIODGLIB_LINE_CLOCK_MONOTONIC:
+		return "monotonic";
+	case GPIODGLIB_LINE_CLOCK_REALTIME:
+		return "realtime";
+	case GPIODGLIB_LINE_CLOCK_HTE:
+		return "hte";
+	default:
+		g_error("invalid event clock value returned by libgpiod-glib");
+	}
+}
+
+void gpiodbus_line_set_props(GpiodbusLine *skeleton, GpiodglibLineInfo *info)
+{
+	g_autofree gchar *consumer = gpiodglib_line_info_dup_consumer(info);
+	g_autofree gchar *name = gpiodglib_line_info_dup_name(info);
+
+	gpiodbus_line_set_offset(skeleton,
+				 gpiodglib_line_info_get_offset(info));
+	gpiodbus_line_set_name(skeleton, name);
+	gpiodbus_line_set_used(skeleton, gpiodglib_line_info_is_used(info));
+	gpiodbus_line_set_consumer(skeleton, consumer);
+	gpiodbus_line_set_direction(skeleton,
+			map_direction(gpiodglib_line_info_get_direction(info)));
+	gpiodbus_line_set_edge_detection(skeleton,
+			map_edge(gpiodglib_line_info_get_edge_detection(info)));
+	gpiodbus_line_set_bias(skeleton,
+			       map_bias(gpiodglib_line_info_get_bias(info)));
+	gpiodbus_line_set_drive(skeleton,
+				map_drive(gpiodglib_line_info_get_drive(info)));
+	gpiodbus_line_set_active_low(skeleton,
+				     gpiodglib_line_info_is_active_low(info));
+	gpiodbus_line_set_debounced(skeleton,
+				    gpiodglib_line_info_is_debounced(info));
+	gpiodbus_line_set_debounce_period_us(skeleton,
+			gpiodglib_line_info_get_debounce_period_us(info));
+	gpiodbus_line_set_event_clock(skeleton,
+			map_clock(gpiodglib_line_info_get_event_clock(info)));
+	g_dbus_interface_skeleton_flush(G_DBUS_INTERFACE_SKELETON(skeleton));
+}
+
+static gint line_offset_cmp(gconstpointer a, gconstpointer b)
+{
+	GpiodbusObject *line_obj = (GpiodbusObject *)a;
+	GpiodbusLine *line;
+	const guint *offset = b;
+
+	line = gpiodbus_object_peek_line(line_obj);
+
+	return gpiodbus_line_get_offset(line) != *offset;
+}
+
+void gpiodbus_request_set_props(GpiodbusRequest *skeleton,
+				GpiodglibLineRequest *request, GpiodbusChip *chip,
+				GDBusObjectManager *line_manager)
+{
+	g_autolist(GpiodbusObject) line_objs = NULL;
+	g_autoptr(GStrvBuilder) builder = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_auto(GStrv) paths = NULL;
+	GList *found;
+	guint i;
+
+	offsets = gpiodglib_line_request_get_requested_offsets(request);
+	line_objs = g_dbus_object_manager_get_objects(line_manager);
+	builder = g_strv_builder_new();
+
+	for (i = 0; i < offsets->len; i++) {
+		found = g_list_find_custom(line_objs,
+					   &g_array_index(offsets, guint, i),
+					   line_offset_cmp);
+		if (found)
+			g_strv_builder_add(builder,
+					   g_dbus_object_get_object_path(
+						G_DBUS_OBJECT(found->data)));
+	}
+
+	paths = g_strv_builder_end(builder);
+
+	gpiodbus_request_set_chip_path(skeleton,
+			g_dbus_interface_skeleton_get_object_path(
+					G_DBUS_INTERFACE_SKELETON(chip)));
+	gpiodbus_request_set_line_paths(skeleton, (const gchar *const *)paths);
+	g_dbus_interface_skeleton_flush(G_DBUS_INTERFACE_SKELETON(skeleton));
+}
+
+static gboolean
+set_settings_from_variant(GpiodglibLineSettings *settings, const gchar *key,
+			  GVariant *val)
+{
+	GpiodglibLineDirection direction;
+	GpiodglibLineClock event_clock;
+	GpiodglibLineDrive drive;
+	GpiodglibLineEdge edge;
+	GpiodglibLineBias bias;
+	const gchar *str;
+
+	/* FIXME: Make it into a nice set of hashmaps and callbacks. */
+	if (g_strcmp0(key, "direction") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "input") == 0) {
+			direction = GPIODGLIB_LINE_DIRECTION_INPUT;
+		} else if (g_strcmp0(str, "output") == 0) {
+			direction = GPIODGLIB_LINE_DIRECTION_OUTPUT;
+		} else if (g_strcmp0(str, "as-is") == 0) {
+			direction = GPIODGLIB_LINE_DIRECTION_AS_IS;
+		} else {
+			g_critical("invalid direction value received: '%s'",
+				   str);
+			return FALSE;
+		}
+
+		gpiodglib_line_settings_set_direction(settings, direction);
+	} else if (g_strcmp0(key, "edge") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "falling") == 0) {
+			edge = GPIODGLIB_LINE_EDGE_FALLING;
+		} else if (g_strcmp0(str, "rising") == 0) {
+			edge = GPIODGLIB_LINE_EDGE_RISING;
+		} else if (g_strcmp0(str, "both") == 0) {
+			edge = GPIODGLIB_LINE_EDGE_BOTH;
+		} else {
+			g_critical("invalid edge value received: '%s'", str);
+			return FALSE;
+		}
+
+		gpiodglib_line_settings_set_edge_detection(settings, edge);
+	} else if (g_strcmp0(key, "active-low") == 0) {
+		if (g_variant_get_boolean(val))
+			gpiodglib_line_settings_set_active_low(settings, TRUE);
+	} else if (g_strcmp0(key, "bias") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "as-is") == 0) {
+			bias = GPIODGLIB_LINE_BIAS_AS_IS;
+		} else if (g_strcmp0(str, "pull-up") == 0) {
+			bias = GPIODGLIB_LINE_BIAS_PULL_UP;
+		} else if (g_strcmp0(str, "pull-down") == 0) {
+			bias = GPIODGLIB_LINE_BIAS_PULL_DOWN;
+		} else if (g_strcmp0(str, "disabled") == 0) {
+			bias = GPIODGLIB_LINE_BIAS_DISABLED;
+		} else {
+			g_critical("invalid bias value received: '%s'", str);
+			return FALSE;
+		}
+
+		gpiodglib_line_settings_set_bias(settings, bias);
+	} else if (g_strcmp0(key, "drive") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "push-pull") == 0) {
+			drive = GPIODGLIB_LINE_DRIVE_PUSH_PULL;
+		} else if (g_strcmp0(str, "open-drain") == 0) {
+			drive = GPIODGLIB_LINE_DRIVE_OPEN_DRAIN;
+		} else if (g_strcmp0(str, "open-source") == 0) {
+			drive = GPIODGLIB_LINE_DRIVE_OPEN_SOURCE;
+		} else {
+			g_critical("invalid drive value received: '%s'", str);
+			return FALSE;
+		}
+
+		gpiodglib_line_settings_set_drive(settings, drive);
+	} else if (g_strcmp0(key, "debounce-period") == 0) {
+		gpiodglib_line_settings_set_debounce_period_us(settings,
+						g_variant_get_int64(val));
+	} else if (g_strcmp0(key, "event-clock") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "monotonic") == 0) {
+			event_clock = GPIODGLIB_LINE_CLOCK_MONOTONIC;
+		} else if (g_strcmp0(str, "realtime") == 0) {
+			event_clock = GPIODGLIB_LINE_CLOCK_REALTIME;
+		} else if (g_strcmp0(str, "hte") == 0) {
+			event_clock = GPIODGLIB_LINE_CLOCK_HTE;
+		} else {
+			g_critical("invalid event clock value received: '%s'",
+				   str);
+			return FALSE;
+		}
+
+		gpiodglib_line_settings_set_event_clock(settings, event_clock);
+	} else {
+		g_critical("invalid config option received: '%s'", key);
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+GpiodglibLineConfig *gpiodbus_line_config_from_variant(GVariant *variant)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GVariant) output_values_v = NULL;
+	g_autoptr(GVariant) line_configs_v = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	GVariantIter iter0, iter1;
+	guint offset;
+	gboolean ret;
+	GVariant *v;
+	gchar *k;
+	gint val;
+
+	line_configs_v = g_variant_get_child_value(variant, 0);
+	output_values_v = g_variant_get_child_value(variant, 1);
+
+	config = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(NULL);
+
+	g_variant_iter_init(&iter0, line_configs_v);
+	while ((v = g_variant_iter_next_value(&iter0))) {
+		g_autoptr(GVariant) line_settings_v = NULL;
+		g_autoptr(GVariant) line_config_v = v;
+		g_autoptr(GVariant) offsets_v = NULL;
+		g_autoptr(GArray) offsets = NULL;
+
+		offsets_v = g_variant_get_child_value(line_config_v, 0);
+		line_settings_v = g_variant_get_child_value(line_config_v, 1);
+
+		gpiodglib_line_settings_reset(settings);
+		g_variant_iter_init(&iter1, line_settings_v);
+		while (g_variant_iter_next(&iter1, "{sv}", &k, &v)) {
+			g_autoptr(GVariant) val = v;
+			g_autofree gchar *key = k;
+
+			ret = set_settings_from_variant(settings, key, val);
+			if (!ret)
+				return NULL;
+		}
+
+		offsets = g_array_sized_new(FALSE, TRUE, sizeof(guint),
+					    g_variant_n_children(offsets_v));
+		g_variant_iter_init(&iter1, offsets_v);
+		while (g_variant_iter_next(&iter1, "u", &offset))
+			g_array_append_val(offsets, offset);
+
+		ret = gpiodglib_line_config_add_line_settings(config, offsets,
+							      settings, &err);
+		if (!ret) {
+			g_critical("failed to add line settings: %s",
+				   err->message);
+			return NULL;
+		}
+	}
+
+	values = g_array_sized_new(FALSE, TRUE, sizeof(gint),
+				   g_variant_n_children(output_values_v));
+	g_variant_iter_init(&iter0, output_values_v);
+	while (g_variant_iter_next(&iter0, "i", &val))
+		g_array_append_val(values, val);
+
+	if (values->len > 0) {
+		ret = gpiodglib_line_config_set_output_values(config, values,
+							      &err);
+		if (!ret) {
+			g_critical("failed to set output values: %s",
+				   err->message);
+			return NULL;
+		}
+	}
+
+	return g_object_ref(config);
+}
+
+GpiodglibRequestConfig *gpiodbus_request_config_from_variant(GVariant *variant)
+{
+	g_autoptr(GpiodglibRequestConfig) config = NULL;
+	GVariantIter iter;
+	GVariant *v;
+	gchar *k;
+
+	config = gpiodglib_request_config_new(NULL);
+
+	g_variant_iter_init(&iter, variant);
+	while (g_variant_iter_next(&iter, "{sv}", &k, &v)) {
+		g_autoptr(GVariant) val = v;
+		g_autofree gchar *key = k;
+
+		if (g_strcmp0(key, "consumer") == 0) {
+			gpiodglib_request_config_set_consumer(config,
+					g_variant_get_string(val, NULL));
+		} else if (g_strcmp0(key, "event-buffer-size") == 0) {
+			gpiodglib_request_config_set_event_buffer_size(config,
+						g_variant_get_uint32(val));
+		} else {
+			g_critical("invalid request config option received: '%s'",
+				   key);
+			return NULL;
+		}
+	}
+
+	return g_object_ref(config);
+}
diff --git a/dbus/manager/helpers.h b/dbus/manager/helpers.h
new file mode 100644
index 0000000..6ad83bd
--- /dev/null
+++ b/dbus/manager/helpers.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODBUS_HELPERS_H__
+#define __GPIODBUS_HELPERS_H__
+
+#include <gio/gio.h>
+#include <gpiod-glib.h>
+#include <glib.h>
+#include <gpiodbus.h>
+
+gint gpiodbus_id_cmp(gconstpointer a, gconstpointer b, gpointer user_data);
+gint gpiodbus_id_alloc(GTree *id_root);
+void gpiodbus_id_free(GTree *id_root, gint id);
+gboolean
+gpiodbus_chip_set_props(GpiodbusChip *skeleton, GpiodglibChip *chip,
+			GError **err);
+void gpiodbus_line_set_props(GpiodbusLine *skeleton, GpiodglibLineInfo *info);
+void gpiodbus_request_set_props(GpiodbusRequest *skeleton,
+				GpiodglibLineRequest *request,
+				GpiodbusChip *chip,
+				GDBusObjectManager *line_manager);
+GpiodglibLineConfig *gpiodbus_line_config_from_variant(GVariant *variant);
+GpiodglibRequestConfig *gpiodbus_request_config_from_variant(GVariant *variant);
+
+#endif /* __GPIODBUS_HELPERS_H__ */
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
diff --git a/dbus/tests/daemon-process.c b/dbus/tests/daemon-process.c
new file mode 100644
index 0000000..e65183e
--- /dev/null
+++ b/dbus/tests/daemon-process.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <signal.h>
+
+#include "daemon-process.h"
+
+struct _GpiodbusDaemonProcess {
+	GObject parent_instance;
+	GSubprocess *proc;
+};
+
+G_DEFINE_TYPE(GpiodbusDaemonProcess, gpiodbus_daemon_process, G_TYPE_OBJECT);
+
+static gboolean on_timeout(gpointer data G_GNUC_UNUSED)
+{
+	g_error("timeout reached waiting for the daemon name to appear on the system bus");
+
+	return G_SOURCE_REMOVE;
+}
+
+static void on_name_appeared(GDBusConnection *con G_GNUC_UNUSED,
+			     const gchar *name G_GNUC_UNUSED,
+			     const gchar *name_owner G_GNUC_UNUSED,
+			     gpointer data)
+{
+	gboolean *name_state = data;
+
+	*name_state = TRUE;
+}
+
+static void gpiodbus_daemon_process_constructed(GObject *obj)
+{
+	GpiodbusDaemonProcess *self = GPIODBUS_DAEMON_PROCESS_OBJ(obj);
+	const gchar *path = g_getenv("GPIODBUS_TEST_DAEMON_PATH");
+	g_autoptr(GDBusConnection) con = NULL;
+	g_autofree gchar *addr = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean name_state = FALSE;
+	guint watch_id, timeout_id;
+
+	if (!path)
+		g_error("GPIODBUS_TEST_DAEMON_PATH environment variable must be set");
+
+	addr = g_dbus_address_get_for_bus_sync(G_BUS_TYPE_SYSTEM, NULL, &err);
+	if (!addr)
+		g_error("failed to get an address for system bus: %s",
+			err->message);
+
+	con = g_dbus_connection_new_for_address_sync(addr,
+			G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT |
+			G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
+			NULL, NULL, &err);
+	if (!con)
+		g_error("failed to get a dbus connection: %s", err->message);
+
+	watch_id = g_bus_watch_name_on_connection(con, "io.gpiod1",
+						  G_BUS_NAME_WATCHER_FLAGS_NONE,
+						  on_name_appeared, NULL,
+						  &name_state, NULL);
+
+	self->proc = g_subprocess_new(G_SUBPROCESS_FLAGS_STDOUT_SILENCE |
+				      G_SUBPROCESS_FLAGS_STDERR_SILENCE,
+				      &err, path, NULL);
+	if (!self->proc)
+		g_error("failed to launch the gpio-manager process: %s",
+			err->message);
+
+	timeout_id = g_timeout_add_seconds(5, on_timeout, NULL);
+
+	while (!name_state)
+		g_main_context_iteration(NULL, TRUE);
+
+	g_bus_unwatch_name(watch_id);
+	g_source_remove(timeout_id);
+
+	G_OBJECT_CLASS(gpiodbus_daemon_process_parent_class)->constructed(obj);
+}
+
+static void gpiodbus_daemon_process_kill(GSubprocess *proc)
+{
+	g_autoptr(GError) err = NULL;
+	gint status;
+
+	g_subprocess_send_signal(proc, SIGTERM);
+	g_subprocess_wait(proc, NULL, &err);
+	if (err)
+		g_error("failed to collect the exit status of gpio-manager: %s",
+			err->message);
+
+	if (!g_subprocess_get_if_exited(proc))
+		g_error("dbus-manager process did not exit normally");
+
+	status = g_subprocess_get_exit_status(proc);
+	if (status != 0)
+		g_error("dbus-manager process exited with a non-zero status: %d",
+			status);
+
+	g_object_unref(proc);
+}
+
+static void gpiodbus_daemon_process_dispose(GObject *obj)
+{
+	GpiodbusDaemonProcess *self = GPIODBUS_DAEMON_PROCESS_OBJ(obj);
+
+	g_clear_pointer(&self->proc, gpiodbus_daemon_process_kill);
+
+	G_OBJECT_CLASS(gpiodbus_daemon_process_parent_class)->dispose(obj);
+}
+
+static void
+gpiodbus_daemon_process_class_init(GpiodbusDaemonProcessClass *proc_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(proc_class);
+
+	class->constructed = gpiodbus_daemon_process_constructed;
+	class->dispose = gpiodbus_daemon_process_dispose;
+}
+
+static void gpiodbus_daemon_process_init(GpiodbusDaemonProcess *self)
+{
+	self->proc = NULL;
+}
+
+GpiodbusDaemonProcess *gpiodbus_daemon_process_new(void)
+{
+	return g_object_new(GPIODBUS_DAEMON_PROCESS_TYPE, NULL);
+}
diff --git a/dbus/tests/daemon-process.h b/dbus/tests/daemon-process.h
new file mode 100644
index 0000000..f5f453b
--- /dev/null
+++ b/dbus/tests/daemon-process.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODBUS_TEST_DAEMON_PROCESS_H__
+#define __GPIODBUS_TEST_DAEMON_PROCESS_H__
+
+#include <glib.h>
+
+G_DECLARE_FINAL_TYPE(GpiodbusDaemonProcess, gpiodbus_daemon_process,
+		     GPIODBUS, DAEMON_PROCESS, GObject);
+
+#define GPIODBUS_DAEMON_PROCESS_TYPE (gpiodbus_daemon_process_get_type())
+#define GPIODBUS_DAEMON_PROCESS_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST(obj, \
+	 GPIODBUS_DAEMON_PROCESS_TYPE, \
+	 GpiodbusDaemonProcess))
+
+GpiodbusDaemonProcess *gpiodbus_daemon_process_new(void);
+
+#endif /* __GPIODBUS_TEST_DAEMON_PROCESS_H__ */
diff --git a/dbus/tests/helpers.c b/dbus/tests/helpers.c
new file mode 100644
index 0000000..f0089a0
--- /dev/null
+++ b/dbus/tests/helpers.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "helpers.h"
+
+GDBusConnection *gpiodbus_test_get_dbus_connection(void)
+{
+	g_autoptr(GDBusConnection) con = NULL;
+	g_autofree gchar *addr = NULL;
+	g_autoptr(GError) err = NULL;
+
+	addr = g_dbus_address_get_for_bus_sync(G_BUS_TYPE_SYSTEM, NULL, &err);
+	if (!addr)
+		g_error("Failed to get address on the bus: %s", err->message);
+
+	con = g_dbus_connection_new_for_address_sync(addr,
+		G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT |
+		G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
+		NULL, NULL, &err);
+	if (!con)
+		g_error("Failed to get system bus connection: %s",
+			err->message);
+
+	return g_object_ref(con);
+}
+
+typedef struct {
+	gboolean *added;
+	gchar *obj_path;
+} OnObjectAddedData;
+
+static void on_object_added(GDBusObjectManager *manager G_GNUC_UNUSED,
+			    GpiodbusObject *object, gpointer data)
+{
+	OnObjectAddedData *cb_data = data;
+	const gchar *path;
+
+	path = g_dbus_object_get_object_path(G_DBUS_OBJECT(object));
+
+	if (g_strcmp0(path, cb_data->obj_path) == 0)
+		*cb_data->added = TRUE;
+}
+
+static gboolean on_timeout(gpointer data G_GNUC_UNUSED)
+{
+	g_error("timeout reached waiting for the gpiochip interface to appear on the bus");
+
+	return G_SOURCE_REMOVE;
+}
+
+void gpiodbus_test_wait_for_sim_intf(GPIOSimChip *sim)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GDBusConnection) con = NULL;
+	g_autoptr(GpiodbusObject) obj = NULL;
+	g_autoptr(GError) err = NULL;
+	g_autofree gchar *obj_path;
+	OnObjectAddedData cb_data;
+	gboolean added = FALSE;
+	guint timeout_id;
+
+	con = gpiodbus_test_get_dbus_connection();
+	if (!con)
+		g_error("failed to obtain a bus connection: %s", err->message);
+
+	obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+				   g_gpiosim_chip_get_name(sim));
+
+	cb_data.added = &added;
+	cb_data.obj_path = obj_path;
+
+	manager = gpiodbus_object_manager_client_new_sync(con,
+				G_DBUS_OBJECT_MANAGER_CLIENT_FLAGS_NONE,
+				"io.gpiod1", "/io/gpiod1/chips", NULL, &err);
+	if (!manager)
+		g_error("failed to create the object manager client: %s",
+			err->message);
+
+	g_signal_connect(manager, "object-added", G_CALLBACK(on_object_added),
+			 &cb_data);
+
+	obj = GPIODBUS_OBJECT(g_dbus_object_manager_get_object(manager,
+							       obj_path));
+	if (obj) {
+		if (g_strcmp0(g_dbus_object_get_object_path(G_DBUS_OBJECT(obj)),
+			      obj_path) == 0)
+			added = TRUE;
+	}
+
+	timeout_id = g_timeout_add_seconds(5, on_timeout, NULL);
+
+	while (!added)
+		g_main_context_iteration(NULL, TRUE);
+
+	g_source_remove(timeout_id);
+}
+
+GVariant *gpiodbus_test_make_empty_request_config(void)
+{
+	GVariantBuilder builder;
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE("a{sv}"));
+
+	return g_variant_ref_sink(g_variant_builder_end(&builder));
+}
diff --git a/dbus/tests/helpers.h b/dbus/tests/helpers.h
new file mode 100644
index 0000000..b0be279
--- /dev/null
+++ b/dbus/tests/helpers.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODBUS_TEST_INTERNAL_H__
+#define __GPIODBUS_TEST_INTERNAL_H__
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <gpiodbus.h>
+#include <gpiosim-glib.h>
+
+#define __gpiodbus_test_check_gboolean_and_error(_ret, _err) \
+	do { \
+		g_assert_true(_ret); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+#define __gpiodbus_test_check_nonnull_and_error(_ptr, _err) \
+	do { \
+		g_assert_nonnull(_ptr); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+#define gpiodbus_test_get_chip_proxy_or_fail(_obj_path) \
+	({ \
+		g_autoptr(GDBusConnection) _con = NULL; \
+		g_autoptr(GError) _err = NULL; \
+		g_autoptr(GpiodbusChip) _chip = NULL; \
+		_con = gpiodbus_test_get_dbus_connection(); \
+		_chip = gpiodbus_chip_proxy_new_sync(_con, \
+						     G_DBUS_PROXY_FLAGS_NONE, \
+						     "io.gpiod1", _obj_path, \
+						     NULL, &_err); \
+		__gpiodbus_test_check_nonnull_and_error(_chip, _err); \
+		g_object_ref(_chip); \
+	})
+
+#define gpiodbus_test_get_line_proxy_or_fail(_obj_path) \
+	({ \
+		g_autoptr(GDBusConnection) _con = NULL; \
+		g_autoptr(GError) _err = NULL; \
+		g_autoptr(GpiodbusLine) _line = NULL; \
+		_con = gpiodbus_test_get_dbus_connection(); \
+		_line = gpiodbus_line_proxy_new_sync(_con, \
+						     G_DBUS_PROXY_FLAGS_NONE, \
+						     "io.gpiod1", _obj_path, \
+						     NULL, &_err); \
+		__gpiodbus_test_check_nonnull_and_error(_line, _err); \
+		g_object_ref(_line); \
+	})
+
+#define gpiodbus_test_get_request_proxy_or_fail(_obj_path) \
+	({ \
+		g_autoptr(GDBusConnection) _con = NULL; \
+		g_autoptr(GError) _err = NULL; \
+		g_autoptr(GpiodbusRequest) _req = NULL; \
+		_con = gpiodbus_test_get_dbus_connection(); \
+		_req = gpiodbus_request_proxy_new_sync(_con, \
+						G_DBUS_PROXY_FLAGS_NONE, \
+						"io.gpiod1", _obj_path, \
+						NULL, &_err); \
+		__gpiodbus_test_check_nonnull_and_error(_req, _err); \
+		g_object_ref(_req); \
+	})
+
+#define gpiodbus_test_get_chip_object_manager_or_fail() \
+	({ \
+		g_autoptr(GDBusObjectManager) _manager = NULL; \
+		g_autoptr(GDBusConnection) _con = NULL; \
+		g_autoptr(GError) _err = NULL; \
+		_con = gpiodbus_test_get_dbus_connection(); \
+		_manager = gpiodbus_object_manager_client_new_sync( \
+				_con, \
+				G_DBUS_OBJECT_MANAGER_CLIENT_FLAGS_NONE, \
+				"io.gpiod1", "/io/gpiod1/chips", NULL, \
+				&_err); \
+		__gpiodbus_test_check_nonnull_and_error(_manager, _err); \
+		g_object_ref(_manager); \
+	})
+
+#define gpiodbus_test_chip_call_request_lines_sync_or_fail(_chip, \
+							   _line_config, \
+							   _request_config, \
+							   _request_path) \
+	do { \
+		g_autoptr(GError) _err = NULL; \
+		gboolean _ret; \
+		_ret = gpiodbus_chip_call_request_lines_sync( \
+						_chip, _line_config, \
+						_request_config, \
+						G_DBUS_CALL_FLAGS_NONE, -1, \
+						_request_path, NULL, &_err); \
+		__gpiodbus_test_check_gboolean_and_error(_ret, _err); \
+	} while (0)
+
+#define gpiodbus_test_request_call_release_sync_or_fail(_request) \
+	do { \
+		g_autoptr(GError) _err = NULL; \
+		gboolean _ret; \
+		_ret = gpiodbus_request_call_release_sync( \
+						_request, \
+						G_DBUS_CALL_FLAGS_NONE, \
+						-1, NULL, &_err); \
+		__gpiodbus_test_check_gboolean_and_error(_ret, _err); \
+	} while (0)
+
+GDBusConnection *gpiodbus_test_get_dbus_connection(void);
+void gpiodbus_test_wait_for_sim_intf(GPIOSimChip *sim);
+GVariant *gpiodbus_test_make_empty_request_config(void);
+
+#endif /* __GPIODBUS_TEST_INTERNAL_H__ */
+
diff --git a/dbus/tests/tests-chip.c b/dbus/tests/tests-chip.c
new file mode 100644
index 0000000..bfb5e3c
--- /dev/null
+++ b/dbus/tests/tests-chip.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiodbus.h>
+#include <gpiosim-glib.h>
+
+#include "daemon-process.h"
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "gpiodbus/chip"
+
+GPIOD_TEST_CASE(read_chip_info)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8,
+							"label", "foobar",
+							NULL);
+	g_autoptr(GpiodbusDaemonProcess) mgr = NULL;
+	g_autoptr(GpiodbusChip) chip = NULL;
+	g_autofree gchar *obj_path = NULL;
+
+	mgr = gpiodbus_daemon_process_new();
+	gpiodbus_test_wait_for_sim_intf(sim);
+
+	obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+				   g_gpiosim_chip_get_name(sim));
+	chip = gpiodbus_test_get_chip_proxy_or_fail(obj_path);
+
+	g_assert_cmpstr(gpiodbus_chip_get_name(chip), ==,
+			g_gpiosim_chip_get_name(sim));
+	g_assert_cmpstr(gpiodbus_chip_get_label(chip), ==, "foobar");
+	g_assert_cmpuint(gpiodbus_chip_get_num_lines(chip), ==, 8);
+	g_assert_cmpstr(gpiodbus_chip_get_path(chip), ==,
+			g_gpiosim_chip_get_dev_path(sim));
+}
+
+static gboolean on_timeout(gpointer user_data)
+{
+	gboolean *timed_out = user_data;
+
+	*timed_out = TRUE;
+
+	return G_SOURCE_REMOVE;
+}
+
+static void on_object_event(GDBusObjectManager *manager G_GNUC_UNUSED,
+			    GpiodbusObject *object, gpointer user_data)
+{
+	gchar **obj_path = user_data;
+
+	*obj_path = g_strdup(g_dbus_object_get_object_path(
+						G_DBUS_OBJECT(object)));
+}
+
+GPIOD_TEST_CASE(chip_added)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GpiodbusDaemonProcess) mgr = NULL;
+	g_autofree gchar *sim_obj_path = NULL;
+	g_autoptr(GPIOSimChip) sim = NULL;
+	g_autofree gchar *obj_path = NULL;
+	gboolean timed_out = FALSE;
+	guint timeout_id;
+
+	mgr = gpiodbus_daemon_process_new();
+
+	manager = gpiodbus_test_get_chip_object_manager_or_fail();
+
+	g_signal_connect(manager, "object-added", G_CALLBACK(on_object_event),
+			 &obj_path);
+	timeout_id = g_timeout_add_seconds(5, on_timeout, &timed_out);
+
+	sim = g_gpiosim_chip_new(NULL);
+
+	while (!obj_path && !timed_out)
+		g_main_context_iteration(NULL, TRUE);
+
+	if (timed_out) {
+		g_test_fail_printf("timeout reached waiting for chip to be added");
+		return;
+	}
+
+	sim_obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+				       g_gpiosim_chip_get_name(sim));
+
+	g_assert_cmpstr(sim_obj_path, ==, obj_path);
+
+	g_source_remove(timeout_id);
+}
+
+GPIOD_TEST_CASE(chip_removed)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GpiodbusDaemonProcess) mgr = NULL;
+	g_autofree gchar *sim_obj_path = NULL;
+	g_autoptr(GpiodbusChip) chip = NULL;
+	g_autofree gchar *obj_path = NULL;
+	gboolean timed_out = FALSE;
+	guint timeout_id;
+
+	sim_obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+				       g_gpiosim_chip_get_name(sim));
+
+	mgr = gpiodbus_daemon_process_new();
+	gpiodbus_test_wait_for_sim_intf(sim);
+
+	obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+				   g_gpiosim_chip_get_name(sim));
+	chip = gpiodbus_test_get_chip_proxy_or_fail(obj_path);
+	manager = gpiodbus_test_get_chip_object_manager_or_fail();
+
+	g_signal_connect(manager, "object-removed", G_CALLBACK(on_object_event),
+			 &obj_path);
+	timeout_id = g_timeout_add_seconds(5, on_timeout, &timed_out);
+
+	g_clear_object(&sim);
+
+	while (!obj_path && !timed_out)
+		g_main_context_iteration(NULL, TRUE);
+
+	if (timed_out) {
+		g_test_fail_printf("timeout reached waiting for chip to be removed");
+		return;
+	}
+
+	g_assert_cmpstr(sim_obj_path, ==, obj_path);
+
+	g_source_remove(timeout_id);
+}
diff --git a/dbus/tests/tests-line.c b/dbus/tests/tests-line.c
new file mode 100644
index 0000000..309e6c4
--- /dev/null
+++ b/dbus/tests/tests-line.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiodbus.h>
+#include <gpiosim-glib.h>
+
+#include "daemon-process.h"
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "gpiodbus/line"
+
+GPIOD_TEST_CASE(read_line_properties)
+{
+	static const GPIOSimLineName names[] = {
+		{ .offset = 1, .name = "foo", },
+		{ .offset = 2, .name = "bar", },
+		{ .offset = 4, .name = "baz", },
+		{ .offset = 5, .name = "xyz", },
+		{ }
+	};
+
+	static const GPIOSimHog hogs[] = {
+		{
+			.offset = 3,
+			.name = "hog3",
+			.direction = G_GPIOSIM_DIRECTION_OUTPUT_HIGH,
+		},
+		{
+			.offset = 4,
+			.name = "hog4",
+			.direction = G_GPIOSIM_DIRECTION_OUTPUT_LOW,
+		},
+		{ }
+	};
+
+	g_autoptr(GpiodbusDaemonProcess) mgr = NULL;
+	g_autoptr(GpiodbusLine) line4 = NULL;
+	g_autoptr(GpiodbusLine) line6 = NULL;
+	g_autofree gchar *obj_path_4 = NULL;
+	g_autofree gchar *obj_path_6 = NULL;
+	g_autoptr(GPIOSimChip) sim = NULL;
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
+	g_autoptr(GVariant) vhogs = g_gpiosim_package_hogs(hogs);
+
+	sim = g_gpiosim_chip_new(
+			"num-lines", 8,
+			"line-names", vnames,
+			"hogs", vhogs,
+			NULL);
+
+	mgr = gpiodbus_daemon_process_new();
+	gpiodbus_test_wait_for_sim_intf(sim);
+
+	obj_path_4 = g_strdup_printf("/io/gpiod1/chips/%s/line4",
+				     g_gpiosim_chip_get_name(sim));
+	line4 = gpiodbus_test_get_line_proxy_or_fail(obj_path_4);
+
+	obj_path_6 = g_strdup_printf("/io/gpiod1/chips/%s/line6",
+				     g_gpiosim_chip_get_name(sim));
+	line6 = gpiodbus_test_get_line_proxy_or_fail(obj_path_6);
+
+	g_assert_cmpuint(gpiodbus_line_get_offset(line4), ==, 4);
+	g_assert_cmpstr(gpiodbus_line_get_name(line4), ==, "baz");
+	g_assert_cmpstr(gpiodbus_line_get_consumer(line4), ==, "hog4");
+	g_assert_true(gpiodbus_line_get_used(line4));
+	g_assert_false(gpiodbus_line_get_managed(line4));
+	g_assert_cmpstr(gpiodbus_line_get_direction(line4), ==, "output");
+	g_assert_cmpstr(gpiodbus_line_get_edge_detection(line4), ==, "none");
+	g_assert_false(gpiodbus_line_get_active_low(line4));
+	g_assert_cmpstr(gpiodbus_line_get_bias(line4), ==, "unknown");
+	g_assert_cmpstr(gpiodbus_line_get_drive(line4), ==, "push-pull");
+	g_assert_cmpstr(gpiodbus_line_get_event_clock(line4), ==, "monotonic");
+	g_assert_false(gpiodbus_line_get_debounced(line4));
+	g_assert_cmpuint(gpiodbus_line_get_debounce_period_us(line4), ==, 0);
+
+	g_assert_cmpuint(gpiodbus_line_get_offset(line6), ==, 6);
+	g_assert_cmpstr(gpiodbus_line_get_name(line6), ==, "");
+	g_assert_cmpstr(gpiodbus_line_get_consumer(line6), ==, "");
+	g_assert_false(gpiodbus_line_get_used(line6));
+}
+
+static gboolean on_timeout(gpointer user_data)
+{
+	gboolean *timed_out = user_data;
+
+	*timed_out = TRUE;
+
+	return G_SOURCE_REMOVE;
+}
+
+static void
+on_properties_changed(GpiodbusLine *line G_GNUC_UNUSED,
+		      GVariant *changed_properties,
+		      GStrv invalidated_properties G_GNUC_UNUSED,
+		      gpointer user_data)
+{
+	GHashTable *changed_props = user_data;
+	GVariantIter iter;
+	GVariant *variant;
+	gchar *str;
+
+	g_variant_iter_init(&iter, changed_properties);
+	while (g_variant_iter_next(&iter, "{sv}", &str, &variant)) {
+		g_hash_table_insert(changed_props, str, NULL);
+		g_variant_unref(variant);
+	}
+}
+
+static void check_props_requested(GHashTable *props)
+{
+	if (!g_hash_table_contains(props, "Direction") ||
+	    !g_hash_table_contains(props, "Consumer") ||
+	    !g_hash_table_contains(props, "Used") ||
+	    !g_hash_table_contains(props, "RequestPath") ||
+	    !g_hash_table_contains(props, "Managed"))
+		g_test_fail_printf("Not all expected properties have changed");
+}
+
+static void check_props_released(GHashTable *props)
+{
+	if (!g_hash_table_contains(props, "RequestPath") ||
+	    !g_hash_table_contains(props, "Consumer") ||
+	    !g_hash_table_contains(props, "Used") ||
+	    !g_hash_table_contains(props, "Managed"))
+		g_test_fail_printf("Not all expected properties have changed");
+}
+
+static GVariant *make_props_changed_line_config(void)
+{
+	g_autoptr(GVariant) output_values = NULL;
+	g_autoptr(GVariant) line_settings = NULL;
+	g_autoptr(GVariant) line_offsets = NULL;
+	g_autoptr(GVariant) line_configs = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	GVariantBuilder builder;
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	g_variant_builder_add_value(&builder, g_variant_new_uint32(4));
+	line_offsets = g_variant_builder_end(&builder);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	g_variant_builder_add_value(&builder,
+				g_variant_new("{sv}", "direction",
+					      g_variant_new_string("output")));
+	line_settings = g_variant_builder_end(&builder);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_TUPLE);
+	g_variant_builder_add_value(&builder, g_variant_ref(line_offsets));
+	g_variant_builder_add_value(&builder, g_variant_ref(line_settings));
+	line_config = g_variant_builder_end(&builder);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	g_variant_builder_add_value(&builder, g_variant_ref(line_config));
+	line_configs = g_variant_builder_end(&builder);
+
+	output_values = g_variant_new("ai", NULL);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_TUPLE);
+	g_variant_builder_add_value(&builder, g_variant_ref(line_configs));
+	g_variant_builder_add_value(&builder, g_variant_ref(output_values));
+
+	return g_variant_ref_sink(g_variant_builder_end(&builder));
+}
+
+GPIOD_TEST_CASE(properties_changed)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodbusDaemonProcess) mgr = NULL;
+	g_autoptr(GHashTable) changed_props = NULL;
+	g_autoptr(GpiodbusRequest) request = NULL;
+	g_autoptr(GVariant) request_config = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	g_autofree gchar *line_obj_path = NULL;
+	g_autofree gchar *chip_obj_path = NULL;
+	g_autofree gchar *request_path = NULL;
+	g_autoptr(GpiodbusChip) chip = NULL;
+	g_autoptr(GpiodbusLine) line = NULL;
+	gboolean timed_out = FALSE;
+	guint timeout_id;
+
+	mgr = gpiodbus_daemon_process_new();
+	gpiodbus_test_wait_for_sim_intf(sim);
+
+	line_obj_path = g_strdup_printf("/io/gpiod1/chips/%s/line4",
+					g_gpiosim_chip_get_name(sim));
+	line = gpiodbus_test_get_line_proxy_or_fail(line_obj_path);
+
+	chip_obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+					g_gpiosim_chip_get_name(sim));
+	chip = gpiodbus_test_get_chip_proxy_or_fail(chip_obj_path);
+
+	changed_props = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
+						      NULL);
+
+	g_signal_connect(line, "g-properties-changed",
+			 G_CALLBACK(on_properties_changed), changed_props);
+	timeout_id = g_timeout_add_seconds(5, on_timeout, &timed_out);
+
+	line_config = make_props_changed_line_config();
+	request_config = gpiodbus_test_make_empty_request_config();
+
+	gpiodbus_test_chip_call_request_lines_sync_or_fail(chip, line_config,
+							   request_config,
+							   &request_path);
+
+	while (g_hash_table_size(changed_props) < 5 && !timed_out)
+		g_main_context_iteration(NULL, TRUE);
+
+	check_props_requested(changed_props);
+
+	g_hash_table_destroy(g_hash_table_ref(changed_props));
+
+	request = gpiodbus_test_get_request_proxy_or_fail(request_path);
+	gpiodbus_test_request_call_release_sync_or_fail(request);
+
+	while (g_hash_table_size(changed_props) < 4 && !timed_out)
+		g_main_context_iteration(NULL, TRUE);
+
+	check_props_released(changed_props);
+
+	if (timed_out) {
+		g_test_fail_printf("timeout reached waiting for line properties to change");
+		return;
+	}
+
+	g_source_remove(timeout_id);
+}
diff --git a/dbus/tests/tests-request.c b/dbus/tests/tests-request.c
new file mode 100644
index 0000000..c84e528
--- /dev/null
+++ b/dbus/tests/tests-request.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiodbus.h>
+#include <gpiosim-glib.h>
+
+#include "daemon-process.h"
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "gpiodbus/request"
+
+static GVariant *make_empty_request_config(void)
+{
+	GVariantBuilder builder;
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE("a{sv}"));
+
+	return g_variant_ref_sink(g_variant_builder_end(&builder));
+}
+
+static GVariant *make_input_lines_line_config(void)
+{
+	g_autoptr(GVariant) output_values = NULL;
+	g_autoptr(GVariant) line_settings = NULL;
+	g_autoptr(GVariant) line_offsets = NULL;
+	g_autoptr(GVariant) line_configs = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	GVariantBuilder builder;
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	g_variant_builder_add_value(&builder, g_variant_new_uint32(3));
+	g_variant_builder_add_value(&builder, g_variant_new_uint32(5));
+	g_variant_builder_add_value(&builder, g_variant_new_uint32(7));
+	line_offsets = g_variant_builder_end(&builder);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	g_variant_builder_add_value(&builder,
+				g_variant_new("{sv}", "direction",
+					      g_variant_new_string("input")));
+	line_settings = g_variant_builder_end(&builder);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_TUPLE);
+	g_variant_builder_add_value(&builder, g_variant_ref(line_offsets));
+	g_variant_builder_add_value(&builder, g_variant_ref(line_settings));
+	line_config = g_variant_builder_end(&builder);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	g_variant_builder_add_value(&builder, g_variant_ref(line_config));
+	line_configs = g_variant_builder_end(&builder);
+
+	output_values = g_variant_new("ai", NULL);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_TUPLE);
+	g_variant_builder_add_value(&builder, g_variant_ref(line_configs));
+	g_variant_builder_add_value(&builder, g_variant_ref(output_values));
+
+	return g_variant_ref_sink(g_variant_builder_end(&builder));
+}
+
+GPIOD_TEST_CASE(request_input_lines)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodbusDaemonProcess) mgr = NULL;
+	g_autoptr(GVariant) request_config = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	g_autofree gchar *request_path = NULL;
+	g_autoptr(GpiodbusChip) chip = NULL;
+	g_autofree gchar *obj_path = NULL;
+
+	mgr = gpiodbus_daemon_process_new();
+	gpiodbus_test_wait_for_sim_intf(sim);
+
+	obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+				   g_gpiosim_chip_get_name(sim));
+	chip = gpiodbus_test_get_chip_proxy_or_fail(obj_path);
+
+	line_config = make_input_lines_line_config();
+	request_config = make_empty_request_config();
+
+	gpiodbus_test_chip_call_request_lines_sync_or_fail(chip, line_config,
+							   request_config,
+							   &request_path);
+}
+
+GPIOD_TEST_CASE(release_request)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodbusDaemonProcess) mgr = NULL;
+	g_autoptr(GVariant) request_config = NULL;
+	g_autoptr(GpiodbusRequest) request = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	g_autofree gchar *request_path = NULL;
+	g_autoptr(GpiodbusChip) chip = NULL;
+	g_autofree gchar *obj_path = NULL;
+
+	mgr = gpiodbus_daemon_process_new();
+	gpiodbus_test_wait_for_sim_intf(sim);
+
+	obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+				   g_gpiosim_chip_get_name(sim));
+	chip = gpiodbus_test_get_chip_proxy_or_fail(obj_path);
+
+	line_config = make_input_lines_line_config();
+	request_config = make_empty_request_config();
+
+	gpiodbus_test_chip_call_request_lines_sync_or_fail(chip, line_config,
+							   request_config,
+							   &request_path);
+
+	request = gpiodbus_test_get_request_proxy_or_fail(request_path);
+	gpiodbus_test_request_call_release_sync_or_fail(request);
+}

-- 
2.43.0


