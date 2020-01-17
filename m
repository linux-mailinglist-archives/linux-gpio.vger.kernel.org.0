Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 668AD14062F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 10:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729140AbgAQJfc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 04:35:32 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45586 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729112AbgAQJfb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 04:35:31 -0500
Received: by mail-lj1-f194.google.com with SMTP id j26so25739884ljc.12;
        Fri, 17 Jan 2020 01:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5G2Jq7cbJnlKXxoPCsYd5FlCl6CmO0LfS0famLwy+MA=;
        b=OXZnbhceFUtkIk5RPlkoOO9iGcK+cRbOUwD72tiw0b8sM03TSxrLZTHYRRmwr+u/Ct
         N8MpTvjJbMJc0gk0wiF0eYVv331zWVQbNyu5p6zVdg7hTGZTQKGR8lKiXGKGPJYZ0+ye
         iFvY2js/p+9CkNjo8NMlOTAUGGv6KAeZZfUPxe+wiMh5dUgAbYFqHmGE5Rc1s14qA40B
         xYDKQpW5fRt/hHehig7YLGYC4m49EyqbYzUUhnNTNRBoUusD/2Xy9aZJNY7Fr9/QTd9z
         DSxfkvOaMlVPJn6pvL/y3OXwjJ6g0NKaDF+QcnRokuv8uY2g52T39X8hZugX8/fWqf0u
         jfxQ==
X-Gm-Message-State: APjAAAWctWskF7pWcZVrcMeLDRtsQ1fn7ORCRpKVts+6qI3s0VhQcyRd
        XTi/sC0Wg9mDIdGe4P2lEiI=
X-Google-Smtp-Source: APXvYqyW9iF5U3kuzBTOFPyGfBQUJdXZ11kB9kyWNtyZllb8G0RZOSBw3lT3Wu5hYOqBamnmGmxcCg==
X-Received: by 2002:a2e:b4cf:: with SMTP id r15mr4655513ljm.52.1579253728938;
        Fri, 17 Jan 2020 01:35:28 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id z5sm12108551lji.40.2020.01.17.01.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 01:35:28 -0800 (PST)
Date:   Fri, 17 Jan 2020 11:35:21 +0200
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
Subject: [PATCH v10 04/13] mfd: bd718x7: Add compatible for BD71850
Message-ID: <9771850fe04040c30ff3668fcba7002f7f0681fd.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
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

ROHM BD71850 PMIC is almost identical to BD71847. Main difference is some
initial voltage values for regulators. The BD71850 can be handled by
BD71847 driver but adding own compatible makes it clearer for one who
creates the DT for board containing this PMIC and allows SW to be
differentiating PMICs if needed.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
no changes since v9

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
