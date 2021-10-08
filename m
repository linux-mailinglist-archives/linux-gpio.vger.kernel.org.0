Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0898426DA4
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 17:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243035AbhJHPlw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 11:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242780AbhJHPlv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 11:41:51 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278F7C061570;
        Fri,  8 Oct 2021 08:39:56 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t9so39824097lfd.1;
        Fri, 08 Oct 2021 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gDyEXWIeYRFxChu9VxQR3xwCXz9T0mgyC95BWcs1m1I=;
        b=jGK19TX4C59UJgY1shXWdZHtXz7jMJBPg866ZeCN71fkOHlLX2tqaebuU9SGhPfWsW
         lsi97Pj1w/DcjPWH1QhAPRJMUFhmYkQZzVNLiFgOekPlb4f/pMj7OOh+xq3JRsfdrUYP
         AI8cxBpncxGkrbZKkfdNsXEzkB0Dyr72CReHcocIn3U20VxGds4aIMEzEXIOV6YdFT8p
         AoQhEZF3UKqiJ7ARxr69LByA580j3LpwJoUSC1mIXucKI4YzfRTxXuoe/4mdBi2YQgFN
         FaqGPZrujj05+ycejlyxdRLsDOANEQ98tF7uCcW4yEaPniJuf+IklNM7LaxW/B/li5tg
         hTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gDyEXWIeYRFxChu9VxQR3xwCXz9T0mgyC95BWcs1m1I=;
        b=i5hLwFKJcUrI5wE93PvEmyrEW1ly7yWeFd5aCq7ORA6mh99KadqQjbufgmM1bXuGuC
         t3QlFovXbp3hJESnDFjvxmPiILckkgleIJ3RESqLDD5PmhAt5dCFr+0mArZadjUeLgjp
         ydtRXAxJuRGNznAYHqRFvDYGltK6R2sLcf42Xa+TEQbDvLCa52KKdUbw/4j3QvuNTCdk
         BYhOCgEXSF0FDjAhSUJPTX/1ZMobmhx3+FMbXvdpufIMOI2hnhZzepYP1pin4C66SZbM
         Kl7jTSJV5TUgv3yS5NWoDpwXgc44RyH6n0SdytMy4L31rbW5RN+qAOwKPnirKf/XjcjP
         tZcw==
X-Gm-Message-State: AOAM533L7XPDuwfXWdI+B8AILFDFk4hzRf2itDBe8IeuCqOoiWtgo3LF
        IVO4gH6MYieVygJfWlK3COc=
X-Google-Smtp-Source: ABdhPJyrPWldKwHWPwzsouIKLWc2KVmxKlBBTf362iEc8sEfyXu0e4IBIQuQ18iRsscGlWPiOhO2bw==
X-Received: by 2002:ac2:4e47:: with SMTP id f7mr11155438lfr.615.1633707590279;
        Fri, 08 Oct 2021 08:39:50 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id u27sm156851lfm.275.2021.10.08.08.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 08:39:49 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 linux-pinctrl 2/2] Revert "pinctrl: bcm: ns: support updated DT binding as syscon subnode"
Date:   Fri,  8 Oct 2021 17:39:39 +0200
Message-Id: <20211008153939.19685-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211008153939.19685-1-zajec5@gmail.com>
References: <20211008153939.19685-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This reverts commit a49d784d5a8272d0f63c448fe8dc69e589db006e.

The updated binding was wrong / invalid and has been reverted. There
isn't any upstream kernel DTS using it and Broadcom isn't known to use
it neither. There is close to zero chance this will cause regression for
anyone.

Actually in-kernel bcm5301x.dtsi still uses the old good binding and so
it's broken since the driver update. This revert fixes it.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/pinctrl/bcm/pinctrl-ns.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns.c b/drivers/pinctrl/bcm/pinctrl-ns.c
index e79690bd8b85..d7f8175d2c1c 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns.c
@@ -5,7 +5,6 @@
 
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -13,7 +12,6 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
-#include <linux/regmap.h>
 #include <linux/slab.h>
 
 #define FLAG_BCM4708		BIT(1)
@@ -24,8 +22,7 @@ struct ns_pinctrl {
 	struct device *dev;
 	unsigned int chipset_flag;
 	struct pinctrl_dev *pctldev;
-	struct regmap *regmap;
-	u32 offset;
+	void __iomem *base;
 
 	struct pinctrl_desc pctldesc;
 	struct ns_pinctrl_group *groups;
@@ -232,9 +229,9 @@ static int ns_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev,
 		unset |= BIT(pin_number);
 	}
 
-	regmap_read(ns_pinctrl->regmap, ns_pinctrl->offset, &tmp);
+	tmp = readl(ns_pinctrl->base);
 	tmp &= ~unset;
-	regmap_write(ns_pinctrl->regmap, ns_pinctrl->offset, tmp);
+	writel(tmp, ns_pinctrl->base);
 
 	return 0;
 }
@@ -266,13 +263,13 @@ static const struct of_device_id ns_pinctrl_of_match_table[] = {
 static int ns_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
 	const struct of_device_id *of_id;
 	struct ns_pinctrl *ns_pinctrl;
 	struct pinctrl_desc *pctldesc;
 	struct pinctrl_pin_desc *pin;
 	struct ns_pinctrl_group *group;
 	struct ns_pinctrl_function *function;
+	struct resource *res;
 	int i;
 
 	ns_pinctrl = devm_kzalloc(dev, sizeof(*ns_pinctrl), GFP_KERNEL);
@@ -290,18 +287,12 @@ static int ns_pinctrl_probe(struct platform_device *pdev)
 		return -EINVAL;
 	ns_pinctrl->chipset_flag = (uintptr_t)of_id->data;
 
-	ns_pinctrl->regmap = syscon_node_to_regmap(of_get_parent(np));
-	if (IS_ERR(ns_pinctrl->regmap)) {
-		int err = PTR_ERR(ns_pinctrl->regmap);
-
-		dev_err(dev, "Failed to map pinctrl regs: %d\n", err);
-
-		return err;
-	}
-
-	if (of_property_read_u32(np, "offset", &ns_pinctrl->offset)) {
-		dev_err(dev, "Failed to get register offset\n");
-		return -ENOENT;
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+					   "cru_gpio_control");
+	ns_pinctrl->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(ns_pinctrl->base)) {
+		dev_err(dev, "Failed to map pinctrl regs\n");
+		return PTR_ERR(ns_pinctrl->base);
 	}
 
 	memcpy(pctldesc, &ns_pinctrl_desc, sizeof(*pctldesc));
-- 
2.26.2

