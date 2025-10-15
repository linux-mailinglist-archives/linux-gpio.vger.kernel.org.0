Return-Path: <linux-gpio+bounces-27183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9375EBDF4CA
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 17:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7ED91885C2A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 15:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3687A2FAC1D;
	Wed, 15 Oct 2025 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SH7IAli9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A68B5464F
	for <linux-gpio@vger.kernel.org>; Wed, 15 Oct 2025 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541371; cv=none; b=Op3qxUhIULPtD95J7BgKhQKAMG6OungCVS8pgSGbDD8+2Y4AEJojCEKPK5eMv4AzUHQ12ZluFs8msqdFOFI8EbrWy+Q9o+yqj8DYAS+pIKDurDMTmi7uC61V8JzpeJkPoA0gU29xD3oOggotFyyGukMBxepNEF1fnp29urljGQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541371; c=relaxed/simple;
	bh=uCgt805cHRK5qUGajx+3IfAQ3/pisK3BcFy2PmB4M4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRY5J0sikEvG7lNAUL2E0Wc3ctoCEp5qhIuEnPJmDxtXdSh9iJbCFlHLM1HqWpSXJeEx/c6JsFJJZovCfFAypI/SgIpiCyDFVv+zM6eG3A1eeltA6jACNPzPrvc4gxAkgAAuoUVjfPlladTWegvSSTEnya7vmHFLvxukV9tSCbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SH7IAli9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47106fc51faso6887685e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Oct 2025 08:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760541367; x=1761146167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=leA4p5KdGzuUByIONtOKgx/UtP5+WR5VhZskIIy7wo0=;
        b=SH7IAli9zwgkbmF1lewCVBrKn0gsDmudtGWSI4A/+GewKyYigDXkTgc6KGnNtw+f0I
         Bg/189W+tQI40xqcFiyINBYCA+SMlXxDAQuHLO8XCKPVyNhHctKQdRYgrjz1xwkrzRXn
         20FpZXAGIQvwpoBUV6YFAyFDANN5hUUca16Cy4AfaTjVDy6vWSriu81gJlbn43cIa64m
         Uaixe1QmBofX+rMu0MMBk+5PEfKMoKsZ5rUwcjO7Kz5oj6me5SjyjL0yE9edjXmOuh9x
         d/Cr5tXudANBl1EaBYRbT+aJzHC4iV6bk0+HbYZCGOdC38BzALmcYIokQPu24WYchYC4
         xHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760541367; x=1761146167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leA4p5KdGzuUByIONtOKgx/UtP5+WR5VhZskIIy7wo0=;
        b=KzPQxF9ghw2UC0aIXKyke6mkcbCZhueozwfeIOKr0FYYknbDu14qDI3s3x6wmzYyqh
         0dmWoNEZUhSqbVPoYyI1ySSuDXmKpFF1PCEvALePRvPHMXi5/vRrnPaDXW5w4LHHYhrg
         B5ZJaLBihd0GFfQmhbI3bJLqnLT2BYabbq3PIDNfdc5kM+1KUwkaDoKRXZJZPboGkYcs
         6IG0wvkVcR3u1njhSzcc3fW9izNURjJDaLgxIth1E4DmlxOWpLQ+RXHBdrm2F9X7Rqex
         avIWaxRcOA6JmVhA9ynG6Mj4wxgqEixg/v6vt1XiTnIbU0UlKNmlJ4Z/9r8n1nfSELBK
         H4bA==
X-Gm-Message-State: AOJu0Yz3h2RtOuaKQQhC8daj6PXaGTuehzTHDC21MJ8UtmqHgS1s4eXa
	mApucNvQqyPAa+uBFggcLJ6OGdcm7aYTh0MMTb1sOoIYbjkFBpiAWqrSv4KlYV1Bv+U=
X-Gm-Gg: ASbGncvxkwNls4pB4LTGEYQgaHUAlUiZ1s7nROFCKaIkMPr/z7l0qsJtwMm73XBgLbs
	JMd6f09hltAfkBfzIw2Wastaj+JvffGM5bIH5cSzFj/ogt44YnjMaCqipVYZT+M+okazrcXLkde
	AHlNJ0J23LovGFv9JC2jsXR5/XZ+5EJL/sCiAys9rVxZlhOaKh6tZOh+xfM8Px8vVDOX8Lojv6a
	p1fqccGV3/8qbDDn0ToqMFTzu3AUV8NSUUqP6Oo6+P1AjhcEkE3R/TztLzjEaJVrQLvmwh/RYQO
	DWeU+uK52J269eBwTw1aCNuxHK1APcXNevAQoK+/liHNnOi6c7aSTParB9B7pLbDYK7Ol7LgUzr
	udyakibWcf1DGw3AYkpBda8ZKJmD2QhHagvOl673dnly9Uu8qlQrT
X-Google-Smtp-Source: AGHT+IFobeSqnmbUBNUK5N3Z6RnbXKgGRPhiEdaBCRGo2rpUCq2z1ZjchQMQ0dd2uRi1a1GL0TkZiA==
X-Received: by 2002:a05:600c:4745:b0:46d:cfc9:1d0f with SMTP id 5b1f17b1804b1-46fa9af30e5mr229761485e9.19.1760541366622;
        Wed, 15 Oct 2025 08:16:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9ef5:841b:1380:f197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47101c0371csm32994155e9.7.2025.10.15.08.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 08:16:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: latch: remove unneeded include
Date: Wed, 15 Oct 2025 17:16:05 +0200
Message-ID: <20251015151605.71203-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver no longer uses any GPIOLIB internal symbols. We can drop the
gpiolib.h include.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-latch.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-latch.c b/drivers/gpio/gpio-latch.c
index c64aaa896766..452a9ce61488 100644
--- a/drivers/gpio/gpio-latch.c
+++ b/drivers/gpio/gpio-latch.c
@@ -48,8 +48,6 @@
 #include <linux/property.h>
 #include <linux/delay.h>
 
-#include "gpiolib.h"
-
 struct gpio_latch_priv {
 	struct gpio_chip gc;
 	struct gpio_descs *clk_gpios;
-- 
2.48.1


