Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC4C3BE90F
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jul 2021 15:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhGGNzQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jul 2021 09:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbhGGNzP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Jul 2021 09:55:15 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680AAC06175F
        for <linux-gpio@vger.kernel.org>; Wed,  7 Jul 2021 06:52:35 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id h2so3497457edt.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jul 2021 06:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xzn5beMRwlDU7RiGDi7KQ0mh5zrErFCKdJw7ho9vOWU=;
        b=DO5zWxxqUTFRrmFdJlISl3mEcuyUikO9XunHpeA6kcEzHtor88k+QHlQk/BAyTnUsG
         ZRvYAc6KKCozox1khD75UNGQTivBgJo4Ge79I5O1hbv4s8ZTrR9q6sS4UdIY8ssMVvB0
         /S9VschAc8MdVsFZXNXBqD+vPzbojMzDL1M+Cw34Q71c8BhWwnf/n2AtjCeULXRvmLT+
         uGR5vx/BJcjuQTLVDSPQdq5aLmIdgHns6qlJuNtYHjWp1joimCZvsQ0zIkxFY7PU4MaL
         BXiqAzTVoTzktl+rBAvjTsLvMgyWT6SIDNHVCXgJLHDEcONBBjYnYSWfsi15Dw/j+gEi
         QE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xzn5beMRwlDU7RiGDi7KQ0mh5zrErFCKdJw7ho9vOWU=;
        b=VO63Gg6c33F5iW2ZbVCAGu+cGYLcbb6BwtyJCDazZ9DSaqISnGX3hbrQpO65GLTrST
         Z3h/CApC6igxRyxPaMrtoSLtGETyuq2SNNFire616H484p1TXozq3G32GNcjiaSMV/wx
         aHmXhBg7p+RamVpRXIVoXM0uCmSJQefGMCbhYfILIARNZqpxKhIcvOGry0bhVENCHc5+
         Hk0nM/d/3R5cm81TbSRwpje7LdLi1bOu0zM465BCHuYY5/dPZyhYUTUPM3yjlrmbgh8E
         HrTVcvLLsv+RMHNABK+6y9M7k5R5JZwXeOC9J1eukZPbmdPpNui2Me7OzEaXTt5QmxaT
         cKlg==
X-Gm-Message-State: AOAM5316RlpJUmC6NjxqZrqB/35MLtj4Xj2Yu/0Q4LTDbgEbAJmbkhhr
        EOMQE76srd2qrDONLW3qwUSxEECVY4TP2vBib9w=
X-Google-Smtp-Source: ABdhPJwv41T+C++xFliVuTZ7mCoQvhWC5JAnPtsodz1EvhPcqsGeDZdY63krJOrGgd1K05k5qepecg==
X-Received: by 2002:a05:6402:2552:: with SMTP id l18mr30620995edb.363.1625665953808;
        Wed, 07 Jul 2021 06:52:33 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id bm1sm2588576ejb.38.2021.07.07.06.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 06:52:33 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        sathyanarayanan.kuppuswamy@linux.intel.com, andy@kernel.org,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: wcove: remove platform_set_drvdata() + cleanup probe
Date:   Wed,  7 Jul 2021 16:52:26 +0300
Message-Id: <20210707135226.191988-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The platform_set_drvdata() call is only useful if we need to retrieve back
the private information.
Since the driver doesn't do that, it's not useful to have it.

This change also changes the probe order a bit, moving the
devm_gpiochip_add_data() as the last call. This means that when the
gpiochip is registered [and available to consumers], it should be
initialized.

It's still possible that the devm_gpiochip_add_data() call could fail,
leaving the chip in a partially initialized state, but that was possible
even before this change; it was just some other partially initialized
state.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/gpio/gpio-wcove.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index a19eeef6cf1e..2109610f5dad 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -428,8 +428,6 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 
 	wg->regmap_irq_chip = pmic->irq_chip_data;
 
-	platform_set_drvdata(pdev, wg);
-
 	mutex_init(&wg->buslock);
 	wg->chip.label = KBUILD_MODNAME;
 	wg->chip.direction_input = wcove_gpio_dir_in;
@@ -469,12 +467,6 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_gpiochip_add_data(dev, &wg->chip, wg);
-	if (ret) {
-		dev_err(dev, "Failed to add gpiochip: %d\n", ret);
-		return ret;
-	}
-
 	/* Enable GPIO0 interrupts */
 	ret = regmap_clear_bits(wg->regmap, IRQ_MASK_BASE + 0, GPIO_IRQ0_MASK);
 	if (ret)
@@ -485,7 +477,7 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return 0;
+	return devm_gpiochip_add_data(dev, &wg->chip, wg);
 }
 
 /*
-- 
2.31.1

