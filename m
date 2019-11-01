Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0933EEC236
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 12:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbfKALpe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 07:45:34 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35657 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfKALpe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 07:45:34 -0400
Received: by mail-lj1-f194.google.com with SMTP id r7so1273410ljg.2;
        Fri, 01 Nov 2019 04:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qxgJokQrFEU8GXkH/n/1Oa59RLXaum3MBpNuuyp1ECI=;
        b=J9Qwt1P7FQcGuQ1K8gaPxgd5hKUYKmBarN3fG3XYGUQzOIoqL/z9HzxJLhraAcHYnc
         pq7+VFrN3293dbyr57WfQ3JdpNB8Wq9EYAQpyyswY4hUJ1n2Jv6lcvaZ67cUeJu9DzLV
         BrGpEg6liPuSw9XY8ixYxdiQqtBhmSkpcuPKvL3hdg5xXZaeJcrFlTC+cyLpENOHpLRE
         qZY5G0E1SZQQ+msRRWy9mpyIyjYGT77DFPbbBu2VblG4eTjIYsHa0BooWbBikTrZpHkm
         rrnMXDy7papwZR6gvMTsP6cDiuAIQYNVyXa2MBnTINlm9F6euPnJ+GH2hEl00fStwX5e
         pDkw==
X-Gm-Message-State: APjAAAU1bm3dSxLb9L64JXFH+4XS9GwKjseegen9Kn7uCxog3qMac3Qn
        KcD0zilLQ4pudlOemzk/DHE=
X-Google-Smtp-Source: APXvYqwxKGowdxbHKEaDZuJoF47UQwiKFaBVmdMJ9dR73HdOmVPwawL2A5mG6blMEHlFDPynQrt0aw==
X-Received: by 2002:a2e:3311:: with SMTP id d17mr4035482ljc.237.1572608730683;
        Fri, 01 Nov 2019 04:45:30 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id g25sm3253148ljk.36.2019.11.01.04.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:45:30 -0700 (PDT)
Date:   Fri, 1 Nov 2019 13:45:20 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [RFC PATCH v3 12/15] regulator: bd71828: Support in-kernel APIs to
 change run-level
Message-ID: <ba8e6186501e2a3b1ab6441bacdbe05d0aab0778.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
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

Changes from v2 - no changes

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
index d2bb78427466..fc0955f0662c 100644
--- a/include/linux/mfd/rohm-bd71828.h
+++ b/include/linux/mfd/rohm-bd71828.h
@@ -420,5 +420,7 @@ enum {
 
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
