Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C180444CD07
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 23:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233896AbhKJWtZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 17:49:25 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:62570 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233634AbhKJWtX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Nov 2021 17:49:23 -0500
X-IronPort-AV: E=Sophos;i="5.87,225,1631545200"; 
   d="scan'208";a="100143073"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Nov 2021 07:46:34 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AE090413165E;
        Thu, 11 Nov 2021 07:46:32 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/6] pinctrl: renesas: pinctrl-rzg2l: Add helper functions to read/write pin config
Date:   Wed, 10 Nov 2021 22:46:19 +0000
Message-Id: <20211110224622.16022-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add helper functions to read/read modify write pin config.

Switch to use helper functions for pins supporting PIN_CONFIG_INPUT_ENABLE
capabilities.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3
* Dropped duplicate masking in rzg2l_read_pin_config
* Dropped port_pin flag
* Dropped spinlocks around read/write
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 58 +++++++++++++++----------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index be9af717a497..984c19328efa 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -424,6 +424,36 @@ static int rzg2l_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return ret;
 }
 
+static u32 rzg2l_read_pin_config(struct rzg2l_pinctrl *pctrl, u32 offset,
+				 u8 bit, u32 mask)
+{
+	void __iomem *addr = pctrl->base + offset;
+
+	/* handle _L/_H for 32-bit register read/write */
+	if (bit >= 4) {
+		bit -= 4;
+		addr += 4;
+	}
+
+	return (readl(addr) >> (bit * 8)) & mask;
+}
+
+static void rzg2l_rmw_pin_config(struct rzg2l_pinctrl *pctrl, u32 offset,
+				 u8 bit, u32 mask, u32 val)
+{
+	void __iomem *addr = pctrl->base + offset;
+	u32 reg;
+
+	/* handle _L/_H for 32-bit register read/write */
+	if (bit >= 4) {
+		bit -= 4;
+		addr += 4;
+	}
+
+	reg = readl(addr) & ~(mask << (bit * 8));
+	writel(reg | (val << (bit * 8)), addr);
+}
+
 static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 				     unsigned int _pin,
 				     unsigned long *config)
@@ -432,8 +462,8 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
 	unsigned int *pin_data = pin->drv_data;
-	u32 port_offset = 0, reg;
 	unsigned int arg = 0;
+	u32 port_offset = 0;
 	unsigned long flags;
 	void __iomem *addr;
 	u32 cfg = 0;
@@ -452,17 +482,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_INPUT_ENABLE:
 		if (!(cfg & PIN_CFG_IEN))
 			return -EINVAL;
-		spin_lock_irqsave(&pctrl->lock, flags);
-		/* handle _L/_H for 32-bit register read/write */
-		addr = pctrl->base + IEN(port_offset);
-		if (bit >= 4) {
-			bit -= 4;
-			addr += 4;
-		}
-
-		reg = readl(addr) & (IEN_MASK << (bit * 8));
-		arg = (reg >> (bit * 8)) & 0x1;
-		spin_unlock_irqrestore(&pctrl->lock, flags);
+		arg = rzg2l_read_pin_config(pctrl, IEN(port_offset), bit, IEN_MASK);
 		break;
 
 	case PIN_CONFIG_POWER_SOURCE: {
@@ -502,7 +522,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
 	unsigned int *pin_data = pin->drv_data;
 	enum pin_config_param param;
-	u32 port_offset = 0, reg;
+	u32 port_offset = 0;
 	unsigned long flags;
 	void __iomem *addr;
 	unsigned int i;
@@ -528,17 +548,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			if (!(cfg & PIN_CFG_IEN))
 				return -EINVAL;
 
-			/* handle _L/_H for 32-bit register read/write */
-			addr = pctrl->base + IEN(port_offset);
-			if (bit >= 4) {
-				bit -= 4;
-				addr += 4;
-			}
-
-			spin_lock_irqsave(&pctrl->lock, flags);
-			reg = readl(addr) & ~(IEN_MASK << (bit * 8));
-			writel(reg | (arg << (bit * 8)), addr);
-			spin_unlock_irqrestore(&pctrl->lock, flags);
+			rzg2l_rmw_pin_config(pctrl, IEN(port_offset), bit, IEN_MASK, !!arg);
 			break;
 		}
 
-- 
2.17.1

