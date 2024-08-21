Return-Path: <linux-gpio+bounces-8943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03224959B76
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 14:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B9BD1F22F65
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 12:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6B6192586;
	Wed, 21 Aug 2024 12:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LIjN60aX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63051531E7
	for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724242509; cv=none; b=YeQiOs12uBLPRCOuOVM9B0ZUiQY3uURVYnVTssjwiRBjxjkfphQJzn2vBhfElfVp2IBtaHZS+b2fJeDJdI8Cu3RUZeXUC8EiQTbeJiqlqIzk0WVWhcbKJkL4NpANqTlzcooRN1otCvsRjoLdI6izpvgrsXngSMaWwuCWLr4MZYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724242509; c=relaxed/simple;
	bh=3H/WqiAo6uqFZQE1lRkQCi5RepQKfb9s+lHlguhqzZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjMqqBhFREtVmpw81HOpeUYCkgEIDVpnr4hEs2uyJJn67fNxzkwHICZwJbUdYxX7set61uGq5OeUwuX9mJDfzgwM92BNDZ91NdX8+81DVoFk/ckktJ+FldVqVjor7ZPyAJljMZj+k6rR3JlLBaa91fc/iOoFHvn5Af7fwT+W7g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LIjN60aX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42808071810so53632075e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724242506; x=1724847306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2g23GRxkgie7TFHi4GQuGeOQtGfBjr5Jypy20f9X7c=;
        b=LIjN60aXa5Fsou/2rs3AH+1MJE6URXg9AQLarLght1t/uwESBEYeisYdbUVO84wHRu
         67JvLL/B5s0nUb0Z1idLAuRATfEvpT/xM+awVPyO9o49Gg1cu7pseDb9W4qy094Bt1/T
         6+nei2zkElRVqkM94uUqRhhhUWL36Nosefp6qnp0hN/Vj7ceElx4xQJ6VgrZJhqH8tyJ
         6njRiCEWQgyjUr+0NKFUi1UwTzc60LygoDK9JRCtoL0KJ6zwd7wfQIUMOwIH6T8F3x2H
         +XmXa16nISMlrSwF/Ppst7/7+t+ec8J+J4d576xPhPI3O9vSWrhF6lTQzIbcY+MMHqP5
         fxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724242506; x=1724847306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2g23GRxkgie7TFHi4GQuGeOQtGfBjr5Jypy20f9X7c=;
        b=DcpRA72h0BWiZ1MVM7qmDJ9Ud4y0ZxxN6240olOAnR0MDv8VzusRvIUFL58Ij/ocI+
         8f+nNxrLdgwRyubyIHrAZ6CJPpYjtImT9AG3NpQj36pELLBLgX0ZlmASYXKCMva1lnx9
         7goPfMPRtl/XC5zEm0YB7w3hUUZf2tqAC13eKj0ldopyrWwwhaeKItOQJqp3nnzVkLhR
         FGtpuPXMTTaRz8FXMSpapv+bDYbhbMIXw/NKvQCnZV+ViX4A+651uyNazy5e6YLQ3Nh7
         GLxxb+ZxanymlxJm/08nBiNOx+J8No/rMxzoXMCO7ZkurzyQIFwnpyhvNRVe5vfFThBl
         AuXg==
X-Forwarded-Encrypted: i=1; AJvYcCXaYCeawV6aop1yVpliCfAgk/6jD6bEE29qObsM+H9A8+1SNm2iCsOMyRoF891KMLpN0VIIMCTzR8e3@vger.kernel.org
X-Gm-Message-State: AOJu0YwF3UN6we4um5BFSoHDoTO0LNz2LxHaAVlXedfkgQnYwA54adkt
	7VsSctqubzbnmGTmSFej7ym6SYmqx08CvYalM/34yaM7EH3lV1uUZVtfc36KeHQ=
X-Google-Smtp-Source: AGHT+IHNB0bMBHu5uN2TeLkLjvGSPPoCscd1V61ttq3FLFZReTCP+bj6itZle9p3KiNgSz4rqRCKmg==
X-Received: by 2002:a05:600c:354f:b0:426:5e91:3920 with SMTP id 5b1f17b1804b1-42abd245744mr20584995e9.29.1724242505674;
        Wed, 21 Aug 2024 05:15:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:42a6:b34f:6c18:3851])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abee8b43fsm23056595e9.12.2024.08.21.05.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:15:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Alban Bedel <albeu@free.fr>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 4/4] gpio: ath79: remove support for platform data
Date: Wed, 21 Aug 2024 14:14:56 +0200
Message-ID: <20240821121456.19553-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240821121456.19553-1-brgl@bgdev.pl>
References: <20240821121456.19553-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no more board files defining platform data for this driver so
remove the header and support from the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ath79.c                | 22 ++++++----------------
 include/linux/platform_data/gpio-ath79.h | 16 ----------------
 2 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 include/linux/platform_data/gpio-ath79.h

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 211faffbef32..de4cc12e5e03 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -14,7 +14,6 @@
 #include <linux/irq.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/platform_data/gpio-ath79.h>
 #include <linux/platform_device.h>
 
 #define AR71XX_GPIO_REG_OE		0x00
@@ -225,9 +224,7 @@ MODULE_DEVICE_TABLE(of, ath79_gpio_of_match);
 
 static int ath79_gpio_probe(struct platform_device *pdev)
 {
-	struct ath79_gpio_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
 	struct ath79_gpio_ctrl *ctrl;
 	struct gpio_irq_chip *girq;
 	u32 ath79_gpio_count;
@@ -238,21 +235,14 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	if (!ctrl)
 		return -ENOMEM;
 
-	if (np) {
-		err = device_property_read_u32(dev, "ngpios", &ath79_gpio_count);
-		if (err) {
-			dev_err(dev, "ngpios property is not valid\n");
-			return err;
-		}
-		oe_inverted = device_is_compatible(dev, "qca,ar9340-gpio");
-	} else if (pdata) {
-		ath79_gpio_count = pdata->ngpios;
-		oe_inverted = pdata->oe_inverted;
-	} else {
-		dev_err(dev, "No DT node or platform data found\n");
-		return -EINVAL;
+	err = device_property_read_u32(dev, "ngpios", &ath79_gpio_count);
+	if (err) {
+		dev_err(dev, "ngpios property is not valid\n");
+		return err;
 	}
 
+	oe_inverted = device_is_compatible(dev, "qca,ar9340-gpio");
+
 	if (ath79_gpio_count >= 32) {
 		dev_err(dev, "ngpios must be less than 32\n");
 		return -EINVAL;
diff --git a/include/linux/platform_data/gpio-ath79.h b/include/linux/platform_data/gpio-ath79.h
deleted file mode 100644
index 3ea6dd942c27..000000000000
--- a/include/linux/platform_data/gpio-ath79.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- *  Atheros AR7XXX/AR9XXX GPIO controller platform data
- *
- * Copyright (C) 2015 Alban Bedel <albeu@free.fr>
- */
-
-#ifndef __LINUX_PLATFORM_DATA_GPIO_ATH79_H
-#define __LINUX_PLATFORM_DATA_GPIO_ATH79_H
-
-struct ath79_gpio_platform_data {
-	unsigned ngpios;
-	bool oe_inverted;
-};
-
-#endif
-- 
2.43.0


