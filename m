Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02DE714063E
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 10:37:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgAQJhE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 04:37:04 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44191 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgAQJhE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 04:37:04 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so1979550ljj.11;
        Fri, 17 Jan 2020 01:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rZv37RKsYtFvKDFJEFoZS7pAx4G6kcGgNTTiB7tm5uU=;
        b=DcxNPMg1VqDpGxiUhiNFNxz74w+d4aGtDYeBhb9lFcR67nx8Fi1B6o4hoeyhFsL91a
         ArPzkLKppGLn+VbIE25hSfUewm5p0pa5sA7z6udGUj7IfuNZhILXiw2YqzpmE+gpy9JK
         gdQgvu4rZemtJCv6mTjoUcFxBHhytIcYnV98pPfb0pcQK7MwfkdKVx3U2HWNww5cYJ+p
         PaFKCo0LKIhRODm8pSGma5szy6oC66fn5rHPuRsKLMsIlBIMP//3w88FXDvd1iG/In/W
         XXuaB4ZvbKf3UxoXzMQz1R2dU1txiPtc2VDacoya53GPt9otIRR/FBrFo9SAHbV8rmkM
         m1cQ==
X-Gm-Message-State: APjAAAVJeRzyqaRvHWOEL9cED2JFUfP6iJrc1tVFN6oMbO7Xv2/zr6P1
        BHbXrljKDNZI3xTGGdPLfRA=
X-Google-Smtp-Source: APXvYqyoGEt/denJH+eMcrLW284CLcO3roZEL33B2EAPuFnQ+UVV+Qz1Fe01yziHo0l4d1yWt4hDtA==
X-Received: by 2002:a2e:3a13:: with SMTP id h19mr5151807lja.16.1579253821564;
        Fri, 17 Jan 2020 01:37:01 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v5sm12037704ljk.67.2020.01.17.01.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 01:37:00 -0800 (PST)
Date:   Fri, 17 Jan 2020 11:36:54 +0200
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
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v10 06/13] mfd: input: bd71828: Add power-key support
Message-ID: <aa965067acfbdaa862f5f5de8b66e2c161f276a0.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use gpio_keys to send power input-event to user-space when power
button (short) press is detected.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
no changes since v9

 drivers/mfd/rohm-bd71828.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index 0ec386c9f26b..210261d026f2 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -4,7 +4,9 @@
 //
 // ROHM BD71828 PMIC driver
 
+#include <linux/gpio_keys.h>
 #include <linux/i2c.h>
+#include <linux/input.h>
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/irq.h>
@@ -15,6 +17,18 @@
 #include <linux/regmap.h>
 #include <linux/types.h>
 
+static struct gpio_keys_button button = {
+	.code = KEY_POWER,
+	.gpio = -1,
+	.type = EV_KEY,
+};
+
+static struct gpio_keys_platform_data bd71828_powerkey_data = {
+	.buttons = &button,
+	.nbuttons = 1,
+	.name = "bd71828-pwrkey",
+};
+
 static const struct resource rtc_irqs[] = {
 	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC0, "bd71828-rtc-alm-0"),
 	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC1, "bd71828-rtc-alm-1"),
@@ -35,6 +49,10 @@ static struct mfd_cell bd71828_mfd_cells[] = {
 		.name = "bd71828-rtc",
 		.resources = rtc_irqs,
 		.num_resources = ARRAY_SIZE(rtc_irqs),
+	}, {
+		.name = "gpio-keys",
+		.platform_data = &bd71828_powerkey_data,
+		.pdata_size = sizeof(bd71828_powerkey_data),
 	},
 };
 
@@ -288,6 +306,14 @@ static int bd71828_i2c_probe(struct i2c_client *i2c)
 	dev_dbg(&i2c->dev, "Registered %d IRQs for chip\n",
 		bd71828_irq_chip.num_irqs);
 
+	ret = regmap_irq_get_virq(irq_data, BD71828_INT_SHORTPUSH);
+	if (ret < 0) {
+		dev_err(&i2c->dev, "Failed to get the power-key IRQ\n");
+		return ret;
+	}
+
+	button.irq = ret;
+
 	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
 				   bd71828_mfd_cells,
 				   ARRAY_SIZE(bd71828_mfd_cells), NULL, 0,
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
