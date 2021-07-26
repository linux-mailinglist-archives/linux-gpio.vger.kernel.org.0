Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41EBC3D53DA
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 09:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbhGZGhA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 02:37:00 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:56688 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232307AbhGZGg7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 02:36:59 -0400
X-UUID: 47b170a8835d494498e0fb4f6ea05f59-20210726
X-UUID: 47b170a8835d494498e0fb4f6ea05f59-20210726
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1103810837; Mon, 26 Jul 2021 15:17:26 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 15:17:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Jul 2021 15:17:24 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH 04/12] pinctrl: mediatek: moore: use pin number in mtk_pin_desc instead of array index
Date:   Mon, 26 Jul 2021 15:14:31 +0800
Message-ID: <20210726071439.14248-5-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210726071439.14248-1-sam.shih@mediatek.com>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Certain SoC are missing the middle part gpios in consecutive pins,
it's better to use pin number in mtk_pin_desc instead of array index
for the extensibility

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 61 ++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 3a4a23c40a71..16206254ec3d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -35,6 +35,19 @@ static const struct pin_config_item mtk_conf_items[] = {
 };
 #endif
 
+static int mtk_pin_desc_lookup(struct mtk_pinctrl *hw, int pin)
+{
+	int idx;
+
+	for (idx = 0 ; idx < hw->soc->npins ; idx++)
+		if (hw->soc->pins[idx].number == pin)
+			break;
+	if (idx < hw->soc->npins)
+		return idx;
+
+	return -EINVAL;
+}
+
 static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned int selector, unsigned int group)
 {
@@ -74,6 +87,13 @@ static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	const struct mtk_pin_desc *desc;
+	int err;
+
+	err = mtk_pin_desc_lookup(hw, pin);
+	if (err >= 0)
+		pin = err;
+	else
+		return err;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
@@ -87,6 +107,13 @@ static int mtk_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	const struct mtk_pin_desc *desc;
+	int err;
+
+	err = mtk_pin_desc_lookup(hw, pin);
+	if (err >= 0)
+		pin = err;
+	else
+		return err;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
@@ -102,6 +129,12 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 	int val, val2, err, reg, ret = 1;
 	const struct mtk_pin_desc *desc;
 
+	err = mtk_pin_desc_lookup(hw, pin);
+	if (err >= 0)
+		pin = err;
+	else
+		return err;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
 	switch (param) {
@@ -217,6 +250,12 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	u32 reg, param, arg;
 	int cfg, err = 0;
 
+	err = mtk_pin_desc_lookup(hw, pin);
+	if (err >= 0)
+		pin = err;
+	else
+		return err;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
 	for (cfg = 0; cfg < num_configs; cfg++) {
@@ -434,6 +473,12 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
+	err = mtk_pin_desc_lookup(hw, gpio);
+	if (err >= 0)
+		gpio = err;
+	else
+		return err;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
@@ -447,6 +492,15 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
+	int err;
+
+	err = mtk_pin_desc_lookup(hw, gpio);
+	if (err >= 0) {
+		gpio = err;
+	} else {
+		dev_err(hw->dev, "Failed to set gpio %d\n", gpio);
+		return;
+	}
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
@@ -488,6 +542,13 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 	u32 debounce;
+	int err;
+
+	err = mtk_pin_desc_lookup(hw, offset);
+	if (err >= 0)
+		offset = err;
+	else
+		return err;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
 
-- 
2.29.2

