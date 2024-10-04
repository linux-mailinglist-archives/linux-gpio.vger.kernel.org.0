Return-Path: <linux-gpio+bounces-10819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3169998FFB0
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 11:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4C4D1F237F0
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 09:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CD9148301;
	Fri,  4 Oct 2024 09:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vxuM7rf8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34581459F7
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 09:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728033940; cv=none; b=Ic/LqNPcf44a8iiNuuTaqkM52+Tt0B9fAcNSKUuZGslJJQQ5TcoO+/K6udixRX90oOOXBTjeUsS2R/KICGKuJ98W9ItdnJAau4/ojWk8qZzzl6yTSqTxx2614cLyQxsGchSmc3EQuY9KNCV8mNiUXaaaRpcQ1Aa8h9IWokg5vNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728033940; c=relaxed/simple;
	bh=rY/slRJ13BlBdIdHSChvy5wUp9Q3OmU7SiDY5VsSB8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nDBGkp9cuwUwpEPMFmAIStd9IR1F0XVa8NsMGFNWOuqIwsFOcrLwSKkIy/mXU22a9z8SlsxlQp6aqLoFCyanmrh0qAiSxo8Y02YFYnCIvc3UGBJTUiZUt+l+cK+Y/P9aGgW27mLwapbGNGphHVVplshMi/HrMP41go5vLAFw+rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vxuM7rf8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cc8782869so18652865e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2024 02:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728033936; x=1728638736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x5DFzQO+UpyfmXMrPrr+/PcTRdTQiCfnMIl1pWEUfuA=;
        b=vxuM7rf8DAwjMQo3MPzIii06So8ECUYeeBgKd67nd1m8kT9ijOxKevFxAcUtjIdoiA
         GKJMTj6MxbRVwfy8VAv7iI7qqG2ZiuAtF15roIip5RFKEGKCWbk8r2L3bsBVyRktDse9
         yZto952GUqe2woKJhGM9LSlMibjQAGCjAeQQmt1XB8gVSp9Qy2uHVtiIQIZ7Jl5nSd6d
         ajfeIrqt2hGnFQI6lx6ShG7Sj6TGJcLzBJXVJqvRi4+4rZF97h9vRHRZGuC9TMrOC13Y
         Rkx6oEgY3RHieBEO5OudzrSl6AczMFx+p//uEgHN9+ASsykoPrXitMp5w56lh839ahhI
         Uxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728033936; x=1728638736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5DFzQO+UpyfmXMrPrr+/PcTRdTQiCfnMIl1pWEUfuA=;
        b=kTyDTgQiRk8ETB1IQqZE0cyhpHYPQSjUBE1L1kGjevjF9gzbP2G/FnYAyAaB3Hyn0m
         ibIULMepyy78JMPU+QJs5KDN84wgqdQ4/srPWfa1PvCcah6LOvFCxoB1u2iOlB+Bp6U0
         tjEZmUo9R/eR9MzWzNVZb/9Cmrq+L4fkn7+9gEnoTtGi7K/3s/ed0IwsXcjVqukE3A90
         OvBuICxUZ5uqaGO1Gcyw4bJEZrSI4x4FJGxR79q1AWAjYuJgmz/PwfllWLnNlvxPYaX0
         XUIYPJwBeRYaE8OzLbJIotx3mVS0b5zugJPtjsi4TnJOIFCc3ZgbubyFMmQjF6d/5a+g
         MXZA==
X-Gm-Message-State: AOJu0YyApLOMlleZqsuqMk7eZcmxdkt9s1nOPv3+cDmptEPsz9AiqDs6
	5LkrA4ZLFllELQRTGjy7gnF5kMp+zmIqIZcqK9LjE32Po2sgXVk3HrFrCLoXsd0=
X-Google-Smtp-Source: AGHT+IFkFGPFXqLeK8EBors5/55ehuYj1xbYKHxDv6iPhZqZ33vXQdciWFxScByqUTlFEZDGQTGl2g==
X-Received: by 2002:adf:fc12:0:b0:37c:cd8a:50e2 with SMTP id ffacd0b85a97d-37d0e79bd2amr1495593f8f.33.1728033935531;
        Fri, 04 Oct 2024 02:25:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:80ea:d045:eb77:2d3b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b4a38bsm10814215e9.39.2024.10.04.02.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 02:25:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] build: add an additional check for glib-mkenums
Date: Fri,  4 Oct 2024 11:25:33 +0200
Message-ID: <20241004092533.34368-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Some distros split glib-mkenums and other GLib build utilities into a
separate package but the glib-2.0 pkgconfig file pointing to it is
typically shipped as part of the -dev package. This can lead to a
situation where configure thinks it knows where glib-mkenums is but make
then fails because it's not really installed on the system. Check the
existence of the actual executable in addition to querying pkgconfig.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index cfa0997..60ccb1c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -281,6 +281,9 @@ fi
 
 AM_CONDITIONAL([WITH_BINDINGS_GLIB], [test "x$with_bindings_glib" = xtrue])
 
+AC_DEFUN([GLIB_MKENUMS_NOT_FOUND],
+	 [AC_MSG_ERROR([glib-mkenums not found - needed to build GLib bindings])])
+
 if test "x$with_bindings_glib" = xtrue
 then
 	PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.80])
@@ -288,8 +291,12 @@ then
 	PKG_CHECK_MODULES([GIO], [gio-2.0 >= 2.80])
 	PKG_CHECK_MODULES([GIO_UNIX], [gio-unix-2.0 >= 2.80])
 	PKG_PROG_PKG_CONFIG([0.28])
-	PKG_CHECK_VAR([GLIB_MKENUMS], [glib-2.0], [glib_mkenums], [],
-		AC_MSG_ERROR([glib-mkenums not found - needed to build GLib bindings]))
+	PKG_CHECK_VAR([GLIB_MKENUMS], [glib-2.0], [glib_mkenums], [], GLIB_MKENUMS_NOT_FOUND)
+	AC_CHECK_PROG([has_glib_mkenums], [glib-mkenums], [true], [false])
+	if test "x$has_glib_mkenums" == xfalse
+	then
+		GLIB_MKENUMS_NOT_FOUND
+	fi
 
 	AC_CHECK_PROG([has_gi_docgen], [gi-docgen], [true], [false])
 	if test "x$has_gi_docgen" = xfalse
-- 
2.43.0


