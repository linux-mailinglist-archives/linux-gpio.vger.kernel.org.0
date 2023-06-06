Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD246723D2D
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 11:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234197AbjFFJYD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 05:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjFFJYC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 05:24:02 -0400
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C4BE5A;
        Tue,  6 Jun 2023 02:23:58 -0700 (PDT)
X-QQ-mid: bizesmtp69t1686043399tsc30gza
Received: from wxdbg.localdomain.com ( [122.235.137.64])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Tue, 06 Jun 2023 17:23:18 +0800 (CST)
X-QQ-SSF: 01400000000000J0Z000000A0000000
X-QQ-FEAT: Wp4pj0u9TId8jp8KjUBpJie/DQcp0vSS8vOp/dctK+FZL/b5k4rFTD3Ag1bnm
        RM2ih1CSIS/AQ6HS7PTwyt2Onu+2h1EXHon/CQYmgBTYOwQLySOmN08evZUvjC0KUSEULaw
        /QMywzktnCSNo8iL1eA15bEPT0Y4VXejFUgE8cB/7xOQboEBFyCUWqSh9NGfRiThs2bk5Vu
        o7itP6Eu8BJgenDt7dPri1aXwjehF/v0z0tpRFqgyMI81srGA331/5Bepjm38HEtlKSQT39
        0fA/vNJK66cJbtDiQ9ND2uDdL3juahoYPBcy6is29AS8fUJg5sg5vvvE6UvP/MGPnj/rwF0
        u4GUmGadW7SD+X4GXZ44E7d+JPo4Fh+jObqI0ih6L6oNXKpsqVapBbPl6KNIVCcWY1fDcpG
        RyavBeNPHpIfL8MiiBmzlA==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 15754691781465022428
From:   Jiawen Wu <jiawenwu@trustnetic.com>
To:     netdev@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk
Cc:     linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com,
        Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v12 2/8] net: txgbe: Register fixed rate clock
Date:   Tue,  6 Jun 2023 17:21:01 +0800
Message-Id: <20230606092107.764621-3-jiawenwu@trustnetic.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230606092107.764621-1-jiawenwu@trustnetic.com>
References: <20230606092107.764621-1-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In order for I2C to be able to work in standard mode, register a fixed
rate clock for each I2C device.

Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/wangxun/Kconfig          |  1 +
 .../net/ethernet/wangxun/txgbe/txgbe_phy.c    | 41 +++++++++++++++++++
 .../net/ethernet/wangxun/txgbe/txgbe_type.h   |  2 +
 3 files changed, 44 insertions(+)

diff --git a/drivers/net/ethernet/wangxun/Kconfig b/drivers/net/ethernet/wangxun/Kconfig
index c9d88673d306..190d42a203b4 100644
--- a/drivers/net/ethernet/wangxun/Kconfig
+++ b/drivers/net/ethernet/wangxun/Kconfig
@@ -40,6 +40,7 @@ config NGBE
 config TXGBE
 	tristate "Wangxun(R) 10GbE PCI Express adapters support"
 	depends on PCI
+	depends on COMMON_CLK
 	select LIBWX
 	help
 	  This driver supports Wangxun(R) 10GbE PCI Express family of
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index be4b5ad74a3c..06506cfb8d06 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -2,6 +2,8 @@
 /* Copyright (c) 2015 - 2023 Beijing WangXun Technology Co., Ltd. */
 
 #include <linux/gpio/property.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
 #include <linux/i2c.h>
 #include <linux/pci.h>
 
@@ -70,6 +72,32 @@ static int txgbe_swnodes_register(struct txgbe *txgbe)
 	return software_node_register_node_group(nodes->group);
 }
 
+static int txgbe_clock_register(struct txgbe *txgbe)
+{
+	struct pci_dev *pdev = txgbe->wx->pdev;
+	struct clk_lookup *clock;
+	char clk_name[32];
+	struct clk *clk;
+
+	snprintf(clk_name, sizeof(clk_name), "i2c_designware.%d",
+		 (pdev->bus->number << 8) | pdev->devfn);
+
+	clk = clk_register_fixed_rate(NULL, clk_name, NULL, 0, 156250000);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	clock = clkdev_create(clk, NULL, clk_name);
+	if (!clock) {
+		clk_unregister(clk);
+		return -ENOMEM;
+	}
+
+	txgbe->clk = clk;
+	txgbe->clock = clock;
+
+	return 0;
+}
+
 int txgbe_init_phy(struct txgbe *txgbe)
 {
 	int ret;
@@ -80,10 +108,23 @@ int txgbe_init_phy(struct txgbe *txgbe)
 		return ret;
 	}
 
+	ret = txgbe_clock_register(txgbe);
+	if (ret) {
+		wx_err(txgbe->wx, "failed to register clock: %d\n", ret);
+		goto err_unregister_swnode;
+	}
+
 	return 0;
+
+err_unregister_swnode:
+	software_node_unregister_node_group(txgbe->nodes.group);
+
+	return ret;
 }
 
 void txgbe_remove_phy(struct txgbe *txgbe)
 {
+	clkdev_drop(txgbe->clock);
+	clk_unregister(txgbe->clk);
 	software_node_unregister_node_group(txgbe->nodes.group);
 }
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index 9aa399acd9a0..856d0f9d045b 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -147,6 +147,8 @@ struct txgbe_nodes {
 struct txgbe {
 	struct wx *wx;
 	struct txgbe_nodes nodes;
+	struct clk_lookup *clock;
+	struct clk *clk;
 };
 
 #endif /* _TXGBE_TYPE_H_ */
-- 
2.27.0

