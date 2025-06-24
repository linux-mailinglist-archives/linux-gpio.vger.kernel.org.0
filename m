Return-Path: <linux-gpio+bounces-22061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6C4AE663F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 15:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CC2E17D33E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 13:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5587C2D193B;
	Tue, 24 Jun 2025 13:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q2kcqtiR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593812C327E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771174; cv=none; b=OYweh8ww/XqxIFO3rI2sC6uqzer47JotUXvZjomPtgvGpMP8ykkxJYMKpeyfKkFNwOsNszucKJxpTbouIChkvL8UuXFFaB5y/RJzM+ZS97oavIyAfBxotZsEi4ikCt7/cqjQFMJ6ocQ+rKrIUEDOclgBLC64mOvZ0qdxd4P5ai8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771174; c=relaxed/simple;
	bh=42CM0Y9wbPob7M9n1TchKbAWBw3fz3skePpGaPIjouI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FUltOsEJGc0yeIxUHGwHfbyhSW8ddsjciDpaAPimY3xKQM/H6Ngfp61fONqSbaAOgqXK5L8bRrrhr/r9qGcWwrH9OmRo14Ze0lDBsIwsiawBdHeBqvX57jfRweVtJSpUJcvE98QNMF0J16evR/nst2Bzi1Ypzsc4YRW4egJtoOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q2kcqtiR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so29107365e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771171; x=1751375971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2B/kiSHHHZJxgJh/qvuyiyzLHnz4/qgrmBlSv19H08=;
        b=Q2kcqtiRgx94eX2fm8UtBXVyHHzFpTm1uGLlfYZ1q/P/iFTszbdXHbTc5NZfOqbscY
         00ekfCRJN+DMLy0AE+DUY2JJIcf6rWKs06d+1XwammUzxkfcWPogGTUpwq/d5PHAdpiA
         ukEMcqRf7jbsuBI+t8y2Y32MZS6ZAEm5XyGVsH0QRA3VdDaDEX2bn06MPGdn7AaRYM0O
         7TR6VU10MJKyBiOki1ICzM30QZQTQObPBBcR03lI9Z9vf/AYGD1hYoo9BU6SD6GSdDsP
         3DG96/5Wy2z1Q8YQ3Qt86e5cqmBZsxNm9th+Dyf8eoqOJLxWcc+IltY0H/je3a61ycOi
         cajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771171; x=1751375971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2B/kiSHHHZJxgJh/qvuyiyzLHnz4/qgrmBlSv19H08=;
        b=H16Ljbj2M8KXDaCZ6mpf9JkGv3dhKVUaY8hLWVenc6H8z4fa8NHIn7uKwafgz5Bqxd
         8jFTMh+IjXlDS1ML5t179kSVR9YSZFsb4vCkyS5AbeXIXRBXkRFl+OIN6lL796DJ4amf
         ra4YEryaHJzclH+JC+4f9LgbQ+nd4NLdwPqUG28dNOoWgyb6rnxpQRSBuYTv5187vuWM
         m9rt3m/gO/gzMjDgJJMxxtXq4/IXNDwzU+hd2LlC6zixJcYKCXgkm7pEBk7VQ/coUIhe
         FaB7KEQJKvfqUQ+PGu63ORUalDXTPCO/NGSkayWmR98KY1LlIcNaFD7p9EhpswffN/p+
         +v7A==
X-Gm-Message-State: AOJu0YzIlnlJgBHTh7mlCNIJ5sqRSdcdHZiw21vmi1IYKTcoWwQT/L2b
	xlyr78q8311QYB+GxOguDjLY7Y3THimeWntfzHtXuD5yj8uLqJbMVn01dDDI+H6v1e0=
X-Gm-Gg: ASbGncsiRZ7cHiR/zPGpq+8JUsph2se5jiS6tiRi4jYlkfuuOcGZzx061OTr/cQrR1o
	UMdNc0/qTlTkMnVqefivz9iNhoZh5EWm4OsRdO1WOJyOh2kYcifaawfvu5CVVt0gFa7qCCu228W
	4cu+mFqml0ZnGWpT0h6cdEL0O9APnZlkLipSwKx6oksr69NS6VDu02lCvtteYGyRGqrpcb9bMZC
	+mgE6E8RQrR85uP3b8i0o3gxYl9o7TAuiUTN6BXG6RGvppBPfEuEuigSYcv8vEslpoHwTzAi0hQ
	IhxQCZ7Wlgz5vZhM0S2Yh8JWOuYuMR1ooThELlnDxuaT+qDo1O6yjAd+g9UybnsUbg==
X-Google-Smtp-Source: AGHT+IEonwGwTEN0PQTTY5zvr8GZMj5f2L5JRFileQvI4Ft8kxR7RvhZm0EGSz4y5sH3Ydfuq5cdmg==
X-Received: by 2002:a5d:5f53:0:b0:3a6:eb59:f37f with SMTP id ffacd0b85a97d-3a6eb59f3d2mr816690f8f.12.1750771170749;
        Tue, 24 Jun 2025 06:19:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:17 +0200
Subject: [PATCH RFT 6/6] gpio: mmio: remove struct bgpio_pdata
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-6-a58c72eb556a@linaro.org>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3644;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=H3M3IpDQpY9NSlvQzNFcRcqnugqGexh8ZnJKDM0pSQk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXYsMqxCAK8bVz8LUzIFa3A10IhSZWnxZZsN
 y8r7RVwjcSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql2AAKCRARpy6gFHHX
 ck/vEACtGvpcJ1rDqsgHSQ1GwautrZv4YEuXxKtBnuKN+NKbKghxnTNRHCCpyNXnCtxEbtiq7y8
 OjE8GYR13yIXh+1q7W+hK73xOKZZYp7OKgszPx6sc1XZVxQVUFaZZK9l1IKT36uV6GMdzHkBYTR
 VLXV1B8i3FYqgT9VVJiXlPCTeYkyRt3bOhslU2Wgf/i82p19bvW99oZ4odEgC+BAXpMEMOmb1bi
 s5gUjdNfaISr8OhvHIWmDOSjqnwnwMcBVPl6VnI8/Zy1bFo7DjaU0rTYcGDQMwoJ8jn1PRPbkKA
 J5vsXCQOkCe7CkMs7A0u1AQgbX4gQtST2Nun3Zndjk/OX1P4k+m6YU65hzs6kC2BI/ApH1pmCct
 tLlsIUDjPM8WAgsc1U4Y6WYVmSJf7SIVAy1uFDwLeKn3C1TzF93zb1HhF9fSeZNGNydcCtyh3ZO
 siD6Gb8u4cOa6kAtcEekj9BY2HBt7dl9Z1pIfRWL+6IbZX3PKftx6KkQKEFm3Br4FnQMSY8Vnti
 /yhgqO320uLRS6bIOZH70S91IcTigcwHdVkj8ndRazqgDc6pDaQ1xsUAE7CAk3hjnF4RoXaU3hs
 1vkdBp6qaOnwhfLDadsq11vMZoW8jZDv6A35M6PSY1zuGWL2uHZdVsOOc4AtnOGEblLXaWZDaar
 J16/cpP8OIkWQHw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With no more users, we can now remove struct bgpio_pdata. Move the
relevant bits from bgpio_parse_fw() into bgpio_pdev_probe() while
maintaining the logical ordering (get flags before calling
bgpio_init()).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c    | 65 +++++++++++----------------------------------
 include/linux/gpio/driver.h |  6 -----
 2 files changed, 15 insertions(+), 56 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 8108aa8e6b86ae3d0b520a0f22a09689ab1d9bc5..cf4d3f968af52bb750038d32f78d1c39498d3f06 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -734,39 +734,6 @@ static const struct of_device_id bgpio_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, bgpio_of_match);
 
-static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *flags)
-{
-	struct bgpio_pdata *pdata;
-	const char *label;
-	unsigned int base;
-	int ret;
-
-	if (!dev_fwnode(dev))
-		return NULL;
-
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return ERR_PTR(-ENOMEM);
-
-	pdata->base = -1;
-
-	if (device_is_big_endian(dev))
-		*flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
-
-	if (device_property_read_bool(dev, "no-output"))
-		*flags |= BGPIOF_NO_OUTPUT;
-
-	ret = device_property_read_string(dev, "label", &label);
-	if (!ret)
-		pdata->label = label;
-
-	ret = device_property_read_u32(dev, "gpio-mmio,base", &base);
-	if (!ret && base <= INT_MAX)
-		pdata->base = base;
-
-	return pdata;
-}
-
 static int bgpio_pdev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -778,18 +745,10 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	void __iomem *dirin;
 	unsigned long sz;
 	unsigned long flags = 0;
+	unsigned int base;
 	int err;
 	struct gpio_chip *gc;
-	struct bgpio_pdata *pdata;
-
-	pdata = bgpio_parse_fw(dev, &flags);
-	if (IS_ERR(pdata))
-		return PTR_ERR(pdata);
-
-	if (!pdata) {
-		pdata = dev_get_platdata(dev);
-		flags = pdev->id_entry->driver_data;
-	}
+	const char *label;
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
 	if (!r)
@@ -821,17 +780,23 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (!gc)
 		return -ENOMEM;
 
+	if (device_is_big_endian(dev))
+		flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+
+	if (device_property_read_bool(dev, "no-output"))
+		flags |= BGPIOF_NO_OUTPUT;
+
 	err = bgpio_init(gc, dev, sz, dat, set, clr, dirout, dirin, flags);
 	if (err)
 		return err;
 
-	if (pdata) {
-		if (pdata->label)
-			gc->label = pdata->label;
-		gc->base = pdata->base;
-		if (pdata->ngpio > 0)
-			gc->ngpio = pdata->ngpio;
-	}
+	err = device_property_read_string(dev, "label", &label);
+	if (!err)
+		gc->label = label;
+
+	err = device_property_read_u32(dev, "gpio-mmio,base", &base);
+	if (!err && base <= INT_MAX)
+		gc->base = base;
 
 	platform_set_drvdata(pdev, gc);
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 97cc75623261917e9b3624e1e636d2432c0db205..4b984e8f8fcdbba5c008fc67ff0557bda11df40b 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -718,12 +718,6 @@ const unsigned long *gpiochip_query_valid_mask(const struct gpio_chip *gc);
 /* get driver data */
 void *gpiochip_get_data(struct gpio_chip *gc);
 
-struct bgpio_pdata {
-	const char *label;
-	int base;
-	int ngpio;
-};
-
 #ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
 
 int gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *gc,

-- 
2.48.1


