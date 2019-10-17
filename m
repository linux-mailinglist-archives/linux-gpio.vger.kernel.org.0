Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A892DA95F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 11:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393992AbfJQJx5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 05:53:57 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40738 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392771AbfJQJx5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 05:53:57 -0400
Received: by mail-lf1-f65.google.com with SMTP id f23so1358255lfk.7;
        Thu, 17 Oct 2019 02:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YKPy157MyxNTX58VqQMXSnzeJYWY0GCmPfKZ6W0ULhc=;
        b=rDTEECv7WTiPAgVts7xMKp8piDOzwOkXm4MzUZ/OHY78PZtaG3b3WWy7rapmP85BTX
         fbHHQBEj11UxIdok8cvdIF6WMJodITozIMnWp7VAmey5bVmYr2d68bFyumzGyZ2ymxnv
         2Lp/VTrl9jO+Ty6Qb0mYfMe5hj54rtCffxdAmmZ1MVb0pO4L5/kRPBy7/oqjIwVI9ftt
         oiqnZnu2ydXzE4jfd1xTX62/W+9Yf58svc8gW4+jOPn9cqPQ4JziMRiKL91pv21Z+2jm
         VpRG73S4DWF/rgphZvlHCzpe4f/w4QuqU3mi5PBaYbpsl+4dPFD4MmXhQrW79a5rl429
         z9gg==
X-Gm-Message-State: APjAAAW+0H0tQOuIfl/SNGuwrdE4mi4UBxZY15EqdG+jFy8zx3MimClg
        U8xUjcqr/Ku7TH39F50NEYs=
X-Google-Smtp-Source: APXvYqzH0eJcI2UWEQVJS48oRBLJNfl3hwzsygFtbv1eR1wWDleoxyWr9Uk8fywm1gi13AVN4Xm+qQ==
X-Received: by 2002:a19:40c7:: with SMTP id n190mr1768219lfa.37.1571306033549;
        Thu, 17 Oct 2019 02:53:53 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id k23sm911286ljc.13.2019.10.17.02.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 02:53:53 -0700 (PDT)
Date:   Thu, 17 Oct 2019 12:53:39 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [RFC PATCH 11/13] led: bd71828: Support LED outputs on ROHM BD71828
 PMIC
Message-ID: <af1fb3e010d5f34502d354369b88fa28639f587d.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ROHM BD71828 power management IC has two LED outputs for charge status
and button pressing indications. The LED outputs can also be forced
bs SW so add driver allowing to use these LEDs for other indications
as well.

Leds are controlled by SW using 'Force ON' bits. Please note the
constrains mentioned in data-sheet:
1. If one LED is forced ON - then also the other LED is forced.
	=> You can't use SW control to force ON one LED and allow HW
	   to control the other.
2. You can't force both LEDs OFF. If the FORCE bit for both LED's is
   zero, then LEDs are controlled by HW and indicate button/charger
   states as explained in data-sheet.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/leds/Kconfig        | 10 ++++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-bd71828.c | 97 +++++++++++++++++++++++++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 drivers/leds/leds-bd71828.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b0fdeef10bd9..ec59f28bcb39 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -529,6 +529,16 @@ config LEDS_BD2802
 	  This option enables support for BD2802GU RGB LED driver chips
 	  accessed via the I2C bus.
 
+config LEDS_BD71828
+	tristate "LED driver for LED pins on ROHM BD71828 PMIC"
+	depends on LEDS_CLASS
+	depends on I2C
+	help
+	  This option enables support for LED outputs located on ROHM
+	   BD71828 power management IC. ROHM BD71828 has two led output pins
+	   which can be left to indicate HW states or controlled by SW. Say
+	   yes here if you want to enable SW control for these LEDs.
+
 config LEDS_INTEL_SS4200
 	tristate "LED driver for Intel NAS SS4200 series"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 41fb073a39c1..2a8f6a8e4c7c 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
 obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
 obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
+obj-$(CONFIG_LEDS_BD71828)		+= leds-bd71828.o
 obj-$(CONFIG_LEDS_CPCAP)		+= leds-cpcap.o
 obj-$(CONFIG_LEDS_LOCOMO)		+= leds-locomo.o
 obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
diff --git a/drivers/leds/leds-bd71828.c b/drivers/leds/leds-bd71828.c
new file mode 100644
index 000000000000..2427619444f5
--- /dev/null
+++ b/drivers/leds/leds-bd71828.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2019 ROHM Semiconductors
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/mfd/rohm-bd71828.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define BD71828_LED_TO_DATA(l) ((l)->id == ID_GREEN_LED ? \
+	container_of((l), struct bd71828_leds, green) : \
+	container_of((l), struct bd71828_leds, amber))
+
+enum {
+	ID_GREEN_LED,
+	ID_AMBER_LED,
+	ID_NMBR_OF,
+};
+
+struct bd71828_led {
+	int id;
+	struct led_classdev l;
+	u8 force_mask;
+};
+
+struct bd71828_leds {
+	struct rohm_regmap_dev *bd71828;
+	struct bd71828_led green;
+	struct bd71828_led amber;
+};
+
+static int bd71828_led_brightness_set(struct led_classdev *led_cdev,
+				      enum led_brightness value)
+{
+	struct bd71828_led *l = container_of(led_cdev, struct bd71828_led, l);
+	struct bd71828_leds *data;
+	unsigned int val = BD71828_LED_OFF;
+
+	data = BD71828_LED_TO_DATA(l);
+	if (value != LED_OFF)
+		val = BD71828_LED_ON;
+
+	return regmap_update_bits(data->bd71828->regmap, BD71828_REG_LED_CTRL,
+			    l->force_mask, val);
+}
+
+static int bd71828_led_probe(struct platform_device *pdev)
+{
+	struct rohm_regmap_dev *bd71828;
+	struct bd71828_leds *l;
+	struct bd71828_led *g, *a;
+	static const char *GNAME = "bd71828-green-led";
+	static const char *ANAME = "bd71828-amber-led";
+	int ret;
+
+	pr_info("bd71828 LED driver probed\n");
+
+	bd71828 = dev_get_drvdata(pdev->dev.parent);
+	l = devm_kzalloc(&pdev->dev, sizeof(*l), GFP_KERNEL);
+	if (!l)
+		return -ENOMEM;
+	l->bd71828 = bd71828;
+	a = &l->amber;
+	g = &l->green;
+	a->id = ID_AMBER_LED;
+	g->id = ID_GREEN_LED;
+	a->force_mask = BD71828_MASK_LED_AMBER;
+	g->force_mask = BD71828_MASK_LED_GREEN;
+
+	a->l.name = ANAME;
+	g->l.name = GNAME;
+	a->l.brightness_set_blocking = bd71828_led_brightness_set;
+	g->l.brightness_set_blocking = bd71828_led_brightness_set;
+
+	ret = devm_led_classdev_register(&pdev->dev, &g->l);
+	if (ret)
+		return ret;
+
+	return devm_led_classdev_register(&pdev->dev, &a->l);
+}
+
+static struct platform_driver bd71828_led_driver = {
+	.driver = {
+		.name  = "bd71828-led",
+	},
+	.probe  = bd71828_led_probe,
+};
+
+module_platform_driver(bd71828_led_driver);
+
+MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
+MODULE_DESCRIPTION("ROHM BD71828 LED driver");
+MODULE_LICENSE("GPL");
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
