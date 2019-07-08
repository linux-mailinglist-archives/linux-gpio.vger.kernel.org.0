Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76F2A61D6E
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 13:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730298AbfGHLCJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 07:02:09 -0400
Received: from onstation.org ([52.200.56.107]:56170 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730264AbfGHLB6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jul 2019 07:01:58 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 270CF45752;
        Mon,  8 Jul 2019 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1562583717;
        bh=2RS0KK1hfrl4EHuQ2ry/wHGZzJKEyGQ/7nvoEOIsG+c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S3I2jkIjojC0S6qKPu9ezIbQyDdmKYQkdjulFIdMWHqxTDEM93i3GnLE7qHG1sb1c
         gh6b/OovLwUyucZR/1JTMc2VKnJgneRaH/FCrh2Zo0TuX+8mf+861rgoiW37Bx6uV6
         I8U/DwSBapFjIsQbwnOgk/yilIz4xwjuUnNTxIZc=
From:   Brian Masney <masneyb@onstation.org>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        tglx@linutronix.de, marc.zyngier@arm.com, ilina@codeaurora.org,
        jonathanh@nvidia.com, skomatineni@nvidia.com, bbiswas@nvidia.com,
        linux-tegra@vger.kernel.org, david.daney@cavium.com,
        yamada.masahiro@socionext.com, treding@nvidia.com,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] gpio: use handler in gpio_irq_chip instead of handle_bad_irq
Date:   Mon,  8 Jul 2019 07:01:37 -0400
Message-Id: <20190708110138.24657-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190708110138.24657-1-masneyb@onstation.org>
References: <20190708110138.24657-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the IRQ handler field that's available in the struct gpio_irq_chip
when allocating an IRQ rather than hardcoding the handler to
handle_bad_irq(). The kernel reboots without any messages when testing
this using spmi-gpio on the Nexus 5.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
I didn't have time to dig into more detail about why this is happening.
I suspect the issue is that __irq_do_set_handler() has a special check
for handle_bad_irq:

https://elixir.bootlin.com/linux/latest/source/kernel/irq/chip.c#L974

My post about this:
https://lore.kernel.org/linux-gpio/20190707014620.GA9690@onstation.org/

 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5423242deb81..bc68ebb8f40e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1872,7 +1872,7 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 				    hwirq + i,
 				    gc->irq.chip,
 				    gc,
-				    handle_bad_irq,
+				    girq->handler,
 				    NULL, NULL);
 		irq_set_probe(irq + i);
 
-- 
2.20.1

