Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5651C3D7997
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 17:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237046AbhG0PUl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 11:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236901AbhG0PUd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 11:20:33 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219B9C061764;
        Tue, 27 Jul 2021 08:20:33 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id k4so7817214wms.3;
        Tue, 27 Jul 2021 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A97sJEVHqRr1cAiROr2GcKYuYpM2uXOvkYVkdzP+alE=;
        b=VpOIOtiIbqj8QEZDSZ2iuEe1kRowCX7PH/pmrU+EAxYHJRX9YNyaPRcfLhvBSVzybL
         sJw21Pd99DpQjh9LcrCpAuhk3BmrA94nbKSHX8chSa+BsEBnhcGBdJwviOW6Gt8kpkUZ
         GahMria5iyNigyH79NEPOuvPQc3rIZROQ3B4o/8y/kXskH7PxkDiVDAHk9DR3yW+m/Nl
         LmyP/KOI/k6B55iCC1QSDNUM3TzcvmFe4ZD2RU99SWRv5fFmdR3Dap7cxmiIhyV+QaFi
         9AaGf/x5OzY2W2Ltb65P9hUHj9i+V6N39N+2ZR2YUXtdBH/G0t4CmOmL6c0wCK4hRHyY
         97bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A97sJEVHqRr1cAiROr2GcKYuYpM2uXOvkYVkdzP+alE=;
        b=ghyV4yuNQWCF+lEWCZQVRMc7e3BvanGp9+1bOTfhLpziti4M71PbqsYmATOSJevqDR
         VmaWHqliSfiYAKxyJo/+UbtJf4r7utv9ztECrbaut8AYDADwJUq7C8uclozGvSud6LHt
         pVFTBAq/lPvK2Wx0L6xRpDgw6uy+jjD1Mwe177Hb9XGVcFrU5K4YOIBqMHIYWy8Rp2Kl
         CBTRYNCXHBRU0PI2dLJmiOh2SSycX9z4JQ+8LfyBu7BgAmQDhiyQGyQIEyW9k4wp4Jmc
         kWbSgxfRY7Ouu+hqZLTg90NuU2OX/ImnUpVLqEoZ9wuVYk8hYi4x0GbVdDo96Zixl1d2
         TZ4A==
X-Gm-Message-State: AOAM533dw2ZqVJJ2elxAI8FeTSm2vPWJrFb5yYL7joX7a7bbwQCc1ISZ
        npvqJF0hFhPSSR/lS/SMyP/OCufv/Uzdpsz0
X-Google-Smtp-Source: ABdhPJyhRyZ1EZ3YKM8HxTwp3POX7+E0ZO9ReE5j9PAoCL6apZ1uXjjcYL1OGvn6T0bm6KNwXuHbhA==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr22930583wmk.51.1627399231434;
        Tue, 27 Jul 2021 08:20:31 -0700 (PDT)
Received: from localhost.localdomain (189.red-83-51-242.dynamicip.rima-tde.net. [83.51.242.189])
        by smtp.gmail.com with ESMTPSA id w185sm3372393wmb.11.2021.07.27.08.20.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jul 2021 08:20:31 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'
Date:   Tue, 27 Jul 2021 17:20:26 +0200
Message-Id: <20210727152026.31019-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727152026.31019-1-sergio.paracuellos@gmail.com>
References: <20210727152026.31019-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Gpiolib core code has been updated to support setting friendly names
through properly 'gpio-line-names'. Instead of redefine behaviour here
to skip the core to be executed, just properly assign the desired offset
per bank to get in the core the expected behaviour.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/gpio/gpio-brcmstb.c | 45 +------------------------------------
 1 file changed, 1 insertion(+), 44 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index fcfc1a1f1a5c..a7275159052e 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -603,49 +603,6 @@ static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
 	.resume_noirq = brcmstb_gpio_resume,
 };
 
-static void brcmstb_gpio_set_names(struct device *dev,
-				   struct brcmstb_gpio_bank *bank)
-{
-	struct device_node *np = dev->of_node;
-	const char **names;
-	int nstrings, base;
-	unsigned int i;
-
-	base = bank->id * MAX_GPIO_PER_BANK;
-
-	nstrings = of_property_count_strings(np, "gpio-line-names");
-	if (nstrings <= base)
-		/* Line names not present */
-		return;
-
-	names = devm_kcalloc(dev, MAX_GPIO_PER_BANK, sizeof(*names),
-			     GFP_KERNEL);
-	if (!names)
-		return;
-
-	/*
-	 * Make sure to not index beyond the end of the number of descriptors
-	 * of the GPIO device.
-	 */
-	for (i = 0; i < bank->width; i++) {
-		const char *name;
-		int ret;
-
-		ret = of_property_read_string_index(np, "gpio-line-names",
-						    base + i, &name);
-		if (ret) {
-			if (ret != -ENODATA)
-				dev_err(dev, "unable to name line %d: %d\n",
-					base + i, ret);
-			break;
-		}
-		if (*name)
-			names[i] = name;
-	}
-
-	bank->gc.names = names;
-}
-
 static int brcmstb_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -759,6 +716,7 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 		gc->of_xlate = brcmstb_gpio_of_xlate;
 		/* not all ngpio lines are valid, will use bank width later */
 		gc->ngpio = MAX_GPIO_PER_BANK;
+		gc->offset = bank->id * MAX_GPIO_PER_BANK;
 		if (priv->parent_irq > 0)
 			gc->to_irq = brcmstb_gpio_to_irq;
 
@@ -769,7 +727,6 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 		need_wakeup_event |= !!__brcmstb_gpio_get_active_irqs(bank);
 		gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
 
-		brcmstb_gpio_set_names(dev, bank);
 		err = gpiochip_add_data(gc, bank);
 		if (err) {
 			dev_err(dev, "Could not add gpiochip for bank %d\n",
-- 
2.25.1

