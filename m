Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C9D2295DA
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 12:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732063AbgGVKRv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 06:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732053AbgGVKRu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 06:17:50 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5919AC0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 03:17:50 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id h8so993122lfp.9
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 03:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XBYm1fcRo/AzWk53mgvvDkii2dppQSf2kifHQgHpe28=;
        b=yBjx9/WJO/9bmYCxMZsOxOaUWZom9NSSbd98bF7+ZV2AAdMmFKclNweyWAkRCb74kU
         AhjD8TVNfIv71XuwmQtEv6W3NPPv/JYBMKzRkBNujS46hbnxk1nmsk3eidwXC0rG2wjt
         5R+YkvqNy/DvrJTs90wxBLrOGRnBsNa0p6lRQBW8BdyKu+fQiezHLgObqIMjHaLu2TU2
         ecT3xxDZPIv2h0jLVqaDzdTpRFujtRhcuN0/pE9tQJ/M6IekUOJ4u2BmQZ8+/7/Zf8L9
         MEbKJxSYExCSj2NxoOC4lHEaQ+JFqVxFIYk2ClK9zSWIOZD2JWwt5S5sumjS0Ev4JBES
         IdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XBYm1fcRo/AzWk53mgvvDkii2dppQSf2kifHQgHpe28=;
        b=ltUlvcL7wkMKaSeGnMgoJF88vhRxubX38gkNSSwTEyYmEc6F/Z6DvXLogH1FF+an7d
         ioTSwTPfgBVhFH2Z54CAsBgmZ6V57EuA8gs6sWiHPVcdpEk55GhGk3HGHpccIO5V4zqQ
         n4ufw9YF2J9htd9jzxGWv02cBEDdbIfQIEZna1yQT/qCJPJTSSpNugija20MJVuQidni
         K+q1kD/EIJ0pPFA74933BNPVJH8alogTmukFSTUyLOqRVuEOnsVLYhHaRyAdP7iannCm
         tyjfOC2liq85VHhBv2tzDZzeOZywxS20NLWPfyA44oeCegttEp6L+P4V8053et3Sz8zH
         cejQ==
X-Gm-Message-State: AOAM533rKPNTxBVAulUPS+f5fDAR5bgB8HfTOVvji7Y8w0WyZUfKCgMX
        WgDbycI+B5yzcgZI30sgiVpXBM6JTo/z3A==
X-Google-Smtp-Source: ABdhPJyaYWCV1OgfA0WwTCycIM3QUBvHGHeWZDsDM55bmQ8iXFIC87Pj0K10WuLuprtIpzzwaCltqw==
X-Received: by 2002:a19:c3d0:: with SMTP id t199mr4118228lff.56.1595413068433;
        Wed, 22 Jul 2020 03:17:48 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id 11sm6360957lju.102.2020.07.22.03.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 03:17:47 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>
Subject: [PATCH] pinctrl: amd: Use irqchip template
Date:   Wed, 22 Jul 2020 12:15:45 +0200
Message-Id: <20200722101545.144373-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the driver use the irqchip template to assign
properties to the gpio_irq_chip instead of using the
explicit call to gpiochip_irqchip_add().

The irqchip is instead added while adding the gpiochip.

Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Sandeep Singh <sandeep.singh@amd.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-amd.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 1fe62a35bb12..faa7aa913c77 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -855,6 +855,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	int irq_base;
 	struct resource *res;
 	struct amd_gpio *gpio_dev;
+	struct gpio_irq_chip *girq;
 
 	gpio_dev = devm_kzalloc(&pdev->dev,
 				sizeof(struct amd_gpio), GFP_KERNEL);
@@ -916,6 +917,15 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(gpio_dev->pctrl);
 	}
 
+	girq = &gpio_dev->gc.irq;
+	girq->chip = &amd_gpio_irqchip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+
 	ret = gpiochip_add_data(&gpio_dev->gc, gpio_dev);
 	if (ret)
 		return ret;
@@ -927,17 +937,6 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		goto out2;
 	}
 
-	ret = gpiochip_irqchip_add(&gpio_dev->gc,
-				&amd_gpio_irqchip,
-				0,
-				handle_simple_irq,
-				IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(&pdev->dev, "could not add irqchip\n");
-		ret = -ENODEV;
-		goto out2;
-	}
-
 	ret = devm_request_irq(&pdev->dev, irq_base, amd_gpio_irq_handler,
 			       IRQF_SHARED, KBUILD_MODNAME, gpio_dev);
 	if (ret)
-- 
2.26.2

