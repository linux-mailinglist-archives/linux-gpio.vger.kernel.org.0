Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6C4125E2A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 10:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfLSJvy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 04:51:54 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44844 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbfLSJvy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 04:51:54 -0500
Received: by mail-lj1-f196.google.com with SMTP id u71so5494514lje.11;
        Thu, 19 Dec 2019 01:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sz9ZFMAfLNnRN0oEPiFfJFkZ500m1Xl+pgBTQx3xh0s=;
        b=cg1aJDt1oPAQFJw4mDQPurG8io8Up2qoLJLprStqtxsOu68mppWeC9oMmtW9mvIY4O
         +J2vMpqDYvJyh+8ScWX33kNrAYMSTJlWlxOkVwGQRebfTMiknKLirzB1pFRj+oY9WlMl
         NLcnmGsFEjrDqNozVR1ET/CEJbIryAUvpV6wOZ5ngog2ye0kP7MgM02hLjbg1JEr+U4U
         Anw/HeuI4/UNeGcjGATHN4zQ6qfZgFE152z4SdodvI6FoXjewcjJTYsR8U6kd5XAQwr4
         SCxmOPfV+QPSAFoyIHKqe0l/qnTZQCZxxEKBIX2ORz5Vsk4QUkjRxWMXYYlUjc0kjfsI
         vpuQ==
X-Gm-Message-State: APjAAAWXkQApD12sypyzSPg/YB2zkYg3vZG+sQskUJVrscOMgXzpbhIT
        77kLIBol3k4nAJswxjXBNkc=
X-Google-Smtp-Source: APXvYqylkSqfqsxEMRUC3ohUj3h49THBJrjXUU6Y2quB7Yr2qurJA0UypPrUqQihShjgVLyK1Odikw==
X-Received: by 2002:a2e:9118:: with SMTP id m24mr4517978ljg.105.1576749111839;
        Thu, 19 Dec 2019 01:51:51 -0800 (PST)
Received: from localhost.localdomain (dyt4gctb359myxd0pkwmt-4.rev.dnainternet.fi. [2001:14bb:430:5140:37cf:5409:8fcc:4495])
        by smtp.gmail.com with ESMTPSA id h19sm2508477ljk.44.2019.12.19.01.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 01:51:51 -0800 (PST)
Date:   Thu, 19 Dec 2019 11:51:37 +0200
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
Subject: [PATCH v7 06/12] mfd: input: bd71828: Add power-key support
Message-ID: <6484e6b98a20c13b6ebb045dc8c2933fa804b253.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
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

No changes since v6

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
