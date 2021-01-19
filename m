Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88FF42FB2BF
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 08:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbhASHTN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 02:19:13 -0500
Received: from mail-lf1-f54.google.com ([209.85.167.54]:37689 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbhASHSp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 02:18:45 -0500
Received: by mail-lf1-f54.google.com with SMTP id o17so27656897lfg.4;
        Mon, 18 Jan 2021 23:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aHDHXJyu7tkpQSEosj4/tuqjLTm3XEYSWoNvMt2PODc=;
        b=RDEE+81qbJasv0TtWNlbOmMyWbx1GvPoQne8/3S+XtIiUPf9VAIthsS+9oK/7gbm2h
         1hJsOt+2vjBLdNxQI999YQFuJXnYkGs5aB6sjwJIO6rrr0CJ8j97ySU6aUT+lpynnLpm
         cz6zxvoeqBS+4RptwLSFkWoKVBeNq2GN0BUJBJMgnYqqJNEEIoNOdfcBepJZ6DjIWu8C
         KWC3geos+uzdzn+OdDo/kwOSsC4ESYXLVRn70Y23tSiz9XHMvsaT01TfhUOyZf/2V4SB
         gqJAQrbzlAUHQt8ReorL3AYYmckfetaTelzsg+0cJreHQDhkzbaMbl8mtpQNzoxUFMiD
         zwDQ==
X-Gm-Message-State: AOAM533EswGb1bq+mrbQO8Xdm6KhjXXQCF0yEswzObF01pMnoIUX41t0
        oAs9HBxeuk9VmNcjmKP/dqk=
X-Google-Smtp-Source: ABdhPJxAeCrjsHaFggqHMEdHpzQOQpuz2f3j9Rh11SeOt+2MHjFy6bYf/V/vmTZBgdAkCXkt+oz/0w==
X-Received: by 2002:a19:2210:: with SMTP id i16mr839420lfi.137.1611040492594;
        Mon, 18 Jan 2021 23:14:52 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id l15sm2177531lfc.244.2021.01.18.23.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 23:14:51 -0800 (PST)
Date:   Tue, 19 Jan 2021 09:14:45 +0200
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
Subject: [PATCH v2 02/17] rtc: bd70528: Do not require parent data
Message-ID: <e113a308ee6e9d22ca7fae066119def1793068d9.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ROHM BD71828 and BD71815 RTC drivers only need the regmap
pointer from parent. Regmap can be obtained via dev_get_regmap()
so do not require parent to populate driver data for that.

BD70528 on the other hand requires parent data to access the
watchdog so leave the parent data for BD70528 here for now.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Please note that this same change has been sent individually:
https://lore.kernel.org/lkml/20210105152350.GA3714833@localhost.localdomain/
It is present in this series only because some patches depend on it.

 drivers/rtc/rtc-bd70528.c | 67 ++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 17cb67f5bf6e..fb4476bb5ab6 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -52,6 +52,7 @@ struct bd70528_rtc_alm {
 
 struct bd70528_rtc {
 	struct rohm_regmap_dev *parent;
+	struct regmap *regmap;
 	struct device *dev;
 	u8 reg_time_start;
 	bool has_rtc_timers;
@@ -234,9 +235,8 @@ static int bd71828_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 	int ret;
 	struct bd71828_rtc_alm alm;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *parent = r->parent;
 
-	ret = regmap_bulk_read(parent->regmap, BD71828_REG_RTC_ALM_START,
+	ret = regmap_bulk_read(r->regmap, BD71828_REG_RTC_ALM_START,
 			       &alm, sizeof(alm));
 	if (ret) {
 		dev_err(dev, "Failed to read alarm regs\n");
@@ -250,7 +250,7 @@ static int bd71828_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 	else
 		alm.alm_mask |= BD70528_MASK_ALM_EN;
 
-	ret = regmap_bulk_write(parent->regmap, BD71828_REG_RTC_ALM_START,
+	ret = regmap_bulk_write(r->regmap, BD71828_REG_RTC_ALM_START,
 				&alm, sizeof(alm));
 	if (ret)
 		dev_err(dev, "Failed to set alarm time\n");
@@ -265,17 +265,16 @@ static int bd70528_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 	struct bd70528_rtc_alm alm;
 	int ret;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *parent = r->parent;
 
-	ret = regmap_bulk_read(parent->regmap, BD70528_REG_RTC_WAKE_START,
-			       &wake, sizeof(wake));
+	ret = regmap_bulk_read(r->regmap, BD70528_REG_RTC_WAKE_START, &wake,
+			       sizeof(wake));
 	if (ret) {
 		dev_err(dev, "Failed to read wake regs\n");
 		return ret;
 	}
 
-	ret = regmap_bulk_read(parent->regmap, BD70528_REG_RTC_ALM_START,
-			       &alm, sizeof(alm));
+	ret = regmap_bulk_read(r->regmap, BD70528_REG_RTC_ALM_START, &alm,
+			       sizeof(alm));
 	if (ret) {
 		dev_err(dev, "Failed to read alarm regs\n");
 		return ret;
@@ -292,15 +291,14 @@ static int bd70528_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 		wake.ctrl &= ~BD70528_MASK_WAKE_EN;
 	}
 
-	ret = regmap_bulk_write(parent->regmap,
-				BD70528_REG_RTC_WAKE_START, &wake,
+	ret = regmap_bulk_write(r->regmap, BD70528_REG_RTC_WAKE_START, &wake,
 				sizeof(wake));
 	if (ret) {
 		dev_err(dev, "Failed to set wake time\n");
 		return ret;
 	}
-	ret = regmap_bulk_write(parent->regmap, BD70528_REG_RTC_ALM_START,
-				&alm, sizeof(alm));
+	ret = regmap_bulk_write(r->regmap, BD70528_REG_RTC_ALM_START, &alm,
+				sizeof(alm));
 	if (ret)
 		dev_err(dev, "Failed to set alarm time\n");
 
@@ -312,9 +310,8 @@ static int bd71828_read_alarm(struct device *dev, struct rtc_wkalrm *a)
 	int ret;
 	struct bd71828_rtc_alm alm;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *parent = r->parent;
 
-	ret = regmap_bulk_read(parent->regmap, BD71828_REG_RTC_ALM_START,
+	ret = regmap_bulk_read(r->regmap, BD71828_REG_RTC_ALM_START,
 			       &alm, sizeof(alm));
 	if (ret) {
 		dev_err(dev, "Failed to read alarm regs\n");
@@ -336,10 +333,9 @@ static int bd70528_read_alarm(struct device *dev, struct rtc_wkalrm *a)
 	struct bd70528_rtc_alm alm;
 	int ret;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *parent = r->parent;
 
-	ret = regmap_bulk_read(parent->regmap, BD70528_REG_RTC_ALM_START,
-			       &alm, sizeof(alm));
+	ret = regmap_bulk_read(r->regmap, BD70528_REG_RTC_ALM_START, &alm,
+			       sizeof(alm));
 	if (ret) {
 		dev_err(dev, "Failed to read alarm regs\n");
 		return ret;
@@ -360,14 +356,12 @@ static int bd70528_set_time_locked(struct device *dev, struct rtc_time *t)
 	int ret, tmpret, old_states;
 	struct bd70528_rtc_data rtc_data;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *parent = r->parent;
 
 	ret = bd70528_disable_rtc_based_timers(r, &old_states);
 	if (ret)
 		return ret;
 
-	tmpret = regmap_bulk_read(parent->regmap,
-				  r->reg_time_start, &rtc_data,
+	tmpret = regmap_bulk_read(r->regmap, r->reg_time_start, &rtc_data,
 				  sizeof(rtc_data));
 	if (tmpret) {
 		dev_err(dev, "Failed to read RTC time registers\n");
@@ -375,8 +369,7 @@ static int bd70528_set_time_locked(struct device *dev, struct rtc_time *t)
 	}
 	tm2rtc(t, &rtc_data);
 
-	tmpret = regmap_bulk_write(parent->regmap,
-				   r->reg_time_start, &rtc_data,
+	tmpret = regmap_bulk_write(r->regmap, r->reg_time_start, &rtc_data,
 				   sizeof(rtc_data));
 	if (tmpret) {
 		dev_err(dev, "Failed to set RTC time\n");
@@ -410,13 +403,11 @@ static int bd70528_set_time(struct device *dev, struct rtc_time *t)
 static int bd70528_get_time(struct device *dev, struct rtc_time *t)
 {
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *parent = r->parent;
 	struct bd70528_rtc_data rtc_data;
 	int ret;
 
 	/* read the RTC date and time registers all at once */
-	ret = regmap_bulk_read(parent->regmap,
-			       r->reg_time_start, &rtc_data,
+	ret = regmap_bulk_read(r->regmap, r->reg_time_start, &rtc_data,
 			       sizeof(rtc_data));
 	if (ret) {
 		dev_err(dev, "Failed to read RTC time (err %d)\n", ret);
@@ -443,7 +434,7 @@ static int bd70528_alm_enable(struct device *dev, unsigned int enabled)
 		dev_err(dev, "Failed to change wake state\n");
 		goto out_unlock;
 	}
-	ret = regmap_update_bits(r->parent->regmap, BD70528_REG_RTC_ALM_MASK,
+	ret = regmap_update_bits(r->regmap, BD70528_REG_RTC_ALM_MASK,
 				 BD70528_MASK_ALM_EN, enableval);
 	if (ret)
 		dev_err(dev, "Failed to change alarm state\n");
@@ -462,7 +453,7 @@ static int bd71828_alm_enable(struct device *dev, unsigned int enabled)
 	if (!enabled)
 		enableval = 0;
 
-	ret = regmap_update_bits(r->parent->regmap, BD71828_REG_RTC_ALM0_MASK,
+	ret = regmap_update_bits(r->regmap, BD71828_REG_RTC_ALM0_MASK,
 				 BD70528_MASK_ALM_EN, enableval);
 	if (ret)
 		dev_err(dev, "Failed to change alarm state\n");
@@ -498,7 +489,6 @@ static int bd70528_probe(struct platform_device *pdev)
 {
 	struct bd70528_rtc *bd_rtc;
 	const struct rtc_class_ops *rtc_ops;
-	struct rohm_regmap_dev *parent;
 	const char *irq_name;
 	int ret;
 	struct rtc_device *rtc;
@@ -508,20 +498,25 @@ static int bd70528_probe(struct platform_device *pdev)
 	u8 hour_reg;
 	enum rohm_chip_type chip = platform_get_device_id(pdev)->driver_data;
 
-	parent = dev_get_drvdata(pdev->dev.parent);
-	if (!parent) {
-		dev_err(&pdev->dev, "No MFD driver data\n");
-		return -EINVAL;
-	}
 	bd_rtc = devm_kzalloc(&pdev->dev, sizeof(*bd_rtc), GFP_KERNEL);
 	if (!bd_rtc)
 		return -ENOMEM;
 
-	bd_rtc->parent = parent;
+	bd_rtc->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!bd_rtc->regmap) {
+		dev_err(&pdev->dev, "No regmap\n");
+		return -EINVAL;
+	}
+
 	bd_rtc->dev = &pdev->dev;
 
 	switch (chip) {
 	case ROHM_CHIP_TYPE_BD70528:
+		bd_rtc->parent = dev_get_drvdata(pdev->dev.parent);
+		if (!bd_rtc->parent) {
+			dev_err(&pdev->dev, "No MFD data\n");
+			return -EINVAL;
+		}
 		irq_name = "bd70528-rtc-alm";
 		bd_rtc->has_rtc_timers = true;
 		bd_rtc->reg_time_start = BD70528_REG_RTC_START;
@@ -547,7 +542,7 @@ static int bd70528_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, bd_rtc);
 
-	ret = regmap_read(parent->regmap, hour_reg, &hr);
+	ret = regmap_read(bd_rtc->regmap, hour_reg, &hr);
 
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to reag RTC clock\n");
@@ -595,7 +590,7 @@ static int bd70528_probe(struct platform_device *pdev)
 	 *  from sub-registers when IRQ is disabled or freed.
 	 */
 	if (enable_main_irq) {
-		ret = regmap_update_bits(parent->regmap,
+		ret = regmap_update_bits(bd_rtc->regmap,
 				 BD70528_REG_INT_MAIN_MASK,
 				 BD70528_INT_RTC_MASK, 0);
 		if (ret) {
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
