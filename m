Return-Path: <linux-gpio+bounces-13770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2069ED18D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 17:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7755D18894D5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 16:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CAC11DDC06;
	Wed, 11 Dec 2024 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kaAV0jIe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492811DCB09;
	Wed, 11 Dec 2024 16:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733934482; cv=none; b=HKjMxyQ8ag8+rtSXW5s6Dt8l+R/093MSfxq/SzozC3WQIvCm5aS/eFdXKcdSWjrCMPOMhy2XOn/17V43LTQ1cWcb5vlBECRF4EjST77537TRYgr4+dYVTGVrI73pKOP2hTP1C0fv1JbKTxVx6PWIw3Sa9Nd9aei3aH89OaIpKes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733934482; c=relaxed/simple;
	bh=A72m0aIUimExktaT990umlPxE578madL+BQI1rpCTdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJVyvwLLE09S2AdSruQUFcl+2BI8zXCHe4Upzg5XxXu/FvMQdyjyDIhsZ2iefm9ySMFvxSElj3v2EFNYb1jxCUIXyyDmy+9PDpET6TBO2+nUAN5c/iufAXsg2epgv/wjUXKYdOJXMB7rUFSJokgq1f6qdD9my1D2hENM1ubyU1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kaAV0jIe; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8650C24000D;
	Wed, 11 Dec 2024 16:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733934472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQayVAe1OKxHfTylerB8TQVBruMZzFhLn/t/stczNho=;
	b=kaAV0jIeXmltH5Iy+ZBRkyzAcTGDb2+z5aAzX/Xgmj7amkdiym+9dJDhjaMOSQKHPcUZA8
	5jJri6Gu6/+0tX+S5Of22E9vX+vLCTI1OYq8Nzj0CYP5DzQj0rxlEifvrfClCWUbMcXxkk
	l2ZRb4VEq/BcTw26HN2wXhiQEHbIT5FMl8PuSXejg03Bb080T/3Y1U0K/9qhIYOMPRFdbc
	FMCCeC3ct8t5kwRxDr8sLZie4Ajul8TRahjUtX9T+HB21aX1i80I8EgGdOr57LHIxgPriM
	6Dd2mSrTigMONqtBn9uO1Tb2jVUcFqk4/dQ2B175LZMQoN+zkzIIPpuD21mp7Q==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 11 Dec 2024 17:27:17 +0100
Subject: [PATCH 2/5] leds: Add AAEON UP board LED driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-aaeon-up-board-pinctrl-support-v1-2-24719be27631@bootlin.com>
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
In-Reply-To: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: thomas.richard@bootlin.com

Add support for LEDs on AAEON UP boards. These leds are managed by the
onboard FPGA:
- UP boards: yellow, green, red
- UP Squared boards: blue, yellow, green, red

Based on the work done by Gary Wang <garywang@aaeon.com.tw>, largely
rewritten.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/leds/Kconfig        |   9 ++++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-upboard.c | 126 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 136 insertions(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b784bb74a837..984ef5cfa9fa 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -815,6 +815,15 @@ config LEDS_SC27XX_BLTC
 	  This driver can also be built as a module. If so the module will be
 	  called leds-sc27xx-bltc.
 
+config LEDS_UPBOARD
+	tristate "LED support for the UP board"
+	depends on LEDS_CLASS && MFD_UPBOARD_FPGA
+	help
+	  This option enables support for the UP board LEDs.
+
+	  This driver can also be built as a module. If so the module will be
+	  called leds-upboard.
+
 comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
 
 config LEDS_BLINKM
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 18afbb5a23ee..e7982938ddc1 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -89,6 +89,7 @@ obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
 obj-$(CONFIG_LEDS_TLC591XX)		+= leds-tlc591xx.o
 obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
 obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
+obj-$(CONFIG_LEDS_UPBOARD)		+= leds-upboard.o
 obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
 obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
 obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
diff --git a/drivers/leds/leds-upboard.c b/drivers/leds/leds-upboard.c
new file mode 100644
index 000000000000..b350eb294280
--- /dev/null
+++ b/drivers/leds/leds-upboard.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * UP board LED driver.
+ *
+ * Copyright (c) AAEON. All rights reserved.
+ * Copyright (C) 2024 Bootlin
+ *
+ * Author: Gary Wang <garywang@aaeon.com.tw>
+ * Author: Thomas Richard <thomas.richard@bootlin.com>
+ */
+
+#include <linux/device.h>
+#include <linux/container_of.h>
+#include <linux/leds.h>
+#include <linux/mfd/upboard-fpga.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define led_cdev_to_led_upboard(c)	container_of(c, struct upboard_led, cdev)
+
+struct upboard_led {
+	struct regmap_field *field;
+	struct led_classdev cdev;
+};
+
+struct upboard_led_profile {
+	const char *name;
+	unsigned int bit;
+};
+
+static struct upboard_led_profile upboard_up_led_profile[] = {
+	{ "upboard:yellow:" LED_FUNCTION_STATUS, 0 },
+	{ "upboard:green:" LED_FUNCTION_STATUS, 1 },
+	{ "upboard:red:" LED_FUNCTION_STATUS, 2 },
+};
+
+static struct upboard_led_profile upboard_up2_led_profile[] = {
+	{ "upboard:blue:" LED_FUNCTION_STATUS, 0 },
+	{ "upboard:yellow:" LED_FUNCTION_STATUS, 1 },
+	{ "upboard:green:" LED_FUNCTION_STATUS, 2 },
+	{ "upboard:red:" LED_FUNCTION_STATUS, 3 },
+};
+
+static enum led_brightness upboard_led_brightness_get(struct led_classdev *cdev)
+{
+	struct upboard_led *led = led_cdev_to_led_upboard(cdev);
+	int brightness, ret;
+
+	ret = regmap_field_read(led->field, &brightness);
+
+	return ret ? LED_OFF : brightness;
+};
+
+static int upboard_led_brightness_set(struct led_classdev *cdev, enum led_brightness brightness)
+{
+	struct upboard_led *led = led_cdev_to_led_upboard(cdev);
+
+	return regmap_field_write(led->field, brightness != LED_OFF);
+};
+
+static int upboard_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct upboard_fpga *fpga = dev_get_drvdata(dev->parent);
+	struct upboard_led_profile *led_profile;
+	struct upboard_led *led;
+	int led_instances, ret, i;
+
+	switch (fpga->fpga_data->type) {
+	case UPBOARD_UP_FPGA:
+		led_profile = upboard_up_led_profile;
+		led_instances = ARRAY_SIZE(upboard_up_led_profile);
+		break;
+	case UPBOARD_UP2_FPGA:
+		led_profile = upboard_up2_led_profile;
+		led_instances = ARRAY_SIZE(upboard_up2_led_profile);
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL, "Unknown device type %d\n",
+				     fpga->fpga_data->type);
+	}
+
+	for (i = 0; i < led_instances; i++) {
+		const struct reg_field fldconf = {
+			.reg = UPBOARD_REG_FUNC_EN0,
+			.lsb = led_profile[i].bit,
+			.msb = led_profile[i].bit,
+		};
+
+		led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
+		if (!led)
+			return -ENOMEM;
+
+		led->field = devm_regmap_field_alloc(&pdev->dev, fpga->regmap, fldconf);
+		if (IS_ERR(led->field))
+			return PTR_ERR(led->field);
+
+		led->cdev.brightness_get = upboard_led_brightness_get;
+		led->cdev.brightness_set_blocking = upboard_led_brightness_set;
+		led->cdev.max_brightness = LED_ON;
+
+		led->cdev.name = led_profile[i].name;
+
+		ret = devm_led_classdev_register(dev, &led->cdev);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver upboard_led_driver = {
+	.driver = {
+		.name = "upboard-leds",
+	},
+	.probe = upboard_led_probe,
+};
+
+module_platform_driver(upboard_led_driver);
+
+MODULE_AUTHOR("Gary Wang <garywang@aaeon.com.tw>");
+MODULE_AUTHOR("Thomas Richard <thomas.richard@bootlin.com>");
+MODULE_DESCRIPTION("UP Board LED driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:upboard-led");

-- 
2.39.5


