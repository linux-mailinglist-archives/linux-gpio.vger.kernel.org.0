Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8E42FB2B6
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 08:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbhASHQZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 02:16:25 -0500
Received: from mail-lj1-f175.google.com ([209.85.208.175]:35573 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbhASHPH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 02:15:07 -0500
Received: by mail-lj1-f175.google.com with SMTP id p13so20794503ljg.2;
        Mon, 18 Jan 2021 23:14:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HcEq01wGvES8F7d5s4ArfJgTmyrtGVfxLQPWHyjZtEY=;
        b=Th1uNnpfOaiDv7vMu8ojKSjzzvfiWoGNueiWObO6hpxGxgaGIpcILTqUoRugh9hcf0
         vaxndQMTaM3bBe72Sp6iZpCFldnipnw/5vMGcO1mY+bElJ3osV81h+kUcUlfO889XMuU
         lPZdfVaJaqsmRuvlKUiDnwsZ0QveNdPbxeqIsLGl5cAW/SgLMhqG5jXLRNNNhun0gcA4
         YfuU30T9UyhExqgSUJe4XfVEJx91UsR1S2qSb0lRd7YTD9oHR0yV1EDx/It6J5S0j0zS
         399QayqqQ2tpOY1e9mDPLUR75U+eYKcYIwB7ZBr7t7Jb/LQnolgrt60qMS9aI0b+S9C3
         R8RA==
X-Gm-Message-State: AOAM531h6p9Jy1ym8jAbBrzvcHmBI8kws4sGDVbV/P/GO3JlBbgmBU4g
        QDHvn90od5aGMV4Rb+HbYfg=
X-Google-Smtp-Source: ABdhPJzhUbkMrUIhKnjfnBqJmD4OkwBeet6fZd7QQxvgDFhpJT1vw0rSg761pxbrtWfuyPStPmzyIg==
X-Received: by 2002:a2e:6a11:: with SMTP id f17mr1352418ljc.202.1611040464754;
        Mon, 18 Jan 2021 23:14:24 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id u15sm53637lfl.170.2021.01.18.23.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 23:14:24 -0800 (PST)
Date:   Tue, 19 Jan 2021 09:14:16 +0200
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
Subject: [PATCH v2 01/17] regulator: bd718x7, bd71828, Fix dvs voltage levels
Message-ID: <7b7a9111e02e06574849bacd5703e6c5cdcd2206.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ROHM BD718x7 and BD71828 drivers support setting HW state
specific voltages from device-tree. This is used also by various
in-tree DTS files.

These drivers do incorrectly try to compose bit-map using enum
values. By a chance this works for first two valid levels having
values 1 and 2 - but setting values for the rest of the levels
do indicate capbility of setting values for first levels as
well. Luckily the regulators which support settin values for
SUSPEND/LPSR do usually also support setting values for RUN
and IDLE too - thus this has not been such a fatal issue.

Fix this by defining the old enum values as bits and using
new enum in parsing code. This allows keeping existing IC
specific drivers intact and only adding the defines and
slightly changing the rohm-regulator.c

Fixes: 21b72156ede8b ("regulator: bd718x7: Split driver to common and bd718x7 specific parts")
Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Please note that this same change has been sent individually:
https://lore.kernel.org/lkml/20210118075851.GA1016281@localhost.localdomain/
It is present in this series only because some patches depend on it.

 drivers/regulator/rohm-regulator.c |  9 ++++++---
 include/linux/mfd/rohm-generic.h   | 14 ++++++--------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/rohm-regulator.c b/drivers/regulator/rohm-regulator.c
index 399002383b28..5c558b153d55 100644
--- a/drivers/regulator/rohm-regulator.c
+++ b/drivers/regulator/rohm-regulator.c
@@ -52,9 +52,12 @@ int rohm_regulator_set_dvs_levels(const struct rohm_dvs_config *dvs,
 	char *prop;
 	unsigned int reg, mask, omask, oreg = desc->enable_reg;
 
-	for (i = 0; i < ROHM_DVS_LEVEL_MAX && !ret; i++) {
-		if (dvs->level_map & (1 << i)) {
-			switch (i + 1) {
+	for (i = 0; i < ROHM_DVS_LEVEL_VALID_AMOUNT && !ret; i++) {
+		int bit;
+
+		bit = BIT(i);
+		if (dvs->level_map & bit) {
+			switch (bit) {
 			case ROHM_DVS_LEVEL_RUN:
 				prop = "rohm,dvs-run-voltage";
 				reg = dvs->run_reg;
diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
index 4283b5b33e04..2b85b9deb03a 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -20,14 +20,12 @@ struct rohm_regmap_dev {
 	struct regmap *regmap;
 };
 
-enum {
-	ROHM_DVS_LEVEL_UNKNOWN,
-	ROHM_DVS_LEVEL_RUN,
-	ROHM_DVS_LEVEL_IDLE,
-	ROHM_DVS_LEVEL_SUSPEND,
-	ROHM_DVS_LEVEL_LPSR,
-	ROHM_DVS_LEVEL_MAX = ROHM_DVS_LEVEL_LPSR,
-};
+#define ROHM_DVS_LEVEL_RUN		BIT(0)
+#define ROHM_DVS_LEVEL_IDLE		BIT(1)
+#define ROHM_DVS_LEVEL_SUSPEND		BIT(2)
+#define ROHM_DVS_LEVEL_LPSR		BIT(3)
+#define ROHM_DVS_LEVEL_VALID_AMOUNT	4
+#define ROHM_DVS_LEVEL_UNKNOWN		0
 
 /**
  * struct rohm_dvs_config - dynamic voltage scaling register descriptions
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
