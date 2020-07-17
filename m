Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582E72230DD
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 03:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbgGQB4E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 21:56:04 -0400
Received: from lucky1.263xmail.com ([211.157.147.133]:41394 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgGQB4D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 21:56:03 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 44809C5D6B;
        Fri, 17 Jul 2020 09:53:26 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P26706T140361238066944S1594950804654023_;
        Fri, 17 Jul 2020 09:53:25 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <6045a8117473b967c7cacb8c546d06de>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: heiko@sntech.de
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, kever.yang@rock-chips.com,
        david.wu@rock-chips.com, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 09/13] pinctrl: rockchip: do codingstyle
Date:   Fri, 17 Jul 2020 09:53:23 +0800
Message-Id: <20200717015323.14323-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717014908.13914-1-jay.xu@rock-chips.com>
References: <20200717014908.13914-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add RK3228 definitions to separate from other SoCs.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 44f051af97c6..ec6a1a08f8b1 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1918,6 +1918,9 @@ static void rk3288_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 }
 
 #define RK3228_PULL_OFFSET		0x100
+#define RK3228_PULL_BITS_PER_PIN	2
+#define RK3228_PULL_PINS_PER_REG	8
+#define RK3228_PULL_BANK_STRIDE		16
 
 static void rk3228_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 				    int pin_num, struct regmap **regmap,
@@ -1927,14 +1930,17 @@ static void rk3228_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 
 	*regmap = info->regmap_base;
 	*reg = RK3228_PULL_OFFSET;
-	*reg += bank->bank_num * RK3188_PULL_BANK_STRIDE;
-	*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
+	*reg += bank->bank_num * RK3228_PULL_BANK_STRIDE;
+	*reg += ((pin_num / RK3228_PULL_PINS_PER_REG) * 4);
 
-	*bit = (pin_num % RK3188_PULL_PINS_PER_REG);
-	*bit *= RK3188_PULL_BITS_PER_PIN;
+	*bit = (pin_num % RK3228_PULL_PINS_PER_REG);
+	*bit *= RK3228_PULL_BITS_PER_PIN;
 }
 
 #define RK3228_DRV_GRF_OFFSET		0x200
+#define RK3228_DRV_BITS_PER_PIN		2
+#define RK3228_DRV_PINS_PER_REG		8
+#define RK3228_DRV_BANK_STRIDE		16
 
 static void rk3228_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 				    int pin_num, struct regmap **regmap,
@@ -1944,11 +1950,11 @@ static void rk3228_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 
 	*regmap = info->regmap_base;
 	*reg = RK3228_DRV_GRF_OFFSET;
-	*reg += bank->bank_num * RK3288_DRV_BANK_STRIDE;
-	*reg += ((pin_num / RK3288_DRV_PINS_PER_REG) * 4);
+	*reg += bank->bank_num * RK3228_DRV_BANK_STRIDE;
+	*reg += ((pin_num / RK3228_DRV_PINS_PER_REG) * 4);
 
-	*bit = (pin_num % RK3288_DRV_PINS_PER_REG);
-	*bit *= RK3288_DRV_BITS_PER_PIN;
+	*bit = (pin_num % RK3228_DRV_PINS_PER_REG);
+	*bit *= RK3228_DRV_BITS_PER_PIN;
 }
 
 #define RK3308_PULL_OFFSET		0xa0
-- 
2.17.1



