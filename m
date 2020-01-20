Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5589142376
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 07:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgATGgG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 01:36:06 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46516 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgATGgF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 01:36:05 -0500
Received: by mail-lf1-f67.google.com with SMTP id z26so2444553lfg.13;
        Sun, 19 Jan 2020 22:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KXTgRFhqhIuBLt1GObZ2IiRRibWmr5RBj8PVEAPf3TA=;
        b=NZaMIHnL3Wm7T0mZpHL+gFFAr0ohY7Kk/JB448mdVb2z/L4lNKn/p3kUUgh3uogymh
         XVUb/94OkFVb6kAIfstyirtDFNYv4j3LYf/eXLUxOx9hsI09+bXkzUETttMBP9j31b+5
         THB3OXZ0cH0+bP2Msq68So7bazkcricfiGAdp7G5yoz+14PqqOdkd1QmqFn+4xvhuv1v
         4YCi3/ngQrBEs1bsjreEl9s9K5C32iCNDkXDq1WhOgOJITmDVH1G82q07jHc/7QKyvfD
         TebE9War0PrPU2VdAzfTR6DQZSIWUhnG7zV6FMAtoNHaOb0CHBI2tWZQOQSweEH68AHO
         Qi0w==
X-Gm-Message-State: APjAAAXfXiTpA0TF3ezB8iXm44vi7HdiEGu1pXKpwNUo9Y3AKgW7vYXH
        mCZO2eCY538sZQ7GW/zYTZY=
X-Google-Smtp-Source: APXvYqwTVIcdgn6Vmy8IPbVx+ErHl5ZhFxU8D+OMHvXFIcD1WjnXAsmwm909Bt2OCKzdDfB1gQSanA==
X-Received: by 2002:ac2:5509:: with SMTP id j9mr3202179lfk.135.1579502162597;
        Sun, 19 Jan 2020 22:36:02 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id z22sm16139628ljm.24.2020.01.19.22.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2020 22:36:02 -0800 (PST)
Date:   Mon, 20 Jan 2020 08:35:50 +0200
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
Subject: [PATCH v11 04/13] mfd: bd718x7: Add compatible for BD71850
Message-ID: <9771850fe04040c30ff3668fcba7002f7f0681fd.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

ROHM BD71850 PMIC is almost identical to BD71847. Main difference is some
initial voltage values for regulators. The BD71850 can be handled by
BD71847 driver but adding own compatible makes it clearer for one who
creates the DT for board containing this PMIC and allows SW to be
differentiating PMICs if needed.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
No changes since v10

 drivers/mfd/rohm-bd718x7.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index bb86ec829079..c32c1b6c98fa 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -213,6 +213,10 @@ static const struct of_device_id bd718xx_of_match[] = {
 		.compatible = "rohm,bd71847",
 		.data = (void *)ROHM_CHIP_TYPE_BD71847,
 	},
+	{
+		.compatible = "rohm,bd71850",
+		.data = (void *)ROHM_CHIP_TYPE_BD71847,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bd718xx_of_match);
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
