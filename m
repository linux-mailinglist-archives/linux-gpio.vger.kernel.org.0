Return-Path: <linux-gpio+bounces-9785-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB40496BCFC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 14:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2D611C247D8
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 12:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B541CC175;
	Wed,  4 Sep 2024 12:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiBQ56yZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9201D9D6A
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454227; cv=none; b=TXDpfHujkQ5PGJ9hpzNRcIjX2/o2SU+1LXbgTV1FkEC0ghmayI6JZsFnwrvQAWLbyns4LNnuZ3+leD1SNI/R4+4zJti2owb5aEZ3itkJj8fF6VjZTRzy/PbCp5l0aYgdefmqgWsj/q8malSzYL97kTPOnoTlXGyK3eYWC5PovbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454227; c=relaxed/simple;
	bh=3JA6BzeZ2wwF6ZHRV534RLQs/6frLZZtgR8mol8rRaw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Aep7EvhL2qmenWEMWxnGLe5Lrv9mTYJkRTA7oL7q5Ei0k3ejEm9VvqThLlzSVz+SJ4GbwoJVGV910Ulm/VAFUjVSI6YHVdO1Gk/znZ1cczCVT3TMdi49Rm2/+1u/9gK/kTfcHCNDE+3CoZg0wiGVPgCVhg70ez7WmMCLqHu1ME8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiBQ56yZ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20573eb852aso4967635ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2024 05:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725454225; x=1726059025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b5Tug3jQKHRZQfvl5s+z3GnhPMxuVquk+2KivxoQ0rQ=;
        b=eiBQ56yZzESGXaKAoCvkKpMHp7SDmq3Bx46dYX52/rQPzbMmvd/22SSvpTvD6KtKzB
         mZWLTpNucH0DWIvCfxTOXtXn0EotHAb44meG/ix7e4YSvbsmesgI20VgTSaUhDQ/gES2
         BcbuSQnyfQaGoGs75PVRPyUJFXGjhTISjiz4WSoO6b4vxgLEJnUmG5k0OgLZv3cAkHzk
         OYP000l/xZgbHTm3JVyjfSPlX+Har8slc7hgj3v7+GjSvJAiQ/e3WKdVyxz2jULGXgIY
         wNYS/QfU+Bf6P1fHFJb+OoAMaQqwN7yJZ/cbQtnDzwM/N827CSsPUqxDTa/+6mOFrToR
         VHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725454225; x=1726059025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5Tug3jQKHRZQfvl5s+z3GnhPMxuVquk+2KivxoQ0rQ=;
        b=kIvEX1vIGtHI3RURhc6/WiMIv3GeGKeeD05zYEl4grSN1hCWqFEifj4jA4/1xEpb3K
         O9yntXt/MgS6WVdxPUU7X37igPgOdxatc4P86etSqlTi9N71+6PlVj0XYspC6hCQHOhm
         BGQ5c58SCShHkQOEaNuj0kNNziOkBaXHe2rHI1H5XL14D+dphDbQpw6lRepXwoVaEcyv
         x/fVUOcAgDu3iYTZSGHDM3dRAZOWj6eDIf3hpQCHAws+o6s7IoHQXVGB4mqhH8TyHbOs
         sgGtu7mWBmnXVgTVKU5TK08achzqmAixNg/NL4mpEusLDu7Wug+Y544QbIVhgjtUJtiw
         +lKw==
X-Gm-Message-State: AOJu0YwfqMtGxbx5q4ivNcUZTrcobPYIoB79RhzdbhpKonze8OP2eWEI
	0JMDcTGOCJt35DU8oaH9ekeKNVXI6GH1ElfFK9JB5Yw3bZBkwtx0mrvPSg==
X-Google-Smtp-Source: AGHT+IHLv6FzwyQpemEbmrxGLRm0YH3jge8FbzpvGQhMBkKo1ajg7Mf/j/hX4v5iX7YDXwbSfHhAWw==
X-Received: by 2002:a17:902:ccc7:b0:205:5284:e510 with SMTP id d9443c01a7336-206b7d00211mr32484825ad.1.1725454224855;
        Wed, 04 Sep 2024 05:50:24 -0700 (PDT)
Received: from rigel.home.arpa ([203.63.211.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206b9367925sm9871915ad.244.2024.09.04.05.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 05:50:24 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] dbus: update glib dependency to 2.80
Date: Wed,  4 Sep 2024 20:50:14 +0800
Message-Id: <20240904125014.262715-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpio-manager makes use of g_log_writer_default_set_debug_domains()
which was added in glib 2.80, but the dependency in configure.ac is only
glib 2.54. This results in compile errors when built with glib between 2.54
and 2.80.

Update the glib dependency, and related dependencies, to 2.80.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 configure.ac | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configure.ac b/configure.ac
index 1ac1002..aa915ef 100644
--- a/configure.ac
+++ b/configure.ac
@@ -258,10 +258,10 @@ AM_CONDITIONAL([WITH_BINDINGS_GLIB], [test "x$with_bindings_glib" = xtrue])
 
 if test "x$with_bindings_glib" = xtrue
 then
-	PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.54])
-	PKG_CHECK_MODULES([GOBJECT], [gobject-2.0 >= 2.54])
-	PKG_CHECK_MODULES([GIO], [gio-2.0 >= 2.54])
-	PKG_CHECK_MODULES([GIO_UNIX], [gio-unix-2.0 >= 2.54])
+	PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.80])
+	PKG_CHECK_MODULES([GOBJECT], [gobject-2.0 >= 2.80])
+	PKG_CHECK_MODULES([GIO], [gio-2.0 >= 2.80])
+	PKG_CHECK_MODULES([GIO_UNIX], [gio-unix-2.0 >= 2.80])
 	PKG_PROG_PKG_CONFIG([0.28])
 	PKG_CHECK_VAR([GLIB_MKENUMS], [glib-2.0], [glib_mkenums], [],
 		AC_MSG_ERROR([glib-mkenums not found - needed to build GLib bindings]))
-- 
2.39.2


