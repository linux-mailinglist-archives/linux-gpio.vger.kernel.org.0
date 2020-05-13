Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356D51D135A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 14:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbgEMM4I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 08:56:08 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:41461 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728413AbgEMM4H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 08:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589374567; x=1620910567;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tWUrw/osLjvb/c0rlAloWSn6upuy4DQgjffgP9JdqBU=;
  b=fXj5IzqatnlmyMgZfRkj1ugYDueFfws12kYd6ZfyLtohOPHskYcdypub
   naxOw3T6+MR+ZChif35dzcNcjWvDZdGSdkBu7kIXBbyhpfU3nG3Yt8fKL
   uS9iT7tCfp4h1ldO79JZVd7/r5b5RmijqKbMKTIoyFCSR9OFHk88MHURu
   FiCniTpbPYymJ5SH3YeoPDH/MqfqXEx7Wm9G6cujVG5rvwzyQ5tQ5/V5+
   h1Evoa03BWXzXota0fgePY+jZCM+mI6EZ2CkbGr7rUEiCoyAYGzOzKRMd
   9H0ajpSyHMxHCcqzcy9n2g0GpMdWTbD6fFkyprbgLV6e5YE6fnv6Wd5O5
   A==;
IronPort-SDR: 5GHqSiFtKgWIC8va82L+s6NuvHwV62gTUokLdXnoPAjLf5/HA5uwPqmcP00xXoVlF0HErxDLTG
 9aLm3xM6vdtFRug26VdhIpctNXmcVVZ/IfHQL43hxYe3FijQxx6p+g6diKrDY4WJgjxUgydAmQ
 m1Rkuu5XoerHhbojxsEY/QGTsPcpUhhDi77/5WeWsgE46h+bjosOvGqQ5RhOXeMnwdPTysupA4
 c0QvLKjHNmh1h0HP1r6VIPqUZxvZK64FulwW5Z3tR5rtef98cJW0byFBlYHWJehBKrOStYPJ0E
 scM=
X-IronPort-AV: E=Sophos;i="5.73,387,1583218800"; 
   d="scan'208";a="79436238"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 05:56:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 05:56:08 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 05:56:02 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 01/14] pinctrl: ocelot: Should register GPIO's even if not irq controller
Date:   Wed, 13 May 2020 14:55:19 +0200
Message-ID: <20200513125532.24585-2-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513125532.24585-1-lars.povlsen@microchip.com>
References: <20200513125532.24585-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This fixes the situation where the GPIO controller is not used as an
interrupt controller as well.

Previously, the driver would silently fail to register even the
GPIO's. With this change, the driver will only register as an
interrupt controller if a parent interrupt is provided.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index ed8eac6c14944..d4ac65b1efc0b 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -751,21 +751,21 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 	gc->of_node = info->dev->of_node;
 	gc->label = "ocelot-gpio";
 
-	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (irq <= 0)
-		return irq;
-
-	girq = &gc->irq;
-	girq->chip = &ocelot_irqchip;
-	girq->parent_handler = ocelot_irq_handler;
-	girq->num_parents = 1;
-	girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents),
-				     GFP_KERNEL);
-	if (!girq->parents)
-		return -ENOMEM;
-	girq->parents[0] = irq;
-	girq->default_type = IRQ_TYPE_NONE;
-	girq->handler = handle_edge_irq;
+	irq = irq_of_parse_and_map(gc->of_node, 0);
+	if (irq) {
+		girq = &gc->irq;
+		girq->chip = &ocelot_irqchip;
+		girq->parent_handler = ocelot_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(&pdev->dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = irq;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_edge_irq;
+	}
 
 	ret = devm_gpiochip_add_data(&pdev->dev, gc, info);
 	if (ret)
-- 
2.26.2

