Return-Path: <linux-gpio+bounces-17339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC974A587A8
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 20:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EC6816A123
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 19:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBE0215195;
	Sun,  9 Mar 2025 19:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="OyzQJKYL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7115920297A;
	Sun,  9 Mar 2025 19:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741549000; cv=none; b=Cq1bnViTwixyU8Wq6gPDvUP5S2RHAYef2mPNoOLqbPIotd/5UaDBrTGFZ4Kem2fzmGkuTa4yLp+JR8oaJxu1dr8HtFFmIyrB6UdWCz8aXbbvLRULHxmq3TfejQ/FBwLVmkCT63QZnRFGFWAVpw8hm0ssIKCcWLDJ30y8PtVzR6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741549000; c=relaxed/simple;
	bh=S1sPDinZTLVsiP1u0Qs9QrCGmo9x5v1nqQ1+FUtSFSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s7bO9XoObJQUSIc0OCp3ei5pr3OgJbEJ2jHhN2UXz4iV1kyIPp5pxfAkTsLYowL25CjMItxLJAG2O7CzAYOuuESQvO6LVOGrTpGvTFcs5FI5mjZfeah0q9Fol+5wEDo8HSdRUvZnRJVNG7TY1j1qHzSOZFnRxMSzblKWSvYXBu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=OyzQJKYL; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=OTVzpKrragh6daMHL2oyxU0rsCjw1//kH0kmHJYku/Y=; b=OyzQJKYLdSh4qKoa
	P6PU9hwnq5ZeuPtJKhp9ZLJFT3xvbjYwyHedE+sXDS58Qr2UwmEt3B9gbA/Y0w0aDr7mQq2xQwjXj
	+mT7OiDUXbB8kMu4lbukvGNQYVB+M5B899ugcLfFhRW7Z+8L0+aGBScRNxfAGGflCfpYofMOtngDF
	K/eoF5595bKNZG8Gf99saa8YIbUPMld1ymzeBtseWNlTetiHhI25ZcMl/JLbIWEoM9JePtAtubUqC
	Z9UOebKpsqBP/JYk1MdRLrMEj5ynUKAcdmjFYfUX35aGu0K0P9J042MzfB14OYeFEkayo+Coa44+t
	WfyNBWmC70h9qEcwgA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1trMRs-003kFU-0Z;
	Sun, 09 Mar 2025 19:36:32 +0000
From: linux@treblig.org
To: arnd@arndb.de,
	lee@kernel.org,
	dmitry.torokhov@gmail.com,
	sre@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/9] backlight: pcf50633-backlight: Remove
Date: Sun,  9 Mar 2025 19:36:05 +0000
Message-ID: <20250309193612.251929-3-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309193612.251929-1-linux@treblig.org>
References: <20250309193612.251929-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The pcf50633 was used as part of the OpenMoko devices but
the support for its main chip was recently removed in:
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")

See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/mfd/pcf50633-core.c                  |   2 -
 drivers/video/backlight/Kconfig              |   7 -
 drivers/video/backlight/Makefile             |   1 -
 drivers/video/backlight/pcf50633-backlight.c | 154 -------------------
 include/linux/mfd/pcf50633/backlight.h       |  42 -----
 include/linux/mfd/pcf50633/core.h            |   4 -
 6 files changed, 210 deletions(-)
 delete mode 100644 drivers/video/backlight/pcf50633-backlight.c
 delete mode 100644 include/linux/mfd/pcf50633/backlight.h

diff --git a/drivers/mfd/pcf50633-core.c b/drivers/mfd/pcf50633-core.c
index 70f8bbb89f76..08aa68ef2fbc 100644
--- a/drivers/mfd/pcf50633-core.c
+++ b/drivers/mfd/pcf50633-core.c
@@ -210,7 +210,6 @@ static int pcf50633_probe(struct i2c_client *client)
 	pcf50633_client_dev_register(pcf, "pcf50633-input", &pcf->input_pdev);
 	pcf50633_client_dev_register(pcf, "pcf50633-rtc", &pcf->rtc_pdev);
 	pcf50633_client_dev_register(pcf, "pcf50633-mbc", &pcf->mbc_pdev);
-	pcf50633_client_dev_register(pcf, "pcf50633-backlight", &pcf->bl_pdev);
 
 
 	for (i = 0; i < PCF50633_NUM_REGULATORS; i++) {
@@ -262,7 +261,6 @@ static void pcf50633_remove(struct i2c_client *client)
 	platform_device_unregister(pcf->input_pdev);
 	platform_device_unregister(pcf->rtc_pdev);
 	platform_device_unregister(pcf->mbc_pdev);
-	platform_device_unregister(pcf->bl_pdev);
 
 	for (i = 0; i < PCF50633_NUM_REGULATORS; i++)
 		platform_device_unregister(pcf->regulator_pdev[i]);
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 3614a5d29c71..ef4ac1ac7520 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -359,13 +359,6 @@ config BACKLIGHT_88PM860X
 	help
 	  Say Y to enable the backlight driver for Marvell 88PM8606.
 
-config BACKLIGHT_PCF50633
-	tristate "Backlight driver for NXP PCF50633 MFD"
-	depends on MFD_PCF50633
-	help
-	  If you have a backlight driven by a NXP PCF50633 MFD, say Y here to
-	  enable its driver.
-
 config BACKLIGHT_AAT2870
 	tristate "AnalogicTech AAT2870 Backlight"
 	depends on MFD_AAT2870_CORE
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 8fc98f760a8a..21bf62bcaccf 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -49,7 +49,6 @@ obj-$(CONFIG_BACKLIGHT_MP3309C)		+= mp3309c.o
 obj-$(CONFIG_BACKLIGHT_MT6370)		+= mt6370-backlight.o
 obj-$(CONFIG_BACKLIGHT_OMAP1)		+= omap1_bl.o
 obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
-obj-$(CONFIG_BACKLIGHT_PCF50633)	+= pcf50633-backlight.o
 obj-$(CONFIG_BACKLIGHT_PWM)		+= pwm_bl.o
 obj-$(CONFIG_BACKLIGHT_QCOM_WLED)	+= qcom-wled.o
 obj-$(CONFIG_BACKLIGHT_RT4831)		+= rt4831-backlight.o
diff --git a/drivers/video/backlight/pcf50633-backlight.c b/drivers/video/backlight/pcf50633-backlight.c
deleted file mode 100644
index 157be2f366df..000000000000
--- a/drivers/video/backlight/pcf50633-backlight.c
+++ /dev/null
@@ -1,154 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
- *      PCF50633 backlight device driver
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/platform_device.h>
-
-#include <linux/backlight.h>
-
-#include <linux/mfd/pcf50633/core.h>
-#include <linux/mfd/pcf50633/backlight.h>
-
-struct pcf50633_bl {
-	struct pcf50633 *pcf;
-	struct backlight_device *bl;
-
-	unsigned int brightness;
-	unsigned int brightness_limit;
-};
-
-/*
- * pcf50633_bl_set_brightness_limit
- *
- * Update the brightness limit for the pc50633 backlight. The actual brightness
- * will not go above the limit. This is useful to limit power drain for example
- * on low battery.
- *
- * @dev: Pointer to a pcf50633 device
- * @limit: The brightness limit. Valid values are 0-63
- */
-int pcf50633_bl_set_brightness_limit(struct pcf50633 *pcf, unsigned int limit)
-{
-	struct pcf50633_bl *pcf_bl = platform_get_drvdata(pcf->bl_pdev);
-
-	if (!pcf_bl)
-		return -ENODEV;
-
-	pcf_bl->brightness_limit = limit & 0x3f;
-	backlight_update_status(pcf_bl->bl);
-
-	return 0;
-}
-
-static int pcf50633_bl_update_status(struct backlight_device *bl)
-{
-	struct pcf50633_bl *pcf_bl = bl_get_data(bl);
-	unsigned int new_brightness;
-
-
-	if (bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK) ||
-		bl->props.power != BACKLIGHT_POWER_ON)
-		new_brightness = 0;
-	else if (bl->props.brightness < pcf_bl->brightness_limit)
-		new_brightness = bl->props.brightness;
-	else
-		new_brightness = pcf_bl->brightness_limit;
-
-
-	if (pcf_bl->brightness == new_brightness)
-		return 0;
-
-	if (new_brightness) {
-		pcf50633_reg_write(pcf_bl->pcf, PCF50633_REG_LEDOUT,
-					new_brightness);
-		if (!pcf_bl->brightness)
-			pcf50633_reg_write(pcf_bl->pcf, PCF50633_REG_LEDENA, 1);
-	} else {
-		pcf50633_reg_write(pcf_bl->pcf, PCF50633_REG_LEDENA, 0);
-	}
-
-	pcf_bl->brightness = new_brightness;
-
-	return 0;
-}
-
-static int pcf50633_bl_get_brightness(struct backlight_device *bl)
-{
-	struct pcf50633_bl *pcf_bl = bl_get_data(bl);
-
-	return pcf_bl->brightness;
-}
-
-static const struct backlight_ops pcf50633_bl_ops = {
-	.get_brightness = pcf50633_bl_get_brightness,
-	.update_status	= pcf50633_bl_update_status,
-	.options	= BL_CORE_SUSPENDRESUME,
-};
-
-static int pcf50633_bl_probe(struct platform_device *pdev)
-{
-	struct pcf50633_bl *pcf_bl;
-	struct device *parent = pdev->dev.parent;
-	struct pcf50633_platform_data *pcf50633_data = dev_get_platdata(parent);
-	struct pcf50633_bl_platform_data *pdata = pcf50633_data->backlight_data;
-	struct backlight_properties bl_props;
-
-	pcf_bl = devm_kzalloc(&pdev->dev, sizeof(*pcf_bl), GFP_KERNEL);
-	if (!pcf_bl)
-		return -ENOMEM;
-
-	memset(&bl_props, 0, sizeof(bl_props));
-	bl_props.type = BACKLIGHT_RAW;
-	bl_props.max_brightness = 0x3f;
-	bl_props.power = BACKLIGHT_POWER_ON;
-
-	if (pdata) {
-		bl_props.brightness = pdata->default_brightness;
-		pcf_bl->brightness_limit = pdata->default_brightness_limit;
-	} else {
-		bl_props.brightness = 0x3f;
-		pcf_bl->brightness_limit = 0x3f;
-	}
-
-	pcf_bl->pcf = dev_to_pcf50633(pdev->dev.parent);
-
-	pcf_bl->bl = devm_backlight_device_register(&pdev->dev, pdev->name,
-						&pdev->dev, pcf_bl,
-						&pcf50633_bl_ops, &bl_props);
-
-	if (IS_ERR(pcf_bl->bl))
-		return PTR_ERR(pcf_bl->bl);
-
-	platform_set_drvdata(pdev, pcf_bl);
-
-	pcf50633_reg_write(pcf_bl->pcf, PCF50633_REG_LEDDIM, pdata->ramp_time);
-
-	/*
-	 * Should be different from bl_props.brightness, so we do not exit
-	 * update_status early the first time it's called
-	 */
-	pcf_bl->brightness = pcf_bl->bl->props.brightness + 1;
-
-	backlight_update_status(pcf_bl->bl);
-
-	return 0;
-}
-
-static struct platform_driver pcf50633_bl_driver = {
-	.probe =	pcf50633_bl_probe,
-	.driver = {
-		.name = "pcf50633-backlight",
-	},
-};
-
-module_platform_driver(pcf50633_bl_driver);
-
-MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
-MODULE_DESCRIPTION("PCF50633 backlight driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:pcf50633-backlight");
diff --git a/include/linux/mfd/pcf50633/backlight.h b/include/linux/mfd/pcf50633/backlight.h
deleted file mode 100644
index fd4a4f8d6c13..000000000000
--- a/include/linux/mfd/pcf50633/backlight.h
+++ /dev/null
@@ -1,42 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
- *      PCF50633 backlight device driver
- */
-
-#ifndef __LINUX_MFD_PCF50633_BACKLIGHT
-#define __LINUX_MFD_PCF50633_BACKLIGHT
-
-/*
-* @default_brightness: Backlight brightness is initialized to this value
-*
-* Brightness to be used after the driver has been probed.
-* Valid range 0-63.
-*
-* @default_brightness_limit: The actual brightness is limited by this value
-*
-* Brightness limit to be used after the driver has been probed. This is useful
-* when it is not known how much power is available for the backlight during
-* probe.
-* Valid range 0-63. Can be changed later with pcf50633_bl_set_brightness_limit.
-*
-* @ramp_time: Display ramp time when changing brightness
-*
-* When changing the backlights brightness the change is not instant, instead
-* it fades smooth from one state to another. This value specifies how long
-* the fade should take. The lower the value the higher the fade time.
-* Valid range 0-255
-*/
-struct pcf50633_bl_platform_data {
-	unsigned int	default_brightness;
-	unsigned int	default_brightness_limit;
-	uint8_t		ramp_time;
-};
-
-
-struct pcf50633;
-
-int pcf50633_bl_set_brightness_limit(struct pcf50633 *pcf, unsigned int limit);
-
-#endif
-
diff --git a/include/linux/mfd/pcf50633/core.h b/include/linux/mfd/pcf50633/core.h
index cbf3054fd8fe..42e0412fa98f 100644
--- a/include/linux/mfd/pcf50633/core.h
+++ b/include/linux/mfd/pcf50633/core.h
@@ -15,7 +15,6 @@
 #include <linux/regulator/machine.h>
 #include <linux/pm.h>
 #include <linux/power_supply.h>
-#include <linux/mfd/pcf50633/backlight.h>
 
 struct pcf50633;
 struct regmap;
@@ -42,8 +41,6 @@ struct pcf50633_platform_data {
 	void (*force_shutdown)(struct pcf50633 *);
 
 	u8 resumers[5];
-
-	struct pcf50633_bl_platform_data *backlight_data;
 };
 
 struct pcf50633_irq {
@@ -152,7 +149,6 @@ struct pcf50633 {
 	struct platform_device *rtc_pdev;
 	struct platform_device *mbc_pdev;
 	struct platform_device *input_pdev;
-	struct platform_device *bl_pdev;
 	struct platform_device *regulator_pdev[PCF50633_NUM_REGULATORS];
 };
 
-- 
2.48.1


