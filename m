Return-Path: <linux-gpio+bounces-11449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECF59A0E14
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 17:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 954361F223A5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 15:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A6620E003;
	Wed, 16 Oct 2024 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YjfI+QK3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE3120B201
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 15:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092294; cv=none; b=PWHwE1FTabiQmANkvBiuGn2S5qbIRdsvmA2TlIg5VGuW6Jh73xcsX+FyOd6Rr3dOcqjgtOx9s3MbScNxTGt2AX4tTKzKHQ/A7zIzXfODhnqfj8Qf8DDuaPVbZB1eAW3KVsveK5xFNF2qcqAF1NWqF8oSZoRpg/SCBzD1FVkJ89s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092294; c=relaxed/simple;
	bh=3lafsJYdee8pS9NNbzkW4HLcS0VD33eMlHoq5cyYIks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ENV8HnKFLEMUeSU7k9cpgIa4EeFcozSk7Z4DAxhaS514KXZq224qRJnuiywkDpqEwRUYIyTxiyGNAjxLAtjLgtKyxtJaTlMP/pcSvTiq37fqzZ8M5FXPTXFIxGpV/PGmkLwJF20HrVq+gMK5YLcZo3AgILhun1q+NKrf3evB6Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YjfI+QK3; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53a0c160b94so147301e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 08:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729092290; x=1729697090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V9F0oSqsLsAIbz1FF7LAsC5dQEfuBTiNpeqMxdTTksI=;
        b=YjfI+QK3qTD9fWo0WRvjxMBbRsOT9yZsdmbDR2SUUbZZmV1upBPwUmlAeWqsoPtQcd
         /H4qPNYqLK9tYwRYKlsh6nmmza4jQFiyU40ISmwXLpkZJ7pkH/jHk0kjJgNK4KXk6SzQ
         EMVOtFnnx/Yna9TTe2qOrzbRhQH+Mo3iq/HuzTLjs2s9VYObf989ehyh2qIEuPsxMold
         e3jOCJ0VMgghZLH7VTCezGY/rKWTpN0uyRvu2Vv9wkool/GWZatXjPCFVxEaHXG53k7b
         kQBWpXnbutgsB3mbTzwzdW2U6eTfTiA4/XJnAE2fFJhhGY+Us8+MiU0jRhWuBbF02fjf
         Utqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729092290; x=1729697090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9F0oSqsLsAIbz1FF7LAsC5dQEfuBTiNpeqMxdTTksI=;
        b=IF/Ukn4SWKAmqcOkVHGOKUguT1b50BsTHJ+TOxeS6L76gbYyI2SLd+2A5DawZlMjTQ
         sl/X01uoxbmAjQIZER5IgT+sgVMgKFlWOqNioCCcNBopcGBFOv5hTEgXEDVZs9MCR5l6
         NaVdCtHHagHNZ5LVoflZiNrrCeB5UH8Bkxp5zS5xHS/3OOhw3HGnxtK7qglAcGLx5Ufk
         WID4Jv+8e5UjnJJbCUC7QDokuv+OVZzAQ5TBcoYkMclhygXwWEnvVuoKybPxWBDRr8EX
         sO534cJyivxeD78tR+EmGuaVjXalRv8BL/l/n2vYHpftyU9eNsg4aQUv4w/xvYJXgHts
         MCxA==
X-Gm-Message-State: AOJu0Yyyu5E+gsLFQo422bq5L7wnvRNJkMvi/ayxfKYcz5+VTGcC4CGs
	dhSD8MDXwe3cWaOMqHoeZhc9YrgjpPcvHnbYgK71jWLYbfb1fYWi+iEiMLcw/3g=
X-Google-Smtp-Source: AGHT+IEbbPvwHpyQPqLfBBAY1zViFIB5vnZrzNVR0sddz9lcTDz9vXl+Y815bg2JyY7UhQ9GnwyL4A==
X-Received: by 2002:a05:6512:e9d:b0:536:52ed:a23f with SMTP id 2adb3069b0e04-539e540baffmr8251735e87.0.1729092288031;
        Wed, 16 Oct 2024 08:24:48 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29717151sm195727166b.22.2024.10.16.08.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 08:24:47 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: Switch back to struct platform_driver::remove()
Date: Wed, 16 Oct 2024 17:24:36 +0200
Message-ID: <20241016152435.38149-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=13359; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=3lafsJYdee8pS9NNbzkW4HLcS0VD33eMlHoq5cyYIks=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnD9qziVd3BEbsoeLNsNUFlIKl+AvDBT2Vyz4F4 Nd/2dxW0sqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZw/aswAKCRCPgPtYfRL+ TrqBB/4zsX9q+9v5ieBfjDVJmib1+MF9jnj+6zr5cTf7MIY/VmjCc//YBZ2sm+5v7bA3wFSiPBg 17REIwe+pOuBEvcDE5c53JBepY5w7hOPA7MNZ1z6WyV6PalcE+MmMaM4aiaolFcN1c1Uc5rftu/ l5B0oLOLGnTyAgPqfWj8N76CGoYVBV0cml0d66glkxf/xqnJaBdJDSD2A2wJWCZnt74A92TOsIK 4j30FjfU0/R5fdyqeLSnlw4d9H7IGo5v50x4gXczChSolP1HtP9Khm6ozx9IlaAjh6wzVu0hApi LJjXKWjFBraIsksNyy9I3etTtN7JpUdEQQmOghRUrTAbDLkG
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/gpio/ to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

converting all drivers in a single patch as the individual changes are
trivial and I don't expect conflicts with backporting etc.

Note I didn't Cc: the individual maintainers to prevent sending limits
and spam filters triggering.

Best regards
Uwe

 drivers/gpio/gpio-altera.c                | 2 +-
 drivers/gpio/gpio-amdpt.c                 | 2 +-
 drivers/gpio/gpio-brcmstb.c               | 2 +-
 drivers/gpio/gpio-cadence.c               | 2 +-
 drivers/gpio/gpio-dln2.c                  | 2 +-
 drivers/gpio/gpio-ftgpio010.c             | 2 +-
 drivers/gpio/gpio-grgpio.c                | 2 +-
 drivers/gpio/gpio-lpc18xx.c               | 2 +-
 drivers/gpio/gpio-mb86s7x.c               | 2 +-
 drivers/gpio/gpio-mm-lantiq.c             | 2 +-
 drivers/gpio/gpio-mpc5200.c               | 4 ++--
 drivers/gpio/gpio-mpc8xxx.c               | 2 +-
 drivers/gpio/gpio-omap.c                  | 2 +-
 drivers/gpio/gpio-rcar.c                  | 2 +-
 drivers/gpio/gpio-rockchip.c              | 2 +-
 drivers/gpio/gpio-sloppy-logic-analyzer.c | 2 +-
 drivers/gpio/gpio-tb10x.c                 | 2 +-
 drivers/gpio/gpio-ts5500.c                | 2 +-
 drivers/gpio/gpio-uniphier.c              | 2 +-
 drivers/gpio/gpio-xgene-sb.c              | 2 +-
 drivers/gpio/gpio-xgs-iproc.c             | 2 +-
 drivers/gpio/gpio-xilinx.c                | 2 +-
 drivers/gpio/gpio-zynq.c                  | 2 +-
 23 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index c2edfbb231fc..6340134d68c6 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -336,7 +336,7 @@ static struct platform_driver altera_gpio_driver = {
 		.of_match_table = altera_gpio_of_match,
 	},
 	.probe		= altera_gpio_probe,
-	.remove_new	= altera_gpio_remove,
+	.remove		= altera_gpio_remove,
 };
 
 static int __init altera_gpio_init(void)
diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index 0a2ea9db4682..b3e052f4c85e 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -143,7 +143,7 @@ static struct platform_driver pt_gpio_driver = {
 		.acpi_match_table = ACPI_PTR(pt_gpio_acpi_match),
 	},
 	.probe = pt_gpio_probe,
-	.remove_new = pt_gpio_remove,
+	.remove = pt_gpio_remove,
 };
 
 module_platform_driver(pt_gpio_driver);
diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 5762e517338e..491b529d25f8 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -751,7 +751,7 @@ static struct platform_driver brcmstb_gpio_driver = {
 		.pm = &brcmstb_gpio_pm_ops,
 	},
 	.probe = brcmstb_gpio_probe,
-	.remove_new = brcmstb_gpio_remove,
+	.remove = brcmstb_gpio_remove,
 	.shutdown = brcmstb_gpio_shutdown,
 };
 module_platform_driver(brcmstb_gpio_driver);
diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index 1b8ffd0ddab6..e9dd2564c54f 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -277,7 +277,7 @@ static struct platform_driver cdns_gpio_driver = {
 		.of_match_table = cdns_of_ids,
 	},
 	.probe = cdns_gpio_probe,
-	.remove_new = cdns_gpio_remove,
+	.remove = cdns_gpio_remove,
 };
 module_platform_driver(cdns_gpio_driver);
 
diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index 7ead1f51128a..596da59d4b13 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -512,7 +512,7 @@ static void dln2_gpio_remove(struct platform_device *pdev)
 static struct platform_driver dln2_gpio_driver = {
 	.driver.name	= "dln2-gpio",
 	.probe		= dln2_gpio_probe,
-	.remove_new	= dln2_gpio_remove,
+	.remove		= dln2_gpio_remove,
 };
 
 module_platform_driver(dln2_gpio_driver);
diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 97d345b59352..5b07749dbdff 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -350,6 +350,6 @@ static struct platform_driver ftgpio_gpio_driver = {
 		.of_match_table = ftgpio_gpio_of_match,
 	},
 	.probe = ftgpio_gpio_probe,
-	.remove_new = ftgpio_gpio_remove,
+	.remove = ftgpio_gpio_remove,
 };
 builtin_platform_driver(ftgpio_gpio_driver);
diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 017c7170eb57..aa089e195496 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -455,7 +455,7 @@ static struct platform_driver grgpio_driver = {
 		.of_match_table = grgpio_match,
 	},
 	.probe = grgpio_probe,
-	.remove_new = grgpio_remove,
+	.remove = grgpio_remove,
 };
 module_platform_driver(grgpio_driver);
 
diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
index e7c0ef6e54fa..2cf9fb4637a2 100644
--- a/drivers/gpio/gpio-lpc18xx.c
+++ b/drivers/gpio/gpio-lpc18xx.c
@@ -388,7 +388,7 @@ MODULE_DEVICE_TABLE(of, lpc18xx_gpio_match);
 
 static struct platform_driver lpc18xx_gpio_driver = {
 	.probe	= lpc18xx_gpio_probe,
-	.remove_new = lpc18xx_gpio_remove,
+	.remove	= lpc18xx_gpio_remove,
 	.driver	= {
 		.name		= "lpc18xx-gpio",
 		.of_match_table	= lpc18xx_gpio_match,
diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index ccbb63c21d6f..7efc9fc6f4cd 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -227,7 +227,7 @@ static struct platform_driver mb86s70_gpio_driver = {
 		.acpi_match_table = ACPI_PTR(mb86s70_gpio_acpi_ids),
 	},
 	.probe = mb86s70_gpio_probe,
-	.remove_new = mb86s70_gpio_remove,
+	.remove = mb86s70_gpio_remove,
 };
 module_platform_driver(mb86s70_gpio_driver);
 
diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index e855c68c981b..14ae25783438 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -136,7 +136,7 @@ MODULE_DEVICE_TABLE(of, ltq_mm_match);
 
 static struct platform_driver ltq_mm_driver = {
 	.probe = ltq_mm_probe,
-	.remove_new = ltq_mm_remove,
+	.remove = ltq_mm_remove,
 	.driver = {
 		.name = "gpio-mm-ltq",
 		.of_match_table = ltq_mm_match,
diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
index a199dce3394a..091d96f2d682 100644
--- a/drivers/gpio/gpio-mpc5200.c
+++ b/drivers/gpio/gpio-mpc5200.c
@@ -183,7 +183,7 @@ static struct platform_driver mpc52xx_wkup_gpiochip_driver = {
 		.of_match_table = mpc52xx_wkup_gpiochip_match,
 	},
 	.probe = mpc52xx_wkup_gpiochip_probe,
-	.remove_new = mpc52xx_gpiochip_remove,
+	.remove = mpc52xx_gpiochip_remove,
 };
 
 /*
@@ -336,7 +336,7 @@ static struct platform_driver mpc52xx_simple_gpiochip_driver = {
 		.of_match_table = mpc52xx_simple_gpiochip_match,
 	},
 	.probe = mpc52xx_simple_gpiochip_probe,
-	.remove_new = mpc52xx_gpiochip_remove,
+	.remove = mpc52xx_gpiochip_remove,
 };
 
 static struct platform_driver * const drivers[] = {
diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 2f66e24127f4..24417c3247b0 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -460,7 +460,7 @@ MODULE_DEVICE_TABLE(acpi, gpio_acpi_ids);
 
 static struct platform_driver mpc8xxx_plat_driver = {
 	.probe		= mpc8xxx_probe,
-	.remove_new	= mpc8xxx_remove,
+	.remove		= mpc8xxx_remove,
 	.driver		= {
 		.name = "gpio-mpc8xxx",
 		.of_match_table	= mpc8xxx_gpio_ids,
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 76d5d87e9681..7ad453405496 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1557,7 +1557,7 @@ static const struct dev_pm_ops gpio_pm_ops = {
 
 static struct platform_driver omap_gpio_driver = {
 	.probe		= omap_gpio_probe,
-	.remove_new	= omap_gpio_remove,
+	.remove		= omap_gpio_remove,
 	.driver		= {
 		.name	= "omap_gpio",
 		.pm	= &gpio_pm_ops,
diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 6159fda38d5d..2ecee3269a0c 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -657,7 +657,7 @@ static SIMPLE_DEV_PM_OPS(gpio_rcar_pm_ops, gpio_rcar_suspend, gpio_rcar_resume);
 
 static struct platform_driver gpio_rcar_device_driver = {
 	.probe		= gpio_rcar_probe,
-	.remove_new	= gpio_rcar_remove,
+	.remove		= gpio_rcar_remove,
 	.driver		= {
 		.name	= "gpio_rcar",
 		.pm     = &gpio_rcar_pm_ops,
diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 365ab947983c..a7e115e4352a 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -795,7 +795,7 @@ static const struct of_device_id rockchip_gpio_match[] = {
 
 static struct platform_driver rockchip_gpio_driver = {
 	.probe		= rockchip_gpio_probe,
-	.remove_new	= rockchip_gpio_remove,
+	.remove		= rockchip_gpio_remove,
 	.driver		= {
 		.name	= "rockchip-gpio",
 		.of_match_table = rockchip_gpio_match,
diff --git a/drivers/gpio/gpio-sloppy-logic-analyzer.c b/drivers/gpio/gpio-sloppy-logic-analyzer.c
index 07e0d7180579..64f2ca4a72b2 100644
--- a/drivers/gpio/gpio-sloppy-logic-analyzer.c
+++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
@@ -311,7 +311,7 @@ MODULE_DEVICE_TABLE(of, gpio_la_poll_of_match);
 
 static struct platform_driver gpio_la_poll_device_driver = {
 	.probe = gpio_la_poll_probe,
-	.remove_new = gpio_la_poll_remove,
+	.remove = gpio_la_poll_remove,
 	.driver = {
 		.name = GPIO_LA_NAME,
 		.of_match_table = gpio_la_poll_of_match,
diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index e8c1485b9c73..b6335cde455f 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -235,7 +235,7 @@ MODULE_DEVICE_TABLE(of, tb10x_gpio_dt_ids);
 
 static struct platform_driver tb10x_gpio_driver = {
 	.probe		= tb10x_gpio_probe,
-	.remove_new	= tb10x_gpio_remove,
+	.remove		= tb10x_gpio_remove,
 	.driver = {
 		.name	= "tb10x-gpio",
 		.of_match_table = tb10x_gpio_dt_ids,
diff --git a/drivers/gpio/gpio-ts5500.c b/drivers/gpio/gpio-ts5500.c
index 90f8e9e9915e..61cbec5c06a7 100644
--- a/drivers/gpio/gpio-ts5500.c
+++ b/drivers/gpio/gpio-ts5500.c
@@ -433,7 +433,7 @@ static struct platform_driver ts5500_dio_driver = {
 		.name = "ts5500-dio",
 	},
 	.probe = ts5500_dio_probe,
-	.remove_new = ts5500_dio_remove,
+	.remove = ts5500_dio_remove,
 	.id_table = ts5500_dio_ids,
 };
 
diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index da99ba13e82d..d738da8718f9 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -481,7 +481,7 @@ MODULE_DEVICE_TABLE(of, uniphier_gpio_match);
 
 static struct platform_driver uniphier_gpio_driver = {
 	.probe = uniphier_gpio_probe,
-	.remove_new = uniphier_gpio_remove,
+	.remove = uniphier_gpio_remove,
 	.driver = {
 		.name = "uniphier-gpio",
 		.of_match_table = uniphier_gpio_match,
diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index bd5befa807c3..836fcf1c82fe 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -325,7 +325,7 @@ static struct platform_driver xgene_gpio_sb_driver = {
 		   .acpi_match_table = ACPI_PTR(xgene_gpio_sb_acpi_match),
 		   },
 	.probe = xgene_gpio_sb_probe,
-	.remove_new = xgene_gpio_sb_remove,
+	.remove = xgene_gpio_sb_remove,
 };
 module_platform_driver(xgene_gpio_sb_driver);
 
diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index d445eea03687..0f9d1f61fee3 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -316,7 +316,7 @@ static struct platform_driver bcm_iproc_gpio_driver = {
 		.of_match_table = bcm_iproc_gpio_of_match,
 	},
 	.probe = iproc_gpio_probe,
-	.remove_new = iproc_gpio_remove,
+	.remove = iproc_gpio_remove,
 };
 
 module_platform_driver(bcm_iproc_gpio_driver);
diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 31bb02e133fa..c6a8f2c82680 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -702,7 +702,7 @@ MODULE_DEVICE_TABLE(of, xgpio_of_match);
 
 static struct platform_driver xgpio_plat_driver = {
 	.probe		= xgpio_probe,
-	.remove_new	= xgpio_remove,
+	.remove		= xgpio_remove,
 	.driver		= {
 			.name = "gpio-xilinx",
 			.of_match_table	= xgpio_of_match,
diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 1a42336dfc1d..be81fa2b17ab 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -1023,7 +1023,7 @@ static struct platform_driver zynq_gpio_driver = {
 		.of_match_table = zynq_gpio_of_match,
 	},
 	.probe = zynq_gpio_probe,
-	.remove_new = zynq_gpio_remove,
+	.remove = zynq_gpio_remove,
 };
 
 module_platform_driver(zynq_gpio_driver);

base-commit: 15e7d45e786a62a211dd0098fee7c57f84f8c681
-- 
2.45.2


