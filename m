Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1A4FF4FE
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Nov 2019 19:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727601AbfKPS6c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Nov 2019 13:58:32 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46038 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727561AbfKPS6c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Nov 2019 13:58:32 -0500
Received: by mail-lf1-f67.google.com with SMTP id v8so10542013lfa.12;
        Sat, 16 Nov 2019 10:58:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WBMubSJK3yYX1LJw7bJIh1492Hjr+617R5W1VJHNuuc=;
        b=QJwcRDneMoRulG38qXOVSVb/xzg3QmorosvP7nLr+QTyghAvUqclvhqibJxsFJMyy/
         XXlbyYCaOabfRZ7INqZOdtmDrloqeQBDleOStw1pQhj5pVjDF5PGK8A/B0NCvKaFRwcc
         ndxYdeF7e82X7FBK+a+/9WZZMbbOdC8ErrBFZtay2vJv+LTetj7mxWWDtWUEMoAP7DD3
         MXQOSKqZAxz4BvJxp45+wTDL5+vChNqH9t/w72C6QwTHNs6dNqRGX1mDsFyAlgZfhLIz
         69p0fcwt9lL7KtsPpxPJF6amziITgEfD4kKEu/EPJ5WvuKV+LNGvydDKltwJ6LjxRm8u
         B+3g==
X-Gm-Message-State: APjAAAUQonzdIW1QoVa+Zt5XFo83N1VnPbH0wmlSOcySyfN6dQkoYKrr
        HTRK/mNHPo8tyyhvlona+1I=
X-Google-Smtp-Source: APXvYqw8XA8clz/DfIxUbN4D3geVVKZKP0PsUfrPBmqdFVjRi79DAVNlNltXjp/NoAw+4fqJaldK3A==
X-Received: by 2002:a19:ca1b:: with SMTP id a27mr5906044lfg.93.1573930709693;
        Sat, 16 Nov 2019 10:58:29 -0800 (PST)
Received: from localhost.localdomain (dyttqz39y2bkc1ryvyh3t-4.rev.dnainternet.fi. [2001:14bb:420:da5f:a0b0:502a:b811:1af])
        by smtp.gmail.com with ESMTPSA id r4sm5723041ljn.64.2019.11.16.10.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 10:58:29 -0800 (PST)
Date:   Sat, 16 Nov 2019 20:58:20 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v4 06/16] mfd: input: bd71828: Add power-key support
Message-ID: <3d9db6ef3de2e851c9e00e1e20aa5bdbf7e2b09c.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/mfd/rohm-bd71828.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index 7f445d699fd9..b892b50ec555 100644
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
