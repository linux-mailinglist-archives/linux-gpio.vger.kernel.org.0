Return-Path: <linux-gpio+bounces-24257-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01774B223C1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 11:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F4C35056F1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 09:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD1F2EAB9F;
	Tue, 12 Aug 2025 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="q4QlyaPz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7262EAB72
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 09:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992353; cv=none; b=CSXb9VmlCRKj0Jo38QPHGugGNbe07Ig7ptPR2ZgGuW1iSHsBIwGHqozJCTL6GPRRc/32q/fnGcIej0xSXhnwTAA4c5RskVPpLDmXJOlyxJkVfkEAjTXYdzX25/MyLE4t6ynCfJu8PUA87cg9v1zDRS0UfTKIIhGl31/L4ZZ1DkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992353; c=relaxed/simple;
	bh=1thbdLmTFudV7ob9RYvrVsAtyDB0jUXy5XVU1fSzbt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iyQBRkvvxanZT5IN5lNkiv0LYIjt1a58Kzccfd0ORXL/d/gjISGG7xUhDJv9XltrcUbpI1MJ78jJJC84fyuglyLGrQGSyJqbO1OFuieVpoc4aqmWOS/BauyDXM0SwOw9hNWHae0y8x+LElbutyVDTPZQ92TYkQ7lnV4vvIGlEw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=q4QlyaPz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-459e1338565so49307875e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 02:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992350; x=1755597150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=;
        b=q4QlyaPzzs9H5piOb+xvwvhtbfCN863NzC7ilcLD3lYwcrXW8CaqnjDuodAoSzXa4j
         oqRcU9ZFenxMY/2eu2vPXZlO2FYnovUKZR1HuNsexxwfZ4P7u2HE2ArekzuuO+7dWHzX
         QE7UT3zTSQse3EpTBv2+LqrUG6PZyGFS/BofVngo5T80wv1sBrVDqUIYUdU2wPuLQc6C
         W4yLp+G4uXO5NtK94SLHVz7Vgzb4Te8PmWVjFgDtd5yg+39YJiacDGI0zopP+RRqeXEz
         cr0aH6En8A3ZP6o2R5TXtrKu0/2Tbhnl3sVNwRCZ+Mk9RvW3SdSAF5GP/uYXDKuZxxj1
         dtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992350; x=1755597150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=;
        b=jzS7zA2mxqxcD3wTq+5TXTCozfl14Yb1WNUUhyjCJU0cq4LHl039t4zJ7BrHew+ad7
         IcoTT8dWbs1fuZsOaf/zAYOVpnyRqiMteKQw+R3iROdygD6QtsXMA23QU8I2G+XR8Svo
         AUM0BoPNvSrBYcP1zTlZjRtHAg8aCcdFjPDFMQkT/69fk6tKTBq3uiUjIIVJvZHEJlNo
         ugkE7VZ65me9klb208v2DESTLDpYVjX61+FwOi/RSChkBWOvDTCAsy/I77pIl10yrLq1
         W7nANA9HsGOSPDwxlgI36j3W7v5+5UbEH3k/h8qeE7tZWKUqTut+uMe4P7RkHf6XJdQ7
         7OAA==
X-Gm-Message-State: AOJu0YzxREeQl7H+QKUGK5LGbxHALMqWE52YqKtzo+vbDGk9iurIiFHV
	Am4+PAnF3W7fVwsbfYTNFgG1+99pcOiSRPXzpdvzguTGma+VW2eRPvL1MFw88u/KFNCU0wVJFQg
	nHdX+
X-Gm-Gg: ASbGncvP/CamiF7pqDw8rrZgGaTRHyTU7U8HXTL5A9fGubQ3J9t+Gm4gRej10r13QCi
	/Zm45tpEIu4l6WvAZ/KaG+tTnUDWMLiTLhzN0QgWwmYp0HeXM8oYWEnVFMEqx/KOxFgI7iGC+6J
	19J0laj5Lbstw2Cnvdwt8e8K7C2U0asorJWlWigRQiTUoDZJ0Tln46uiVPB6fYMgnBZY+Fppu0i
	ihSV6/oNW4QgRpu+k2KmSZ6vUcI0+nE7mRMS+3YhcLkPjFdItDhVp578gAYOi+CkZyxQ2mEx5Nr
	3J2ZSIbZAy/RPH/ucDj9GwlQuUD3EjYAdlBpjmkgF4WQ0bE67+DXY6wPkum4XEnTp7xPVECCEbf
	pDqZ0urK5FgSbzyU=
X-Google-Smtp-Source: AGHT+IGIcINkdiK0LNz/i++bv0RtZ8hP381jlLDx4TdmYRuzvhN/HMrb4TfbDRUlL2JwjGPQsH0Szw==
X-Received: by 2002:a05:600c:1caa:b0:456:e39:ec1a with SMTP id 5b1f17b1804b1-459f4ec3a43mr159061415e9.14.1754992349900;
        Tue, 12 Aug 2025 02:52:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587e154sm312580295e9.27.2025.08.12.02.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:52:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:52:02 +0200
Subject: [PATCH 05/14] gpio: ts4800: use generic device properties
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-5-9f43e95dea98@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nK9pJAlcVqEpACXDhaB9m0pP1KYR56NEQPbKtHUMK9c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomw7GBscP67JH5SX99nyhFAOUx+Gt0iwwFvC9Z
 hi0AI/V4juJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsOxgAKCRARpy6gFHHX
 ck9hD/4lxQ4nelKeye5szjwGOfRfZTuTicWo0zhTlKdddlkk6xoh66S6JcXMp/50mhZ6gEHaJXq
 Q4opBxRZuN6v4aGsJbZgA8rH3LpVNgobh600taxKRx5sHLUyWyw2avAK/leGr5iuoLY7Fqc1Uaj
 2u3vrE1e3E/ZPOqcFn7Xb+fpL8cVI05xKVV1OgNDijT84ExRe22wTQVKll8NHM6KoKJnUQTBgbA
 UDnVxtaiCkk++HoA/jNxeOanH3FrvAo9hFhDEpW24BWkANpPzt+E2bBwJWpFbd5rbcDH20qJ06f
 QHSCanc3huYGyHxZqiSH9UwFja1f83QfLjyoNKzJ4zhK+0TJrs9zHghvpp8jT8lXBfKs7jPK6bd
 CRT8gMzhIppcQUyQZwVGFS5QuoqDtHUBSZZDn4sfQU1KwyMJh1ArON5LJhdBaZvfYnUilPbDBVh
 sE6SswcFS4HAM1Gosf+yHBHd5SCyiPyFpkx5C8zMK+4pfCoBRevD1ER+GY7a+D2vyazx+NPUkwt
 wPsWYxcQBABUeIrZpWSwkdTVRF4weNZq/FRcmwkIlJFIdVk4giAs3ZCAbuEaE8og6uaHWihEHtH
 poQctsPGzdnlKdecj4LJ+OvyBa57PU5XKZcSbl5pMFweUtUv55hCNxeVqXQlfTjkaW6xHF/2tdb
 AfVCaZlsKTziFqg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Avoid pulling in linux/of.h by using the generic device properties.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4800.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 86f7947ca9b2d23292c1e6660fe93c611e0cb837..f4ae87325393c909c66eda3bb7b2f849e645b7a4 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -7,8 +7,8 @@
 
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #define DEFAULT_PIN_NUMBER      16
 #define INPUT_REG_OFFSET        0x00
@@ -17,7 +17,7 @@
 
 static int ts4800_gpio_probe(struct platform_device *pdev)
 {
-	struct device_node *node;
+	struct device *dev = &pdev->dev;
 	struct gpio_chip *chip;
 	void __iomem *base_addr;
 	int retval;
@@ -31,11 +31,7 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(base_addr))
 		return PTR_ERR(base_addr);
 
-	node = pdev->dev.of_node;
-	if (!node)
-		return -EINVAL;
-
-	retval = of_property_read_u32(node, "ngpios", &ngpios);
+	retval = device_property_read_u32(dev, "ngpios", &ngpios);
 	if (retval == -EINVAL)
 		ngpios = DEFAULT_PIN_NUMBER;
 	else if (retval)

-- 
2.48.1


