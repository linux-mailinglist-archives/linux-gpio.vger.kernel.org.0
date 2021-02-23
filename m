Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44DC63228A1
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Feb 2021 11:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbhBWKKx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Feb 2021 05:10:53 -0500
Received: from lucky1.263xmail.com ([211.157.147.131]:42416 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232452AbhBWKJq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2021 05:09:46 -0500
Received: from localhost (unknown [192.168.167.224])
        by lucky1.263xmail.com (Postfix) with ESMTP id ADB9BB8591;
        Tue, 23 Feb 2021 18:07:28 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P17592T140304944715520S1614074847067728_;
        Tue, 23 Feb 2021 18:07:28 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <204451e20f75e94f177c1e08f0a529c1>
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
        Wang Panzhenzhuan <randy.wang@rock-chips.com>,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH] pinctrl: rockchip: fix restore error in resume
Date:   Tue, 23 Feb 2021 18:07:25 +0800
Message-Id: <20210223100725.269240-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223064807.121358-1-jay.xu@rock-chips.com>
References: <20210223064807.121358-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Wang Panzhenzhuan <randy.wang@rock-chips.com>

The restore in resume should match to suspend which only set for RK3288
SoCs pinctrl.

Fixes: 8dca933127024 ("pinctrl: rockchip: save and restore gpio6_c6 pinmux in suspend/resume")
Reviewed-by: Jianqun Xu <jay.xu@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Wang Panzhenzhuan <randy.wang@rock-chips.com>
Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index aa1a1c850d05..53a0badc6b03 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3727,12 +3727,15 @@ static int __maybe_unused rockchip_pinctrl_suspend(struct device *dev)
 static int __maybe_unused rockchip_pinctrl_resume(struct device *dev)
 {
 	struct rockchip_pinctrl *info = dev_get_drvdata(dev);
-	int ret = regmap_write(info->regmap_base, RK3288_GRF_GPIO6C_IOMUX,
-			       rk3288_grf_gpio6c_iomux |
-			       GPIO6C6_SEL_WRITE_ENABLE);
+	int ret;
 
-	if (ret)
-		return ret;
+	if (info->ctrl->type == RK3288) {
+		ret = regmap_write(info->regmap_base, RK3288_GRF_GPIO6C_IOMUX,
+				   rk3288_grf_gpio6c_iomux |
+				   GPIO6C6_SEL_WRITE_ENABLE);
+		if (ret)
+			return ret;
+	}
 
 	return pinctrl_force_default(info->pctl_dev);
 }
-- 
2.25.1



