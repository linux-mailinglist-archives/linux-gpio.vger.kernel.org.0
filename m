Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F5644CD04
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 23:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbhKJWtX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 17:49:23 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:61074 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233795AbhKJWtV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Nov 2021 17:49:21 -0500
X-IronPort-AV: E=Sophos;i="5.87,225,1631545200"; 
   d="scan'208";a="100143068"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Nov 2021 07:46:32 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 43C75413162C;
        Thu, 11 Nov 2021 07:46:30 +0900 (JST)
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
Subject: [PATCH v3 2/6] pinctrl: renesas: pinctrl-rzg2l: Rename RZG2L_SINGLE_PIN_GET_PORT macro
Date:   Wed, 10 Nov 2021 22:46:18 +0000
Message-Id: <20211110224622.16022-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename RZG2L_SINGLE_PIN_GET_PORT -> RZG2L_SINGLE_PIN_GET_PORT_OFFSET.

Also, rename port -> port_offset in rzg2l_pinctrl_pinconf_set/get for
readability.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3
* New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 20b2af889ca9..be9af717a497 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -77,7 +77,7 @@
 #define RZG2L_SINGLE_PIN		BIT(31)
 #define RZG2L_SINGLE_PIN_PACK(p, b, f)	(RZG2L_SINGLE_PIN | \
 					 ((p) << 24) | ((b) << 20) | (f))
-#define RZG2L_SINGLE_PIN_GET_PORT(x)	(((x) & GENMASK(30, 24)) >> 24)
+#define RZG2L_SINGLE_PIN_GET_PORT_OFFSET(x)	(((x) & GENMASK(30, 24)) >> 24)
 #define RZG2L_SINGLE_PIN_GET_BIT(x)	(((x) & GENMASK(22, 20)) >> 20)
 #define RZG2L_SINGLE_PIN_GET_CFGS(x)	((x) & GENMASK(19, 0))
 
@@ -432,10 +432,10 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
 	unsigned int *pin_data = pin->drv_data;
+	u32 port_offset = 0, reg;
 	unsigned int arg = 0;
 	unsigned long flags;
 	void __iomem *addr;
-	u32 port = 0, reg;
 	u32 cfg = 0;
 	u8 bit = 0;
 
@@ -443,7 +443,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	if (*pin_data & RZG2L_SINGLE_PIN) {
-		port = RZG2L_SINGLE_PIN_GET_PORT(*pin_data);
+		port_offset = RZG2L_SINGLE_PIN_GET_PORT_OFFSET(*pin_data);
 		cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
 		bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
 	}
@@ -454,7 +454,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 			return -EINVAL;
 		spin_lock_irqsave(&pctrl->lock, flags);
 		/* handle _L/_H for 32-bit register read/write */
-		addr = pctrl->base + IEN(port);
+		addr = pctrl->base + IEN(port_offset);
 		if (bit >= 4) {
 			bit -= 4;
 			addr += 4;
@@ -502,9 +502,9 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
 	unsigned int *pin_data = pin->drv_data;
 	enum pin_config_param param;
+	u32 port_offset = 0, reg;
 	unsigned long flags;
 	void __iomem *addr;
-	u32 port = 0, reg;
 	unsigned int i;
 	u32 cfg = 0;
 	u8 bit = 0;
@@ -513,7 +513,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	if (*pin_data & RZG2L_SINGLE_PIN) {
-		port = RZG2L_SINGLE_PIN_GET_PORT(*pin_data);
+		port_offset = RZG2L_SINGLE_PIN_GET_PORT_OFFSET(*pin_data);
 		cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
 		bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
 	}
@@ -529,7 +529,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 				return -EINVAL;
 
 			/* handle _L/_H for 32-bit register read/write */
-			addr = pctrl->base + IEN(port);
+			addr = pctrl->base + IEN(port_offset);
 			if (bit >= 4) {
 				bit -= 4;
 				addr += 4;
-- 
2.17.1

