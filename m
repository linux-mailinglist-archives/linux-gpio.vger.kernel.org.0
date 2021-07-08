Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC333BF5F4
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jul 2021 09:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhGHHH3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jul 2021 03:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbhGHHHY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jul 2021 03:07:24 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2987CC061764;
        Thu,  8 Jul 2021 00:04:37 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id t14-20020a05600c198eb029020c8aac53d4so16379055wmq.1;
        Thu, 08 Jul 2021 00:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qi7EPW8pW/I0yAkgaQOKC9ugDNgF35OVARmaEmgJKWw=;
        b=Cwn8F5vy9JikZKZheIsJEDo2QKqWrbdmcrE4AkBuaH8/kk2Ef7dMtZXzqGLk3X5hGI
         WfOuhv7vRTl7hSuvYcmx6aRhKu+mEDa9tqzl+hWR9hpVu0LRZMA9wBqj3a08M4e++PFR
         lrPErK5riYTt+57XBSjmgj6RJmM/escT7YiRJT3O0irt3UvkxvPsbK+soASuHZnOlecl
         1o+QP8jAKtrBM7bUPAAVNxgdGOEVbsYXHTpQ/CYopq6hjuU/D0JivaHaP8uSjlxCKbw4
         LEWqRALNDHv954PUwwMXq/JLi7f5PGpGJHHDpr6bJEa9sDRb/aJpgy/+x6VQoomsZGsI
         C6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qi7EPW8pW/I0yAkgaQOKC9ugDNgF35OVARmaEmgJKWw=;
        b=Xm9yDStJRn6nGDZot793SSTeJqxquRr9+VPeIewKsNa2mbQ8Jq3MH889pQVdfLopDR
         uHpj8grOUTgHWRI/LcJNjlMwTm+AasADVfTCJX0HnOYkl6ZWtZ7Uu6hxKGH+ws86G+b+
         vIAXsB1a0SrA+VsyPtpMgugBkuimLCf1+J66BDuM9KLBdITssASpiKJTO2A5LW76f/KU
         mJB9sWgLn/OD1LRTOfs/zU5Zar1aAvdspvMt5YU+GeEyxXKIu1K+XV1b9cJE635g3geN
         A+0GtBuLL+E50iKQ7qKjl3IPTu/+aV85EruY4Or8Fc+u3c7UOB2hTlkQ7/7+f7WvnEqi
         ceiw==
X-Gm-Message-State: AOAM530MNYyqgL1JzsZMtL5X8qfnp6iltWB4U5O+8X+SbI3hNKZKlqNa
        TDJsMfBRU4G4RQT9AXSggCKxFm9konxIhA==
X-Google-Smtp-Source: ABdhPJziVIvppULck7oF3vVM83VrYcTW4RZzJVVQbvoYI82XxRS+fCrLP94/iSsWpIsCPOTjXiVNXA==
X-Received: by 2002:a7b:c0c1:: with SMTP id s1mr28990524wmh.70.1625727875543;
        Thu, 08 Jul 2021 00:04:35 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id u15sm8093305wmq.1.2021.07.08.00.04.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jul 2021 00:04:35 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'
Date:   Thu,  8 Jul 2021 09:04:29 +0200
Message-Id: <20210708070429.31871-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
References: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Gpiolib core code has been updated to support setting
friendly names through properly 'gpio-line-names'.
Instead of redefine behaviour here to skip the core
to be executed, just properly assign the desired offset
per bank to get in the core the expected behaviour.

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

