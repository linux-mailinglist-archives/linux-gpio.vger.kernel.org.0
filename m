Return-Path: <linux-gpio+bounces-9622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0016596998B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 11:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABC63288815
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 09:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC0619F437;
	Tue,  3 Sep 2024 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Udpvku3i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2963F1A0BC6
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725357242; cv=none; b=Xy2r7BjJLpNjSY1yRyJycjGuBRtwhYCNtHdGt6qzRYz2WxLR0EjQI2+Y3G7y8P72FDwCLRGTyFAYJ3St8moclCOfLM5ZsenQeooYUMLIaJ3IV1OCqfc0XzWWobWpuTMhNQqMfqu9eD1OqV9UgiNTQU782elLKvLEvHpbLXy/8pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725357242; c=relaxed/simple;
	bh=IbpTT6S4V1luVgt1JS2fuCNjChVvH/86LlhmEnOvP5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d7WITn0D9dxYqqyXJNJlVyjGCM+4Rhh1cn6eDmH/XbFgK7YuS5qXiCOnvKBRK1Xcf4ic2X/xwqdzB5oAwlnjGBpEKOCGf5g+Y2NZubEihI4CtSIw1i+xoX/CvCrkSZ4+AREJKb2EYyQPzlQRlsxCol/itly0/MjLQk3FDVXVB9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Udpvku3i; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42c7856ed66so24648745e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2024 02:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725357239; x=1725962039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8lfOdkF2ndBEmCHtZC6aXIJtpuydyKDMjkA3wwk6mS4=;
        b=Udpvku3iH6PYSMS/fopa7zbI7SosA1WbfKygXy7fPtz0XkHpbsBKDJRZ6UZcaJ7pVJ
         2CXOiCX6D5aUwlopn41g0b9pzqwhfROP9buu7bLjDp19kJAULiJQYzyWUnI3QFTyvM/5
         0QZa3DS2HjEcavbM1nZC8A2qBfrSU9rQuyJEbbm1GZWb/tvznWsWG8geOUcmbhr9gZdh
         ei7BOVOCJJI8Yfa+zbr2VmxPbJmGhZZjCeGCpovc5qStoy1bj46EDjE/35XBhKzTirq/
         FxXt48pp1SVO9pD5gszIWtwFJQ6XFcroFZ6T8qn17fju1g4RZnfZTGknKFHYaHuEZl03
         2YWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725357239; x=1725962039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lfOdkF2ndBEmCHtZC6aXIJtpuydyKDMjkA3wwk6mS4=;
        b=MMS4NWwRH9Ic2I3e9MY9Y815FoCUHUytFviHCCiPKhpT8cMb6pQI12zaeqdArEwdIQ
         ot9Ty8NacvccKd/5mwgBC1ZLRNpYcvX6oMwejwe2GeRWVOxFA9MesDP2k6Mxe6BN2+kz
         +OXQw75PlNRKLKMwCJVwK2PQ83odExcPC5YYBY9q+i+6NwFx+zz4U/mehTML7Ivoe+mB
         TZ1b9SyTvYlX1esIBaAjCnO3E9aa+GD1qukbB4xXxxwTxcAhRAWr3Xlmyd+VGx7IqFLd
         hK/CQ/qcSWSYX6w8Tjr8ht0sJSIcGGUg0wFpYd6KoV9c8vqecPBTWgUFjVJFjBjvKWFg
         xAPQ==
X-Gm-Message-State: AOJu0YzrkRrUfNhTYai5qMtTxACtY+N6zOXVYXHTTbPdA2Omhnbq7k0H
	hvxWVwwUMxoxUoFaI7aALG6UripOsEdmwToS3ilp6qfc0m5ZDggwKFbBNXUL8ZE=
X-Google-Smtp-Source: AGHT+IHun79FCVF6zZ4w4sEWdS71L/emDmC4pSV2DFN6cmYUeuVm+RsL0+x2gJwhv83rCm4+z4b/XQ==
X-Received: by 2002:a05:600c:3c8e:b0:429:d0cb:950f with SMTP id 5b1f17b1804b1-42bb02c2031mr125153175e9.2.1725357239167;
        Tue, 03 Sep 2024 02:53:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e61d:37d0:a59f:d06f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df9705sm164893505e9.27.2024.09.03.02.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:53:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Douglas Silva <doug.hs@proton.me>
Subject: [libgpiod][PATCH] build: imply --enable-bindings-glib for --enable-dbus
Date: Tue,  3 Sep 2024 11:53:57 +0200
Message-ID: <20240903095357.27998-1-brgl@bgdev.pl>
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
 configure.ac | 48 +++++++++++++++++++++---------------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/configure.ac b/configure.ac
index 1ac1002..a4dd05f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -250,6 +250,27 @@ then
 	fi
 fi
 
+AC_ARG_ENABLE([dbus],
+	[AS_HELP_STRING([--enable-dbus], [build dbus daemon [default=no]])],
+	[if test "x$enableval" == xyes; then with_dbus=true; with_bindings_glib=true; fi],
+	[with_dbus=false])
+AM_CONDITIONAL([WITH_DBUS], [test "x$with_dbus" = xtrue])
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
+fi
+
 AC_ARG_ENABLE([bindings-glib],
 	[AS_HELP_STRING([--enable-bindings-glib],[enable GLib 2.0 bindings [default=no]])],
 	[if test "x$enableval" = xyes; then with_bindings_glib=true; fi],
@@ -280,33 +301,6 @@ m4_ifdef([GOBJECT_INTROSPECTION_CHECK],
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


