Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F65612CE59
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2019 10:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfL3JhI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Dec 2019 04:37:08 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36323 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727162AbfL3JhI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Dec 2019 04:37:08 -0500
Received: by mail-lj1-f193.google.com with SMTP id r19so32726381ljg.3;
        Mon, 30 Dec 2019 01:37:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BeBlJ9Mt1RNMC0l/X62DskBze2BUcu0okU82ea0Lekc=;
        b=j8YMmgP1AhWJywFFqY/6IavPWqlEZH+BW8UgIM16a+u2aY3Xjst/8gazZ5nxjUk+P1
         gRg8SFdWyjaozjZqJK0bWkyKEegXLAcEc2AYjhzboT5JbMuUFs1x/RsRW/PigWATwH1f
         VNsazbrSXH2GO/O5ZswacDTZeo5I2GxJeVOYyMUq64338+4PDdqyo5ktn0q1FLunZjk0
         n8ES+FLNxBEXOSPAZOGScKiBo9HqAWCLKV9TrVHkfYz0TAHIOjKScJf+jhTbj34B96PD
         /CvoENj0JFJhNtbW3z4+rUzxnOw3hLP+p9Sq66Jtk75nZEcrbJ99hF1M3D3h5+GRf0Gg
         waWg==
X-Gm-Message-State: APjAAAVd0QINLCwnKGlzNcKsc4Q9sH0Utm0wyBA07tP4FCgwdTWCYT/R
        TCuDgzpJaWMqSDox7wkp/FI=
X-Google-Smtp-Source: APXvYqyYFNXMykxFSbiTXPtA0U8DQJXTm7dor3w1g8QqYtyGl86YYk4KcDLik3ZxJwiL3Ft8wXIpcA==
X-Received: by 2002:a2e:858b:: with SMTP id b11mr33458862lji.135.1577698625351;
        Mon, 30 Dec 2019 01:37:05 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id t9sm18196757lfl.51.2019.12.30.01.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 01:37:04 -0800 (PST)
Date:   Mon, 30 Dec 2019 11:36:56 +0200
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
Subject: [PATCH v8 04/12] mfd: bd718x7: Add compatible for BD71850
Message-ID: <bd5009357c16d73d9bad52be68db74a2cfa6328f.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
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
---

Changes from v7 - no changes

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
