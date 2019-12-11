Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3033E11A7BA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728613AbfLKJne (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:43:34 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45692 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728370AbfLKJnd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:43:33 -0500
Received: by mail-lf1-f65.google.com with SMTP id 203so16100462lfa.12;
        Wed, 11 Dec 2019 01:43:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+biBEQreu589nhDfTn2/9rER8Ofo2M73AkOaXykP3cY=;
        b=Dgx/fJMXoX30hYDAFkrQ5CmLRvrBKwc1D3OTUSlWonvIoRaZolizs2sE5QDtmXOZmX
         eBXw7KevbLNAHeYBM7QAPXtD+k9glaAU+30/8Qd4stHzJ4wIy5rC4TaREZecqlddEdEK
         UnnIFvKhRe0RstkO3wdT7lZUTaIKiQ3XCevtzhRl1bnM79oNDPHGrzk5tTzCb4nr9fPl
         WdvdqV5mi7OhGOKbN0CkcLk8T4HoJk+jypUupNhBe3OVL5TLb++njtP+D9d+aGdlHWN6
         is1GMU8Tsek/6pAdBG7FjJ3JrgVeIwjj/loekAU2ttqgMxHX5IMyUaXT5dPc5D4LhHKv
         05ZQ==
X-Gm-Message-State: APjAAAW7hFvFd6gLuQdAzInjhXjRx+qDdPjiwUKQzx1gF4bDhi/4owpX
        QTfuNFS3oehOecdynt5A6aw=
X-Google-Smtp-Source: APXvYqzfy3MGetNTGCQwBQiEPvpTeLG1Lv7I3w3JEVExp0tqLwNz5RTxNqn61tFOCFdJuWHe9TS8Uw==
X-Received: by 2002:a19:4a:: with SMTP id 71mr1573471lfa.50.1576057410729;
        Wed, 11 Dec 2019 01:43:30 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 207sm897874ljj.72.2019.12.11.01.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 01:43:30 -0800 (PST)
Date:   Wed, 11 Dec 2019 11:43:18 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v6 06/15] mfd: input: bd71828: Add power-key support
Message-ID: <3ae6840d5984463f2d6f3ce068242269dba21989.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use gpio_keys to send power input-event to user-space when power
button (short) press is detected.

Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

No changes since v5

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
