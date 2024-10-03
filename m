Return-Path: <linux-gpio+bounces-10794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5CA98F0E1
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 15:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD3FCB20E84
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 13:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0390019C56A;
	Thu,  3 Oct 2024 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DqlQH8y8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59DD1547DC
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 13:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727963893; cv=none; b=EvlYsKYAwDzkLJi6xEvDbEnVum4qwkJCi9g55A73uogDrrnTY9KFa3dDckjGzm3Xxon9aKqT736fWlkCpVBqW57kxW1bzskkRC6UGCZ3GRkEtjFBp7f4cLlbhApt/jIO9nyJB3/rfqfdRoZ2Fv1sFeufSQrBcqfF2F60jNe90Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727963893; c=relaxed/simple;
	bh=cHuxdp/kWyQcdWiAAP0eyCIh2ZkaQDqYKf4xqgD7/3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gPYL+H9FjQk24aVooQ7+Va5ZIxOYkbmO32cGSbDDuxGlFJYqI9RWpAMu1zkFjH9m7vL/A/6ODEkliELJjzxs7hBcROpFDtPd2yZM9VcREU3f6NQE5bsrsgniZ2aVtlkPNdGtBikAb2T8OGDxCFy9r2+guCVIi4vq2ajXC4VrKSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DqlQH8y8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cb60aff1eso9653215e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2024 06:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727963889; x=1728568689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7QF4YjQ58EjMCkeb6Nc4EMDF+wlkZVHb9+90lyr0/Q=;
        b=DqlQH8y8bA95P3hQVbIzgh4fC9NcRv4+Bi4VLRfILPaEINZqwvJdp+6ZG2csnrxams
         yki9QIOtZQ60cuutWnPW/UOnk/i0sU7Hd6h62MZOlziZimtjqbJ9zZEoFIpcBCpcnpoy
         xxelEFlNKMnFEfty+TtLJtD6CFavDWflQ1qRoz3Jglfn1oMcIobyTQoFxfJXZurVbEa4
         1hm32lbPuS8ovFJFBqIKbaGKUal4D58Og9VA8DNnOOcWIliJw1lk3skcgSs1JBY5MtBH
         jLY0AJqo8QSbh+/Vd4AJqB+JLeJ7xmO5Ppp8YHXAgKiA5Ff1Bnsu26W9Z/zqSPDoxMK0
         M0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727963889; x=1728568689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7QF4YjQ58EjMCkeb6Nc4EMDF+wlkZVHb9+90lyr0/Q=;
        b=mh5MTgFH0mNwCW4U8KywVlqqsAcrK80A3hNqSjc6GWlQm19DVUIvkUq45BeSWM1AHl
         TAIIJfeAHJZzOMH70JzPWOwL5AMgaL15/EJBDDz3+Bi9RGxBvRjoc2e6QtRTr2io/Xte
         Uj8P2KPJECew/vZ2LbgHiAPItkB64SRR0BNLve4/z6zTLt7MJugFUnhvEWE+QlGomm6L
         RIhaF6LVwhfZhsSSyKl0xXo5oGyIvK+wlEYCdYkSnThnkzwwAbPLAeyORyoAnlXqW6+X
         4yFMaBFY3p1Ya75cDC72xJf+6WjXEfRJe+XtRrEINOy0i6Z8Dx4xPqZxy5a+P7U4/CUH
         hUAw==
X-Gm-Message-State: AOJu0Yy8ri3ylwmxMrKz6/VwmgAcY1/uAAmecJPiXgPvwFekHTfPaBLh
	klrg3xZXZ10o9+lgI06hWO5swl5i1anUkp0gvgGz3Io9+xriZ+aEwZxikOlmz4c=
X-Google-Smtp-Source: AGHT+IFLFzcLE6o+3M1Y9rMS3gbYgb/BQQ/c9AaJXFQWGvHm4h50+Rl7p3vavyhEiorBwCE8WaWRGA==
X-Received: by 2002:a05:600c:4fc8:b0:428:18d9:9963 with SMTP id 5b1f17b1804b1-42f778f3821mr59050435e9.22.1727963888814;
        Thu, 03 Oct 2024 06:58:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d16b:3a82:8bfb:222a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7a02ef4bsm45343195e9.47.2024.10.03.06.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 06:58:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] build: drop obsolete autoconf macro
Date: Thu,  3 Oct 2024 15:58:06 +0200
Message-ID: <20241003135806.41934-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

AC_HEADER_STDC is deprecated and should be replaced with
AC_CHECK_INCLUDES_DEFAULT. We haven't done this until now because the
latter is only available since autoconf v2.71. We kept supporting v2.69
for the sake of Debian stable but it has since upgraded to autoconf v2.71
so we update configure.ac as well and fix an autoconf warning.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index cfa0997..b12db22 100644
--- a/configure.ac
+++ b/configure.ac
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-AC_PREREQ([2.69])
+AC_PREREQ([2.71])
 
 AC_INIT([libgpiod], [2.2])
 AC_SUBST(EXTRA_VERSION, [-rc2])
@@ -74,7 +74,8 @@ AC_DEFUN([HEADER_NOT_FOUND_CXX],
 	[ERR_NOT_FOUND([$1 header], [C++ bindings])])
 
 # This is always checked (library needs this)
-AC_HEADER_STDC
+AC_CHECK_INCLUDES_DEFAULT
+
 AC_FUNC_MALLOC
 AC_HEADER_STDBOOL
 AC_CHECK_FUNC([ioctl], [], [FUNC_NOT_FOUND_LIB([ioctl])])
-- 
2.43.0


