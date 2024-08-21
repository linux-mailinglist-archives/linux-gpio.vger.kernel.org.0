Return-Path: <linux-gpio+bounces-8942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D874E959B74
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 14:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96116283138
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 12:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9D118E34A;
	Wed, 21 Aug 2024 12:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zBEyXfb9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30787188909
	for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 12:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724242508; cv=none; b=qCmCtHiIiWXxcgUbWEV+tA1/vRtHhjB5VIuY384Lcmbz3z0UOs20+WaOF525S3RJRounFQdYRg0XUL530miAmKXfsfqBzN435gxjiE3AZ0nKH54zYfIHDOqelzLVFIK4zLdIl36siZVDfcLJQvmul5FWmsYVlh8QaC6hlZpO65I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724242508; c=relaxed/simple;
	bh=MvPZYChaSu48xcGhe0UV0wtQ2Wcl98SijA6Nj/8YE1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G44qzKL0bLJ66MQ13NOlkkbC8ON4nYwKkPTAhCfwMvqZvttU2b9i7nMUsGNva25u91oy08Qt2yAZMDVXo9TF7llYoZfjxl4nJwz0DG+a875mK7ZBgiJp0TOg8TY/3UFXh6ZUWbQPyAxB7HhjLrBxwvTpXtHAt8pOV13O3PWqguw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zBEyXfb9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428119da952so53699645e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 05:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724242505; x=1724847305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W522iQjD1OPMlrDTE09654YKgrbKn4PGID5p31o6cSk=;
        b=zBEyXfb9yrmzA/bRUFQrLyyWY9YOK/aA8W29BSs9KTry+UWXCABrCdrqdig/6hUgmD
         A8pTnJ8BpE0SIKJDrLKEfCh0+xhM8e3KIXX7YN7GFdiMV70+9lnDwiR/0/d9eZyQbad+
         vswi+uiugVEGU/0kaEUtYUrhnG0yBZo0fEJZdsdXuJOxkgNp3wNGJS1GPgGDFqNbGkDe
         8aJf4ugz5TAYUjfQv7N/VRgQCKiUBkMo2ZMw0XWd4AfccX9O1U+B8x+0T+xXBq/YnjSF
         ztb2cwxYva3ht7+Ln4rSU/mXBKyRgxpdkH7luxvhy0m7zYxOcg7EsdWVb9Rq3z2wJiz7
         YQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724242505; x=1724847305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W522iQjD1OPMlrDTE09654YKgrbKn4PGID5p31o6cSk=;
        b=r3zK1mWmQhJCHz/DBpjzM8bwOmALtft1TbQcMvoLq/pIeDGh54Ksedq8tpj0msrBip
         14vBmmy89m0NOTTu/awLyCh2yyd9FqQEOMMolzmfsVlGY0FuuM+mUrieq65WbB1Ewb6d
         jVeS53fRbKkhUY0wnA3SYyIM8oh4tYi29MszpJBYhu55AjEoqYSG8tAn6MCRVfZcL2bU
         GpB90ti6rjvC+rwlCmEiLp9OPxn88GD1UBvgT6IiJqikpW7hXWtJGJYAHZpGxQ2uFmDO
         dUxGh32qdEa5w19lfbqr2yU32/Q7r7dQse4SqoczboJ7wXv+YzUPKbdccirjqTqg1RVt
         z7Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUooGWF3qXda7csCyI/1GNpfoK7qtDO0Rkw4Ds/lizXYxmhIMGIP+8/VAc/AG1E0KB53F9aDOF6tWYT@vger.kernel.org
X-Gm-Message-State: AOJu0YzbBHVSK+o1/f+6oK6tdHtmhglKxuZfO/P0z28A5vnojiaBlxLe
	uYfIXpV8jgq6Vp9iiK9sKJAvT7rh17tK0OAuXYCw+dX4SUvm+Nn5FdDJiAV0b5I=
X-Google-Smtp-Source: AGHT+IGbshlM6qk4FCeTg3pBRUAoxPkSAZLN+Uo1JQuNMKBUoB3kMWjeaX6lkQDLWbQUXu+jw6K60Q==
X-Received: by 2002:a05:600c:3b86:b0:426:5269:983a with SMTP id 5b1f17b1804b1-42abf048867mr16517455e9.8.1724242504989;
        Wed, 21 Aug 2024 05:15:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:42a6:b34f:6c18:3851])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abee8b43fsm23056595e9.12.2024.08.21.05.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:15:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Alban Bedel <albeu@free.fr>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/4] gpio: ath79: use generic device property getters
Date: Wed, 21 Aug 2024 14:14:55 +0200
Message-ID: <20240821121456.19553-3-brgl@bgdev.pl>
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

Don't use specialized OF accessors if we can avoid it: switch to using
the generic device property helpers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ath79.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 7f9e66d75c8b..211faffbef32 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -8,12 +8,12 @@
  *  Copyright (C) 2008 Imre Kaloz <kaloz@openwrt.org>
  */
 
+#include <linux/device.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_data/gpio-ath79.h>
 #include <linux/platform_device.h>
 
@@ -239,12 +239,12 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (np) {
-		err = of_property_read_u32(np, "ngpios", &ath79_gpio_count);
+		err = device_property_read_u32(dev, "ngpios", &ath79_gpio_count);
 		if (err) {
 			dev_err(dev, "ngpios property is not valid\n");
 			return err;
 		}
-		oe_inverted = of_device_is_compatible(np, "qca,ar9340-gpio");
+		oe_inverted = device_is_compatible(dev, "qca,ar9340-gpio");
 	} else if (pdata) {
 		ath79_gpio_count = pdata->ngpios;
 		oe_inverted = pdata->oe_inverted;
@@ -276,7 +276,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	}
 
 	/* Optional interrupt setup */
-	if (!np || of_property_read_bool(np, "interrupt-controller")) {
+	if (device_property_read_bool(dev, "interrupt-controller")) {
 		girq = &ctrl->gc.irq;
 		gpio_irq_chip_set_chip(girq, &ath79_gpio_irqchip);
 		girq->parent_handler = ath79_gpio_irq_handler;
-- 
2.43.0


