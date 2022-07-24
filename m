Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D7E57F2AE
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Jul 2022 04:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbiGXCe3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Jul 2022 22:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiGXCe3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jul 2022 22:34:29 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B5F18361
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jul 2022 19:34:27 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3762A84003;
        Sun, 24 Jul 2022 04:34:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1658630063;
        bh=IvmPehRerHKL4Qoh9Ai1dbU9dTQyCSgMDS1MyWXEbYk=;
        h=From:To:Cc:Subject:Date:From;
        b=hqkD4T9rNmo//o438wb2TbxS4zCICUYPMsdYXG7Ax8bDMpebQlGKRhaATDfuhp12i
         n45ZvXpgQwuRlByykL58Hgn/kzCmhKW0mY3mHWHShfOKL90J3ERzxj0BiI5GkS1l1m
         f78d+XmJwktMblNtT8+7/TjoLUCd7U5cUdb2wFJMnaZcaXng++93Nbmibn78k119GB
         btMmfeGGxI1wZUWeEjw+nLu/sFS4sUSKfNi+IITIxan3AWXz3rqUIGw9YYIqAb4qJ1
         5U9uyHKqp2tu9wb1MrQIHcZnfdfrPUqAJcPwN9hGUrUnP7NfAHIPQiIT0yED9Wurjp
         ZnCJT4ChlhD2Q==
From:   Marek Vasut <marex@denx.de>
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2] gpio: mxc: Always set GPIOs used as interrupt source to INPUT mode
Date:   Sun, 24 Jul 2022 04:34:18 +0200
Message-Id: <20220724023418.441899-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
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

Always configure interrupt source GPIO pin as input to fix the above case.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
---
V2: Actually update and clear bits in GDIR register
---
 drivers/gpio/gpio-mxc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index c871602fc5ba9..ed58441627d92 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -147,7 +147,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
-	u32 bit, val;
+	u32 bit, val, dir;
 	u32 gpio_idx = d->hwirq;
 	int edge;
 	void __iomem *reg = port->base;
@@ -204,6 +204,10 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 
 	writel(1 << gpio_idx, port->base + GPIO_ISR);
 
+	dir = readl(port->base + GPIO_GDIR);
+	dir &= ~BIT(gpio_idx);
+	writel(dir, port->base + GPIO_GDIR);
+
 	return 0;
 }
 
-- 
2.35.1

