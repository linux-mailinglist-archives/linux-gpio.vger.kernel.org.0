Return-Path: <linux-gpio+bounces-10557-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DE1989F6C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 12:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22A0C1C227A5
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 10:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EF518BC3F;
	Mon, 30 Sep 2024 10:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CYljyKVL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA10D18B472
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727692328; cv=none; b=OrbcETqkTbn/CZj/11Nh+zPmRQOsm8KKo6phfz3LsOKN4R6TjLHSbHCvoAK34MwN39HoD8dN6eG8VOtb/bZ5pAjGdunzqPX2XWpsvXApWa3Q+6wKz7+mzJswFDGJNkK69k0TJRjsBHP+wAkAL9Lz3NSObz4PAHdre8CMd/WNehY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727692328; c=relaxed/simple;
	bh=aIZPTXuyA3IdOp3E5tKoSd7rL9GYMk8CHYQ3RC0Ak2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEap5M8nX1ZoCfxShnteG162HqNLUH+QuLTf7vXKuPpXwliouC3HFiJNyUJwDCb3SnYh22aEW9Yzbbj1FfHZ6UrJuuYBWZwTEXM2+l23lScidAtg7tChveFqci5T1digLQeV00EJTNaYWxPvCSZJO3gZzC/HsZDTOhDJURiPJCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CYljyKVL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37ccc600466so1787931f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 03:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727692325; x=1728297125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbIeQCIQG29ruA9aOyFEUr782VHdH/golS3SG+SvRT0=;
        b=CYljyKVL3PYnfLVmqxlJ1vth92v2HvW9PNaTpG2rzKlWdCv1b2PbVf+LogXhv5cy5j
         4V7O+SItBkk3iIwZ3Amr9W99PTBrb7bYMwO6tgitxyND2voHYaXghascZvRuxDuxe4v+
         9+viCFeyfKUxDva8ZyngwLRcGcoYhllbCqiq9v6LLs4HdtNRjQZoy4GrCHseMWTuylSf
         GtD+C0hiwgou8O/1vkrGyBU9MYpJyiuvcSMcBUC/GFySLTsm9b99hNSXcg2DXTY1lIea
         mBV1iFERJwgGz5jadSjlx1/V6MpARWU0ZUAM78bRN87HjDU7wCUFOAxeIk27ystzjZ9n
         +vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727692325; x=1728297125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbIeQCIQG29ruA9aOyFEUr782VHdH/golS3SG+SvRT0=;
        b=qITRc/kE8AQ4T84JOXvRPtr2vsn174yf+XNLVupbhCGPQksfz3OSnav8oGBWiA6sRQ
         tZL7KX+GlUk35IiRer06ke09qXKtS0dz84YdHIj+BIIK5Y9pyIY1Knb3U+n27oD8pT1p
         1a2+SjsWWjvrbT5cNUvCFJSEQqyfOZoLsb1zq8n0t3mBBnCE40rQnaUucJ+0ROURs+IM
         u6SIcPrswAN9B1iaVQX3adM46FM+4gCdhrOkSQtg79oJywfzKJZyY4o3X8/yYRdUA2aR
         ZU4fZArizJ+KIRQ7Ebxr9SIU3Lc7vloxpU3+11nSnjKeo5wcjPVV4hD2p2Lz0Bhy9Hji
         BA4w==
X-Gm-Message-State: AOJu0YyHIX3LK6vlrFgAbRdrFN8yeJOIwHmUBkZ/XLxxoUaueP7co/Dx
	mizjobB/vE6GhxJ+liAkc+jQNhGfyVzeGcmWeZd0SgQ7lpiAGYCIrgJ5XiCbPVk=
X-Google-Smtp-Source: AGHT+IH5plmZC25ms6hNKllqBa1tbp+dUWi0ti5d9oJ+0pVrJAYkka/MkWfWzSt5AttzcdV9kme8/w==
X-Received: by 2002:a5d:5273:0:b0:37c:d027:d92f with SMTP id ffacd0b85a97d-37cd5a80dd7mr6986395f8f.15.1727692324965;
        Mon, 30 Sep 2024 03:32:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5745696sm8633491f8f.106.2024.09.30.03.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:32:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/3] gpio: syscon: use generic device properties
Date: Mon, 30 Sep 2024 12:31:56 +0200
Message-ID: <20240930103157.49259-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240930103157.49259-1-brgl@bgdev.pl>
References: <20240930103157.49259-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

OF-specific routines should not be used unless necessary. Generic device
properties are preferred so switch to using them in the driver code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-syscon.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 638095d5f459..06c07085feb8 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -9,7 +9,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
@@ -208,12 +207,13 @@ static int syscon_gpio_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	int ret;
 	bool use_parent_regmap = false;
+	unsigned int props[] = { 0, 0 };
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->data = of_device_get_match_data(dev);
+	priv->data = device_get_match_data(dev);
 
 	priv->syscon = syscon_regmap_lookup_by_phandle(np, "gpio,syscon-dev");
 	if (IS_ERR(priv->syscon) && np->parent) {
@@ -224,19 +224,15 @@ static int syscon_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->syscon);
 
 	if (!use_parent_regmap) {
-		ret = of_property_read_u32_index(np, "gpio,syscon-dev", 1,
-						 &priv->dreg_offset);
-		if (ret)
+		ret = device_property_read_u32_array(dev, "gpio,syscon-dev",
+						     props, 2);
+		if (ret < 0)
 			dev_err(dev, "can't read the data register offset!\n");
-
-		priv->dreg_offset <<= 3;
-
-		ret = of_property_read_u32_index(np, "gpio,syscon-dev", 2,
-						 &priv->dir_reg_offset);
-		if (ret)
+		if (ret != 2)
 			dev_dbg(dev, "can't read the dir register offset!\n");
 
-		priv->dir_reg_offset <<= 3;
+		priv->dreg_offset = props[0] << 3;
+		priv->dir_reg_offset = props[1] << 3;
 	}
 
 	priv->chip.parent = dev;
-- 
2.43.0


