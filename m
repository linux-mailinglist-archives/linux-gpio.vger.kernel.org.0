Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F77F5FE4B1
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 00:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbiJMWAI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Oct 2022 18:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiJMWAG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2022 18:00:06 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831944685A
        for <linux-gpio@vger.kernel.org>; Thu, 13 Oct 2022 15:00:02 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3CCAD84E40;
        Fri, 14 Oct 2022 00:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1665698400;
        bh=94Q49BLfqATZ0DJEAh29wKkuNHiaNFmVdePRfY74jVo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bsMuD/xiQMj4s1q5K+NaPC/vXcOZIBcQrUjn8c/WUP5lD8lL3HSwmXMUAECkXbdfc
         Mc3bZS/1xlwde3E2C8aHNJuucDnJbJXAbQlhumKfomkh9iEChd+xMiLiP+Keh2Z2V9
         R+l857g4vU3swBtfEjp5NW60pM+mRWgQPAINrMBU9y534qdFm0VUIi+PsxrMZ/RVDf
         8XEVI9ISScKlC+Js4EnIbO8I1zFIroPQuVciYAC0HAh59Axjp9rcKJN2vXfS+seA9L
         rRhDlZqnm5373ptX3HX8dYgfC9YmQU7m8PzdY1rs51a5jUwuTn2SZkUgKI2b9ePp/Y
         CVmXSluhIhZBw==
From:   Marek Vasut <marex@denx.de>
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v6 2/2] gpio: mxc: Always set GPIOs used as interrupt source to INPUT mode
Date:   Thu, 13 Oct 2022 23:59:46 +0200
Message-Id: <20221013215946.216184-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013215946.216184-1-marex@denx.de>
References: <20221013215946.216184-1-marex@denx.de>
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
---
 drivers/gpio/gpio-mxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 6cc98a5684ae1..dd91908c72f19 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -210,7 +210,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 
 	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
 
-	return 0;
+	return port->gc.direction_input(&port->gc, gpio_idx);
 }
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
-- 
2.35.1

