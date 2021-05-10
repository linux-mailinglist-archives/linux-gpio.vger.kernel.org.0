Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A21D377C60
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 08:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhEJGin (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 02:38:43 -0400
Received: from lucky1.263xmail.com ([211.157.147.134]:50254 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhEJGin (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 May 2021 02:38:43 -0400
Received: from localhost (unknown [192.168.167.130])
        by lucky1.263xmail.com (Postfix) with ESMTP id 41CF7C8603;
        Mon, 10 May 2021 14:37:37 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P29694T140717190006528S1620628656593974_;
        Mon, 10 May 2021 14:37:37 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <e409584a888479cdfcdec1650aab20fe>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 7
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org, robh+dt@kernel.org
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 7/7] gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
Date:   Mon, 10 May 2021 14:37:34 +0800
Message-Id: <20210510063734.506063-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510063602.505829-1-jay.xu@rock-chips.com>
References: <20210510063602.505829-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There has spin lock for irq set type already, so drop irq_gc_lock and
irq_gc_unlock.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 048e7eecddba..c9c55614bbef 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -406,7 +406,6 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 		irq_set_handler_locked(d, handle_level_irq);
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
-	irq_gc_lock(gc);
 
 	level = rockchip_gpio_readl(bank, bank->gpio_regs->int_type);
 	polarity = rockchip_gpio_readl(bank, bank->gpio_regs->int_polarity);
@@ -461,7 +460,6 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 	rockchip_gpio_writel(bank, level, bank->gpio_regs->int_type);
 	rockchip_gpio_writel(bank, polarity, bank->gpio_regs->int_polarity);
 out:
-	irq_gc_unlock(gc);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
 	return ret;
-- 
2.25.1



