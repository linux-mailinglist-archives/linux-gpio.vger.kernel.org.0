Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE3566BADD
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 10:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjAPJuc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 04:50:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjAPJuT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 04:50:19 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77E314EB7
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:50:17 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id AA1018552C;
        Mon, 16 Jan 2023 10:50:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673862616;
        bh=LlxdRq+LS3uNYQoqQjAgfSe8RvgV76LTyReNgpjcnAA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gaaDX6bKWxM32+CFOnuXYruSDtaWkhSXB7v7oCmDNZEiYzmcnIpp9tzAaWM/MsKYO
         JqN76XxfwsECBsurQX93Jn8v+rmC+eCZEPtCSscLVoDL2LTS7jextsxcbXz55oOYAP
         uyShtdAmivrGml84oS8SfKLgITFYSmP08AXdIVIs57HUetsgioJvFPsJTwjHVFkogP
         sl9y608D5F5jWhc8hOb8IEcKh/Q5q3HBcQgW4o3k+NG9BMkUSXK4eX/5jUaDQ7gL+L
         3l5EZi8i1jpHwj3RAr8n75jns8R7PILNt5vdMCkVqIZWFqvkUy1xo9roLzcNPgfUCu
         b4GYn2LpkBC3w==
From:   Marek Vasut <marex@denx.de>
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v7 2/2] gpio: mxc: Always set GPIOs used as interrupt source to INPUT mode
Date:   Mon, 16 Jan 2023 10:49:57 +0100
Message-Id: <20230116094957.5756-2-marex@denx.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116094957.5756-1-marex@denx.de>
References: <20230116094957.5756-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Always configure GPIO pins which are used as interrupt source as INPUTs.
In case the default pin configuration is OUTPUT, or the prior stage does
configure the pins as OUTPUT, then Linux will not reconfigure the pin as
INPUT and no interrupts are received.

Always configure the interrupt source GPIO pin as input to fix the above case.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
---
V2: Actually update and clear bits in GDIR register
V3: Rebase on top of new patch 1/2, expand CC list, add Fixes tag
V4: No change
V5: No change
V6: - Call gc->direction_input() to set direction, instead of GDIR register
      poking. The bgpio (gpio-mmio) may cache the content of direction
      register, so updating the HW GDIR register is not enough. Calling
      the gc->direction() assures the cache is updated.
    - Drop RBs since this is updated patch.
V7: Rebase on current next-20230116
---
 drivers/gpio/gpio-mxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 2d9d498727f10..6f673b2f2a1bf 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -223,7 +223,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 
 	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
 
-	return 0;
+	return port->gc.direction_input(&port->gc, gpio_idx);
 }
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
-- 
2.39.0

