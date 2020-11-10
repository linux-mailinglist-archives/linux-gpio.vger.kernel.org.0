Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA6F2ACF98
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 07:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgKJGYD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 01:24:03 -0500
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:51382 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726006AbgKJGYD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 01:24:03 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1783931|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00551052-0.00222848-0.992261;FP=12104955532006367399|1|1|17|0|-1|-1|-1;HT=ay29a033018047205;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=8;RT=8;SR=0;TI=SMTPD_---.IunzMV9_1604989434;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.IunzMV9_1604989434)
          by smtp.aliyun-inc.com(10.147.41.143);
          Tue, 10 Nov 2020 14:23:58 +0800
From:   Frank Lee <frank@allwinnertech.com>
To:     tiny.windzz@gmail.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Yangtao Li <frank@allwinnertech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Subject: [RESEND PATCH 02/19] pinctrl: sunxi: Mark the irq bank not found in sunxi_pinctrl_irq_handler() with WARN_ON
Date:   Tue, 10 Nov 2020 14:23:44 +0800
Message-Id: <470ebae22fc5434ad5409c4f6e29255467b3cef6.1604988979.git.frank@allwinnertech.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604988979.git.frank@allwinnertech.com>
References: <cover.1604988979.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Yangtao Li <frank@allwinnertech.com>

The interrupt descriptor cannot be found in the interrupt processing
function, and this situation cannot happen when the system is running
normally. It doesn't seem right to return directly to the status of not
handling gic. In this case, it must be a bug, let's mark it with
WARN_ON.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 8e792f8e2dc9..9d8b59dafa4b 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1139,8 +1139,7 @@ static void sunxi_pinctrl_irq_handler(struct irq_desc *desc)
 		if (irq == pctl->irq[bank])
 			break;
 
-	if (bank == pctl->desc->irq_banks)
-		return;
+	WARN_ON(bank == pctl->desc->irq_banks);
 
 	reg = sunxi_irq_status_reg_from_bank(pctl->desc, bank);
 	val = readl(pctl->membase + reg);
-- 
2.28.0

