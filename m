Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB26A2FB2D6
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 08:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729922AbhASHUC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 02:20:02 -0500
Received: from mail-lj1-f179.google.com ([209.85.208.179]:41699 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbhASHSq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 02:18:46 -0500
Received: by mail-lj1-f179.google.com with SMTP id f11so20748768ljm.8;
        Mon, 18 Jan 2021 23:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9ZY0L8bbRVXe/6xLBWY1YwMiqJ47wj6UMuWkgMlqtUI=;
        b=Gg6Tq7qBu52cbstc73FTnZH80ZkMFMWWZT4pTbZwSfeXAuM54rAA/KL2hNjLgngnKL
         2Orvl4D79FYQV1rLfnfFCjpOk618ZRdj71P7UW4c3H1q5ZXJ3wnboskFCfeEPRFX3rTJ
         SdSYsbAGX4Fcc+g60U2CdFLCd5w9284WOYkjWJY0chcTfyXgLEumc3AHOjMLl86e9Mli
         EasmDhqs+ogqjqVkoqL/iATQEG8JvqvS5EUtNsfkHjga3sXmhUuXSixZXNpvvZTt4LkD
         /rVvfrdxuyO1YorqkHSCZXVz9np3Pk7uFb48qCwaB8/w+wtG3qIqfBV8zeU0F/e4Jje/
         4Odg==
X-Gm-Message-State: AOAM531IZlwdRGkiA4MXfPVYSMManJnjbketZkD9ddPQWTndREfpxca0
        GInOMktJ7+fnEGVynMkdGww=
X-Google-Smtp-Source: ABdhPJxKhBECpZmBAMxGE6leVACTTChB1hgU4NS+3VDOleR9mnaqicqV6b+a8D2QJjm7j+gboaGLvA==
X-Received: by 2002:a2e:850f:: with SMTP id j15mr1357500lji.34.1611040561063;
        Mon, 18 Jan 2021 23:16:01 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id c14sm2180363lfd.186.2021.01.18.23.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 23:16:00 -0800 (PST)
Date:   Tue, 19 Jan 2021 09:15:53 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v2 04/17] mfd: bd718x7: simplify by cleaning unnecessary
 device data
Message-ID: <b722c33ef2e499da3860b442f263e1c7bfe13e51.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Most ROHM PMIC sub-devices only use the regmap pointer from
parent device. They can obtain this by dev_get_regamap so in
most cases the MFD device does not need to allocate and populate
the driver data. Simplify drivers by removing this.

The BD70528 still needs the access to watchdog mutex so keep
rohm_regmap_dev in use on BD70528 RTC and WDG drivers for now.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

No changes since v1

 drivers/mfd/rohm-bd718x7.c       | 43 ++++++++++++--------------------
 include/linux/mfd/rohm-bd718x7.h | 13 ----------
 2 files changed, 16 insertions(+), 40 deletions(-)

diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index c32c1b6c98fa..bfd81f78beae 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -91,9 +91,9 @@ static const struct regmap_config bd718xx_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
-static int bd718xx_init_press_duration(struct bd718xx *bd718xx)
+static int bd718xx_init_press_duration(struct regmap *regmap,
+				       struct device *dev)
 {
-	struct device* dev = bd718xx->chip.dev;
 	u32 short_press_ms, long_press_ms;
 	u32 short_press_value, long_press_value;
 	int ret;
@@ -102,8 +102,7 @@ static int bd718xx_init_press_duration(struct bd718xx *bd718xx)
 				   &short_press_ms);
 	if (!ret) {
 		short_press_value = min(15u, (short_press_ms + 250) / 500);
-		ret = regmap_update_bits(bd718xx->chip.regmap,
-					 BD718XX_REG_PWRONCONFIG0,
+		ret = regmap_update_bits(regmap, BD718XX_REG_PWRONCONFIG0,
 					 BD718XX_PWRBTN_PRESS_DURATION_MASK,
 					 short_press_value);
 		if (ret) {
@@ -116,8 +115,7 @@ static int bd718xx_init_press_duration(struct bd718xx *bd718xx)
 				   &long_press_ms);
 	if (!ret) {
 		long_press_value = min(15u, (long_press_ms + 500) / 1000);
-		ret = regmap_update_bits(bd718xx->chip.regmap,
-					 BD718XX_REG_PWRONCONFIG1,
+		ret = regmap_update_bits(regmap, BD718XX_REG_PWRONCONFIG1,
 					 BD718XX_PWRBTN_PRESS_DURATION_MASK,
 					 long_press_value);
 		if (ret) {
@@ -132,7 +130,8 @@ static int bd718xx_init_press_duration(struct bd718xx *bd718xx)
 static int bd718xx_i2c_probe(struct i2c_client *i2c,
 			    const struct i2c_device_id *id)
 {
-	struct bd718xx *bd718xx;
+	struct regmap *regmap;
+	struct regmap_irq_chip_data *irq_data;
 	int ret;
 	unsigned int chip_type;
 	struct mfd_cell *mfd;
@@ -142,13 +141,6 @@ static int bd718xx_i2c_probe(struct i2c_client *i2c,
 		dev_err(&i2c->dev, "No IRQ configured\n");
 		return -EINVAL;
 	}
-
-	bd718xx = devm_kzalloc(&i2c->dev, sizeof(struct bd718xx), GFP_KERNEL);
-
-	if (!bd718xx)
-		return -ENOMEM;
-
-	bd718xx->chip_irq = i2c->irq;
 	chip_type = (unsigned int)(uintptr_t)
 		    of_device_get_match_data(&i2c->dev);
 	switch (chip_type) {
@@ -164,29 +156,26 @@ static int bd718xx_i2c_probe(struct i2c_client *i2c,
 		dev_err(&i2c->dev, "Unknown device type");
 		return -EINVAL;
 	}
-	bd718xx->chip.dev = &i2c->dev;
-	dev_set_drvdata(&i2c->dev, bd718xx);
 
-	bd718xx->chip.regmap = devm_regmap_init_i2c(i2c,
-						    &bd718xx_regmap_config);
-	if (IS_ERR(bd718xx->chip.regmap)) {
+	regmap = devm_regmap_init_i2c(i2c, &bd718xx_regmap_config);
+	if (IS_ERR(regmap)) {
 		dev_err(&i2c->dev, "regmap initialization failed\n");
-		return PTR_ERR(bd718xx->chip.regmap);
+		return PTR_ERR(regmap);
 	}
 
-	ret = devm_regmap_add_irq_chip(&i2c->dev, bd718xx->chip.regmap,
-				       bd718xx->chip_irq, IRQF_ONESHOT, 0,
-				       &bd718xx_irq_chip, &bd718xx->irq_data);
+	ret = devm_regmap_add_irq_chip(&i2c->dev, regmap, i2c->irq,
+				       IRQF_ONESHOT, 0, &bd718xx_irq_chip,
+				       &irq_data);
 	if (ret) {
 		dev_err(&i2c->dev, "Failed to add irq_chip\n");
 		return ret;
 	}
 
-	ret = bd718xx_init_press_duration(bd718xx);
+	ret = bd718xx_init_press_duration(regmap, &i2c->dev);
 	if (ret)
 		return ret;
 
-	ret = regmap_irq_get_virq(bd718xx->irq_data, BD718XX_INT_PWRBTN_S);
+	ret = regmap_irq_get_virq(irq_data, BD718XX_INT_PWRBTN_S);
 
 	if (ret < 0) {
 		dev_err(&i2c->dev, "Failed to get the IRQ\n");
@@ -195,9 +184,9 @@ static int bd718xx_i2c_probe(struct i2c_client *i2c,
 
 	button.irq = ret;
 
-	ret = devm_mfd_add_devices(bd718xx->chip.dev, PLATFORM_DEVID_AUTO,
+	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
 				   mfd, cells, NULL, 0,
-				   regmap_irq_get_domain(bd718xx->irq_data));
+				   regmap_irq_get_domain(irq_data));
 	if (ret)
 		dev_err(&i2c->dev, "Failed to create subdevices\n");
 
diff --git a/include/linux/mfd/rohm-bd718x7.h b/include/linux/mfd/rohm-bd718x7.h
index bee2474a8f9f..df2918198d37 100644
--- a/include/linux/mfd/rohm-bd718x7.h
+++ b/include/linux/mfd/rohm-bd718x7.h
@@ -310,17 +310,4 @@ enum {
 	BD718XX_PWRBTN_LONG_PRESS_15S
 };
 
-struct bd718xx {
-	/*
-	 * Please keep this as the first member here as some
-	 * drivers (clk) supporting more than one chip may only know this
-	 * generic struct 'struct rohm_regmap_dev' and assume it is
-	 * the first chunk of parent device's private data.
-	 */
-	struct rohm_regmap_dev chip;
-
-	int chip_irq;
-	struct regmap_irq_chip_data *irq_data;
-};
-
 #endif /* __LINUX_MFD_BD718XX_H__ */
-- 
2.25.4


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
