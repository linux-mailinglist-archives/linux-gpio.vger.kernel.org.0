Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E877A137CC8
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jan 2020 10:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgAKJtq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Jan 2020 04:49:46 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46561 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728747AbgAKJtq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jan 2020 04:49:46 -0500
Received: by mail-lj1-f196.google.com with SMTP id m26so4665125ljc.13;
        Sat, 11 Jan 2020 01:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=try2mkSwD9JsKvQCY96uRlJiII0dSrRIeEJ/8uLNfho=;
        b=X9evu/cSI1vwiZwqVMW/lQ5ijqerY7Nha7A43P267N5OS0npQG01Kj1f4T+q3KGjuT
         iDL//RPNX98E/eCtJ0VIaaFwiPejmgey8tk9S3Z+/6FjXQLH0xGIXRBIVaZPuEZYX0X8
         qlYBDbr8BVcAaZTRH6cI7DKiR5+wrx/dPa1DdLq6ogMqYFKDeWk6x3WotZTBxKG0HHjN
         gNNYFQx+tFWIRt6vSpGLsNxYNSAQTTFcgz9VHchBhTkVNBbxRqK/6QTMplM8xTJAy6qJ
         mkauTUKj1F/d5mAO+6BA/IW4vDi8MmDxb1txJOOTRzclbOUva1nTgrw6tur/InVUcziK
         1r+Q==
X-Gm-Message-State: APjAAAXIaH7vqwjhh5otK3AycDWS98IRIKklcnZD9qOeIimf8DHvZG0v
        FPoGkBUNqtkv1e9ZgYyo8v0=
X-Google-Smtp-Source: APXvYqyzskM35N+Z4NotPpD5OPjEk8rUMUnxLGpS3M9cyYBXpwuLQ5WOvlaL3UcapCcExPFfskGlSA==
X-Received: by 2002:a2e:8595:: with SMTP id b21mr5050194lji.219.1578736183380;
        Sat, 11 Jan 2020 01:49:43 -0800 (PST)
Received: from localhost.localdomain (dc7t7ryyyyyyyyyyyyybt-3.rev.dnainternet.fi. [2001:14ba:16e1:b700::3])
        by smtp.gmail.com with ESMTPSA id m11sm2420182lfj.89.2020.01.11.01.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2020 01:49:42 -0800 (PST)
Date:   Sat, 11 Jan 2020 11:49:36 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
Subject: [PATCH v9 03/12] mfd: rohm PMICs - use platform_device_id to match
 MFD sub-devices
Message-ID: <360cf16c87395f0a645048bea2bf37a8d256c0de.1578644144.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1578644144.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1578644144.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks to Stephen Boyd I today learned we can use platform_device_id
to do device and module matching for MFD sub-devices!

Do device matching using the platform_device_id instead of using
explicit module_aliases to load modules and custom parent-data field
to do module loading and sub-device matching.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
No changes since v8

 drivers/clk/clk-bd718x7.c             | 12 ++++++++-
 drivers/mfd/rohm-bd70528.c            |  3 +--
 drivers/mfd/rohm-bd718x7.c            | 39 ++++++++++++++++++++++-----
 drivers/regulator/bd718x7-regulator.c | 17 +++++++++---
 include/linux/mfd/rohm-generic.h      |  3 +--
 5 files changed, 58 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/clk-bd718x7.c b/drivers/clk/clk-bd718x7.c
index 00926c587390..33699ee1bdf3 100644
--- a/drivers/clk/clk-bd718x7.c
+++ b/drivers/clk/clk-bd718x7.c
@@ -74,6 +74,7 @@ static int bd71837_clk_probe(struct platform_device *pdev)
 		.name = "bd718xx-32k-out",
 		.ops = &bd71837_clk_ops,
 	};
+	enum rohm_chip_type chip = platform_get_device_id(pdev)->driver_data;
 
 	c = devm_kzalloc(&pdev->dev, sizeof(*c), GFP_KERNEL);
 	if (!c)
@@ -87,7 +88,7 @@ static int bd71837_clk_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "No parent clk found\n");
 		return -EINVAL;
 	}
-	switch (mfd->chip_type) {
+	switch (chip) {
 	case ROHM_CHIP_TYPE_BD71837:
 	case ROHM_CHIP_TYPE_BD71847:
 		c->reg = BD718XX_REG_OUT32K;
@@ -121,11 +122,20 @@ static int bd71837_clk_probe(struct platform_device *pdev)
 	return rval;
 }
 
+static const struct platform_device_id bd718x7_clk_id[] = {
+	{ "bd71837-clk", ROHM_CHIP_TYPE_BD71837 },
+	{ "bd71847-clk", ROHM_CHIP_TYPE_BD71847 },
+	{ "bd70528-clk", ROHM_CHIP_TYPE_BD70528 },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, bd718x7_clk_id);
+
 static struct platform_driver bd71837_clk = {
 	.driver = {
 		.name = "bd718xx-clk",
 	},
 	.probe = bd71837_clk_probe,
+	.id_table = bd718x7_clk_id,
 };
 
 module_platform_driver(bd71837_clk);
diff --git a/drivers/mfd/rohm-bd70528.c b/drivers/mfd/rohm-bd70528.c
index ef6786fd3b00..5c44d3b77b3e 100644
--- a/drivers/mfd/rohm-bd70528.c
+++ b/drivers/mfd/rohm-bd70528.c
@@ -48,7 +48,7 @@ static struct mfd_cell bd70528_mfd_cells[] = {
 	 * We use BD71837 driver to drive the clock block. Only differences to
 	 * BD70528 clock gate are the register address and mask.
 	 */
-	{ .name = "bd718xx-clk", },
+	{ .name = "bd70528-clk", },
 	{ .name = "bd70528-wdt", },
 	{
 		.name = "bd70528-power",
@@ -236,7 +236,6 @@ static int bd70528_i2c_probe(struct i2c_client *i2c,
 
 	dev_set_drvdata(&i2c->dev, &bd70528->chip);
 
-	bd70528->chip.chip_type = ROHM_CHIP_TYPE_BD70528;
 	bd70528->chip.regmap = devm_regmap_init_i2c(i2c, &bd70528_regmap);
 	if (IS_ERR(bd70528->chip.regmap)) {
 		dev_err(&i2c->dev, "Failed to initialize Regmap\n");
diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index 85e7f5133365..bb86ec829079 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -30,14 +30,24 @@ static struct gpio_keys_platform_data bd718xx_powerkey_data = {
 	.name = "bd718xx-pwrkey",
 };
 
-static struct mfd_cell bd718xx_mfd_cells[] = {
+static struct mfd_cell bd71837_mfd_cells[] = {
 	{
 		.name = "gpio-keys",
 		.platform_data = &bd718xx_powerkey_data,
 		.pdata_size = sizeof(bd718xx_powerkey_data),
 	},
-	{ .name = "bd718xx-clk", },
-	{ .name = "bd718xx-pmic", },
+	{ .name = "bd71837-clk", },
+	{ .name = "bd71837-pmic", },
+};
+
+static struct mfd_cell bd71847_mfd_cells[] = {
+	{
+		.name = "gpio-keys",
+		.platform_data = &bd718xx_powerkey_data,
+		.pdata_size = sizeof(bd718xx_powerkey_data),
+	},
+	{ .name = "bd71847-clk", },
+	{ .name = "bd71847-pmic", },
 };
 
 static const struct regmap_irq bd718xx_irqs[] = {
@@ -124,6 +134,9 @@ static int bd718xx_i2c_probe(struct i2c_client *i2c,
 {
 	struct bd718xx *bd718xx;
 	int ret;
+	unsigned int chip_type;
+	struct mfd_cell *mfd;
+	int cells;
 
 	if (!i2c->irq) {
 		dev_err(&i2c->dev, "No IRQ configured\n");
@@ -136,8 +149,21 @@ static int bd718xx_i2c_probe(struct i2c_client *i2c,
 		return -ENOMEM;
 
 	bd718xx->chip_irq = i2c->irq;
-	bd718xx->chip.chip_type = (unsigned int)(uintptr_t)
-				of_device_get_match_data(&i2c->dev);
+	chip_type = (unsigned int)(uintptr_t)
+		    of_device_get_match_data(&i2c->dev);
+	switch (chip_type) {
+	case ROHM_CHIP_TYPE_BD71837:
+		mfd = bd71837_mfd_cells;
+		cells = ARRAY_SIZE(bd71837_mfd_cells);
+		break;
+	case ROHM_CHIP_TYPE_BD71847:
+		mfd = bd71847_mfd_cells;
+		cells = ARRAY_SIZE(bd71847_mfd_cells);
+		break;
+	default:
+		dev_err(&i2c->dev, "Unknown device type");
+		return -EINVAL;
+	}
 	bd718xx->chip.dev = &i2c->dev;
 	dev_set_drvdata(&i2c->dev, bd718xx);
 
@@ -170,8 +196,7 @@ static int bd718xx_i2c_probe(struct i2c_client *i2c,
 	button.irq = ret;
 
 	ret = devm_mfd_add_devices(bd718xx->chip.dev, PLATFORM_DEVID_AUTO,
-				   bd718xx_mfd_cells,
-				   ARRAY_SIZE(bd718xx_mfd_cells), NULL, 0,
+				   mfd, cells, NULL, 0,
 				   regmap_irq_get_domain(bd718xx->irq_data));
 	if (ret)
 		dev_err(&i2c->dev, "Failed to create subdevices\n");
diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
index 13a43eee2e46..6beaf867d9cb 100644
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@ -1164,6 +1164,7 @@ static int bd718xx_probe(struct platform_device *pdev)
 
 	int i, j, err;
 	bool use_snvs;
+	enum rohm_chip_type chip = platform_get_device_id(pdev)->driver_data;
 
 	mfd = dev_get_drvdata(pdev->dev.parent);
 	if (!mfd) {
@@ -1172,8 +1173,8 @@ static int bd718xx_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	if (mfd->chip.chip_type >= ROHM_CHIP_TYPE_AMOUNT ||
-	    !pmic_regulators[mfd->chip.chip_type].r_datas) {
+	if (chip >= ROHM_CHIP_TYPE_AMOUNT || chip < 0 ||
+	    !pmic_regulators[chip].r_datas) {
 		dev_err(&pdev->dev, "Unsupported chip type\n");
 		err = -EINVAL;
 		goto err;
@@ -1215,13 +1216,13 @@ static int bd718xx_probe(struct platform_device *pdev)
 		}
 	}
 
-	for (i = 0; i < pmic_regulators[mfd->chip.chip_type].r_amount; i++) {
+	for (i = 0; i < pmic_regulators[chip].r_amount; i++) {
 
 		const struct regulator_desc *desc;
 		struct regulator_dev *rdev;
 		const struct bd718xx_regulator_data *r;
 
-		r = &pmic_regulators[mfd->chip.chip_type].r_datas[i];
+		r = &pmic_regulators[chip].r_datas[i];
 		desc = &r->desc;
 
 		config.dev = pdev->dev.parent;
@@ -1281,11 +1282,19 @@ static int bd718xx_probe(struct platform_device *pdev)
 	return err;
 }
 
+static const struct platform_device_id bd718x7_pmic_id[] = {
+	{ "bd71837-pmic", ROHM_CHIP_TYPE_BD71837 },
+	{ "bd71847-pmic", ROHM_CHIP_TYPE_BD71847 },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, bd718x7_pmic_id);
+
 static struct platform_driver bd718xx_regulator = {
 	.driver = {
 		.name = "bd718xx-pmic",
 	},
 	.probe = bd718xx_probe,
+	.id_table = bd718x7_pmic_id,
 };
 
 module_platform_driver(bd718xx_regulator);
diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
index bff15ac26f2c..922f88008232 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -4,7 +4,7 @@
 #ifndef __LINUX_MFD_ROHM_H__
 #define __LINUX_MFD_ROHM_H__
 
-enum {
+enum rohm_chip_type {
 	ROHM_CHIP_TYPE_BD71837 = 0,
 	ROHM_CHIP_TYPE_BD71847,
 	ROHM_CHIP_TYPE_BD70528,
@@ -12,7 +12,6 @@ enum {
 };
 
 struct rohm_regmap_dev {
-	unsigned int chip_type;
 	struct device *dev;
 	struct regmap *regmap;
 };
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
