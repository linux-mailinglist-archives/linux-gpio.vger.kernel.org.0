Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4ABDA93F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 11:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393993AbfJQJwC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 05:52:02 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44130 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393728AbfJQJwC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 05:52:02 -0400
Received: by mail-lf1-f68.google.com with SMTP id q12so1333146lfc.11;
        Thu, 17 Oct 2019 02:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=K0zNHSadiAOJfttlhL66NPc5o78JjTFcNPkPB09X5nE=;
        b=cJyGGQ0HQsq5DmTgPLfK1WJOAQqYTx0g4EGpoKgg0rVnJpM3yHbiy3emLTAEzXD1rB
         d76z8PbEGD3+k2OGknm6wJWa3z4z32cpayVDzBqtfaZf2tsnGfVmXrjaCldTwtk3MJv9
         JLtd+GdYSskkD+z6tqHrlqKnG6upBGEFptEqW1+M9qN8Cy/R2Lq06OGyQwaKyPWTMsPc
         fa3H1LBm1oAyamqrwGMBhNMluaThlC5EpKhl7uXbSpdrLYCuab1eX+SR/WXvc/7fOHlw
         aqItyR89+jaqAwyTzWEX329NTr9FVcgwmkyzXtL6yQjXrWwa5MlmENZ1507YWP/xdNUF
         el4A==
X-Gm-Message-State: APjAAAV/AgCpNXatzlruVWbDB6zzSIL/jJnTZ4KWu0Lzn1FBDGPv0JoV
        yhSTi5/Me6XI7Jy+WD9QOVA=
X-Google-Smtp-Source: APXvYqxnjcbcNLqt1xVZyuxtYFzM8aZbmEkV+9NHKX2DqoXtWMnvHrGKh1xF1J3zIXzBKJwDHHFjmg==
X-Received: by 2002:a19:48d6:: with SMTP id v205mr1725589lfa.27.1571305919615;
        Thu, 17 Oct 2019 02:51:59 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id g26sm887301lje.80.2019.10.17.02.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 02:51:58 -0700 (PDT)
Date:   Thu, 17 Oct 2019 12:51:45 +0300
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
Subject: [RFC PATCH 08/13] regulator: bd71828: Support in-kernel APIs to
 change run-level
Message-ID: <3275428ea15aed2de31e1304769273e5eb637829.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
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

Add exported functions bd71828_set_runlevel and
bd71828_get_runlevel for setting and getting the system run
level.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/bd71828-regulator.c | 67 +++++++++++++++++++++++++++
 include/linux/mfd/rohm-bd71828.h      |  2 +
 2 files changed, 69 insertions(+)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index d5d0dcee90cf..e242d829cbf5 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -505,6 +505,73 @@ int bd71828_set_runlevel_voltage(struct regulator *regulator, unsigned int uv,
 }
 EXPORT_SYMBOL(bd71828_set_runlevel_voltage);
 
+/**
+ * bd71828_set_runlevel - change system run-level.
+ *
+ * @regulator:	pointer to one of the BD71828 regulators obtained by
+ *		call to regulator_get
+ * @level:	New run-level the system should enter
+ *
+ * Changes the system to run-level which was given as argument. This
+ * operation will change state of all regulators which are set to be
+ * controlled by run-levels. Note that 'regulator' must point to a
+ * regulator which is controlled by run-levels.
+ */
+int bd71828_set_runlevel(struct regulator *regulator, unsigned int level)
+{
+	struct regulator_dev *rdev = regulator->rdev;
+	struct bd71828_regulator_data *rd = rdev_get_drvdata(rdev);
+
+	if (!rd)
+		return -ENOENT;
+
+	if (!rd || !rd->allow_runlvl)
+		return -EINVAL;
+
+	if (rd->gps)
+		return bd71828_dvs_gpio_set_run_level(rd, level);
+
+	return bd71828_dvs_i2c_set_run_level(rd->regmap, level);
+}
+EXPORT_SYMBOL(bd71828_set_runlevel);
+
+/**
+ * bd71828_get_runlevel - get the current system run-level.
+ *
+ * @regulator:	pointer to one of the BD71828 regulators obtained by
+ *		call to regulator_get
+ * @level:	Pointer to value where current run-level is stored
+ *
+ * Returns the current system run-level. Note that 'regulator' must
+ * point to a regulator which is controlled by run-levels.
+ */
+int bd71828_get_runlevel(struct regulator *regulator, unsigned int *level)
+{
+	struct regulator_dev *rdev = regulator->rdev;
+	struct bd71828_regulator_data *rd = rdev_get_drvdata(rdev);
+	int ret;
+
+	if (!rd)
+		return -ENOENT;
+
+	if (!rd || !rd->allow_runlvl)
+		return -EINVAL;
+
+	if (!rd->gps)
+		ret = bd71828_dvs_i2c_get_run_level(rd->regmap, rd);
+	else
+		ret = bd71828_dvs_gpio_get_run_level(rd);
+
+	if (ret < 0)
+		return ret;
+
+	*level = (unsigned int) ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(bd71828_get_runlevel);
+
+
 static const struct regulator_ops dvs_buck_gpio_ops = {
 	.is_enabled = bd71828_dvs_gpio_is_enabled,
 	.get_voltage = bd71828_dvs_gpio_get_voltage,
diff --git a/include/linux/mfd/rohm-bd71828.h b/include/linux/mfd/rohm-bd71828.h
index 5f15c6a309e6..bbbd4f118550 100644
--- a/include/linux/mfd/rohm-bd71828.h
+++ b/include/linux/mfd/rohm-bd71828.h
@@ -424,5 +424,7 @@ enum {
 
 int bd71828_set_runlevel_voltage(struct regulator *regulator, unsigned int uv,
 				 unsigned int level);
+int bd71828_set_runlevel(struct regulator *regulator, unsigned int level);
+int bd71828_get_runlevel(struct regulator *regulator, unsigned int *level);
 
 #endif /* __LINUX_MFD_BD71828_H__ */
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
