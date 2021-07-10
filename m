Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6103C33B9
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jul 2021 10:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232315AbhGJIUT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Jul 2021 04:20:19 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58340 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232165AbhGJIUR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Jul 2021 04:20:17 -0400
X-UUID: c95fd11b20a74effb078797734c5d04a-20210710
X-UUID: c95fd11b20a74effb078797734c5d04a-20210710
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 110359811; Sat, 10 Jul 2021 16:17:28 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 16:17:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Jul 2021 16:17:26 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>,
        <light.hsieh@mediatek.com>, <biao.huang@mediatek.com>,
        <hongzhou.yang@mediatek.com>, <sean.wang@mediatek.com>,
        <seiya.wang@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v10 2/2] pinctrl: mediatek: add rsel setting on MT8195
Date:   Sat, 10 Jul 2021 16:17:22 +0800
Message-ID: <20210710081722.1828-3-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch provides rsel setting on MT8195

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  96 +++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 134 +++++++++++++++---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  10 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  24 +++-
 drivers/pinctrl/mediatek/pinctrl-paris.h      |   2 +-
 5 files changed, 239 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
index a7500e18bb1d..ccfdbac94544 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
@@ -779,6 +779,100 @@ static const struct mtk_pin_field_calc mt8195_pin_drv_adv_range[] = {
 	PIN_FIELD_BASE(45, 45, 1, 0x040, 0x10, 9, 3),
 };
 
+static const struct mtk_pin_field_calc mt8195_pin_rsel_range[] = {
+	PIN_FIELD_BASE(8, 8, 4, 0x0c0, 0x10, 15, 3),
+	PIN_FIELD_BASE(9, 9, 4, 0x0c0, 0x10, 0, 3),
+	PIN_FIELD_BASE(10, 10, 4, 0x0c0, 0x10, 18, 3),
+	PIN_FIELD_BASE(11, 11, 4, 0x0c0, 0x10, 3, 3),
+	PIN_FIELD_BASE(12, 12, 4, 0x0c0, 0x10, 21, 3),
+	PIN_FIELD_BASE(13, 13, 4, 0x0c0, 0x10, 6, 3),
+	PIN_FIELD_BASE(14, 14, 4, 0x0c0, 0x10, 24, 3),
+	PIN_FIELD_BASE(15, 15, 4, 0x0c0, 0x10, 9, 3),
+	PIN_FIELD_BASE(16, 16, 4, 0x0c0, 0x10, 27, 3),
+	PIN_FIELD_BASE(17, 17, 4, 0x0c0, 0x10, 12, 3),
+	PIN_FIELD_BASE(29, 29, 2, 0x080, 0x10, 0, 3),
+	PIN_FIELD_BASE(30, 30, 2, 0x080, 0x10, 3, 3),
+	PIN_FIELD_BASE(34, 34, 1, 0x0e0, 0x10, 0, 3),
+	PIN_FIELD_BASE(35, 35, 1, 0x0e0, 0x10, 3, 3),
+	PIN_FIELD_BASE(44, 44, 1, 0x0e0, 0x10, 6, 3),
+	PIN_FIELD_BASE(45, 45, 1, 0x0e0, 0x10, 9, 3),
+};
+
+static const unsigned int mt8195_pull_type[] = {
+	MTK_PULL_PUPD_R1R0_TYPE /* 0 */, MTK_PULL_PUPD_R1R0_TYPE /* 1 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 2 */, MTK_PULL_PUPD_R1R0_TYPE /* 3 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 4 */, MTK_PULL_PUPD_R1R0_TYPE /* 5 */,
+	MTK_PULL_PU_PD_TYPE /* 6 */, MTK_PULL_PU_PD_TYPE /* 7 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 8 */, MTK_PULL_PU_PD_RSEL_TYPE /* 9 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 10 */, MTK_PULL_PU_PD_RSEL_TYPE /* 11 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 12 */, MTK_PULL_PU_PD_RSEL_TYPE /* 13 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 14 */, MTK_PULL_PU_PD_RSEL_TYPE /* 15 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 16 */, MTK_PULL_PU_PD_RSEL_TYPE /* 17 */,
+	MTK_PULL_PU_PD_TYPE /* 18 */, MTK_PULL_PU_PD_TYPE /* 19 */,
+	MTK_PULL_PU_PD_TYPE /* 20 */, MTK_PULL_PU_PD_TYPE /* 21 */,
+	MTK_PULL_PU_PD_TYPE /* 22 */, MTK_PULL_PU_PD_TYPE /* 23 */,
+	MTK_PULL_PU_PD_TYPE /* 24 */, MTK_PULL_PU_PD_TYPE /* 25 */,
+	MTK_PULL_PU_PD_TYPE /* 26 */, MTK_PULL_PU_PD_TYPE /* 27 */,
+	MTK_PULL_PU_PD_TYPE /* 28 */, MTK_PULL_PU_PD_RSEL_TYPE /* 29 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 30 */, MTK_PULL_PU_PD_TYPE /* 31 */,
+	MTK_PULL_PU_PD_TYPE /* 32 */, MTK_PULL_PU_PD_TYPE /* 33 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 34 */, MTK_PULL_PU_PD_RSEL_TYPE /* 35 */,
+	MTK_PULL_PU_PD_TYPE /* 36 */, MTK_PULL_PU_PD_TYPE /* 37 */,
+	MTK_PULL_PU_PD_TYPE /* 38 */, MTK_PULL_PU_PD_TYPE /* 39 */,
+	MTK_PULL_PU_PD_TYPE /* 40 */, MTK_PULL_PU_PD_TYPE /* 41 */,
+	MTK_PULL_PU_PD_TYPE /* 42 */, MTK_PULL_PU_PD_TYPE /* 43 */,
+	MTK_PULL_PU_PD_RSEL_TYPE /* 44 */, MTK_PULL_PU_PD_RSEL_TYPE /* 45 */,
+	MTK_PULL_PU_PD_TYPE /* 46 */, MTK_PULL_PU_PD_TYPE /* 47 */,
+	MTK_PULL_PU_PD_TYPE /* 48 */, MTK_PULL_PU_PD_TYPE /* 49 */,
+	MTK_PULL_PU_PD_TYPE /* 50 */, MTK_PULL_PU_PD_TYPE /* 51 */,
+	MTK_PULL_PU_PD_TYPE /* 52 */, MTK_PULL_PU_PD_TYPE /* 53 */,
+	MTK_PULL_PU_PD_TYPE /* 54 */, MTK_PULL_PU_PD_TYPE /* 55 */,
+	MTK_PULL_PU_PD_TYPE /* 56 */, MTK_PULL_PU_PD_TYPE /* 57 */,
+	MTK_PULL_PU_PD_TYPE /* 58 */, MTK_PULL_PU_PD_TYPE /* 59 */,
+	MTK_PULL_PU_PD_TYPE /* 60 */, MTK_PULL_PU_PD_TYPE /* 61 */,
+	MTK_PULL_PU_PD_TYPE /* 62 */, MTK_PULL_PU_PD_TYPE /* 63 */,
+	MTK_PULL_PU_PD_TYPE /* 64 */, MTK_PULL_PU_PD_TYPE /* 65 */,
+	MTK_PULL_PU_PD_TYPE /* 66 */, MTK_PULL_PU_PD_TYPE /* 67 */,
+	MTK_PULL_PU_PD_TYPE /* 68 */, MTK_PULL_PU_PD_TYPE /* 69 */,
+	MTK_PULL_PU_PD_TYPE /* 70 */, MTK_PULL_PU_PD_TYPE /* 71 */,
+	MTK_PULL_PU_PD_TYPE /* 72 */, MTK_PULL_PU_PD_TYPE /* 73 */,
+	MTK_PULL_PU_PD_TYPE /* 74 */, MTK_PULL_PU_PD_TYPE /* 75 */,
+	MTK_PULL_PU_PD_TYPE /* 76 */, MTK_PULL_PUPD_R1R0_TYPE /* 77 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 78 */, MTK_PULL_PUPD_R1R0_TYPE /* 79 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 80 */, MTK_PULL_PUPD_R1R0_TYPE /* 81 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 82 */, MTK_PULL_PUPD_R1R0_TYPE /* 83 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 84 */, MTK_PULL_PUPD_R1R0_TYPE /* 85 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 86 */, MTK_PULL_PUPD_R1R0_TYPE /* 87 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 88 */, MTK_PULL_PUPD_R1R0_TYPE /* 89 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 90 */, MTK_PULL_PUPD_R1R0_TYPE /* 91 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 92 */, MTK_PULL_PUPD_R1R0_TYPE /* 93 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 94 */, MTK_PULL_PUPD_R1R0_TYPE /* 95 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 96 */, MTK_PULL_PU_PD_TYPE /* 97 */,
+	MTK_PULL_PU_PD_TYPE /* 98 */, MTK_PULL_PU_PD_TYPE /* 99 */,
+	MTK_PULL_PU_PD_TYPE /* 100 */, MTK_PULL_PU_PD_TYPE /* 101 */,
+	MTK_PULL_PU_PD_TYPE /* 102 */, MTK_PULL_PU_PD_TYPE /* 103 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 104 */, MTK_PULL_PUPD_R1R0_TYPE /* 105 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 106 */, MTK_PULL_PUPD_R1R0_TYPE /* 107 */,
+	MTK_PULL_PU_PD_TYPE /* 108 */, MTK_PULL_PU_PD_TYPE /* 109 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 110 */, MTK_PULL_PUPD_R1R0_TYPE /* 111 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 112 */, MTK_PULL_PUPD_R1R0_TYPE /* 113 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 114 */, MTK_PULL_PUPD_R1R0_TYPE /* 115 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 116 */, MTK_PULL_PUPD_R1R0_TYPE /* 117 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 118 */, MTK_PULL_PUPD_R1R0_TYPE /* 119 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 120 */, MTK_PULL_PUPD_R1R0_TYPE /* 121 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 122 */, MTK_PULL_PUPD_R1R0_TYPE /* 123 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 124 */, MTK_PULL_PUPD_R1R0_TYPE /* 125 */,
+	MTK_PULL_PUPD_R1R0_TYPE /* 126 */, MTK_PULL_PUPD_R1R0_TYPE /* 127 */,
+	MTK_PULL_PU_PD_TYPE /* 128 */, MTK_PULL_PU_PD_TYPE /* 129 */,
+	MTK_PULL_PU_PD_TYPE /* 130 */, MTK_PULL_PU_PD_TYPE /* 131 */,
+	MTK_PULL_PU_PD_TYPE /* 132 */, MTK_PULL_PU_PD_TYPE /* 133 */,
+	MTK_PULL_PU_PD_TYPE /* 134 */, MTK_PULL_PU_PD_TYPE /* 135 */,
+	MTK_PULL_PU_PD_TYPE /* 136 */, MTK_PULL_PU_PD_TYPE /* 137 */,
+	MTK_PULL_PU_PD_TYPE /* 138 */, MTK_PULL_PU_PD_TYPE /* 139 */,
+	MTK_PULL_PU_PD_TYPE /* 140 */, MTK_PULL_PU_PD_TYPE /* 141 */,
+	MTK_PULL_PU_PD_TYPE /* 142 */, MTK_PULL_PU_PD_TYPE /* 143 */,
+};
+
 static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8195_pin_mode_range),
 	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8195_pin_dir_range),
@@ -793,6 +887,7 @@ static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8195_pin_r0_range),
 	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8195_pin_r1_range),
 	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8195_pin_drv_adv_range),
+	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt8195_pin_rsel_range),
 };
 
 static const char * const mt8195_pinctrl_register_base_names[] = {
@@ -817,6 +912,7 @@ static const struct mtk_pin_soc mt8195_data = {
 	.gpio_m = 0,
 	.base_names = mt8195_pinctrl_register_base_names,
 	.nbase_names = ARRAY_SIZE(mt8195_pinctrl_register_base_names),
+	.pull_type = mt8195_pull_type,
 	.bias_set_combo = mtk_pinconf_bias_set_combo,
 	.bias_get_combo = mtk_pinconf_bias_get_combo,
 	.drive_set = mtk_pinconf_drive_set_rev1,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 5b3b048725cc..d51c1b79300c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -641,6 +641,9 @@ static int mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
 	} else if (arg == MTK_PUPD_SET_R1R0_11) {
 		r0 = 1;
 		r1 = 1;
+	} else if (arg == MTK_ENABLE) {
+		r0 = 1;
+		r1 = 0;
 	} else {
 		err = -EINVAL;
 		goto out;
@@ -661,6 +664,28 @@ static int mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
 	return err;
 }
 
+static int mtk_pinconf_bias_set_rsel(struct mtk_pinctrl *hw,
+				     const struct mtk_pin_desc *desc,
+				     u32 pullup, u32 arg)
+{
+	int err;
+
+	if (arg < MTK_PULL_SET_RSEL_000 || arg > MTK_PULL_SET_RSEL_111) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	arg -= MTK_PULL_SET_RSEL_000;
+	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_RSEL, arg);
+	if (err)
+		goto out;
+
+	err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, MTK_ENABLE);
+
+out:
+	return err;
+}
+
 static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
 				const struct mtk_pin_desc *desc,
 				u32 *pullup, u32 *enable)
@@ -742,44 +767,117 @@ static int mtk_pinconf_bias_get_pupd_r1_r0(struct mtk_pinctrl *hw,
 	return err;
 }
 
-int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
-				const struct mtk_pin_desc *desc,
-				u32 pullup, u32 arg)
+static int mtk_pinconf_bias_get_rsel(struct mtk_pinctrl *hw,
+				     const struct mtk_pin_desc *desc,
+				     u32 *pullup, u32 *enable)
 {
-	int err;
+	int pu, pd, rsel, err;
 
-	err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
-	if (!err)
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_RSEL, &rsel);
+	if (err)
 		goto out;
 
-	err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc, pullup, arg);
-	if (!err)
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PU, &pu);
+	if (err)
 		goto out;
 
-	err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc, pullup, arg);
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PD, &pd);
+
+	if (pu == 0 && pd == 0) {
+		*pullup = 0;
+		*enable = MTK_DISABLE;
+	} else if (pu == 1 && pd == 0) {
+		*pullup = 1;
+		*enable = rsel + MTK_PULL_SET_RSEL_000;
+	} else if (pu == 0 && pd == 1) {
+		*pullup = 0;
+		*enable = rsel + MTK_PULL_SET_RSEL_000;
+	} else {
+		err = -EINVAL;
+		goto out;
+	}
 
 out:
 	return err;
 }
+
+int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc,
+			       u32 pullup, u32 arg)
+{
+	int err = -EOPNOTSUPP;
+	bool try_all_type;
+
+	try_all_type = hw->soc->pull_type ? false : true;
+
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_RSEL_TYPE)) {
+		err = mtk_pinconf_bias_set_rsel(hw, desc, pullup, arg);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_PU_PD_TYPE)) {
+		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_PULLSEL_TYPE)) {
+		err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc,
+							  pullup, arg);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_PUPD_R1R0_TYPE)) {
+		err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc, pullup, arg);
+		if (err)
+			dev_err(hw->dev, "Invalid pull argument\n");
+	}
+
+	return err;
+}
 EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
 
 int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc,
 			      u32 *pullup, u32 *enable)
 {
-	int err;
+	int err = -EOPNOTSUPP;
+	bool try_all_type;
 
-	err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
-	if (!err)
-		goto out;
+	try_all_type = hw->soc->pull_type ? false : true;
 
-	err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc, pullup, enable);
-	if (!err)
-		goto out;
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_RSEL_TYPE)) {
+		err = mtk_pinconf_bias_get_rsel(hw, desc, pullup, enable);
+		if (!err)
+			return err;
+	}
 
-	err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup, enable);
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_PU_PD_TYPE)) {
+		err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_PULLSEL_TYPE)) {
+		err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc,
+							  pullup, enable);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_PUPD_R1R0_TYPE))
+		err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup, enable);
 
-out:
 	return err;
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_combo);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index a6f1bdb2083b..491ae4b3a8cc 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -17,6 +17,13 @@
 #define MTK_ENABLE     1
 #define MTK_PULLDOWN   0
 #define MTK_PULLUP     1
+#define MTK_PULL_PU_PD_TYPE		BIT(0)
+#define MTK_PULL_PULLSEL_TYPE		BIT(1)
+#define MTK_PULL_PUPD_R1R0_TYPE		BIT(2)
+#define MTK_PULL_RSEL_TYPE		BIT(3)
+#define MTK_PULL_PU_PD_RSEL_TYPE	(MTK_PULL_PU_PD_TYPE \
+					| MTK_PULL_RSEL_TYPE)
+
 
 #define EINT_NA	U16_MAX
 #define NO_EINT_SUPPORT	EINT_NA
@@ -67,6 +74,7 @@ enum {
 	PINCTRL_PIN_REG_DRV_E0,
 	PINCTRL_PIN_REG_DRV_E1,
 	PINCTRL_PIN_REG_DRV_ADV,
+	PINCTRL_PIN_REG_RSEL,
 	PINCTRL_PIN_REG_MAX,
 };
 
@@ -206,6 +214,7 @@ struct mtk_pin_soc {
 	bool				ies_present;
 	const char * const		*base_names;
 	unsigned int			nbase_names;
+	const unsigned int		*pull_type;
 
 	/* Specific pinconfig operations */
 	int (*bias_disable_set)(struct mtk_pinctrl *hw,
@@ -237,7 +246,6 @@ struct mtk_pin_soc {
 			     const struct mtk_pin_desc *desc, u32 arg);
 	int (*adv_drive_get)(struct mtk_pinctrl *hw,
 			     const struct mtk_pin_desc *desc, u32 *val);
-
 	/* Specific driver data */
 	void				*driver_data;
 };
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 85db2e4377f0..8990cfe47d72 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -577,9 +577,9 @@ static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int
 	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DRV)
 
 ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
-	unsigned int gpio, char *buf, unsigned int bufLen)
+	unsigned int gpio, char *buf, unsigned int buf_len)
 {
-	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
+	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1, rsel = -1;
 	const struct mtk_pin_desc *desc;
 
 	if (gpio >= hw->soc->npins)
@@ -591,6 +591,8 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 		pinmux -= hw->soc->nfuncs;
 
 	mtk_pinconf_bias_get_combo(hw, desc, &pullup, &pullen);
+
+	/* Case for: R1R0 */
 	if (pullen == MTK_PUPD_SET_R1R0_00) {
 		pullen = 0;
 		r1 = 0;
@@ -607,10 +609,16 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 		pullen = 1;
 		r1 = 1;
 		r0 = 1;
-	} else if (pullen != MTK_DISABLE && pullen != MTK_ENABLE) {
-		pullen = 0;
 	}
-	len += scnprintf(buf + len, bufLen - len,
+
+	/* Case for: RSEL */
+	if (pullen >= MTK_PULL_SET_RSEL_000 &&
+	    pullen <= MTK_PULL_SET_RSEL_111) {
+		rsel = pullen - MTK_PULL_SET_RSEL_000;
+		pullen = 1;
+	}
+
+	len += scnprintf(buf + len, buf_len - len,
 			"%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
 			gpio,
 			pinmux,
@@ -624,10 +632,12 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 			pullup);
 
 	if (r1 != -1) {
-		len += scnprintf(buf + len, bufLen - len, " (%1d %1d)\n",
+		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
 			r1, r0);
+	} else if (rsel != -1) {
+		len += scnprintf(buf + len, buf_len - len, " (%1d)\n", rsel);
 	} else {
-		len += scnprintf(buf + len, bufLen - len, "\n");
+		len += scnprintf(buf + len, buf_len - len, "\n");
 	}
 
 	return len;
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
index afb7650fd25b..681267c0e1a4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.h
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
@@ -61,7 +61,7 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc);
 
 ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
-	unsigned int gpio, char *buf, unsigned int bufLen);
+	unsigned int gpio, char *buf, unsigned int buf_len);
 
 extern const struct dev_pm_ops mtk_paris_pinctrl_pm_ops;
 
-- 
2.18.0

