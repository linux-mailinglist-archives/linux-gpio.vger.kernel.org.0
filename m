Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F257B44CD09
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 23:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233621AbhKJWtf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 17:49:35 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:62570 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233880AbhKJWtZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Nov 2021 17:49:25 -0500
X-IronPort-AV: E=Sophos;i="5.87,225,1631545200"; 
   d="scan'208";a="100143078"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Nov 2021 07:46:37 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1BA30413162C;
        Thu, 11 Nov 2021 07:46:34 +0900 (JST)
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
Subject: [PATCH v3 4/6] pinctrl: renesas: pinctrl-rzg2l: Add support to get/set pin config for GPIO port pins
Date:   Wed, 10 Nov 2021 22:46:20 +0000
Message-Id: <20211110224622.16022-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support to get/set pin config for GPIO port pins.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3
* Introduced RZG2L_PIN_ID_TO_PORT_OFFSET
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 984c19328efa..2b8aea40b95f 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -106,6 +106,7 @@
 #define PM_OUTPUT		0x2
 
 #define RZG2L_PIN_ID_TO_PORT(id)	((id) / RZG2L_PINS_PER_PORT)
+#define RZG2L_PIN_ID_TO_PORT_OFFSET(id)	(RZG2L_PIN_ID_TO_PORT(id) + 0x10)
 #define RZG2L_PIN_ID_TO_PIN(id)		((id) % RZG2L_PINS_PER_PORT)
 
 struct rzg2l_dedicated_configs {
@@ -424,6 +425,23 @@ static int rzg2l_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return ret;
 }
 
+static int rzg2l_validate_gpio_pin(struct rzg2l_pinctrl *pctrl,
+				   u32 cfg, u32 port, u8 bit)
+{
+	u8 pincount = RZG2L_GPIO_PORT_GET_PINCNT(cfg);
+	u32 port_index = RZG2L_GPIO_PORT_GET_INDEX(cfg);
+	u32 data;
+
+	if (bit >= pincount || port >= pctrl->data->n_port_pins)
+		return -EINVAL;
+
+	data = pctrl->data->port_pin_configs[port];
+	if (port_index != RZG2L_GPIO_PORT_GET_INDEX(data))
+		return -EINVAL;
+
+	return 0;
+}
+
 static u32 rzg2l_read_pin_config(struct rzg2l_pinctrl *pctrl, u32 offset,
 				 u8 bit, u32 mask)
 {
@@ -476,6 +494,13 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		port_offset = RZG2L_SINGLE_PIN_GET_PORT_OFFSET(*pin_data);
 		cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
 		bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
+	} else {
+		cfg = RZG2L_GPIO_PORT_GET_CFGS(*pin_data);
+		port_offset = RZG2L_PIN_ID_TO_PORT_OFFSET(_pin);
+		bit = RZG2L_PIN_ID_TO_PIN(_pin);
+
+		if (rzg2l_validate_gpio_pin(pctrl, *pin_data, RZG2L_PIN_ID_TO_PORT(_pin), bit))
+			return -EINVAL;
 	}
 
 	switch (param) {
@@ -536,6 +561,13 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 		port_offset = RZG2L_SINGLE_PIN_GET_PORT_OFFSET(*pin_data);
 		cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
 		bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
+	} else {
+		cfg = RZG2L_GPIO_PORT_GET_CFGS(*pin_data);
+		port_offset = RZG2L_PIN_ID_TO_PORT_OFFSET(_pin);
+		bit = RZG2L_PIN_ID_TO_PIN(_pin);
+
+		if (rzg2l_validate_gpio_pin(pctrl, *pin_data, RZG2L_PIN_ID_TO_PORT(_pin), bit))
+			return -EINVAL;
 	}
 
 	for (i = 0; i < num_configs; i++) {
-- 
2.17.1

