Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD9B35B873
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Apr 2021 04:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236581AbhDLCRD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Apr 2021 22:17:03 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:54488 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236572AbhDLCRD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 11 Apr 2021 22:17:03 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0UVCHCvs_1618193792;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UVCHCvs_1618193792)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 12 Apr 2021 10:16:43 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     linus.walleij@linaro.org
Cc:     bgolaszewski@baylibre.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] gpio: mxs: remove useless function
Date:   Mon, 12 Apr 2021 10:16:21 +0800
Message-Id: <1618193781-35329-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the following gcc warning:

drivers/gpio/gpio-mxs.c:63:19: warning: kernel/sys_ni.cunused function
'is_imx28_gpio'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpio/gpio-mxs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index dfc0c1e..524b668 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -60,11 +60,6 @@ static inline int is_imx23_gpio(struct mxs_gpio_port *port)
 	return port->devid == IMX23_GPIO;
 }
 
-static inline int is_imx28_gpio(struct mxs_gpio_port *port)
-{
-	return port->devid == IMX28_GPIO;
-}
-
 /* Note: This driver assumes 32 GPIOs are handled in one register */
 
 static int mxs_gpio_set_irq_type(struct irq_data *d, unsigned int type)
-- 
1.8.3.1

