Return-Path: <linux-gpio+bounces-9798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C35B696BF79
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 16:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A95228A69C
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 14:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CCA1CF292;
	Wed,  4 Sep 2024 14:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UqMOWpSy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77941CCEFC
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 14:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725458495; cv=none; b=EVQ56FCM4bMhzVjjw070AkyeT5fX35ZduRhvZ+nl9Nxs/jJQzdFnzvXMQC3LecYDqJBM6dAMAsTzIyqyPPwR5wLpW0u0VJXzzkQVpfo54iwJ5zdzp0xCbGJG256Oi1Nu7bTx6n2sirAsqeu49C8sByMfI6IKyxWEyMZ4uc18CIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725458495; c=relaxed/simple;
	bh=Yvc2QWKFGGW7ij5JMho+lUo4/QSIY+9po0k0Wlnc3Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rwWHmHRc1XsAv/F0/SGUnjOUMpmlr/hnrfLHQM8BKMTW+0fUD4ZtuWpimEqlBVgimItzYYoVm50E0sD1PRJqo7c50h3YBnaE3wa2ya0N/2iYrvJQWl1uKTdMxiGolA+m37WMW/a9qQaBoFngvEQhtTPYj/E5FnEh2LRQoYhn/eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UqMOWpSy; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5becd359800so6844957a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2024 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725458491; x=1726063291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yI9uwp1PRvLZ9d6uG18DgVQb9z8/zN76rlGY3xm0zwI=;
        b=UqMOWpSyBFirs8g4pXpQi1BcvAX1/S1KISRuWRbi5RSbDE7sDU8CBekinEWh5VwMZ7
         U+TfVnGa4FdmOmXroNb+UZMALbSiDfHAI4kxvmbWeepwWboX1wx56qmtZ7d0HZlFLRXJ
         4XZUhsCxiyjuDciqaSu8XhR7lWsYAjO5WzuKlCBepk+RVttXGrlWSCwZy6SNrTjqdOdf
         PJMU5JgmuhwqkG+mFiFhiUbzr16pQLvod933RZhm6b9uB0eu7RtFHgmbyx8XiGh7VeNC
         1mQDyjdTOb2nBl+dM4heAkUeFCQ96Ba0J83ArQ1BHOrEOwFsWf+x9IoowulBteb9nI7l
         EYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725458491; x=1726063291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yI9uwp1PRvLZ9d6uG18DgVQb9z8/zN76rlGY3xm0zwI=;
        b=ivgA6TT4ICdQQGWEZtoALARvZfikFUD4duNJlHGMeSdd7Sg9KPf2Z/igmcRGYdUOP0
         unmFkpZootJnv7qrgRB4Vy2ddC9VGBPYg7VS5Q8Hnd3qwW5rdj0t9mljru/wWp7a5BrY
         ZtSYclYSLa/PixdJ8qHzHWzL/gciuFfLjzaelbu6D4YkbLuLQAR18jzX+boGCTeoveNg
         QHlni8cO9FPokmT+CinWvMwBqJcsAEr+qsA/uJw1OWmEJhpZEDw6VMEpy4+fx/5zgKMD
         mTyiTFJM3IDzRbJlgJBnlYwqOdfD8aupMfIQQ2E47IAVr9WpHyCA1/D1VzFUlmmxT/LH
         VpYA==
X-Gm-Message-State: AOJu0YwyGPbTnZ6USNPME6/m+Cq7rnAHqV3Wz6zRqgSXJ08rdsn1s3xB
	+QSG6ajDxp0J+1JExWXSSX6LBbvXr7C9LsXT+VGWlZsqe1AkK6lBZF+lh5TO8KI=
X-Google-Smtp-Source: AGHT+IGEc4KY/zTaEMzRDVWEdLLXECKftWjtf2ySCxhffz5ZPxNY/EPOSqOBO32wOIBOyV/LGwlzLw==
X-Received: by 2002:a17:907:2d10:b0:a86:817e:d27a with SMTP id a640c23a62f3a-a89a38247demr1006842666b.61.1725458489760;
        Wed, 04 Sep 2024 07:01:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:66d0:70f:5bef:d67d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898900f221sm811514866b.61.2024.09.04.07.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 07:01:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Douglas Silva <doug.hs@proton.me>
Subject: [libgpiod][PATCH v2] build: imply --enable-bindings-glib for --enable-dbus
Date: Wed,  4 Sep 2024 16:01:27 +0200
Message-ID: <20240904140127.58667-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GLib bindings are required to build the D-Bus daemon. Enable them
automatically if --enable-dbus is passed to configure.

Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
Reported-by: Douglas Silva <doug.hs@proton.me>
Suggested-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- make the changes actually work

 configure.ac | 52 +++++++++++++++++++++++++---------------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/configure.ac b/configure.ac
index 1ac1002..92d3408 100644
--- a/configure.ac
+++ b/configure.ac
@@ -250,10 +250,35 @@ then
 	fi
 fi
 
+AC_ARG_ENABLE([dbus],
+	[AS_HELP_STRING([--enable-dbus], [build dbus daemon [default=no]])],
+	[if test "x$enableval" == xyes; then with_dbus=true; fi],
+	[with_dbus=false])
+AM_CONDITIONAL([WITH_DBUS], [test "x$with_dbus" = xtrue])
+
 AC_ARG_ENABLE([bindings-glib],
 	[AS_HELP_STRING([--enable-bindings-glib],[enable GLib 2.0 bindings [default=no]])],
 	[if test "x$enableval" = xyes; then with_bindings_glib=true; fi],
 	[with_bindings_glib=false])
+
+AC_DEFUN([FUNC_NOT_FOUND_DBUS],
+	[ERR_NOT_FOUND([$1()], [dbus daemon])])
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
+
+	# Imply GLib bindings for D-Bus
+	with_bindings_glib=true
+fi
+
 AM_CONDITIONAL([WITH_BINDINGS_GLIB], [test "x$with_bindings_glib" = xtrue])
 
 if test "x$with_bindings_glib" = xtrue
@@ -280,33 +305,6 @@ m4_ifdef([GOBJECT_INTROSPECTION_CHECK],
 	[GOBJECT_INTROSPECTION_CHECK([0.6.2])],
 	[AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")])
 
-# Depends on GLib bindings so must come after
-AC_ARG_ENABLE([dbus],
-	[AS_HELP_STRING([--enable-dbus], [build dbus daemon [default=no]])],
-	[if test "x$enableval" == xyes; then with_dbus=true; fi],
-	[with_dbus=false])
-AM_CONDITIONAL([WITH_DBUS], [test "x$with_dbus" = xtrue])
-
-AC_DEFUN([FUNC_NOT_FOUND_DBUS],
-	[ERR_NOT_FOUND([$1()], [dbus daemon])])
-
-if test "x$with_dbus" = xtrue && test "x$with_bindings_glib" != xtrue
-then
-	AC_MSG_ERROR([GLib bindings are required to build the dbus daemon - use --enable-bindings-glib])
-fi
-
-if test "x$with_dbus" = xtrue
-then
-	AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_DBUS([daemon])])
-	AC_CHECK_FUNC([strverscmp], [], [FUNC_NOT_FOUND_DBUS([strverscmp])])
-	PKG_CHECK_MODULES([GUDEV], [gudev-1.0 >= 230])
-	AC_CHECK_PROG([has_gdbus_codegen], [gdbus-codegen], [true], [false])
-	if test "x$has_gdbus_codegen" = xfalse
-	then
-		AC_MSG_ERROR([gdbus-codegen not found - needed to build dbus daemon])
-	fi
-fi
-
 AC_ARG_ENABLE([systemd],
 	[AS_HELP_STRING([--enable-systemd], [enable systemd support [default=no]])],
 	[if test "x$enableval" == xyes; then with_systemd=true; fi],
-- 
2.43.0


