Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22677E314A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 13:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439296AbfJXLsM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 07:48:12 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:32995 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbfJXLsM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 07:48:12 -0400
Received: by mail-lj1-f193.google.com with SMTP id a22so24685499ljd.0;
        Thu, 24 Oct 2019 04:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8J2+2b/3DwPctSPRqZRS55vvq4sBN5gRrY6PrhiAAS4=;
        b=A6HAHYErCxIRaB9k1eW/L459j1+pyTOYnEUhX2mM28PJeGwNokJQovaqjALJlQCyn5
         wbAhKey2PN/nJSHCeU2tMp3/xBGq+9k1zkr2f6mJ9XLJ8TN+Rup4RwcOaitUotKFjD9b
         m/3F13P8Yg7gVBrKHBZCxR6zYHSlKLyf9A35+Av2HIYFk3vaGwzZXBxN/RP30ZspAJ36
         XJOp1N9yNltNGfY+xvkuTvp2B/u0LYKtZlRiCrr72hF9b0YLn2LP4SEw8WYXCCdijnr8
         fvhX8pKzObFnP9543XkNi6lZDE27s7OCD7wjbJrVz0dsKGTEGKtzn+q/JEmq1S3Iucz/
         KlaQ==
X-Gm-Message-State: APjAAAWs1O/dh28OjIcY6dtCfZNQGqCmgOrmF15sKaTkSQer0wVijytw
        6F9IiLc67YSbyvmCur/tYqs=
X-Google-Smtp-Source: APXvYqxN8dcNomoDwNF2GbvvQMePhthWb0lfDLo9guH463q8RkhSVhWtxrzpFc5Fvl8TqSnHgcaACw==
X-Received: by 2002:a2e:9890:: with SMTP id b16mr26169264ljj.4.1571917689423;
        Thu, 24 Oct 2019 04:48:09 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id j7sm11764858lfc.16.2019.10.24.04.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 04:48:08 -0700 (PDT)
Date:   Thu, 24 Oct 2019 14:47:56 +0300
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
Subject: [RFC PATCH v2 10/13] regulator: bd71828: Support in-kernel APIs to
 change run-level
Message-ID: <8e97e506bab0358dbbff2786796f4123db7e3961.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
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

No changes since v1

 drivers/regulator/bd71828-regulator.c | 67 +++++++++++++++++++++++++++
 include/linux/mfd/rohm-bd71828.h      |  2 +
 2 files changed, 69 insertions(+)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index d9e1381b5964..eaff9b1b20f9 100644
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
