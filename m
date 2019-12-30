Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F21E12CE91
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2019 10:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbfL3Jps (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Dec 2019 04:45:48 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40424 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727243AbfL3Jps (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Dec 2019 04:45:48 -0500
Received: by mail-lj1-f193.google.com with SMTP id u1so32730580ljk.7;
        Mon, 30 Dec 2019 01:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DiLW6j/J8X6xuSLTFmEzl5z/ASK2Z7NFXfRl5LfvI8I=;
        b=XI8bp/QKb0x0CZ6jfR7aWVGWrQeHB8wXzltJ4DBhVCOKiiysFdTpqK4db6ZrATqldS
         uEJcZWXQmghRaOq9kAsIlrZzttX5753QCSDpkm0TmUK/LRniA/IhGYCM4JW5mzWiuHvx
         Uwa6QfOOT3l2OK4E0VNE7f7RqasV91yzbBo6xAjkOromoDjt6WAZvQot9G1aJqRDu4el
         yyCEwiRV9VouzPinLpImgizotWFptbgb1Wt3tc8or+YEFfXST3Chow3GTUSC5vtLHkc9
         MKkb+97gto6+muSkQ1k55rBLHYq9L69SqgVh3mjXYqD7Oe9NFj2ET9dvunCNO7dCmNmh
         Gw4Q==
X-Gm-Message-State: APjAAAW0uhjJhTjVC6vWloVRdqI4+5ZoEZH+xE6Q5PQJFj0GR2ASBsNU
        B+CkgmXUM6RUOi1nIGhsOXY=
X-Google-Smtp-Source: APXvYqzSSeMZi1VfrPfTvONjaEOrC1BZ1iIa9SY8e2Kruzc+0hJ1Bum/3VqidV8SpQRbjxQcEXw0EA==
X-Received: by 2002:a2e:3609:: with SMTP id d9mr37133157lja.188.1577699144374;
        Mon, 30 Dec 2019 01:45:44 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v9sm21765411lfe.18.2019.12.30.01.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 01:45:43 -0800 (PST)
Date:   Mon, 30 Dec 2019 11:45:35 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v8 12/12] led: bd71828: Support LED outputs on ROHM BD71828
 PMIC
Message-ID: <86c858def967072fab29b798540a385b63c76714.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ROHM BD71828 power management IC has two LED outputs for charge status
and button pressing indications. The LED outputs can also be forced
by SW so add driver allowing to use these LEDs for other indications
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

Changes from v7 - no changes

 drivers/leds/Kconfig        |  10 +++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-bd71828.c | 118 ++++++++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 drivers/leds/leds-bd71828.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 4b68520ac251..db408e03e296 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -545,6 +545,16 @@ config LEDS_BD2802
 	  This option enables support for BD2802GU RGB LED driver chips
 	  accessed via the I2C bus.
 
+config LEDS_BD71828
+	tristate "LED driver for LEDS on ROHM BD71828 PMIC"
+	depends on LEDS_CLASS
+	depends on MFD_ROHM_BD71828
+	help
+	  This option enables support for LED outputs located on ROHM
+	  BD71828 power management IC. ROHM BD71828 has two led output pins
+	  which can be left to indicate HW states or controlled by SW. Say
+	  yes here if you want to enable SW control for these LEDs.
+
 config LEDS_INTEL_SS4200
 	tristate "LED driver for Intel NAS SS4200 series"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2da39e896ce8..a5164acfaf51 100644
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
index 000000000000..a02c2ac4a70b
--- /dev/null
+++ b/drivers/leds/leds-bd71828.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2019 ROHM Semiconductors
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/mfd/rohm-bd71828.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define BD71828_LED_TO_DATA(l) ((l)->id == ID_GREEN_LED ? \
+	container_of((l), struct bd71828_leds, green) : \
+	container_of((l), struct bd71828_leds, amber))
+
+/* Names for led identification - these match the data sheet names */
+enum {
+	ID_GREEN_LED,
+	ID_AMBER_LED,
+	ID_NMBR_OF,
+};
+
+struct bd71828_led {
+	struct led_init_data init_data;
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
+	int ret;
+
+	bd71828 = dev_get_drvdata(pdev->dev.parent);
+	l = devm_kzalloc(&pdev->dev, sizeof(*l), GFP_KERNEL);
+	if (!l)
+		return -ENOMEM;
+	l->bd71828 = bd71828;
+	a = &l->amber;
+	g = &l->green;
+
+	/* Fill in details for 'AMBLED' */
+	a->init_data.match_property.name = "rohm,led-compatible";
+	a->init_data.match_property.raw_val = "bd71828-ambled";
+	a->init_data.match_property.size = strlen("bd71828-ambled");
+	a->id = ID_AMBER_LED;
+	a->force_mask = BD71828_MASK_LED_AMBER;
+
+	/* Fill in details for 'GRNLED' */
+	g->init_data.match_property.name = "rohm,led-compatible";
+	g->init_data.match_property.raw_val = "bd71828-grnled";
+	g->init_data.match_property.size = strlen("bd71828-grnled");
+	g->id = ID_GREEN_LED;
+	g->force_mask = BD71828_MASK_LED_GREEN;
+
+	a->l.brightness_set_blocking = bd71828_led_brightness_set;
+	g->l.brightness_set_blocking = bd71828_led_brightness_set;
+
+	ret = devm_led_classdev_register_ext(&pdev->dev, &g->l, &g->init_data);
+	if (ret)
+		return ret;
+
+	return devm_led_classdev_register_ext(&pdev->dev, &a->l, &a->init_data);
+}
+
+/*
+ * Device is instantiated through parent MFD device and device matching is done
+ * through platform_device_id.
+ *
+ * However, the *module* matching will be done trough DT aliases. This requires
+ * of_device_id table - but no .of_match_table as *device* matching is still
+ * done through platform_device_id.
+ */
+static const struct of_device_id bd71828_dt_match[] __used = {
+	{ .compatible = "rohm,bd71828-leds" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, bd71828_dt_match);
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
