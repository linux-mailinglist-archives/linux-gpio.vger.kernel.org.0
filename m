Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FE72EF316
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 14:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbhAHNdj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 08:33:39 -0500
Received: from mail-lf1-f41.google.com ([209.85.167.41]:33251 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbhAHNdi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 08:33:38 -0500
Received: by mail-lf1-f41.google.com with SMTP id l11so23021563lfg.0;
        Fri, 08 Jan 2021 05:33:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qSLE7h9zoKQSOWFNe8fkmQbWcGg/f0KBYVoFpdlwRRA=;
        b=SQW2+SfsPZq0iuoMb0Sq1OywabeayckX4zodF+hIymlmltgNOgAgAd4s0xJR7AJzWX
         ZxZXUxgZJBNHDH6/VOlAf7iCdCRbqpzIUC2MgDTPcbnB+UVqcpPWNbnusif7srcpESVV
         jBMz1pE95vqn03sHPotr5Q5a0U+Nm2ZUXHQJWQgj76oOY04EvFn0Zmxi1J/XPoFr6TPq
         Cqg+l9GicX9e8c/oIA8qKUeW40ohUvO253RWeQghc9n8szQeBGMW7JY0dMj13CnvmMHV
         zXgSzJ1pTaY8dqgQk2LbGjerIljxL7xe4gIUdPbIbCshhjQ/LY2TE5ArIcKC9Tg90fV4
         +YEA==
X-Gm-Message-State: AOAM5336wCIGml6LNCSce6n6kvTCWFfNRubSoefY97W19OnV1PuZ8ybj
        9gW1vLPbzsKgkcPA1WbSsjhtYUjeom8=
X-Google-Smtp-Source: ABdhPJyBy4PBxEppKCr4W06SxdnTdtW5h2wd0dIUln/hk3vCZ/tbnbk0MS+Y1+NKj02XMeSOxf3qfQ==
X-Received: by 2002:a2e:80d4:: with SMTP id r20mr1492800ljg.495.1610112775697;
        Fri, 08 Jan 2021 05:32:55 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id w15sm1960553lfd.95.2021.01.08.05.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 05:32:55 -0800 (PST)
Date:   Fri, 8 Jan 2021 15:32:47 +0200
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
Subject: [PATCH 03/15] mfd: bd718x7: simplify by cleaning unnecessary device
 data
Message-ID: <2860acdbecf91bfac83ab98f589bc6e861d212ff.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
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
