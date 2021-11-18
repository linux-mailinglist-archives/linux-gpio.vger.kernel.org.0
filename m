Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64FBB455EC3
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 15:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbhKRO7F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 09:59:05 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:34542 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229587AbhKRO7F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Nov 2021 09:59:05 -0500
X-IronPort-AV: E=Sophos;i="5.87,245,1631545200"; 
   d="scan'208";a="101052139"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 18 Nov 2021 23:56:03 +0900
Received: from localhost.localdomain (unknown [10.226.93.19])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9DB4443D7FED;
        Thu, 18 Nov 2021 23:56:01 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC] pinctrl: renesas: rzg2l: Add support to select MII/RGMII mode
Date:   Thu, 18 Nov 2021 14:55:58 +0000
Message-Id: <20211118145558.32359-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RZ/G2L supports Ether MII/RGMII mode control which select
the direction of the pins based on PHY mode.

This patch adds support to select MII/RGMII mode based on
the phy-mode property present in the ether node, as the
register for configuring the same is located in pinctrl block
rather than GbEthernet block.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Current names on HW manual is based on pins which is going to
change in next version like below.

P20_0->ETH0_mode
P29_0->ETH1_mode
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 70 +++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index ccee9c9e2e22..bc86119be01e 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -92,6 +92,7 @@
 #define PWPR			(0x3014)
 #define SD_CH(n)		(0x3000 + (n) * 4)
 #define QSPI			(0x3008)
+#define ETHER_MODE		(0x3018)
 
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
 #define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
@@ -104,6 +105,10 @@
 #define PFC_MASK		0x07
 #define IEN_MASK		0x01
 #define IOLH_MASK		0x03
+#define ETHER_MODE_ETH0_MASK	BIT(0)
+#define ETHER_MODE_ETH1_MASK	BIT(1)
+#define ETHER_MODE_ETH0_ADDR	0x11c20000
+#define ETHER_MODE_ETH1_ADDR	0x11c30000
 
 #define PM_INPUT		0x1
 #define PM_OUTPUT		0x2
@@ -1197,6 +1202,69 @@ static void rzg2l_pinctrl_clk_disable(void *data)
 	clk_disable_unprepare(data);
 }
 
+static bool rzg2l_pinctrl_is_rgmii_mode(struct rzg2l_pinctrl *pctrl,
+					struct device_node *node)
+{
+	const char *mode = of_get_property(node, "phy-mode", NULL);
+	bool ret = false;
+
+	if (!mode) {
+		dev_err(pctrl->dev, "phy-mode missing, setting to mii mode");
+		return ret;
+	}
+
+	if ((!strcmp("rgmii", mode)) || (!strcmp("rgmii-id", mode)) ||
+	    (!strcmp("rgmii-rxid", mode)) || (!strcmp("rgmii-txid", mode)))
+		ret = true;
+
+	return ret;
+}
+
+static void rzg2l_pinctrl_set_eth_mode(struct rzg2l_pinctrl *pctrl,
+				       struct device_node *np)
+{
+	u8 reg = readb(pctrl->base + ETHER_MODE);
+	u8 mask = ETHER_MODE_ETH0_MASK;
+	const __be32 *prop;
+	u64 addr;
+
+	prop = of_get_property(np, "reg", NULL);
+	if (!prop)
+		return;
+
+	addr = of_read_number(prop, of_n_addr_cells(np));
+	if (addr == ETHER_MODE_ETH1_ADDR)
+		mask = ETHER_MODE_ETH1_MASK;
+
+	if (rzg2l_pinctrl_is_rgmii_mode(pctrl, np))
+		reg &= ~mask;
+	else
+		reg |= mask;
+
+	writeb(reg, pctrl->base + ETHER_MODE);
+}
+
+static void rzg2l_pinctrl_set_ether_modes(struct rzg2l_pinctrl *pctrl)
+{
+	struct device_node *np, *np1 = NULL;
+
+	np = of_find_compatible_node(NULL, NULL, "renesas,rzg2l-gbeth");
+	if (np) {
+		np1 = of_find_compatible_node(np, NULL, "renesas,rzg2l-gbeth");
+		if (of_device_is_available(np))
+			rzg2l_pinctrl_set_eth_mode(pctrl, np);
+
+		of_node_put(np);
+	}
+
+	if (np1) {
+		if (of_device_is_available(np1))
+			rzg2l_pinctrl_set_eth_mode(pctrl, np1);
+
+		of_node_put(np1);
+	}
+}
+
 static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 {
 	struct rzg2l_pinctrl *pctrl;
@@ -1246,6 +1314,8 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	rzg2l_pinctrl_set_ether_modes(pctrl);
+
 	dev_info(pctrl->dev, "%s support registered\n", DRV_NAME);
 	return 0;
 }
-- 
2.17.1

