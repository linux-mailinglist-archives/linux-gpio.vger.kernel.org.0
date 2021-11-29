Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1C1461430
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Nov 2021 12:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237645AbhK2LyL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Nov 2021 06:54:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235081AbhK2LwK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Nov 2021 06:52:10 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3471CC08EB5B
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 02:56:12 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id v11so35785781wrw.10
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 02:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=t4Fz19OEITz1hFR6emn8cktw87Fvn/NDcRj21iTSDJ8=;
        b=MCQTaVx1eofARZWeFYruH/iOLxm3jxTyVtVI7D24dKSTFXQ/AhlmeAqYal8p1XWIqY
         pN2HoiMZESuo5ryUBStowMn19e4llcBNyP47FpyDz22dRZCMXJzSsTKQjQSLXg2PV7VF
         4uBpsgsyT3yS+9MsfdmebbeuyrqaOHWX1cqIhGJyer+hkDyAyN9C8bpN05NYJgo7Wa+v
         /Dbp3P4IR8BVSFD2D6wyEaF4BqXSMBDR8iDQxeGh4fsFFOGpl74Fle0oCKJuoVmU01IN
         Ls/TbtcTeQkF1Fng7Lun1a3bRojsfFUskYkUhKkUq7lORv89gFcx+coqSFjD8wRNplDW
         Jt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t4Fz19OEITz1hFR6emn8cktw87Fvn/NDcRj21iTSDJ8=;
        b=NsidqADDA5J8UNWjl4OQbLpg8zKy6ldy0sTulb0nX+hmlOs5Ff+fcxcLEy2vfVyGeZ
         aUVfnSKVtCKtJ8seZMCilIsBHXAyVaeehbkQxG3IGCmRyuijZwPGvc1NEvp104OLLVCZ
         DGtrUNXx3V70O5spp7pCKjSgze23RL3w/IbJdYtqgJkl3Wm02JC0HkEDbZKusGQuZVU/
         wpDq2T5xyKw6hO8suRcxEqm3DWtQfArsXUB560NzxIuzepdZv+yspkEJpdHoYSOhU1oB
         IuUGBpBNsO9+w0OGDlCd9grVLVUyw25K4IM7C0Fwg2mfUQYCmYXyWqdszjMsEs5Lr1UX
         qWsQ==
X-Gm-Message-State: AOAM531AX6xdh/p41VxqEsvknr54Jr55h5f1VnjEgiC32qhNMEeM+MhH
        KKvHKkAkdOV/5RMKgXZPuWIbFA==
X-Google-Smtp-Source: ABdhPJxNMTENSfCgD1mcdb8Ph6fBL5pzPylgWcFwapLtUPET2Clsm2TdnxIrpYIs1kY2s3aBlFFVnA==
X-Received: by 2002:a5d:464c:: with SMTP id j12mr32190837wrs.150.1638183370798;
        Mon, 29 Nov 2021 02:56:10 -0800 (PST)
Received: from buildbot.pitowers.org ([2a00:1098:3142:14:ae1f:6bff:fedd:de54])
        by smtp.gmail.com with ESMTPSA id z15sm13246285wrr.65.2021.11.29.02.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 02:56:10 -0800 (PST)
From:   Phil Elwell <phil@raspberrypi.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: bcm2835: Change init order for gpio hogs
Date:   Mon, 29 Nov 2021 10:55:55 +0000
Message-Id: <20211129105556.675235-2-phil@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129105556.675235-1-phil@raspberrypi.com>
References: <20211129105556.675235-1-phil@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

...and gpio-ranges

pinctrl-bcm2835 is a combined pinctrl/gpio driver. Currently the gpio
side is registered first, but this breaks gpio hogs (which are
configured during gpiochip_add_data). Part of the hog initialisation
is a call to pinctrl_gpio_request, and since the pinctrl driver hasn't
yet been registered this results in an -EPROBE_DEFER from which it can
never recover.

Change the initialisation sequence to register the pinctrl driver
first.

This also solves a similar problem with the gpio-ranges property, which
is required in order for released pins to be returned to inputs.

Fixes: 73345a18d464b ("pinctrl: bcm2835: Pass irqchip when adding
                       gpiochip")
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 29 +++++++++++++++------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 2abcc6ce4eba..b607d10e4cbd 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1244,6 +1244,18 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 		raw_spin_lock_init(&pc->irq_lock[i]);
 	}
 
+	pc->pctl_desc = *pdata->pctl_desc;
+	pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
+	if (IS_ERR(pc->pctl_dev)) {
+		gpiochip_remove(&pc->gpio_chip);
+		return PTR_ERR(pc->pctl_dev);
+	}
+
+	pc->gpio_range = *pdata->gpio_range;
+	pc->gpio_range.base = pc->gpio_chip.base;
+	pc->gpio_range.gc = &pc->gpio_chip;
+	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
+
 	girq = &pc->gpio_chip.irq;
 	girq->chip = &bcm2835_gpio_irq_chip;
 	girq->parent_handler = bcm2835_gpio_irq_handler;
@@ -1251,8 +1263,10 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	girq->parents = devm_kcalloc(dev, BCM2835_NUM_IRQS,
 				     sizeof(*girq->parents),
 				     GFP_KERNEL);
-	if (!girq->parents)
+	if (!girq->parents) {
+		pinctrl_remove_gpio_range(pc->pctl_dev, &pc->gpio_range);
 		return -ENOMEM;
+	}
 
 	if (is_7211) {
 		pc->wake_irq = devm_kcalloc(dev, BCM2835_NUM_IRQS,
@@ -1307,21 +1321,10 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	err = gpiochip_add_data(&pc->gpio_chip, pc);
 	if (err) {
 		dev_err(dev, "could not add GPIO chip\n");
+		pinctrl_remove_gpio_range(pc->pctl_dev, &pc->gpio_range);
 		return err;
 	}
 
-	pc->pctl_desc = *pdata->pctl_desc;
-	pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
-	if (IS_ERR(pc->pctl_dev)) {
-		gpiochip_remove(&pc->gpio_chip);
-		return PTR_ERR(pc->pctl_dev);
-	}
-
-	pc->gpio_range = *pdata->gpio_range;
-	pc->gpio_range.base = pc->gpio_chip.base;
-	pc->gpio_range.gc = &pc->gpio_chip;
-	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
-
 	return 0;
 }
 
-- 
2.25.1

