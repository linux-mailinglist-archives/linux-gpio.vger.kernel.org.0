Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFE1E3FAF4C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Aug 2021 02:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236234AbhH3AhQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 Aug 2021 20:37:16 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:57772 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236223AbhH3AhP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 29 Aug 2021 20:37:15 -0400
X-UUID: 52a13ddaa9824f65ba261dacaa6d11ae-20210830
X-UUID: 52a13ddaa9824f65ba261dacaa6d11ae-20210830
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1252332981; Mon, 30 Aug 2021 08:36:18 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 08:36:17 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 Aug 2021 08:36:16 +0800
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
Subject: [PATCH v11 4/4] pinctrl: mediatek: add rsel setting on MT8195
Date:   Mon, 30 Aug 2021 08:36:03 +0800
Message-ID: <20210830003603.31864-5-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch provides rsel setting on MT8195

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 133 +++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 181 ++++++++++++++++--
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  35 +++-
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  24 ++-
 drivers/pinctrl/mediatek/pinctrl-paris.h      |   2 +-
 5 files changed, 348 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
index 892e79703f98..275b7ba4386d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
@@ -779,6 +779,135 @@ static const struct mtk_pin_field_calc mt8195_pin_drv_adv_range[] = {
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
+static const struct mtk_pin_rsel mt8195_pin_rsel_val_range[] = {
+	PIN_RSEL(8, 17, 0x0, 75000, 75000),
+	PIN_RSEL(8, 17, 0x1, 10000, 5000),
+	PIN_RSEL(8, 17, 0x2, 5000, 75000),
+	PIN_RSEL(8, 17, 0x3, 4000, 5000),
+	PIN_RSEL(8, 17, 0x4, 3000, 75000),
+	PIN_RSEL(8, 17, 0x5, 2000, 5000),
+	PIN_RSEL(8, 17, 0x6, 1500, 75000),
+	PIN_RSEL(8, 17, 0x7, 1000, 5000),
+	PIN_RSEL(29, 30, 0x0, 75000, 75000),
+	PIN_RSEL(29, 30, 0x1, 10000, 5000),
+	PIN_RSEL(29, 30, 0x2, 5000, 75000),
+	PIN_RSEL(29, 30, 0x3, 4000, 5000),
+	PIN_RSEL(29, 30, 0x4, 3000, 75000),
+	PIN_RSEL(29, 30, 0x5, 2000, 5000),
+	PIN_RSEL(29, 30, 0x6, 1500, 75000),
+	PIN_RSEL(29, 30, 0x7, 1000, 5000),
+	PIN_RSEL(34, 35, 0x0, 75000, 75000),
+	PIN_RSEL(34, 35, 0x1, 10000, 5000),
+	PIN_RSEL(34, 35, 0x2, 5000, 75000),
+	PIN_RSEL(34, 35, 0x3, 4000, 5000),
+	PIN_RSEL(34, 35, 0x4, 3000, 75000),
+	PIN_RSEL(34, 35, 0x5, 2000, 5000),
+	PIN_RSEL(34, 35, 0x6, 1500, 75000),
+	PIN_RSEL(34, 35, 0x7, 1000, 5000),
+	PIN_RSEL(44, 45, 0x0, 75000, 75000),
+	PIN_RSEL(44, 45, 0x1, 10000, 5000),
+	PIN_RSEL(44, 45, 0x2, 5000, 75000),
+	PIN_RSEL(44, 45, 0x3, 4000, 5000),
+	PIN_RSEL(44, 45, 0x4, 3000, 75000),
+	PIN_RSEL(44, 45, 0x5, 2000, 5000),
+	PIN_RSEL(44, 45, 0x6, 1500, 75000),
+	PIN_RSEL(44, 45, 0x7, 1000, 5000),
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
@@ -793,6 +922,7 @@ static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8195_pin_r0_range),
 	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8195_pin_r1_range),
 	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8195_pin_drv_adv_range),
+	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt8195_pin_rsel_range),
 };
 
 static const char * const mt8195_pinctrl_register_base_names[] = {
@@ -817,6 +947,9 @@ static const struct mtk_pin_soc mt8195_data = {
 	.gpio_m = 0,
 	.base_names = mt8195_pinctrl_register_base_names,
 	.nbase_names = ARRAY_SIZE(mt8195_pinctrl_register_base_names),
+	.pull_type = mt8195_pull_type,
+	.pin_rsel = mt8195_pin_rsel_val_range,
+	.npin_rsel = ARRAY_SIZE(mt8195_pin_rsel_val_range),
 	.bias_set_combo = mtk_pinconf_bias_set_combo,
 	.bias_get_combo = mtk_pinconf_bias_get_combo,
 	.drive_set = mtk_pinconf_drive_set_rev1,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 5b3b048725cc..b6a89d41f040 100644
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
@@ -661,6 +664,75 @@ static int mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
 	return err;
 }
 
+static int mtk_hw_pin_rsel_lookup(struct mtk_pinctrl *hw,
+				  const struct mtk_pin_desc *desc,
+				  u32 pullup, u32 arg, u32 *rsel_val)
+{
+	const struct mtk_pin_rsel *rsel;
+	int check;
+	bool found = false;
+
+	rsel = hw->soc->pin_rsel;
+
+	for (check = 0; check <= hw->soc->npin_rsel - 1; check++) {
+		if (desc->number >= rsel[check].s_pin &&
+		    desc->number <= rsel[check].e_pin) {
+			if (pullup) {
+				if (rsel[check].up_rsel == arg) {
+					found = true;
+					*rsel_val = rsel[check].rsel_index;
+					break;
+				}
+			} else {
+				if (rsel[check].down_rsel == arg) {
+					found = true;
+					*rsel_val = rsel[check].rsel_index;
+					break;
+				}
+			}
+		}
+	}
+
+	if (!found) {
+		dev_err(hw->dev, "Not support rsel value %d Ohm for pin = %d (%s)\n",
+			arg, desc->number, desc->name);
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int mtk_pinconf_bias_set_rsel(struct mtk_pinctrl *hw,
+				     const struct mtk_pin_desc *desc,
+				     u32 pullup, u32 arg)
+{
+	int err, rsel_val;
+
+	if (hw->soc->pin_rsel) {
+		/* find pin rsel_index from pin_rsel array*/
+		err = mtk_hw_pin_rsel_lookup(hw, desc, pullup, arg, &rsel_val);
+		if (err)
+			goto out;
+	} else {
+		if (arg < MTK_PULL_SET_RSEL_000 ||
+		    arg > MTK_PULL_SET_RSEL_111) {
+			err = -EINVAL;
+			goto out;
+		}
+
+		rsel_val -= MTK_PULL_SET_RSEL_000;
+	}
+
+	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_RSEL, rsel_val);
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
@@ -742,44 +814,117 @@ static int mtk_pinconf_bias_get_pupd_r1_r0(struct mtk_pinctrl *hw,
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
+
+	if (try_all_type ||
+	    (hw->soc->pull_type[desc->number] & MTK_PULL_PU_PD_TYPE)) {
+		err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
+		if (!err)
+			return err;
+	}
 
-	err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup, enable);
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
index a6f1bdb2083b..a3d73f153efe 100644
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
@@ -42,6 +49,14 @@
 	PIN_FIELD_CALC(_s_pin, _e_pin, 0, _s_addr, _x_addrs, _s_bit,	\
 		       _x_bits, 32, 1)
 
+#define PIN_RSEL(_s_pin, _e_pin, _rsel_index, _up_resl, _down_rsel) {	\
+		.s_pin = _s_pin,					\
+		.e_pin = _e_pin,					\
+		.rsel_index = _rsel_index,				\
+		.up_rsel = _up_resl,					\
+		.down_rsel = _down_rsel,				\
+	}
+
 /* List these attributes which could be modified for the pin */
 enum {
 	PINCTRL_PIN_REG_MODE,
@@ -67,6 +82,7 @@ enum {
 	PINCTRL_PIN_REG_DRV_E0,
 	PINCTRL_PIN_REG_DRV_E1,
 	PINCTRL_PIN_REG_DRV_ADV,
+	PINCTRL_PIN_REG_RSEL,
 	PINCTRL_PIN_REG_MAX,
 };
 
@@ -129,6 +145,21 @@ struct mtk_pin_field_calc {
 	u8  fixed;
 };
 
+/* struct mtk_pin_rsel - the structure that providing bias resistance selection.
+ * @s_pin:		the start pin within the rsel range
+ * @e_pin:		the end pin within the rsel range
+ * @rsel_index:	the rsel bias resistance index
+ * @up_rsel:	the pullup rsel bias resistance value
+ * @down_rsel:	the pulldown rsel bias resistance value
+ */
+struct mtk_pin_rsel {
+	u16 s_pin;
+	u16 e_pin;
+	u16 rsel_index;
+	u32 up_rsel;
+	u32 down_rsel;
+};
+
 /* struct mtk_pin_reg_calc - the structure that holds all ranges used to
  *			     determine which register the pin would make use of
  *			     for certain pin attribute.
@@ -206,6 +237,9 @@ struct mtk_pin_soc {
 	bool				ies_present;
 	const char * const		*base_names;
 	unsigned int			nbase_names;
+	const unsigned int		*pull_type;
+	const struct mtk_pin_rsel	*pin_rsel;
+	unsigned int			npin_rsel;
 
 	/* Specific pinconfig operations */
 	int (*bias_disable_set)(struct mtk_pinctrl *hw,
@@ -237,7 +271,6 @@ struct mtk_pin_soc {
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

