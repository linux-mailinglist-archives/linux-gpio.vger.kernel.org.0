Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A8822319D
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 05:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgGQD0x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 23:26:53 -0400
Received: from lucky1.263xmail.com ([211.157.147.135]:37366 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbgGQD0w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 23:26:52 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 563C4A1038;
        Fri, 17 Jul 2020 11:26:49 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P26706T140361131353856S1594956408412577_;
        Fri, 17 Jul 2020 11:26:49 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <d3cc9f579b567b615a1f839956044562>
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
Subject: [PATCH 06/13] pinctrl: rockchip: Add RK3399 definitions to separate from other SoCs
Date:   Fri, 17 Jul 2020 11:26:47 +0800
Message-Id: <20200717032647.18126-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717032411.17654-1-jay.xu@rock-chips.com>
References: <20200717032411.17654-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add RK3399 definitions to separate from other SoCs.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 1be4627f3877..71335ed003b3 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2050,6 +2050,9 @@ static void rk3368_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 #define RK3399_PULL_GRF_OFFSET		0xe040
 #define RK3399_PULL_PMU_OFFSET		0x40
 #define RK3399_DRV_3BITS_PER_PIN	3
+#define RK3399_PULL_BITS_PER_PIN	2
+#define RK3399_PULL_PINS_PER_REG	8
+#define RK3399_PULL_BANK_STRIDE		16
 
 static void rk3399_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 					 int pin_num, struct regmap **regmap,
@@ -2062,22 +2065,22 @@ static void rk3399_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 		*regmap = info->regmap_pmu;
 		*reg = RK3399_PULL_PMU_OFFSET;
 
-		*reg += bank->bank_num * RK3188_PULL_BANK_STRIDE;
+		*reg += bank->bank_num * RK3399_PULL_BANK_STRIDE;
 
-		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
-		*bit = pin_num % RK3188_PULL_PINS_PER_REG;
-		*bit *= RK3188_PULL_BITS_PER_PIN;
+		*reg += ((pin_num / RK3399_PULL_PINS_PER_REG) * 4);
+		*bit = pin_num % RK3399_PULL_PINS_PER_REG;
+		*bit *= RK3399_PULL_BITS_PER_PIN;
 	} else {
 		*regmap = info->regmap_base;
 		*reg = RK3399_PULL_GRF_OFFSET;
 
 		/* correct the offset, as we're starting with the 3rd bank */
 		*reg -= 0x20;
-		*reg += bank->bank_num * RK3188_PULL_BANK_STRIDE;
-		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
+		*reg += bank->bank_num * RK3399_PULL_BANK_STRIDE;
+		*reg += ((pin_num / RK3399_PULL_PINS_PER_REG) * 4);
 
-		*bit = (pin_num % RK3188_PULL_PINS_PER_REG);
-		*bit *= RK3188_PULL_BITS_PER_PIN;
+		*bit = (pin_num % RK3399_PULL_PINS_PER_REG);
+		*bit *= RK3399_PULL_BITS_PER_PIN;
 	}
 }
 
-- 
2.17.1



