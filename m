Return-Path: <linux-gpio+bounces-8253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E8D93454C
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 02:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ABA01F2252D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 00:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96876800;
	Thu, 18 Jul 2024 00:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pd6eqp/T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7257197
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 00:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721261381; cv=none; b=EbpwNtn42bAV4E6QeR+8v4DIRZcpIct7/EmDvSDjrztsTclf1FICn/8YjwzV6q2HlbteAMhsXAWtz8KMdF3EXw+HX3SW+QiEv4eUtdp2nmCaeIreJM8vnJj2//gLu3vCbV9lCWTCWUExW2Bc46Aghl0k5QoU5ay/R2gXSO0Inqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721261381; c=relaxed/simple;
	bh=4HNKatqWLU6KJV8ksJ86yC6IMX/1lH46LBS256lNGXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxu+0nITogZX0gDSyZ/sAiTmCZl25wd/C/i9E87vmrgTQUxZcWzFFdbDgCK5WOYRVmF58C7jeaQV3hvlC4Kog7pYOEP1RttBE6jx3L4zks11yaLnCoPgBbP6takA/0zX331342GUaTFrBMIZOUuO9fSiNvn4zwp9DT+j8aozc5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pd6eqp/T; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc49c0aaffso2378455ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2024 17:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721261378; x=1721866178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygcvHwT21rnyyK9FqsryADEACNrTd1WTS27RQFo+Wzc=;
        b=pd6eqp/TejsfLCemVEb5MWZp7YHDzy0vbhqpfOAil50xzSf4Upzr/7J63crnbGf0N1
         FPde5oXXpjo74Cd+v/NkDtT18xmBHAV8UMI1b/IaDDeMmxygB39G6VFWG5xG5jYkfY8P
         40dn3NbeiTxZStVU8bpGjKpsaY1hnNakjnWKBZ/GM1USJNDKqoMsnX4y6YdlSYff/r3d
         lO0e7IHQkKMGvLYW0bNUH2aoK3nsuaJ1BeRSuLzbCqSrEbqCyGwGIC2C4O4OBZ3lx6BP
         aJCJmhD3CwXZZABlPZRzp0yyOH4rL264cnwZTXS/zkf7atd8Z6vyvxvwuOJPU7blEYp/
         nYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721261378; x=1721866178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygcvHwT21rnyyK9FqsryADEACNrTd1WTS27RQFo+Wzc=;
        b=hesJDI1FIjJeQRY2I9rBbYIbDIy0GBg/Dk6vvPTXk/t+IQsUmhuzDsS4FFrm5vi+F3
         EnUGEqySYuZBWhyTS4bSaumnwvCbVpiFNir+O0leUzgtC6IuDKZoTOGfDZkBdNqtIEqi
         augNG4w+af2Y6haM/QMTVpv7r6mnWiVLhlbQGMTFBjWsZCGoGIShLOMtaldmpcnY6dQs
         Zr7qUMtn5u20ByX40vBZYwsRF5qy59Bm+y01xLwzAirTxDfBFgjC0uDot1+6sOliSDoN
         QJvPVMf7lPNp7HPLtI30ygoZL9Arml4RcDJCeZa51gsFVmYAZqT99Z11J003UYvJNE+a
         cbew==
X-Gm-Message-State: AOJu0Yyv/eK8FlXqCaZhQudz+y3e1vH78Y6odVfJtNoPi7V3eyK1kd8x
	6Eqkt/4ANk/qg4swHRKUpJQX7P1nn8l56MG69MBDPPPZQGfoDchMKpHw8ipu2fQ8FLe8ij+y8SH
	l
X-Google-Smtp-Source: AGHT+IFPUjaMAlNGpqGgBXdgFvh0EM5pFUKWWpK5R28WcGhYVRlg8c4gIgPooiZk1CIzWmbzpNm2wQ==
X-Received: by 2002:a17:903:40c3:b0:1f6:f298:e50 with SMTP id d9443c01a7336-1fc4e683945mr27662155ad.58.1721261377709;
        Wed, 17 Jul 2024 17:09:37 -0700 (PDT)
Received: from localhost (75-172-111-187.tukw.qwest.net. [75.172.111.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc3a251sm80628035ad.198.2024.07.17.17.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 17:09:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-gpio@vger.kernel.org
Cc: Keerthy <j-keerthy@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] gpiolib: expose for_each_gpio_desc() to drivers
Date: Wed, 17 Jul 2024 17:09:32 -0700
Message-ID: <20240718000935.2573288-2-khilman@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718000935.2573288-1-khilman@baylibre.com>
References: <20240718000935.2573288-1-khilman@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The for_each_gpio_desc() iterator is a convenient helper and is also
useful for GPIO controller drivers.  Move this helper from the
internal gpiolib.h to driver.h.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/gpio/gpiolib.h      | 5 -----
 include/linux/gpio/driver.h | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 48e086c2f416..c68be135e137 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -115,11 +115,6 @@ struct gpio_array {
 	unsigned long		invert_mask[];
 };
 
-#define for_each_gpio_desc(gc, desc)					\
-	for (unsigned int __i = 0;					\
-	     __i < gc->ngpio && (desc = gpiochip_get_desc(gc, __i));	\
-	     __i++)							\
-
 #define for_each_gpio_desc_with_flag(gc, desc, flag)			\
 	for_each_gpio_desc(gc, desc)					\
 		if (!test_bit(flag, &desc->flags)) {} else
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 0032bb6e7d8f..3e7e58be31b4 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -813,6 +813,11 @@ const char *gpio_device_get_label(struct gpio_device *gdev);
 struct gpio_device *gpio_device_find_by_label(const char *label);
 struct gpio_device *gpio_device_find_by_fwnode(const struct fwnode_handle *fwnode);
 
+#define for_each_gpio_desc(gc, desc)					\
+	for (unsigned int __i = 0;					\
+	     __i < gc->ngpio && (desc = gpiochip_get_desc(gc, __i));	\
+	     __i++)							\
+
 #else /* CONFIG_GPIOLIB */
 
 #include <asm/bug.h>
-- 
2.45.2


