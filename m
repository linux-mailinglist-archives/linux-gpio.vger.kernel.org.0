Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 205307024CC
	for <lists+linux-gpio@lfdr.de>; Mon, 15 May 2023 08:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239907AbjEOGec (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 May 2023 02:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239900AbjEOGeb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 May 2023 02:34:31 -0400
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D500C1B5;
        Sun, 14 May 2023 23:34:28 -0700 (PDT)
X-QQ-mid: bizesmtp69t1684132415toj3p941
Received: from wxdbg.localdomain.com ( [115.200.228.151])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Mon, 15 May 2023 14:33:33 +0800 (CST)
X-QQ-SSF: 01400000000000I0Z000000A0000000
X-QQ-FEAT: +ynUkgUhZJnMH+vhRfJ+wGU8ydXD50Fyd46dIHqpzSTXBOWaIQggK3xxOB+A3
        R7MP7Lzdv4MEZbhYGeCNgL88loWFTzXC2COiDp3NkNqBEkxeOo5+NrFPX/RFXhffJYnYNZn
        0oQq4mhlKHuSRzanhQ96EZ34qleCOTWXhK+xWtZFI8uAVahR6xQVoEqlLKxFHABA7kdTGDg
        autaxp07+/qWnU9lYGS3REdrFo6rSxJnWISeQhM+1/xG1lnN7zrtjwXT4e1ggGaESGJiQTm
        CqKdFvlSsOHKhJ2Pbxzu9Ds8nnWe6CyiCGlFCG+tLIiqHH+YlbUof1Bid/4i1Cva4TS5x9Z
        jLSxcjsrmHyXEFamIgYRDNMYWNqvLfAJNs/R98Px4fjtjUh2tAozsLrGlmOBMQObpH90AWx
        qXh0ObgaTvZJ1vnBeFOeJw==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 11328171789803804104
From:   Jiawen Wu <jiawenwu@trustnetic.com>
To:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk
Cc:     linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com, Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v8 3/9] net: txgbe: Register fixed rate clock
Date:   Mon, 15 May 2023 14:31:54 +0800
Message-Id: <20230515063200.301026-4-jiawenwu@trustnetic.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230515063200.301026-1-jiawenwu@trustnetic.com>
References: <20230515063200.301026-1-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In order for I2C to be able to work in standard mode, register a fixed
rate clock for each I2C device.

Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
---
 drivers/net/ethernet/wangxun/Kconfig          |  1 +
 .../net/ethernet/wangxun/txgbe/txgbe_phy.c    | 41 +++++++++++++++++++
 .../net/ethernet/wangxun/txgbe/txgbe_type.h   |  2 +
 3 files changed, 44 insertions(+)

diff --git a/drivers/net/ethernet/wangxun/Kconfig b/drivers/net/ethernet/wangxun/Kconfig
index c9d88673d306..a62614eeed2e 100644
--- a/drivers/net/ethernet/wangxun/Kconfig
+++ b/drivers/net/ethernet/wangxun/Kconfig
@@ -40,6 +40,7 @@ config NGBE
 config TXGBE
 	tristate "Wangxun(R) 10GbE PCI Express adapters support"
 	depends on PCI
+	select COMMON_CLK
 	select LIBWX
 	help
 	  This driver supports Wangxun(R) 10GbE PCI Express family of
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index 3476074869cb..f1c455d799f3 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -2,6 +2,8 @@
 /* Copyright (c) 2015 - 2023 Beijing WangXun Technology Co., Ltd. */
 
 #include <linux/gpio/property.h>
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
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
index 5bef0f9df523..cdbc4b37f832 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -146,6 +146,8 @@ struct txgbe_nodes {
 struct txgbe {
 	struct wx *wx;
 	struct txgbe_nodes nodes;
+	struct clk_lookup *clock;
+	struct clk *clk;
 };
 
 #endif /* _TXGBE_TYPE_H_ */
-- 
2.27.0

