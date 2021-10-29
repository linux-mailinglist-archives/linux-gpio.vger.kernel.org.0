Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E2243FC86
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 14:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbhJ2MrV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 08:47:21 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:14605 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231695AbhJ2MrU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Oct 2021 08:47:20 -0400
X-IronPort-AV: E=Sophos;i="5.87,192,1631545200"; 
   d="scan'208";a="98894441"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 29 Oct 2021 21:44:51 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5FC39438EE72;
        Fri, 29 Oct 2021 21:44:49 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/5] pinctrl: renesas: pinctrl-rzg2l: Add support to get/set pin config for GPIO port pins
Date:   Fri, 29 Oct 2021 13:44:35 +0100
Message-Id: <20211029124437.20721-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support to get/set pin config for GPIO port pins.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index f294ae7b8b5a..bc34c63bbb36 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -426,6 +426,23 @@ static int rzg2l_dt_node_to_map(struct pinctrl_dev *pctldev,
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
 static u32 rzg2l_read_pin_config(struct rzg2l_pinctrl *pctrl, bool port_pin,
 				 u32 offset, u8 bit, u32 mask)
 {
@@ -495,6 +512,14 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		port = RZG2L_SINGLE_PIN_GET_PORT(*pin_data);
 		cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
 		bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
+	} else {
+		cfg = RZG2L_GPIO_PORT_GET_CFGS(*pin_data);
+		port = RZG2L_PIN_ID_TO_PORT(_pin);
+		bit = RZG2L_PIN_ID_TO_PIN(_pin);
+		port_pin = true;
+
+		if (rzg2l_validate_gpio_pin(pctrl, *pin_data, port, bit))
+			return -EINVAL;
 	}
 
 	switch (param) {
@@ -557,6 +582,14 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 		port = RZG2L_SINGLE_PIN_GET_PORT(*pin_data);
 		cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
 		bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
+	} else {
+		cfg = RZG2L_GPIO_PORT_GET_CFGS(*pin_data);
+		port = RZG2L_PIN_ID_TO_PORT(_pin);
+		bit = RZG2L_PIN_ID_TO_PIN(_pin);
+		port_pin = true;
+
+		if (rzg2l_validate_gpio_pin(pctrl, *pin_data, port, bit))
+			return -EINVAL;
 	}
 
 	for (i = 0; i < num_configs; i++) {
-- 
2.17.1

