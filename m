Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD8564D100A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 07:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbiCHGUi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 01:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbiCHGUg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 01:20:36 -0500
Received: from mail-m17661.qiye.163.com (mail-m17661.qiye.163.com [59.111.176.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31479344CA
        for <linux-gpio@vger.kernel.org>; Mon,  7 Mar 2022 22:19:39 -0800 (PST)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m17661.qiye.163.com (Hmail) with ESMTPA id 18F8A1DF400;
        Tue,  8 Mar 2022 14:19:38 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de
Cc:     linus.walleij@linaro.org, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
        linux-gpio@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 2/4] gpio: rockchip: get irq support for both dt and acpi
Date:   Tue,  8 Mar 2022 14:19:33 +0800
Message-Id: <20220308061935.2441447-3-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308061935.2441447-1-jay.xu@rock-chips.com>
References: <20220308061935.2441447-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
        kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRlCGEhWGE4ZGkNITU
        odSEsYVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NzI6EQw4Sz4CSjI9LBAIKz4r
        FRkwCxFVSlVKTU9NTElLSExDT0xIVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUhKS0w3Bg++
X-HM-Tid: 0a7f682ee593da2bkuws18f8a1df400
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Get the irq of gpio controller with fwnode apis, support for both dt
node and acpi.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index b67038572285..3703c3d71809 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -5,7 +5,7 @@
  *
  * Copyright (c) 2021 Rockchip Electronics Co. Ltd.
  */
-
+#include <linux/acpi.h>
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -639,10 +639,6 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 {
 	int id = 0;
 
-	bank->irq = irq_of_parse_and_map(bank->of_node, 0);
-	if (!bank->irq)
-		return -EINVAL;
-
 	bank->clk = of_clk_get(bank->of_node, 0);
 	if (IS_ERR(bank->clk))
 		return PTR_ERR(bank->clk);
@@ -668,6 +664,24 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 	return 0;
 }
 
+static int rockchip_gpio_get_irq(struct rockchip_pin_bank *bank)
+{
+	struct device *dev = bank->dev;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	struct device_node *np = NULL;
+	int irq = 0;
+
+	if (fwnode_property_read_bool(fwnode, "interrupt-controller"))
+		np = to_of_node(fwnode);
+
+	if (np)
+		irq = irq_of_parse_and_map(np, 0);
+	else if (has_acpi_companion(dev))
+		irq = platform_get_irq_optional(to_platform_device(dev), 0);
+
+	return irq;
+}
+
 static struct rockchip_pin_bank *
 rockchip_gpio_find_bank(struct pinctrl_dev *pctldev, int id)
 {
@@ -721,6 +735,10 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(bank->reg_base))
 		return PTR_ERR(bank->reg_base);
 
+	bank->irq = rockchip_gpio_get_irq(bank);
+	if (bank->irq < 0)
+		return bank->irq;
+
 	ret = rockchip_get_bank_data(bank);
 	if (ret)
 		return ret;
-- 
2.25.1

