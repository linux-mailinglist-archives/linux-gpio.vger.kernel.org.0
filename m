Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5672231A7
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 05:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgGQD13 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 23:27:29 -0400
Received: from lucky1.263xmail.com ([211.157.147.135]:38652 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgGQD12 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 23:27:28 -0400
Received: from localhost (unknown [192.168.167.13])
        by lucky1.263xmail.com (Postfix) with ESMTP id 46FE3A1289;
        Fri, 17 Jul 2020 11:27:25 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P17843T139821238978304S1594956444573766_;
        Fri, 17 Jul 2020 11:27:25 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <2d58e0ed85c5041d7568221e8c6e4f3f>
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
Subject: [PATCH 11/13] pinctrl: rockchip: Add RK3128 definitions to separate from other SoCs
Date:   Fri, 17 Jul 2020 11:27:23 +0800
Message-Id: <20200717032723.18383-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717032411.17654-1-jay.xu@rock-chips.com>
References: <20200717032411.17654-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add RK3128 definitions to separate from other SoCs.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 04e7027ec8e1..3b74455dcdb2 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1799,6 +1799,8 @@ static void rk2928_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 };
 
 #define RK3128_PULL_OFFSET	0x118
+#define RK3128_PULL_PINS_PER_REG	16
+#define RK3128_PULL_BANK_STRIDE		8
 
 static void rk3128_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 					 int pin_num, struct regmap **regmap,
@@ -1808,10 +1810,10 @@ static void rk3128_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 
 	*regmap = info->regmap_base;
 	*reg = RK3128_PULL_OFFSET;
-	*reg += bank->bank_num * RK2928_PULL_BANK_STRIDE;
-	*reg += ((pin_num / RK2928_PULL_PINS_PER_REG) * 4);
+	*reg += bank->bank_num * RK3128_PULL_BANK_STRIDE;
+	*reg += ((pin_num / RK3128_PULL_PINS_PER_REG) * 4);
 
-	*bit = pin_num % RK2928_PULL_PINS_PER_REG;
+	*bit = pin_num % RK3128_PULL_PINS_PER_REG;
 }
 
 #define RK3188_PULL_OFFSET		0x164
-- 
2.17.1



