Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE43D2FB2C2
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 08:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728538AbhASHTQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 02:19:16 -0500
Received: from mail-lj1-f180.google.com ([209.85.208.180]:37596 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730654AbhASHSq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 02:18:46 -0500
Received: by mail-lj1-f180.google.com with SMTP id 3so552915ljc.4;
        Mon, 18 Jan 2021 23:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W4lO/s0iMGk19qMdPoDZMWO0rMg1GjXtK6eR1C/M5p4=;
        b=KHwzAQuBv+t/I9tPHnlPbswlu/QYd3bElfHe2JeoL2rl5gldY8HuI8bkMq59Kqcsqw
         Z37tElogP7QS6SC+Y8FqaISD0VoYVawjMGX4CSvWV1jDvX7NfZZeU8XTdZB7llTQRIwS
         YTr0jFaAG+X1KKqunh5yZy5Sarb1wzNvCaBGHdqTqS0rEqhvrJYS76+8yFaVof31aZMu
         AosQus3YOlRJFJdsKF0xgklnfrXjFtNQEKMCHs2owYmV2cjCOf4inNlph5eCd7mfPRzI
         0Mib0pj9uEAEwiPQPcTkTG92qMpKbgImSQvg7qV7jV4WDuxDwIpr+Up6mWUgbC5UlW81
         XJFQ==
X-Gm-Message-State: AOAM530t22DFh8GTlJYc3g1AvWee03F2mGUen2y7lr+Qkn0kpmzfokS9
        5nzrIvJ1+k1nEgR/Qhzk2p8=
X-Google-Smtp-Source: ABdhPJyLpgE/ALX+EKI3BWiDJyqR7ao9BgTLuUUwiFd6rzyZ+m4LXd/ylEWcJpRwjYs52hGudIroHA==
X-Received: by 2002:a2e:a58c:: with SMTP id m12mr1361909ljp.444.1611040527628;
        Mon, 18 Jan 2021 23:15:27 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id w13sm1644155lfu.299.2021.01.18.23.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 23:15:27 -0800 (PST)
Date:   Tue, 19 Jan 2021 09:15:17 +0200
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
Subject: [PATCH v2 03/17] clk: BD718x7: Do not depend on parent driver data
Message-ID: <bfe41e384fba1cc340ac0d9c8a033d3f91776ed8.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The bd718x7 only needs a regmap from parent device. This can be
obtained by call to dev_get_regmap. Do not require parent to
populate the driver data for this.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Please note that this same change has been sent individually:
https://lore.kernel.org/lkml/20210105123028.GA3409663@localhost.localdomain/
It is present in this series only because some patches depend on it.

 drivers/clk/clk-bd718x7.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-bd718x7.c b/drivers/clk/clk-bd718x7.c
index b52e8d6f660c..17d90e09f1c0 100644
--- a/drivers/clk/clk-bd718x7.c
+++ b/drivers/clk/clk-bd718x7.c
@@ -31,12 +31,12 @@ struct bd718xx_clk {
 	u8 reg;
 	u8 mask;
 	struct platform_device *pdev;
-	struct rohm_regmap_dev *mfd;
+	struct regmap *regmap;
 };
 
 static int bd71837_clk_set(struct bd718xx_clk *c, unsigned int status)
 {
-	return regmap_update_bits(c->mfd->regmap, c->reg, c->mask, status);
+	return regmap_update_bits(c->regmap, c->reg, c->mask, status);
 }
 
 static void bd71837_clk_disable(struct clk_hw *hw)
@@ -62,7 +62,7 @@ static int bd71837_clk_is_enabled(struct clk_hw *hw)
 	int rval;
 	struct bd718xx_clk *c = container_of(hw, struct bd718xx_clk, hw);
 
-	rval = regmap_read(c->mfd->regmap, c->reg, &enabled);
+	rval = regmap_read(c->regmap, c->reg, &enabled);
 
 	if (rval)
 		return rval;
@@ -82,7 +82,6 @@ static int bd71837_clk_probe(struct platform_device *pdev)
 	int rval = -ENOMEM;
 	const char *parent_clk;
 	struct device *parent = pdev->dev.parent;
-	struct rohm_regmap_dev *mfd = dev_get_drvdata(parent);
 	struct clk_init_data init = {
 		.name = "bd718xx-32k-out",
 		.ops = &bd71837_clk_ops,
@@ -93,6 +92,10 @@ static int bd71837_clk_probe(struct platform_device *pdev)
 	if (!c)
 		return -ENOMEM;
 
+	c->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!c->regmap)
+		return -ENODEV;
+
 	init.num_parents = 1;
 	parent_clk = of_clk_get_parent_name(parent->of_node, 0);
 
@@ -119,7 +122,6 @@ static int bd71837_clk_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Unknown clk chip\n");
 		return -EINVAL;
 	}
-	c->mfd = mfd;
 	c->pdev = pdev;
 	c->hw.init = &init;
 
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
