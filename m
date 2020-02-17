Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F33D161068
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 11:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgBQKsq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 05:48:46 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45656 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbgBQKsq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 05:48:46 -0500
Received: by mail-pf1-f195.google.com with SMTP id 2so8637743pfg.12
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2020 02:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=LX5CZAwQk9HaQfPKztuKM5rh+LsPbbyjCPsMMUXGGfQ=;
        b=jkaKr3tScWq5eBY4cy/yVvHCW2n6wv+g5UqILiLqYQK0mvAEZdGZD4tNkOLXfP5mUh
         SRvmGno71WHo4yeHQhAAcoj/i00ccqY4IZZV+jY6SukBSmwfneG/+epVZAFjQYIPK7mH
         L9eRdAxQfzH+QvNeFXcsgfxm85Z0sfpH9yq/MP1uyw5RLF+CGQ3psMonCC+E7mq0m7Z/
         dyePKtKzpvAIFUoZagUxMG+iOx8Oz/qNdXX0UAjJs3BqTSGmS46uDIr9KumJ8C/pesSs
         /xCUqaxAMuLvJq6/Dsp/0+kKpq7yc2BnnNZAyy4NXEztlfVp5kJhgqiS/0K3FlED16r2
         FkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LX5CZAwQk9HaQfPKztuKM5rh+LsPbbyjCPsMMUXGGfQ=;
        b=RcWOcdq+ZjDcv8HgJUhd70IaOGvx6Q52zVw/+PLyGpeosP4c2M1TroUbM1jHzptDiX
         LeLPkdoFjPDOVlZaNlpACJFRNH6H9IsAgimnEwmzDwOrOWaJKlTvOXXDFWzarUlRJWeF
         /DkK4eEotEy/Htp9MeqOc4jyWeFrEBExSsxwSEawAMBIq7s6+BW3OaWgx067Kv7xFmJN
         2MdmtjsdCvs1Z6AKTf/hn9SXa9wG90wCEyWf+b/Hnt3GpsqjTU3PzrrQNqJ3NlEE+R2S
         nCPtkEfwTngMBoelmq366b+TecdD1rWvnLPcOGt0DD3ZRv/1K1n5791+R2/xR6QF/ReD
         P4Cw==
X-Gm-Message-State: APjAAAW76L9GhwZEeoiGh1C/estqWiWd1mDLFpVpm7NwLgkZHArLwTy5
        Lec+yL9viCZS5aLOpOSN03I=
X-Google-Smtp-Source: APXvYqwR3xPfW1fcRNXdL/XgSeCnPCduWsvDysOKQaGSMf6psVvlp0P5eI3Ebe+oOwZBWK78/QqaCw==
X-Received: by 2002:a63:a541:: with SMTP id r1mr17026251pgu.118.1581936525799;
        Mon, 17 Feb 2020 02:48:45 -0800 (PST)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id o10sm240262pgq.68.2020.02.17.02.48.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 17 Feb 2020 02:48:45 -0800 (PST)
From:   qiwuchen55@gmail.com
To:     bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: [PATCH v2] gpio: mmio: use devm_platform_ioremap_resource_byname()
Date:   Mon, 17 Feb 2020 18:48:41 +0800
Message-Id: <1581936521-2982-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: chenqiwu <chenqiwu@xiaomi.com>

Use devm_platform_ioremap_resource_byname() instead of calling
platform_get_resource_byname() and devm_ioremap_resource()
separately to simplify code.

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
changes in v2:
 - remove bgpio_map() entirely.
---
 drivers/gpio/gpio-mmio.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index f729e3e..b7170d6 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -654,24 +654,6 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 
 #if IS_ENABLED(CONFIG_GPIO_GENERIC_PLATFORM)
 
-static void __iomem *bgpio_map(struct platform_device *pdev,
-			       const char *name,
-			       resource_size_t sane_sz)
-{
-	struct resource *r;
-	resource_size_t sz;
-
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	if (!r)
-		return NULL;
-
-	sz = resource_size(r);
-	if (sz != sane_sz)
-		return IOMEM_ERR_PTR(-EINVAL);
-
-	return devm_ioremap_resource(&pdev->dev, r);
-}
-
 #ifdef CONFIG_OF
 static const struct of_device_id bgpio_of_match[] = {
 	{ .compatible = "brcm,bcm6345-gpio" },
@@ -742,23 +724,23 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 
 	sz = resource_size(r);
 
-	dat = bgpio_map(pdev, "dat", sz);
+	dat = devm_platform_ioremap_resource_byname(pdev, "dat");
 	if (IS_ERR(dat))
 		return PTR_ERR(dat);
 
-	set = bgpio_map(pdev, "set", sz);
+	set = devm_platform_ioremap_resource_byname(pdev, "set");
 	if (IS_ERR(set))
 		return PTR_ERR(set);
 
-	clr = bgpio_map(pdev, "clr", sz);
+	clr = devm_platform_ioremap_resource_byname(pdev, "clr");
 	if (IS_ERR(clr))
 		return PTR_ERR(clr);
 
-	dirout = bgpio_map(pdev, "dirout", sz);
+	dirout = devm_platform_ioremap_resource_byname(pdev, "dirout");
 	if (IS_ERR(dirout))
 		return PTR_ERR(dirout);
 
-	dirin = bgpio_map(pdev, "dirin", sz);
+	dirin = devm_platform_ioremap_resource_byname(pdev, "dirin");
 	if (IS_ERR(dirin))
 		return PTR_ERR(dirin);
 
-- 
1.9.1

