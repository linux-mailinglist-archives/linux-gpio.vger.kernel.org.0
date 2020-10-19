Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FF8292877
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 15:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbgJSNof (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 09:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728258AbgJSNof (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 09:44:35 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4D4C0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:44:33 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a5so32736ljj.11
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ITgkFo4Zy8H+rPrybuSpyv4LAJDoq36lgF69glOj4io=;
        b=iH0Vi1rW8Y/1DvTM2TY5sZ9yemZBgKs+8bBMCPSVmJNA5z9ARu3bQ7x0Dsi6B5ZEOi
         kdI/RIlqKUdk4Gihj0kVOQ1R/zmTyGwvEX7VHSlRz+k5XDhIkgDpurSlabG75uQ+T9re
         4/EK4mlg5TtjJ+rcnKlc1cNg8l3VXRVRWJEX+lfdgwW2VD7YziRa1v/xIieZI6mG/UlT
         bXbhW2Kl3pAHeZxE1Y+/E8Eu3lvK11gX0ZyvU5HTORC3Le1u8gNFPkHfWof7c3mfCTgJ
         nsE1robVUq8NrrgFt+wxyXQ/EoCs13QT2V4yH8f2mF7MHJWkktnQeUN3szZotxtSvZNI
         GKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ITgkFo4Zy8H+rPrybuSpyv4LAJDoq36lgF69glOj4io=;
        b=pTeUgmOig5O5tYIaPGlymjMC+AYL15QcP539aDldjHl+2UIZSk4QlNb+n3fwUsp9fa
         PRpo0cYNBWY3iob1bBwkcSrU1VDSi+hcsVIrijeTxuUwLBln3brCwM45VC+HczglgFYO
         0ivJ84RsmcZYmlS0sCele0eA/kZ9/fVhxAoOWhMSEyz2SRD2kIqiqCDF0UnQdr8K8ggx
         b+RCUyP/HuTtAomH3P/hGBUq76DjHugDpEZf0b+vGyA+UMVqijNbtl+aAaUBqgnZO8ra
         efKnzurSlvOvfheVnV7+s22d+B4CMswOFI1NA0FUN0c4uWNNo2DGgshIkvbjkrv5sNqJ
         j1sQ==
X-Gm-Message-State: AOAM530oJm0T4CP9y6I9a0nEIgoKWHsEBXr6IhLbzEPG0LZjUyXCdnmU
        OTL044F9gCLoByDKj3l4PskWkvXC4CHmbEGS
X-Google-Smtp-Source: ABdhPJykRHSpvDv0pxfUw+5MlpKTyHAERHdp9vRF4qUgC69+8DRnb3uMYvnmGrF2GpL7KBt1wMc49A==
X-Received: by 2002:a2e:7803:: with SMTP id t3mr31790ljc.156.1603115071849;
        Mon, 19 Oct 2020 06:44:31 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id k13sm3638733ljh.136.2020.10.19.06.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 06:44:31 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: stmpe: Fix forgotten refactoring
Date:   Mon, 19 Oct 2020 15:44:29 +0200
Message-Id: <20201019134429.65563-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We actually handle the gpio_irq_chip set-up properly
now despite what the comment says. Also assign this
pointer along with the rest of the gpio_irq_chip
setup code.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/driver-api/gpio/driver.rst |  4 ++--
 drivers/gpio/gpio-stmpe.c                | 10 +---------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index c9dac5233f3e..490ccd2c3c3e 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -538,8 +538,8 @@ these helpers, we can set .irq.need_valid_mask of the gpiochip before
 devm_gpiochip_add_data() or gpiochip_add_data() is called. This allocates an
 .irq.valid_mask with as many bits set as there are GPIO lines in the chip, each
 bit representing line 0..n-1. Drivers can exclude GPIO lines by clearing bits
-from this mask. The mask must be filled in before gpiochip_irqchip_add() or
-gpiochip_irqchip_add_nested() is called.
+from this mask. The mask can be filled in the init_valid_mask() callback
+that is part of the struct gpio_irq_chip.
 
 To use the helpers please keep the following in mind:
 
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index b0155d6007c8..b94ef8181428 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -474,15 +474,6 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	stmpe_gpio->chip.parent = &pdev->dev;
 	stmpe_gpio->chip.of_node = np;
 	stmpe_gpio->chip.base = -1;
-	/*
-	 * REVISIT: this makes sure the valid mask gets allocated and
-	 * filled in when adding the gpio_chip, but the rest of the
-	 * gpio_irqchip is still filled in using the old method
-	 * in gpiochip_irqchip_add_nested() so clean this up once we
-	 * get the gpio_irqchip to initialize while adding the
-	 * gpio_chip also for threaded irqchips.
-	 */
-	stmpe_gpio->chip.irq.init_valid_mask = stmpe_init_irq_valid_mask;
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
                 stmpe_gpio->chip.dbg_show = stmpe_dbg_show;
@@ -520,6 +511,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_simple_irq;
 		girq->threaded = true;
+		girq->init_valid_mask = stmpe_init_irq_valid_mask;
 	}
 
 	ret = gpiochip_add_data(&stmpe_gpio->chip, stmpe_gpio);
-- 
2.26.2

