Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77A8C4CD69D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Mar 2022 15:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239917AbiCDOnT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Mar 2022 09:43:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239904AbiCDOnN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Mar 2022 09:43:13 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5FDC5F;
        Fri,  4 Mar 2022 06:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646404945; x=1677940945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uSXhUa1TK6x4EhT0rMumawhzMV00/FO2bC40apPpfOA=;
  b=wFP8mdvZ06O7CBG8KEV4xi074HlugzhU0LYSDnKdPA7M9xryVT46lPiq
   Pi+22oGzLW9ZFabDTbxIU6QQ63q8ExyQtsaT31bb+0MYdPVb5Tg7hjgdl
   9Xv9y3XsPg9moOjl6Xhq5utsUIUk96BjAzbIxhhX6WCDlgwADV0JY07zb
   lwjheRGcQOieQOGJSnfNuQertZDZPVBKw3A28plufeNaaSy8xFP4dgq1I
   V6RWYCdNEZpmNh2/zotmtgI5YT4u//IjZMItMo6TfddIuTmGzO7q20urc
   cxhycDBxyyvY1aa1uiuayt5kAheQsuOW3Cut7goqbXRugA8W/YEa5iN+t
   g==;
X-IronPort-AV: E=Sophos;i="5.90,155,1643698800"; 
   d="scan'208";a="150870208"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Mar 2022 07:42:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 4 Mar 2022 07:42:25 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 4 Mar 2022 07:42:23 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linus.walleij@linaro.org>, <colin.foster@in-advantage.com>,
        <andriy.shevchenko@linux.intel.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v2 2/2] pinctrl: ocelot: Fix interrupt parsing
Date:   Fri, 4 Mar 2022 15:44:32 +0100
Message-ID: <20220304144432.3397621-3-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220304144432.3397621-1-horatiu.vultur@microchip.com>
References: <20220304144432.3397621-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In the blamed commit, it removes the duplicate of_node assignment in the
driver. But the driver uses this before calling into of_gpio_dev_init to
determine if it needs to assign an IRQ chip to the GPIO. The fixes
consists in using the platform_get_irq_optional

Fixes: 8a8d6bbe1d3bc7 ("pinctrl: Get rid of duplicate of_node assignment in the drivers")
Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index a859fbcb09af..e8501dac2f04 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1851,8 +1851,8 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 	gc->base = -1;
 	gc->label = "ocelot-gpio";
 
-	irq = irq_of_parse_and_map(gc->of_node, 0);
-	if (irq) {
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq > 0) {
 		girq = &gc->irq;
 		girq->chip = &ocelot_irqchip;
 		girq->parent_handler = ocelot_irq_handler;
-- 
2.33.0

