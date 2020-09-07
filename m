Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE0B25F1F5
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 05:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgIGDGG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Sep 2020 23:06:06 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:51344 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726361AbgIGDGF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Sep 2020 23:06:05 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 5E6D7CC468;
        Mon,  7 Sep 2020 10:59:38 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P22906T140609293825792S1599447567920103_;
        Mon, 07 Sep 2020 10:59:38 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <f642be6f8bedca5c4d708df7dc42a91a>
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
Subject: [PATCH 3/5] pinctrl: rockchip: enable gpio pclk for rockchip_gpio_to_irq
Date:   Mon,  7 Sep 2020 10:59:25 +0800
Message-Id: <20200907025927.9713-4-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907025927.9713-1-jay.xu@rock-chips.com>
References: <20200831084753.7115-1-jay.xu@rock-chips.com>
 <20200907025927.9713-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
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
index cc7512acfc5f..58fd4d822591 100644
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



