Return-Path: <linux-gpio+bounces-26284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C38EB7DB9D
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07E1C3256F1
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 08:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF75730F933;
	Wed, 17 Sep 2025 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ve76RqTy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F24030F7FC
	for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 08:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099267; cv=none; b=ef7kigHCTOznaN6BJ8EMgclcT/+hSEimHW2cOVcm3kS7zjM4Y/Db7ZYyYkqfOHw2cg4c2wrKx5UKHftSj+2cI1zhFtwnkLYkmN7Gb29qcOGzKCcoQhgQxkuTlZQnqWup8BVi1FBqPq1wk0mMxcqyNy/YR2M7sUyzLtRzZ4wG2rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099267; c=relaxed/simple;
	bh=+MDBNkMlc8UQOsD8SCI8/5gDQuNiHiEuGQxqNSHs2uM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+q6UKYlo5VsccNIjbFcrfhgX6dV7R2Uihb2dF7yD/S5IISE/u5z+2FX0INKvMalh9BfFyzljtnmkBWRUoIDfA4d2Eh8lb4ZWNly18+29ep1XHQDM6pHuzHHghHhc532jH554WTohTfR2tDAo8jbA+kW/suB0DtXLvsubwTLBvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ve76RqTy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ece1102998so163739f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 01:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758099264; x=1758704064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjUpDFlS67joxzWF+KwKofXHw6Vn6f1GMMKJF6CGXNM=;
        b=ve76RqTyViy26jQokcKUZlk4F1JmgxnQhlGSCDRsVGxb0PXO5dVcAdjlnFPFAq71Eb
         Has9Vv8W7qkLre6QWPB5+63fHy+TywPTsr7xtScSrbCCVYIe9TZ6QKVqujTDuGYzYCtT
         EBPwD39R2W0ow6slyPDX4U2tqko5dgGkrFqhrN0gdBUWLbHgnn2SbeKbA0HtaugcwXpo
         ZG4hEwM+5GifUsmMwXPcFjmiW6vHW8Izs7tv72mW6CGQQKMLuxdnJ5fG39NseIIpp3LD
         EbXvWLOQDCq2MoxXAs4+myAZDM0ZTvtHgt0GnJoB4fcvROHE2rNiCpb6527MtXtOLAbF
         Dhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758099264; x=1758704064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjUpDFlS67joxzWF+KwKofXHw6Vn6f1GMMKJF6CGXNM=;
        b=Hssb4so4xKpbhWvGAkUgYknPi94YDHlqRmgHU2ZtLBAkMq5SmScfhcXpAZorhwR4zr
         j1bzmWuNjyAHbSvLgeucjxyBZDcGo+bIbelvl2XJfkDPIrH6rU3Qel2/QgqxQbr0Tgiq
         IkqVgeEEqj6/EZYoTITTUAbyGdMxg95mfVFluYDCknXt1LWxQy3y/dD8TIAq0KJG1wCH
         WEhXJCkpAErG264ZwIUMQkb+7D/+nPmhnP5xgz7x8slFAEbK9AyrO90On0OoQhYsuV2k
         LaU68hl4MhTZQBZgvD2Y4zxxJSUyGpbEbP78nyjalpe5MwbuFERdRpr8SwheJJf3Pe1W
         MsYg==
X-Gm-Message-State: AOJu0YxGvUC/FIa/wwV6rcSv5y2AwZrBBzeN9Jkft2yWboOvAsMHR/6V
	hpiDm7i+VyJlwZTrOmlIsUuO2VLKgttq4Ni4XjVA8Ji/EVdH57n+NH3oJw4AJhIQQ2s=
X-Gm-Gg: ASbGnctwL8G1q518LEyXWAJb/I4+oizk04KXMkE0n8m+9xYYN8BL1pNU7F6DDBJzFRP
	j7m1TWyzV6nyM8UQcOBeY0Im806kr7RCwYrn7UsNOc7lgpgeJDREEnshgD9I1t3bYM/wSIm5TVd
	ZZSYt0PRjTNKN0bm0sfn7CAM79PBdJrn9G9WI4cgJVhe8spB3C3PlkMLR9Sb+iXpfdLNGgo6uQ7
	5jBuABJAaO6/5rCk8XDTX6ZD+kBAT6k05MD+6XUZS6Cc8PFbcUyObffOH12wddIXa1NKW9XkZMx
	EsecDosyxQyw+frI/8b3srP4ehzrjknVK5pNPtH7lkAhO5gZuMxLELQfWRE/fov4cy84NjCkDLO
	Fr4xchEHVOhA4DR+FJj3zUGXMyeTcOmO9nOWvt1jb5120pWU5NlnektKerePLHPziAJVN
X-Google-Smtp-Source: AGHT+IEXW6tfwrWsHedmL8ZnwFNgXmuY8g8xLBI+1FTNkagZFtLSe8ZPNJZUm6/cy5N2Xw2ddtClag==
X-Received: by 2002:a5d:584e:0:b0:3eb:a6f8:827d with SMTP id ffacd0b85a97d-3ecdfa0b5d8mr1093461f8f.32.1758099263833;
        Wed, 17 Sep 2025 01:54:23 -0700 (PDT)
Received: from [127.0.1.1] (94.red-217-127-72.staticip.rima-tde.net. [217.127.72.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3eb9a95d225sm10117552f8f.54.2025.09.17.01.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:54:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 17 Sep 2025 10:54:05 +0200
Subject: [PATCH 1/2] gpio: generic: rename BGPIOF_ flags to GPIO_GENERIC_
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-gpio-generic-flags-v1-1-69f51fee8c89@linaro.org>
References: <20250917-gpio-generic-flags-v1-0-69f51fee8c89@linaro.org>
In-Reply-To: <20250917-gpio-generic-flags-v1-0-69f51fee8c89@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19646;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5weySTNaxAXX0xtXQ5JWvDAL2fLgu+6vpryk5Erl31Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoync7v1i2oB8au5XNW5Yb6g1B97Mb3QqVpN/dB
 /zl4GNYiauJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMp3OwAKCRARpy6gFHHX
 ctkeD/9tPCWAgm0X/hLWo6V0rtrBk1kQr6ZcDCEDIu8xl4c05c07C/BOTE4s7CCEJDSoNUcZYwv
 QmWPwVPkVtTKiRWrjuNn8zuWw4JKZ/nCP0U+3rJgOAczPv697XhkOYR7zl42GUnK8h/WpPXkzp0
 YfOTUJUo2IDYhveX8RvrSaEFdZmQWNXXp6Rqp9XS5j2nW9GIbgaZ8WELKA5CYZ2CcWf9p09UK6N
 NVwSTim5pzN5KebKMDBSIomCn6DYJg+kq1jWUoapU2tuCJjk7jpMD6wAVgL/bSdhMIm0XTMrBo0
 ddlkob0+BskNyjqbOocZsjJDx1rwyl/pXpByI+e6WsA8Og2rLm+aKB7kTZa27mrjubnotgZjnkD
 vHQDunl20NKNMxqjfWq2WExunlFgwuvQ3dMgCMGvt2tg390gsqkGiQSixB7VcoKKUKJud7L3exT
 7ImNxhC3koVEqDGsFri2AXZZdf3YzbzRKa65hhAl4KnuDDmchzVCNAgmbZxbpog2QAu2yTjD6Cs
 h2AmWKefEqI6nnN/BljkZFVrZyxHNcfX3c9H6G8XgwS7a72sAALp92lqq+q4kLF4Q4J0SF02ar8
 sexyERFEebt6qsbRQgFyE8PIRkc3HqXp7tHJ/WeW4pgTHC9pnIm2NFvFgrX1nf+gv9YF+GWCv56
 kenLSNH/ENpPGYg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make the flags passed to gpio_generic_chip_init() use the same prefix as
the rest of the modernized generic GPIO chip API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-amdpt.c                 |  2 +-
 drivers/gpio/gpio-brcmstb.c               |  2 +-
 drivers/gpio/gpio-cadence.c               |  2 +-
 drivers/gpio/gpio-ge.c                    |  2 +-
 drivers/gpio/gpio-grgpio.c                |  2 +-
 drivers/gpio/gpio-hisi.c                  |  3 ++-
 drivers/gpio/gpio-hlwd.c                  |  2 +-
 drivers/gpio/gpio-ixp4xx.c                |  2 +-
 drivers/gpio/gpio-mmio.c                  | 28 ++++++++++++++--------------
 drivers/gpio/gpio-mpc8xxx.c               |  4 ++--
 drivers/gpio/gpio-mt7621.c                |  2 +-
 drivers/gpio/gpio-mxc.c                   |  2 +-
 drivers/gpio/gpio-rda.c                   |  2 +-
 drivers/gpio/gpio-realtek-otto.c          |  2 +-
 drivers/gpio/gpio-sifive.c                |  2 +-
 drivers/gpio/gpio-spacemit-k1.c           |  3 ++-
 drivers/gpio/gpio-vf610.c                 |  4 ++--
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c |  2 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c |  2 +-
 include/linux/gpio/driver.h               | 18 +++++++++---------
 22 files changed, 47 insertions(+), 45 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index bbaf42307bc3d7df0a19b34cdb0a5aaa96c9ad3f..8458a6949c65d3e19ff9cefd0c69b2fcbc842938 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -94,7 +94,7 @@ static int pt_gpio_probe(struct platform_device *pdev)
 		.dat = pt_gpio->reg_base + PT_INPUTDATA_REG,
 		.set = pt_gpio->reg_base + PT_OUTPUTDATA_REG,
 		.dirout = pt_gpio->reg_base + PT_DIRECTION_REG,
-		.flags = BGPIOF_READ_OUTPUT_REG_SET,
+		.flags = GPIO_GENERIC_READ_OUTPUT_REG_SET,
 	};
 
 	ret = gpio_generic_chip_init(&pt_gpio->chip, &config);
diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index be3ff916e134a674d3e1d334a7d431b7ad767a33..f40c9472588bc70e734e15a3a5c8dd8efcd3c5a7 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -630,7 +630,7 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 	 * else leave I/O in little endian mode.
 	 */
 #if defined(CONFIG_MIPS) && defined(__BIG_ENDIAN)
-	flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+	flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
 #endif
 
 	of_property_for_each_u32(np, "brcm,gpio-bank-widths", bank_width) {
diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index c647953521c7164879551f41e1bad954fd7d8221..b75734ca22dd7381e2007efd3e7f5d7aa593de0c 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -181,7 +181,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	config.dat = cgpio->regs + CDNS_GPIO_INPUT_VALUE;
 	config.set = cgpio->regs + CDNS_GPIO_OUTPUT_VALUE;
 	config.dirin = cgpio->regs + CDNS_GPIO_DIRECTION_MODE;
-	config.flags = BGPIOF_READ_OUTPUT_REG_SET;
+	config.flags = GPIO_GENERIC_READ_OUTPUT_REG_SET;
 
 	ret = gpio_generic_chip_init(&cgpio->gen_gc, &config);
 	if (ret) {
diff --git a/drivers/gpio/gpio-ge.c b/drivers/gpio/gpio-ge.c
index b5cbf27b8f44225341e23e88b985e26458d11a7b..66bdff36eb615ee005e1dd0be4ed9377f9d06763 100644
--- a/drivers/gpio/gpio-ge.c
+++ b/drivers/gpio/gpio-ge.c
@@ -73,7 +73,7 @@ static int __init gef_gpio_probe(struct platform_device *pdev)
 		.dat = regs + GEF_GPIO_IN,
 		.set = regs + GEF_GPIO_OUT,
 		.dirin = regs + GEF_GPIO_DIRECT,
-		.flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER,
+		.flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER,
 	};
 
 	ret = gpio_generic_chip_init(chip, &config);
diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 5930f4c6f2b578ea55c8143078042d5e0aaf3cfd..0c0f97fa14fc9df05274deeda8f8e17fa68fa9dd 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -359,7 +359,7 @@ static int grgpio_probe(struct platform_device *ofdev)
 		.dat = regs + GRGPIO_DATA,
 		.set = regs + GRGPIO_OUTPUT,
 		.dirout = regs + GRGPIO_DIR,
-		.flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER,
+		.flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER,
 	};
 
 	gc = &priv->chip.gc;
diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index d8c4ab02ceaef7941e97f4788957b1f2c268de98..d26298c8351b711d1922cfcef196a2c6a63b0ef9 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -300,7 +300,8 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 		.clr = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX,
 		.dirout = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_SET_WX,
 		.dirin = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_CLR_WX,
-		.flags = BGPIOF_NO_SET_ON_INPUT | BGPIOF_UNREADABLE_REG_DIR,
+		.flags = GPIO_GENERIC_NO_SET_ON_INPUT |
+			 GPIO_GENERIC_UNREADABLE_REG_DIR,
 	};
 
 	ret = gpio_generic_chip_init(&hisi_gpio->chip, &config);
diff --git a/drivers/gpio/gpio-hlwd.c b/drivers/gpio/gpio-hlwd.c
index a395f87436ac4df386ce2ee345fc0a7cc34c843d..043ce5ef3b07e98532919bc21c15a2fdd002f929 100644
--- a/drivers/gpio/gpio-hlwd.c
+++ b/drivers/gpio/gpio-hlwd.c
@@ -253,7 +253,7 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 		.dat = hlwd->regs + HW_GPIOB_IN,
 		.set = hlwd->regs + HW_GPIOB_OUT,
 		.dirout = hlwd->regs + HW_GPIOB_DIR,
-		.flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER,
+		.flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER,
 	};
 
 	res = gpio_generic_chip_init(&hlwd->gpioc, &config);
diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 8a3b6b192288c8093abfe6644dbb680e9e25e830..f34d87869c8b046966ad9118c535add379a15416 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -289,7 +289,7 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	 * for big endian.
 	 */
 #if defined(CONFIG_CPU_BIG_ENDIAN)
-	flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+	flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
 #else
 	flags = 0;
 #endif
diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index a3df14d672a92ac771014315458cb50933b6c539..7d6dd36cf1aeffeab96704821e0b280727346f6f 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -554,7 +554,7 @@ static int bgpio_setup_io(struct gpio_generic_chip *chip,
 		chip->reg_set = cfg->set;
 		gc->set = bgpio_set_set;
 		gc->set_multiple = bgpio_set_multiple_set;
-	} else if (cfg->flags & BGPIOF_NO_OUTPUT) {
+	} else if (cfg->flags & GPIO_GENERIC_NO_OUTPUT) {
 		gc->set = bgpio_set_none;
 		gc->set_multiple = NULL;
 	} else {
@@ -562,8 +562,8 @@ static int bgpio_setup_io(struct gpio_generic_chip *chip,
 		gc->set_multiple = bgpio_set_multiple;
 	}
 
-	if (!(cfg->flags & BGPIOF_UNREADABLE_REG_SET) &&
-	    (cfg->flags & BGPIOF_READ_OUTPUT_REG_SET)) {
+	if (!(cfg->flags & GPIO_GENERIC_UNREADABLE_REG_SET) &&
+	    (cfg->flags & GPIO_GENERIC_READ_OUTPUT_REG_SET)) {
 		gc->get = bgpio_get_set;
 		if (!chip->be_bits)
 			gc->get_multiple = bgpio_get_set_multiple;
@@ -593,19 +593,19 @@ static int bgpio_setup_direction(struct gpio_generic_chip *chip,
 	if (cfg->dirout || cfg->dirin) {
 		chip->reg_dir_out = cfg->dirout;
 		chip->reg_dir_in = cfg->dirin;
-		if (cfg->flags & BGPIOF_NO_SET_ON_INPUT)
+		if (cfg->flags & GPIO_GENERIC_NO_SET_ON_INPUT)
 			gc->direction_output = bgpio_dir_out_dir_first;
 		else
 			gc->direction_output = bgpio_dir_out_val_first;
 		gc->direction_input = bgpio_dir_in;
 		gc->get_direction = bgpio_get_dir;
 	} else {
-		if (cfg->flags & BGPIOF_NO_OUTPUT)
+		if (cfg->flags & GPIO_GENERIC_NO_OUTPUT)
 			gc->direction_output = bgpio_dir_out_err;
 		else
 			gc->direction_output = bgpio_simple_dir_out;
 
-		if (cfg->flags & BGPIOF_NO_INPUT)
+		if (cfg->flags & GPIO_GENERIC_NO_INPUT)
 			gc->direction_input = bgpio_dir_in_err;
 		else
 			gc->direction_input = bgpio_simple_dir_in;
@@ -654,7 +654,7 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 	gc->label = dev_name(dev);
 	gc->base = -1;
 	gc->request = bgpio_request;
-	chip->be_bits = !!(flags & BGPIOF_BIG_ENDIAN);
+	chip->be_bits = !!(flags & GPIO_GENERIC_BIG_ENDIAN);
 
 	ret = gpiochip_get_ngpios(gc, dev);
 	if (ret)
@@ -665,7 +665,7 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 		return ret;
 
 	ret = bgpio_setup_accessors(dev, chip,
-				    flags & BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+				    flags & GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER);
 	if (ret)
 		return ret;
 
@@ -673,7 +673,7 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 	if (ret)
 		return ret;
 
-	if (flags & BGPIOF_PINCTRL_BACKEND) {
+	if (flags & GPIO_GENERIC_PINCTRL_BACKEND) {
 		chip->pinctrl = true;
 		/* Currently this callback is only used for pincontrol */
 		gc->free = gpiochip_generic_free;
@@ -681,17 +681,17 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 
 	chip->sdata = chip->read_reg(chip->reg_dat);
 	if (gc->set == bgpio_set_set &&
-			!(flags & BGPIOF_UNREADABLE_REG_SET))
+			!(flags & GPIO_GENERIC_UNREADABLE_REG_SET))
 		chip->sdata = chip->read_reg(chip->reg_set);
 
-	if (flags & BGPIOF_UNREADABLE_REG_DIR)
+	if (flags & GPIO_GENERIC_UNREADABLE_REG_DIR)
 		chip->dir_unreadable = true;
 
 	/*
 	 * Inspect hardware to find initial direction setting.
 	 */
 	if ((chip->reg_dir_out || chip->reg_dir_in) &&
-	    !(flags & BGPIOF_UNREADABLE_REG_DIR)) {
+	    !(flags & GPIO_GENERIC_UNREADABLE_REG_DIR)) {
 		if (chip->reg_dir_out)
 			chip->sdir = chip->read_reg(chip->reg_dir_out);
 		else if (chip->reg_dir_in)
@@ -787,10 +787,10 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (device_is_big_endian(dev))
-		flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+		flags |= GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
 
 	if (device_property_read_bool(dev, "no-output"))
-		flags |= BGPIOF_NO_OUTPUT;
+		flags |= GPIO_GENERIC_NO_OUTPUT;
 
 	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index a2a83afb41bbb92c2a1510f67de086cf3b99ff1c..bfe828734ee1bacc735e494abca9d3011f020ee9 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -350,13 +350,13 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 		.sz = 4,
 		.dat = mpc8xxx_gc->regs + GPIO_DAT,
 		.dirout = mpc8xxx_gc->regs + GPIO_DIR,
-		.flags = BGPIOF_BIG_ENDIAN
+		.flags = GPIO_GENERIC_BIG_ENDIAN
 	};
 
 	if (device_property_read_bool(dev, "little-endian")) {
 		dev_dbg(dev, "GPIO registers are LITTLE endian\n");
 	} else {
-		config.flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+		config.flags |= GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
 		dev_dbg(dev, "GPIO registers are BIG endian\n");
 	}
 
diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index e7bb9b2cd6cf32baa71b4185ea274075a7bc2d8f..91230be51587908dcfa9b411eabc2fd920056045 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -242,7 +242,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 		.set = set,
 		.clr = ctrl,
 		.dirout = diro,
-		.flags = BGPIOF_NO_SET_ON_INPUT,
+		.flags = GPIO_GENERIC_NO_SET_ON_INPUT,
 	};
 
 	ret = gpio_generic_chip_init(&rg->chip, &config);
diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 433cbadc3a4cc67ebc89a4702280975fa8d2c9bc..52060b3ec7458a8f8b2915ccd9d64617861b2c2c 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -481,7 +481,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	config.dat = port->base + GPIO_PSR;
 	config.set = port->base + GPIO_DR;
 	config.dirout = port->base + GPIO_GDIR;
-	config.flags = BGPIOF_READ_OUTPUT_REG_SET;
+	config.flags = GPIO_GENERIC_READ_OUTPUT_REG_SET;
 
 	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index fb479d13eb01a49218ad4229e7d4f70f096f5a2e..7bbc6f0ce4c8a78f5ac7258ae412d84930562604 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -245,7 +245,7 @@ static int rda_gpio_probe(struct platform_device *pdev)
 		.clr = rda_gpio->base + RDA_GPIO_CLR,
 		.dirout = rda_gpio->base + RDA_GPIO_OEN_SET_OUT,
 		.dirin = rda_gpio->base + RDA_GPIO_OEN_SET_IN,
-		.flags = BGPIOF_READ_OUTPUT_REG_SET,
+		.flags = GPIO_GENERIC_READ_OUTPUT_REG_SET,
 	};
 
 	ret = gpio_generic_chip_init(&rda_gpio->chip, &config);
diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 37b4f73771e651e95b6127befe579ea76e03a102..de527f4fc6c2ad770015685b8b5c822afd5493f0 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -395,7 +395,7 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 		ctrl->bank_write = realtek_gpio_bank_write;
 		ctrl->line_imr_pos = realtek_gpio_line_imr_pos;
 	} else {
-		gen_gc_flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+		gen_gc_flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
 		ctrl->bank_read = realtek_gpio_bank_read_swapped;
 		ctrl->bank_write = realtek_gpio_bank_write_swapped;
 		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 2ced87ffd3bbf219c11857391eb4ea808adc0527..94ef2efbd14f572d18b704fb391f4ed0177a4222 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -223,7 +223,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 		.set = chip->base + SIFIVE_GPIO_OUTPUT_VAL,
 		.dirout = chip->base + SIFIVE_GPIO_OUTPUT_EN,
 		.dirin = chip->base + SIFIVE_GPIO_INPUT_EN,
-		.flags = BGPIOF_READ_OUTPUT_REG_SET,
+		.flags = GPIO_GENERIC_READ_OUTPUT_REG_SET,
 	};
 
 	ret = gpio_generic_chip_init(&chip->gen_gc, &config);
diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index a0af23f732819be9329af1cb62887dc6eb100ac9..eb66a15c002fc30592179a387e1bc77bd7c4a920 100644
--- a/drivers/gpio/gpio-spacemit-k1.c
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -197,7 +197,8 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 		.clr = clr,
 		.dirout = dirout,
 		.dirin = dirin,
-		.flags = BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR,
+		.flags = GPIO_GENERIC_UNREADABLE_REG_SET |
+			 GPIO_GENERIC_UNREADABLE_REG_DIR,
 	};
 
 	/* This registers 32 GPIO lines per bank */
diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index f3590db72b141223e0a957825e94222056aa77bb..aa8586d8a787f0bc50f23d8b54afee6982a418f5 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -296,14 +296,14 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	}
 
 	gc = &port->chip.gc;
-	flags = BGPIOF_PINCTRL_BACKEND;
+	flags = GPIO_GENERIC_PINCTRL_BACKEND;
 	/*
 	 * We only read the output register for current value on output
 	 * lines if the direction register is available so we can switch
 	 * direction.
 	 */
 	if (port->sdata->have_paddr)
-		flags |= BGPIOF_READ_OUTPUT_REG_SET;
+		flags |= GPIO_GENERIC_READ_OUTPUT_REG_SET;
 
 	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 7f45c2897c3f270430ef7ac34ef064b2e2c58abc..3a5940039428836148f47ae59e7cfbd84a905f33 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1842,7 +1842,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 			.dat = pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DIN,
 			.set = pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DOUT,
 			.dirin = pctrl->gpio_bank[id].base + NPCM7XX_GP_N_IEM,
-			.flags = BGPIOF_READ_OUTPUT_REG_SET,
+			.flags = GPIO_GENERIC_READ_OUTPUT_REG_SET,
 		};
 
 		ret = gpio_generic_chip_init(&pctrl->gpio_bank[id].chip, &config);
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 920dd207792596055d6f6da9403a9b7516531277..8804ae98d10e233ff7e20fe72d259f4d9cf45d0f 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2335,7 +2335,7 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 			.dat = pctrl->gpio_bank[id].base + NPCM8XX_GP_N_DIN,
 			.set = pctrl->gpio_bank[id].base + NPCM8XX_GP_N_DOUT,
 			.dirin = pctrl->gpio_bank[id].base + NPCM8XX_GP_N_IEM,
-			.flags = BGPIOF_READ_OUTPUT_REG_SET,
+			.flags = GPIO_GENERIC_READ_OUTPUT_REG_SET,
 		};
 
 		ret = gpio_generic_chip_init(&pctrl->gpio_bank[id].chip, &config);
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 4dd8a3daa83e44b0e2780fedb03ab11fa46a4b7d..c575949e42e67b1bf08067b5ec75d54de6bd26cc 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -1061,7 +1061,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 			set = pctrl->gpio_base + bank->dataout;
 			dirout = pctrl->gpio_base + bank->cfg0;
 		} else {
-			flags = BGPIOF_NO_OUTPUT;
+			flags = GPIO_GENERIC_NO_OUTPUT;
 		}
 
 		config = (typeof(config)){
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index a8a4c2eee837ad90581d35822d49ab8e4708a8e8..533d53e169ea2e25ba1d243dffd615a79333ffdf 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -648,7 +648,7 @@ static int stm32_hdp_probe(struct platform_device *pdev)
 		.dat = hdp->base + HDP_GPOVAL,
 		.set = hdp->base + HDP_GPOSET,
 		.clr = hdp->base + HDP_GPOCLR,
-		.flags = BGPIOF_NO_INPUT,
+		.flags = GPIO_GENERIC_NO_INPUT,
 	};
 
 	err = gpio_generic_chip_init(&hdp->gpio_chip, &config);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 9b14fd20f13eee7d465e065e7ded2c92e2bbc78e..e62622e42cad378f6c0bee12fb9a0b29eff1f471 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -684,15 +684,15 @@ int gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *gc,
 
 #endif /* CONFIG_IRQ_DOMAIN_HIERARCHY */
 
-#define BGPIOF_BIG_ENDIAN		BIT(0)
-#define BGPIOF_UNREADABLE_REG_SET	BIT(1) /* reg_set is unreadable */
-#define BGPIOF_UNREADABLE_REG_DIR	BIT(2) /* reg_dir is unreadable */
-#define BGPIOF_BIG_ENDIAN_BYTE_ORDER	BIT(3)
-#define BGPIOF_READ_OUTPUT_REG_SET	BIT(4) /* reg_set stores output value */
-#define BGPIOF_NO_OUTPUT		BIT(5) /* only input */
-#define BGPIOF_NO_SET_ON_INPUT		BIT(6)
-#define BGPIOF_PINCTRL_BACKEND		BIT(7) /* Call pinctrl direction setters */
-#define BGPIOF_NO_INPUT			BIT(8) /* only output */
+#define GPIO_GENERIC_BIG_ENDIAN			BIT(0)
+#define GPIO_GENERIC_UNREADABLE_REG_SET		BIT(1) /* reg_set is unreadable */
+#define GPIO_GENERIC_UNREADABLE_REG_DIR		BIT(2) /* reg_dir is unreadable */
+#define GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER	BIT(3)
+#define GPIO_GENERIC_READ_OUTPUT_REG_SET	BIT(4) /* reg_set stores output value */
+#define GPIO_GENERIC_NO_OUTPUT			BIT(5) /* only input */
+#define GPIO_GENERIC_NO_SET_ON_INPUT		BIT(6)
+#define GPIO_GENERIC_PINCTRL_BACKEND		BIT(7) /* Call pinctrl direction setters */
+#define GPIO_GENERIC_NO_INPUT			BIT(8) /* only output */
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 int gpiochip_irqchip_add_domain(struct gpio_chip *gc,

-- 
2.48.1


