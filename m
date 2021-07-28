Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D18A43D867D
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 06:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbhG1ENJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 00:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbhG1ENC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 00:13:02 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C2FC061765;
        Tue, 27 Jul 2021 21:13:00 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id z4so788610wrv.11;
        Tue, 27 Jul 2021 21:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A97sJEVHqRr1cAiROr2GcKYuYpM2uXOvkYVkdzP+alE=;
        b=LGZBzIxxTU0LtsneW2Zt4TabEXGz8FUY9nGRQX6tL71GImfCJjmanV+lzkdnsaiu4V
         IMwWX/aAjbR0S2fKQ2/uzehk+IzzykxCJd++kPRK8sHKQqgIlCTjd2iScw1riNGf1pQ7
         24vq4boKqagT8vMhoq95PgpQs/T2YkM9/laXVBAWfHsh2xn+vmF/+ip8J5mkV7+u8Os9
         NCee/LJGl1ASVK/CadrabDrkVkLZK1+MiYss8BxGS8PxOD3ztmAA7YmUIw4x+vNA92Ts
         ky6Z7po+qkhsudYllH4BTP1F+Z5Ukn9Ht9P6A5nqMAaC/pwhi99S8UlHQiDc91NJjKxy
         1V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A97sJEVHqRr1cAiROr2GcKYuYpM2uXOvkYVkdzP+alE=;
        b=OFOTj+DQUHDzNHDzNfBDba+2ZYFkCi/CZHfMtgGF2H5QFyOI0VVDh4v0rS2PQKyE1o
         UOzYWo3YnF08/w3RznN88ecCx/pWYE5JHdhnu87/NjJQmjkRhEs1UlVfPlRtQ1EkLlU7
         P8moIo6Rxupyc3t/HUQhq1idoKw/cBPPjg7znjRE9HOo40XglIwSndV5Ik0Q1wh436tC
         OlTsQ9qaH6iHHUeJzZYRI2X5/ZpiaGEa71t4iLec6F+RuFKWjLKzQhD4iaIp8d9NwNu5
         Aqzl1EUaDbSQevDOuR13VdtWOIYl0Ity0n/P6ld42IXNrU/+ZvHAEmZEbYUtqLhABxHE
         /dbA==
X-Gm-Message-State: AOAM530vbwUkD/gFdRhFOYa2l52AaPq8x0mRL0o4mjDkK1p3a7QEfAn0
        JNAVWqRQueMFmmQJoWb+gba9pv3AF1KuJIRa
X-Google-Smtp-Source: ABdhPJyGkewZ2tA1K+FC9Sg+eM8cdaovg7Q9TVMUCxXI0+Xz29CHOucfJxKd9HWY8Q2SsOxMA2eGHg==
X-Received: by 2002:a5d:4951:: with SMTP id r17mr11754082wrs.208.1627445579030;
        Tue, 27 Jul 2021 21:12:59 -0700 (PDT)
Received: from localhost.localdomain (189.red-83-51-242.dynamicip.rima-tde.net. [83.51.242.189])
        by smtp.gmail.com with ESMTPSA id e6sm6274184wrg.18.2021.07.27.21.12.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jul 2021 21:12:58 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'
Date:   Wed, 28 Jul 2021 06:12:53 +0200
Message-Id: <20210728041253.15382-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728041253.15382-1-sergio.paracuellos@gmail.com>
References: <20210728041253.15382-1-sergio.paracuellos@gmail.com>
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

