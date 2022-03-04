Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80D5B4CD0BA
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Mar 2022 10:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234173AbiCDJHM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Mar 2022 04:07:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236109AbiCDJG2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Mar 2022 04:06:28 -0500
Received: from mail-m17661.qiye.163.com (mail-m17661.qiye.163.com [59.111.176.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8392A1A06C1
        for <linux-gpio@vger.kernel.org>; Fri,  4 Mar 2022 01:05:27 -0800 (PST)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m17661.qiye.163.com (Hmail) with ESMTPA id DE0C41DFBA5;
        Fri,  4 Mar 2022 17:05:25 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de
Cc:     linus.walleij@linaro.org, linux-rockchip@lists.infradead.org,
        linux-gpio@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 1/3] gpio: rockchip: make gpio work without cru module
Date:   Fri,  4 Mar 2022 17:05:21 +0800
Message-Id: <20220304090523.1748297-2-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304090523.1748297-1-jay.xu@rock-chips.com>
References: <20220304090523.1748297-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
        kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRkZGE9WGBlOQh0eSx
        kdThpPVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PSI6Dgw6Pz4DHT88LSEYLBQC
        MjRPCjFVSlVKTU9NSENPTElNTklLVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUlDTEg3Bg++
X-HM-Tid: 0a7f542d4006da2bkuwsde0c41dfba5
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In some case the system may has no builtin cru module, the gpio driver
will fail to get periph clock and debounce clock.

On rockchip SoCs, the pclk and dbg clk are default to be enabled and
ungated, the gpio possible to work without cru module.

This patch makes gpio work fine without cru module.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index a4c4e4584f5b..1da0324445cc 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -195,6 +195,9 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 	unsigned int cur_div_reg;
 	u64 div;
 
+	if (!bank->db_clk)
+		return -ENOENT;
+
 	if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
 		div_debounce_support = true;
 		freq = clk_get_rate(bank->db_clk);
@@ -654,8 +657,10 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 		return -EINVAL;
 
 	bank->clk = of_clk_get(bank->of_node, 0);
-	if (IS_ERR(bank->clk))
-		return PTR_ERR(bank->clk);
+	if (IS_ERR(bank->clk)) {
+		bank->clk = NULL;
+		dev_warn(bank->dev, "works without clk pm\n");
+	}
 
 	clk_prepare_enable(bank->clk);
 	id = readl(bank->reg_base + gpio_regs_v2.version_id);
@@ -666,9 +671,8 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 		bank->gpio_type = GPIO_TYPE_V2;
 		bank->db_clk = of_clk_get(bank->of_node, 1);
 		if (IS_ERR(bank->db_clk)) {
-			dev_err(bank->dev, "cannot find debounce clk\n");
-			clk_disable_unprepare(bank->clk);
-			return -EINVAL;
+			bank->db_clk = NULL;
+			dev_warn(bank->dev, "works without debounce clk pm\n");
 		}
 	} else {
 		bank->gpio_regs = &gpio_regs_v1;
-- 
2.25.1

