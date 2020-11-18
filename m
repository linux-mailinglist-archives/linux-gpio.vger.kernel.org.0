Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60882B84D7
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 20:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgKRTTu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Nov 2020 14:19:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727407AbgKRTTt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Nov 2020 14:19:49 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA9AC0613D6
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2020 11:19:49 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id q5so2912456qkc.12
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2020 11:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=J4RKqYCS75CkogYyH9S4ETLutwo/22Uyz8nHlVrDlJ0=;
        b=mSFPAg/wWtE8xA2ttOKLbx1oMQoJr16ExH8GN1ttjzYV+DeeBunzwy9mpkqEYY9i+K
         ok+HyfOfH/YwBn7TBY/zW2+gjdnL3osxFHZ8d2r6jviZE2u5Mxy3IygkEAynmBzTAWFQ
         CQhhI3REPlrudT6NXxx00z3fu7QWHb78SZrk54h6StbVPX0R8L3sGT2WQUe4esCWGNGA
         R0qLdj6Xclb5x61jCkZ0eppRrngctMsSNadQ1pFZ3+GeAvippJKqoWaTXxOETOIgW/Fj
         3N7xU/y/CMuGiNQ4RharmtzYK7agjSmToE6ThyfTnsUPO7jw7pCcOHjHoG5Jt+pS5uj+
         vZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=J4RKqYCS75CkogYyH9S4ETLutwo/22Uyz8nHlVrDlJ0=;
        b=IUfJHCqXMIMrZD2ipXQl3joDEIfEw/WG+CzledyQU89l4dYPl4FSecw0IvXdeE3Stk
         VH1lQBIRkDwZfNjaW86KVIrguCkdMuy5K8JoeYqNwiouQzTl++NNgohmF5tAPKzHy/Xm
         wpKNYzBKkrUqKulfwW+1wV8Ws0NF98A08tfAmlQCZHY/ZYFuFJ3WCclsyzioq8zCHfKM
         BGdLsddsg5gpTNV58kE+a8n580d9ZAiBrsYAFLbc4SR8d27d93smONpwfqC5ckZ8xaMJ
         Yw8bBbQmSjJJy+O+zyYjtQ/nY1LBaeFPul0UeI1YKFP7/JxPr3w4W0+1/eeN20K4JTvr
         tN/A==
X-Gm-Message-State: AOAM530CqoamZyfcmpFFScOomR3MEvINNr1nSXEF0czw3SmXb2fCq1Fi
        /aCRhNhG2Q6CeFh13LfdOx0=
X-Google-Smtp-Source: ABdhPJyClD//8MkG5Lqnm/lC4z3XIoCW1pKyC4hDmGM2jLqf6mrnB8o1Seb8MCuMBVLitMQSae/rXQ==
X-Received: by 2002:a37:63cb:: with SMTP id x194mr6556968qkb.257.1605727188673;
        Wed, 18 Nov 2020 11:19:48 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:213a:a240:fc07:36c8])
        by smtp.gmail.com with ESMTPSA id h4sm18009039qkh.93.2020.11.18.11.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 11:19:47 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     shawnguo@kernel.org, linux-gpio@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] gpio: mxs: Remove unused .id_table support
Date:   Wed, 18 Nov 2020 16:19:38 -0300
Message-Id: <20201118191938.32693-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

mxs is a devicetree-only platform and hence it does not make use
of the id_table mechanism.

Get rid of the .id_table as it is unused.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpio/gpio-mxs.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index c4a314c68555..dfc0c1eb1b33 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -254,19 +254,6 @@ static int mxs_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static const struct platform_device_id mxs_gpio_ids[] = {
-	{
-		.name = "imx23-gpio",
-		.driver_data = IMX23_GPIO,
-	}, {
-		.name = "imx28-gpio",
-		.driver_data = IMX28_GPIO,
-	}, {
-		/* sentinel */
-	}
-};
-MODULE_DEVICE_TABLE(platform, mxs_gpio_ids);
-
 static const struct of_device_id mxs_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx23-gpio", .data = (void *) IMX23_GPIO, },
 	{ .compatible = "fsl,imx28-gpio", .data = (void *) IMX28_GPIO, },
@@ -370,7 +357,6 @@ static struct platform_driver mxs_gpio_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe		= mxs_gpio_probe,
-	.id_table	= mxs_gpio_ids,
 };
 
 static int __init mxs_gpio_init(void)
-- 
2.17.1

