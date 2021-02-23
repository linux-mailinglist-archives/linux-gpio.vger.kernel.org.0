Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A103228C6
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Feb 2021 11:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbhBWKV7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Feb 2021 05:21:59 -0500
Received: from lucky1.263xmail.com ([211.157.147.131]:60568 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbhBWKV6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2021 05:21:58 -0500
Received: from localhost (unknown [192.168.167.70])
        by lucky1.263xmail.com (Postfix) with ESMTP id 13FFFB88A8;
        Tue, 23 Feb 2021 18:19:40 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P31655T140707257894656S1614075578214864_;
        Tue, 23 Feb 2021 18:19:39 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <18b2e2b5e8dfee53ac67983dde7c59ee>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Ziyuan Xu <xzy.xu@rock-chips.com>
Subject: [PATCH] pinctrl: rockchip: clear int status when driver probed
Date:   Tue, 23 Feb 2021 18:19:37 +0800
Message-Id: <20210223101937.273085-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some devices may do gpio interrupt trigger and make an int status before
pinctrl driver probed, then the gpio handler will keep complain untill
the device driver works to stop trigger.

Signed-off-by: Ziyuan Xu <xzy.xu@rock-chips.com>
Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index aa1a1c850d05..ec4cb88572cf 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3433,6 +3433,7 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
 		 * things enabled, so for us that's all masked and all enabled.
 		 */
 		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTMASK);
+		writel_relaxed(0xffffffff, bank->reg_base + GPIO_PORTS_EOI);
 		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTEN);
 		gc->mask_cache = 0xffffffff;
 
-- 
2.25.1



