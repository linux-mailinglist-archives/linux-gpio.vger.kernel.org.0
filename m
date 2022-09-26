Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE215E9DB5
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 11:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234922AbiIZJcV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 05:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234923AbiIZJbu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 05:31:50 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C1B63CA
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 02:30:51 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u18so9863135lfo.8
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=2zbkQ64lkl1C3PaMJINLxkJmzjfhw3DsMR+zU3ceqX0=;
        b=O+SIELO+chg1hgp7YEggPOUKB7+83vvMIuHjgKyEEayVrLQx4jrS20344GUae4FHXu
         eQLI3SGL0iWZdJoNh52cWp351gFR+FtB6rwGZixkxbOUHZExJFXUppF4Obt5raSmUTnf
         Nr1/wqbjGCmdEgZ4gFMxs1Es0eFmVGnDBQSwV1RE4niIZ1ayvdfKh3bUZQz7IcqCtUij
         mGWMfXkhnh/omqWBhMRB/eYZwWp4dDFJbMRDdEW7LOBo18kdPB9+Ow7mZ4ar4ojVKVEv
         l3jycGjDo1h6fD6t4RkzY0wR4o/FBPgoJBwPOWeBOLqdmWs8pVTziGSlx2/IW6ANId/e
         XD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=2zbkQ64lkl1C3PaMJINLxkJmzjfhw3DsMR+zU3ceqX0=;
        b=OhOdfcmDQzSEH0iAUHJVfjaxo0UVO5UoR62kkBhYYfkh4Y2KDYq6juXlos55iFg2dB
         kGZvI2/M76yHFqxllvMhTnzW83/U+CGUiF5sFweuHBvPiY6Yl1XRm/we/TXRFjx+OxGV
         FdgfVuebjReVPaOcAPVfnI3OX/Bfu6LVRcqDeWjJF7F4XmcIiYcMP2VpBXg8HUyReEVD
         nwMowZr7Xx+yXVvEnRWmwIuOXRzeiHAdsLub+FZ9z+ASKXenZDa1/MFdllP/TlN9UAT4
         JlJf+5x2HmJIulR3jDPYkMPbkZI31VmzuNNPWhBaDfFLW23fe8sCk56GKrNaWaLs4g5u
         CvcA==
X-Gm-Message-State: ACrzQf0sZqJ6gCGABgHkLAc3tJLhFuxU0bxOrDWZRFa3aAtj2mEQXBOQ
        V6UOW9G4tR0nYa2tIEQKbakg1sORSWCP7Q==
X-Google-Smtp-Source: AMsMyM75KxgKqftkwsJgnFeC3GLMniDsHa4XOXVoC5VNJvugS/ed2DY+Qk/aaj7k31PY9mOFWBgBLw==
X-Received: by 2002:a05:6512:312f:b0:498:f40f:37b5 with SMTP id p15-20020a056512312f00b00498f40f37b5mr7825943lfd.240.1664184649238;
        Mon, 26 Sep 2022 02:30:49 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id w14-20020a05651234ce00b00494942bec60sm2488489lfr.17.2022.09.26.02.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 02:30:48 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH] gpio: tc3589x: Make irqchip immutable
Date:   Mon, 26 Sep 2022 11:30:47 +0200
Message-Id: <20220926093047.1699027-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This turns the Toshiba tc3589x gpio irqchip immutable.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tc3589x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 443fe975bf13..f9edb720710a 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -244,13 +244,15 @@ static void tc3589x_gpio_irq_unmask(struct irq_data *d)
 	tc3589x_gpio->regs[REG_DIRECT][regoffset] &= ~mask;
 }
 
-static struct irq_chip tc3589x_gpio_irq_chip = {
+static const struct irq_chip tc3589x_gpio_irq_chip = {
 	.name			= "tc3589x-gpio",
 	.irq_bus_lock		= tc3589x_gpio_irq_lock,
 	.irq_bus_sync_unlock	= tc3589x_gpio_irq_sync_unlock,
 	.irq_mask		= tc3589x_gpio_irq_mask,
 	.irq_unmask		= tc3589x_gpio_irq_unmask,
 	.irq_set_type		= tc3589x_gpio_irq_set_type,
+	.flags =		IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static irqreturn_t tc3589x_gpio_irq(int irq, void *dev)
@@ -321,7 +323,7 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 	tc3589x_gpio->chip.base = -1;
 
 	girq = &tc3589x_gpio->chip.irq;
-	girq->chip = &tc3589x_gpio_irq_chip;
+	gpio_irq_chip_set_chip(girq, &tc3589x_gpio_irq_chip);
 	/* This will let us handle the parent IRQ in the driver */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;
-- 
2.37.3

