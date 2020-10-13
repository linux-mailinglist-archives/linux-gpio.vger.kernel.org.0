Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941A028C8BE
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 08:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389646AbgJMGoE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 02:44:04 -0400
Received: from lucky1.263xmail.com ([211.157.147.134]:40410 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389640AbgJMGoD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 02:44:03 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 68E1FC3239;
        Tue, 13 Oct 2020 14:37:34 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P30218T139798958167808S1602571053396950_;
        Tue, 13 Oct 2020 14:37:35 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <3f72093f1ea45d218446f5d8a608d148>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v3 2/3] pinctrl: rockchip: enable gpio pclk for rockchip_gpio_to_irq
Date:   Tue, 13 Oct 2020 14:37:30 +0800
Message-Id: <20201013063731.3618-3-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013063731.3618-1-jay.xu@rock-chips.com>
References: <20201013063731.3618-1-jay.xu@rock-chips.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There need to enable pclk_gpio when do irq_create_mapping, since it will
do access to gpio controller.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 927d132d6716..a2f361aa6d05 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3157,7 +3157,9 @@ static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 	if (!bank->domain)
 		return -ENXIO;
 
+	clk_enable(bank->clk);
 	virq = irq_create_mapping(bank->domain, offset);
+	clk_disable(bank->clk);
 
 	return (virq) ? : -ENXIO;
 }
-- 
2.17.1



