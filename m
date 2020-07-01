Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA9C210246
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 05:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgGADAy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 23:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgGADAy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 23:00:54 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF687C061755;
        Tue, 30 Jun 2020 20:00:53 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g75so20775028wme.5;
        Tue, 30 Jun 2020 20:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r4FITRNPzoi7E+hue9JzjyaTaq1hky+n+G+/btPnRfI=;
        b=i6qIjUTNFxzbNAizwgneQ+Io9p3VzWLc0aojRuLi6gbt1UrbD6ueMDefILr66k+Ua7
         RrWp7VceNPMSWUsvIOmu5WWD6UoRA/pPp8CZmOqUwEa8fYISQ1vDyQ1djGGDIjtCOqbE
         c+WZ44GH3lSjHPPUY8LxeGPDUpLn4ORaT43qk18uZLSuHiccfuJdIMfagHMSKDyFZpbr
         kzQmPt7saSuLZchsKlMDnm8OVO980c5r1sV8baewHmfJ2QMqpdu8B5Y+maEGngoWvBub
         ZIcHRqaxset7QUcpt0m+VFTVlZn3BE39zAgMeRs3OheSRcoiimQCvgtFHe9p3NjxaOv0
         wXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=r4FITRNPzoi7E+hue9JzjyaTaq1hky+n+G+/btPnRfI=;
        b=Z+Y/EcZGRlPup3dUJLTch8Bf7UbyHKmYJJA+MQhKVCJ83SGVxnmOQKlxbwTry2ALEo
         AVeACmwvb/72o2YWVJCBQg8JXibPb70CcObsibn+3PxgT2UJhRh/n+3VOJLbMkvtevT7
         TAjsKLsAxdHTvsm1/P7l0d5BZs3aMjgCxc8EfvUAXYmdJv+k/byeDfezELpzzpKOeUHY
         qs9XRZPuT4/2ytWaSGwT4l3N29lh/E79eFvVYuYegGk42ALZ+26oeSrUNgxsKjZArZuq
         m6t/K61ekBGIJiF5X45EXEy7xMHKdMViT5Fh59uX8eBf9DnjuHjFCxYP/GJj4905uGn0
         BKUA==
X-Gm-Message-State: AOAM532VRF8+Gdp19jYQU3Few07vmz7FaW2uYIhw5c1ghJk3ht//ZHol
        WWYb+dA7iqmHi0M31L/kXZk=
X-Google-Smtp-Source: ABdhPJy/PfXS0TfxMhqYWbtqHG0GX+7dmC/JgofQQtsaFE9LbHywkjkpYaVTYjwgU8269m1oK17z8w==
X-Received: by 2002:a1c:544f:: with SMTP id p15mr23515461wmi.84.1593572452482;
        Tue, 30 Jun 2020 20:00:52 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id u65sm5424796wmg.5.2020.06.30.20.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 20:00:51 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] pinctrl: aspeed: Improve debug output
Date:   Wed,  1 Jul 2020 12:30:39 +0930
Message-Id: <20200701030039.2834418-1-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Andrew Jeffery <andrew@aj.id.au>

We need to iterate over each pin in a group for a function and
disable higher priority mux configurations on the pin before finally
muxing the relevant function's signal. With the current debug output it
is hard to track what register output is relevant to which operation, so
break up the actions in the debug output by providing some more context.

Before:

    [    5.446656] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: request pin 37 (B26) for 1e780000.gpio:341
    [    5.447377] Want SCU414[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.447854] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.448340] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000

After:

    [    5.298053] Muxing pin 37 for GPIO
    [    5.298294] Disabling signal NRI4 for NRI4
    [    5.298593] Want SCU414[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.298983] Disabling signal RGMII4RXD1 for RGMII4
    [    5.299309] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.299694] Disabling signal RMII4RXD1 for RMII4
    [    5.300014] Want SCU4B4[0x00000020]=0x1, got 0x0 from 0x00000000
    [    5.300396] Enabling signal GPIOE5 for GPIOE5
    [    5.300687] Muxed pin 37 as GPIOE5

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index b625a657171e..53f3f8aec695 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -76,6 +76,9 @@ static int aspeed_sig_expr_enable(struct aspeed_pinmux_data *ctx,
 {
 	int ret;
 
+	pr_debug("Enabling signal %s for %s\n", expr->signal,
+		 expr->function);
+
 	ret = aspeed_sig_expr_eval(ctx, expr, true);
 	if (ret < 0)
 		return ret;
@@ -91,6 +94,9 @@ static int aspeed_sig_expr_disable(struct aspeed_pinmux_data *ctx,
 {
 	int ret;
 
+	pr_debug("Disabling signal %s for %s\n", expr->signal,
+		 expr->function);
+
 	ret = aspeed_sig_expr_eval(ctx, expr, true);
 	if (ret < 0)
 		return ret;
@@ -229,7 +235,7 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		const struct aspeed_sig_expr **funcs;
 		const struct aspeed_sig_expr ***prios;
 
-		pr_debug("Muxing pin %d for %s\n", pin, pfunc->name);
+		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
 
 		if (!pdesc)
 			return -EINVAL;
@@ -269,6 +275,9 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		ret = aspeed_sig_expr_enable(&pdata->pinmux, expr);
 		if (ret)
 			return ret;
+
+		pr_debug("Muxed pin %s as %s for %s\n", pdesc->name, expr->signal,
+			 expr->function);
 	}
 
 	return 0;
@@ -317,6 +326,8 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 	if (!prios)
 		return -ENXIO;
 
+	pr_debug("Muxing pin %s for GPIO\n", pdesc->name);
+
 	/* Disable any functions of higher priority than GPIO */
 	while ((funcs = *prios)) {
 		if (aspeed_gpio_in_exprs(funcs))
@@ -346,14 +357,22 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 	 * lowest-priority signal type. As such it has no associated
 	 * expression.
 	 */
-	if (!expr)
+	if (!expr) {
+		pr_debug("Muxed pin %s as GPIO\n", pdesc->name);
 		return 0;
+	}
 
 	/*
 	 * If GPIO is not the lowest priority signal type, assume there is only
 	 * one expression defined to enable the GPIO function
 	 */
-	return aspeed_sig_expr_enable(&pdata->pinmux, expr);
+	ret = aspeed_sig_expr_enable(&pdata->pinmux, expr);
+	if (ret)
+		return ret;
+
+	pr_debug("Muxed pin %s as %s\n", pdesc->name, expr->signal);
+
+	return 0;
 }
 
 int aspeed_pinctrl_probe(struct platform_device *pdev,
-- 
2.27.0

