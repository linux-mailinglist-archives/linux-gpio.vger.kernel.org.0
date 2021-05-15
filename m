Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E463816A4
	for <lists+linux-gpio@lfdr.de>; Sat, 15 May 2021 09:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233569AbhEOHx5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 May 2021 03:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233132AbhEOHx4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 May 2021 03:53:56 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B981CC061756
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 00:52:43 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id w3so1885707ejc.4
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 00:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CZk+7UgQ/ev3klOu/zQXroC2fr8BBS83ryBvlIT0lSQ=;
        b=btBYIMJsb2Qc8kUu+BwOzOm0bnembBDeEEMcNwO3rZ8qJl6mPDVKh4e8qHfgiGnzPC
         xnowC/5vzGnTfe1wXi6lseO+Yu9NvNbWjX9LHvPuES1VCgvKtSxw8VAXdJ7CFV7N1Xt2
         Hnb1hOyg2aH9hcm+rIu7BwuaY72D64La3wxF5oLBoleJpgThljTSSHuUrKCwLmuPCdFI
         G6Ix17XOn9G5HduDq1E2r8si1105Zf+Y1hvg16SH/nOQqy21QPDZFVIr4alhANs1gmn6
         QLizj0Y4hiHZCBnVxpeesjJ44EorJ0W/8s0xxX+VBtGRfn6kHW2ZSJ2syIy+1RXNGSEx
         b0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CZk+7UgQ/ev3klOu/zQXroC2fr8BBS83ryBvlIT0lSQ=;
        b=e8WXI9ptbJv/DzqAs+dt3ZqIG5RR8Iq1F3ZsASTn3TRmyAkqd//cH68O/6zTaIit/V
         fu6iXyKvRMPsRqvLD+K3QbMkV2AvdFQ0FxuzVCuz8hjgLL6rQBD+1bLMBiW3F7/ZDhJD
         ikSj3i+XdxhQrvRoc5NOJZ2/jVbQhk+lLk6E/I2f/QBVD7w5c4D7EG271jEh0viEWaTl
         wZzTccKarzZ1styj6kJK+Aq388rRF/boG3yU9j9Yla2z698BNkU7yI5RMmYcl9FmtvJH
         y6uXb9tOYMuWf5IODbfaLsfS+G54WHaM+dk3UO1WJYJZN/dS3rhWqH54kPyf3x6jGzRN
         1MFA==
X-Gm-Message-State: AOAM5302pWowXLGTsCABSVU06g/AU/YHWq++8zaruPzEVZnwmcdtm0sy
        A0n18vws0vKZlbG4PfC2/WzjFrjXUcVB3JQvhtk=
X-Google-Smtp-Source: ABdhPJydKnPJ1GBx+K3tFJkfHdqem6TY2f81reDMs79XknWZXNikrNvVcrJowXyeYpPTPdiq5+cIlg==
X-Received: by 2002:a17:907:1629:: with SMTP id hb41mr53659347ejc.316.1621065162220;
        Sat, 15 May 2021 00:52:42 -0700 (PDT)
Received: from neptune.. ([188.27.131.122])
        by smtp.gmail.com with ESMTPSA id d25sm4868426ejd.59.2021.05.15.00.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 00:52:41 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-tps6586x: remove platform_set_drvdata() + cleanup probe
Date:   Sat, 15 May 2021 10:52:33 +0300
Message-Id: <20210515075233.7594-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The platform_set_drvdata() call is only useful if we need to retrieve back
the private information.
Since the driver doesn't do that, it's not useful to have it.

If this is removed, we can also just do a direct return on
devm_gpiochip_add_data(). We don't need to print that this call failed as
there are other ways to log/see this during probe.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/gpio/gpio-tps6586x.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.c
index 9b6cc74f47c8..20c4f96f42f0 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -76,7 +76,6 @@ static int tps6586x_gpio_probe(struct platform_device *pdev)
 {
 	struct tps6586x_platform_data *pdata;
 	struct tps6586x_gpio *tps6586x_gpio;
-	int ret;
 
 	pdata = dev_get_platdata(pdev->dev.parent);
 	tps6586x_gpio = devm_kzalloc(&pdev->dev,
@@ -106,16 +105,7 @@ static int tps6586x_gpio_probe(struct platform_device *pdev)
 	else
 		tps6586x_gpio->gpio_chip.base = -1;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &tps6586x_gpio->gpio_chip,
-				     tps6586x_gpio);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, tps6586x_gpio);
-
-	return ret;
+	return devm_gpiochip_add_data(&pdev->dev, &tps6586x_gpio->gpio_chip, tps6586x_gpio);
 }
 
 static struct platform_driver tps6586x_gpio_driver = {
-- 
2.31.1

