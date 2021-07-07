Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F2F3BE908
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jul 2021 15:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbhGGNx7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jul 2021 09:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbhGGNx7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Jul 2021 09:53:59 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457EEC06175F
        for <linux-gpio@vger.kernel.org>; Wed,  7 Jul 2021 06:51:18 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id gn32so3423124ejc.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jul 2021 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bH7fMR289hMJbzn7ZF6vWBY+nJ7Foy+FBLYzXhSojiE=;
        b=qIMWaVjiDKF3kyuv/aRciYLViGzP03vA3kr2RNIlhYp2kEfioFTwmsuMDe60dWLiKb
         ZM39skEgrUE8KOoJKb22FZ4izgWClZ6ta7e8vQBYZglQuJ9R1Ddjd448xWonzwUStXq5
         eplY6IZd+Y/mDJTNHQGeCEO/Fy7gUgtXz7WXa46FZ4ULMHjVlGK15iDiif4HUme/1Hh0
         S43W6hH6k3xoCqnZxaUxMgWZ2XqhMgnd5JCeCzlI603MKmjdVnMgeazwZ2DSZSH8/tXb
         yZafCMvDEYtJspNqZ/0okTV1rjeM/VLcQkKRWb7whprRDX/zTF8v/zBqpMxkXSd5i9Hb
         qnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bH7fMR289hMJbzn7ZF6vWBY+nJ7Foy+FBLYzXhSojiE=;
        b=oaDj4Gtq+XneISzk/1HfacGAwA/97j4SSkgB14eLNmgHCFynWvj/xrg8Iu8+l0temO
         dz51xc1U8z6AxhguCJ6M+9cwR5u2CMSMbEUZ4o8q+BnyaxkRCBuchoSWjj9slv+YyKM2
         BEg4kW+unUAMVOX0NZsSyGd3HbiePhW+iRAACiGfxhhqm92ifb2Dfx4p85HAMg3QgCpt
         tTeg3m/ePTtFVXNYjXKx3ZMTUSP0EAWMDUBP+zQ0v/J8PPXmNkniV5zQ8RuV3wn5k6bt
         hqKpGDa3LpwA9VqTvdwVXj2PbUNpGvkxr+X4dUZ2VYGhanH5xroLsivbXih7uPJyx9h+
         7GvA==
X-Gm-Message-State: AOAM530DEVzpB5qPcYthb4oN+GS38nt4Kq6NiYtm6kJHzAmopcc68WhI
        xszkbsJ3QFIqD2B/E2tSI4oy7PHLZ7DB7sWK0ek=
X-Google-Smtp-Source: ABdhPJy0vv6yS32yMzhQVl2p/ULmZaQXyScOveNlOuMYAwNAjl7++fZt92rLlMliE3lvNaxVz0KpWg==
X-Received: by 2002:a17:906:7012:: with SMTP id n18mr24477378ejj.236.1625665876499;
        Wed, 07 Jul 2021 06:51:16 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id p8sm2773129eds.15.2021.07.07.06.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 06:51:15 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        ludovic.desroches@microchip.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: sama5d2-piobu: remove platform_set_drvdata() + cleanup probe
Date:   Wed,  7 Jul 2021 16:51:09 +0300
Message-Id: <20210707135109.191238-1-aardelean@deviqon.com>
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
 drivers/gpio/gpio-sama5d2-piobu.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-piobu.c
index b7c950658170..dfaa069b1466 100644
--- a/drivers/gpio/gpio-sama5d2-piobu.c
+++ b/drivers/gpio/gpio-sama5d2-piobu.c
@@ -189,7 +189,6 @@ static int sama5d2_piobu_probe(struct platform_device *pdev)
 	if (!piobu)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, piobu);
 	piobu->chip.label = pdev->name;
 	piobu->chip.parent = &pdev->dev;
 	piobu->chip.of_node = pdev->dev.of_node;
@@ -210,12 +209,6 @@ static int sama5d2_piobu_probe(struct platform_device *pdev)
 		return PTR_ERR(piobu->regmap);
 	}
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &piobu->chip, piobu);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to add gpiochip %d\n", ret);
-		return ret;
-	}
-
 	for (i = 0; i < PIOBU_NUM; ++i) {
 		ret = sama5d2_piobu_setup_pin(&piobu->chip, i);
 		if (ret) {
@@ -225,7 +218,7 @@ static int sama5d2_piobu_probe(struct platform_device *pdev)
 		}
 	}
 
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, &piobu->chip, piobu);
 }
 
 static const struct of_device_id sama5d2_piobu_ids[] = {
-- 
2.31.1

