Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4B243FC85
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 14:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhJ2MrU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 08:47:20 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:49247 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231693AbhJ2MrS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Oct 2021 08:47:18 -0400
X-IronPort-AV: E=Sophos;i="5.87,192,1631545200"; 
   d="scan'208";a="98894438"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 29 Oct 2021 21:44:49 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E97A9438CAF0;
        Fri, 29 Oct 2021 21:44:46 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/5] pinctrl: renesas: pinctrl-rzg2l: Add helper functions to read/write pin config
Date:   Fri, 29 Oct 2021 13:44:34 +0100
Message-Id: <20211029124437.20721-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add helper functions to read/read modify write pin config.

Switch to use helper functions for pins supporting PIN_CONFIG_INPUT_ENABLE
capabilities.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 78 +++++++++++++++++--------
 1 file changed, 54 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 20b2af889ca9..f294ae7b8b5a 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -91,6 +91,8 @@
 #define SD_CH(n)		(0x3000 + (n) * 4)
 #define QSPI			(0x3008)
 
+#define PORT_PIN_CFG_OFFSET	0x80
+
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
 #define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
 
@@ -424,6 +426,52 @@ static int rzg2l_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return ret;
 }
 
+static u32 rzg2l_read_pin_config(struct rzg2l_pinctrl *pctrl, bool port_pin,
+				 u32 offset, u8 bit, u32 mask)
+{
+	void __iomem *addr = pctrl->base + offset;
+	unsigned long flags;
+	u32 reg;
+
+	if (port_pin)
+		addr += PORT_PIN_CFG_OFFSET;
+
+	/* handle _L/_H for 32-bit register read/write */
+	if (bit >= 4) {
+		bit -= 4;
+		addr += 4;
+	}
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+	reg = readl(addr) & (mask << (bit * 8));
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+	reg = (reg >> (bit * 8)) & mask;
+
+	return reg;
+}
+
+static void rzg2l_rmw_pin_config(struct rzg2l_pinctrl *pctrl, bool port_pin,
+				 u32 offset, u8 bit, u32 mask, u32 val)
+{
+	void __iomem *addr = pctrl->base + offset;
+	unsigned long flags;
+	u32 reg;
+
+	if (port_pin)
+		addr += PORT_PIN_CFG_OFFSET;
+
+	/* handle _L/_H for 32-bit register read/write */
+	if (bit >= 4) {
+		bit -= 4;
+		addr += 4;
+	}
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+	reg = readl(addr) & ~(mask << (bit * 8));
+	writel(reg | (val << (bit * 8)), addr);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+}
+
 static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 				     unsigned int _pin,
 				     unsigned long *config)
@@ -432,10 +480,11 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
 	unsigned int *pin_data = pin->drv_data;
+	bool port_pin = false;
 	unsigned int arg = 0;
 	unsigned long flags;
 	void __iomem *addr;
-	u32 port = 0, reg;
+	u32 port = 0;
 	u32 cfg = 0;
 	u8 bit = 0;
 
@@ -452,17 +501,8 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_INPUT_ENABLE:
 		if (!(cfg & PIN_CFG_IEN))
 			return -EINVAL;
-		spin_lock_irqsave(&pctrl->lock, flags);
-		/* handle _L/_H for 32-bit register read/write */
-		addr = pctrl->base + IEN(port);
-		if (bit >= 4) {
-			bit -= 4;
-			addr += 4;
-		}
 
-		reg = readl(addr) & (IEN_MASK << (bit * 8));
-		arg = (reg >> (bit * 8)) & 0x1;
-		spin_unlock_irqrestore(&pctrl->lock, flags);
+		arg = rzg2l_read_pin_config(pctrl, port_pin, IEN(port), bit, IEN_MASK);
 		break;
 
 	case PIN_CONFIG_POWER_SOURCE: {
@@ -502,10 +542,11 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
 	unsigned int *pin_data = pin->drv_data;
 	enum pin_config_param param;
+	bool port_pin = false;
 	unsigned long flags;
 	void __iomem *addr;
-	u32 port = 0, reg;
 	unsigned int i;
+	u32 port = 0;
 	u32 cfg = 0;
 	u8 bit = 0;
 
@@ -524,21 +565,10 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 		case PIN_CONFIG_INPUT_ENABLE: {
 			unsigned int arg =
 					pinconf_to_config_argument(_configs[i]);
-
 			if (!(cfg & PIN_CFG_IEN))
 				return -EINVAL;
 
-			/* handle _L/_H for 32-bit register read/write */
-			addr = pctrl->base + IEN(port);
-			if (bit >= 4) {
-				bit -= 4;
-				addr += 4;
-			}
-
-			spin_lock_irqsave(&pctrl->lock, flags);
-			reg = readl(addr) & ~(IEN_MASK << (bit * 8));
-			writel(reg | (arg << (bit * 8)), addr);
-			spin_unlock_irqrestore(&pctrl->lock, flags);
+			rzg2l_rmw_pin_config(pctrl, port_pin, IEN(port), bit, IEN_MASK, !!arg);
 			break;
 		}
 
-- 
2.17.1

