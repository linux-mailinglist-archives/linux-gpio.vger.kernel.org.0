Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 910C734C67E
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 10:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbhC2IID (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 04:08:03 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:50911 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231906AbhC2IGZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 04:06:25 -0400
X-UUID: 6c2084c3583847ee842745b39865989f-20210329
X-UUID: 6c2084c3583847ee842745b39865989f-20210329
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1735290150; Mon, 29 Mar 2021 16:06:21 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 16:06:20 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Mar 2021 16:06:18 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>,
        <jg_poxu@mediatek.com>, <biao.huang@mediatek.com>,
        <hongzhou.yang@mediatek.com>, <erin.lo@mediatek.com>,
        <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        <sj.huang@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH 5/6] pinctrl: add drive for I2C related pins on MT8195
Date:   Mon, 29 Mar 2021 16:06:09 +0800
Message-ID: <20210329080611.9312-6-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210329080611.9312-1-zhiyong.tao@mediatek.com>
References: <20210329080611.9312-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch provides the advanced drive raw data setting version
for I2C used pins on MT8195.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 22 +++++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 14 ++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  5 +++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
index 063f164d7c9b..a7500e18bb1d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
@@ -760,6 +760,25 @@ static const struct mtk_pin_field_calc mt8195_pin_drv_range[] = {
 	PIN_FIELD_BASE(143, 143, 1, 0x020, 0x10, 24, 3),
 };
 
+static const struct mtk_pin_field_calc mt8195_pin_drv_adv_range[] = {
+	PIN_FIELD_BASE(8, 8, 4, 0x020, 0x10, 15, 3),
+	PIN_FIELD_BASE(9, 9, 4, 0x020, 0x10, 0, 3),
+	PIN_FIELD_BASE(10, 10, 4, 0x020, 0x10, 18, 3),
+	PIN_FIELD_BASE(11, 11, 4, 0x020, 0x10, 3, 3),
+	PIN_FIELD_BASE(12, 12, 4, 0x020, 0x10, 21, 3),
+	PIN_FIELD_BASE(13, 13, 4, 0x020, 0x10, 6, 3),
+	PIN_FIELD_BASE(14, 14, 4, 0x020, 0x10, 24, 3),
+	PIN_FIELD_BASE(15, 15, 4, 0x020, 0x10, 9, 3),
+	PIN_FIELD_BASE(16, 16, 4, 0x020, 0x10, 27, 3),
+	PIN_FIELD_BASE(17, 17, 4, 0x020, 0x10, 12, 3),
+	PIN_FIELD_BASE(29, 29, 2, 0x020, 0x10, 0, 3),
+	PIN_FIELD_BASE(30, 30, 2, 0x020, 0x10, 3, 3),
+	PIN_FIELD_BASE(34, 34, 1, 0x040, 0x10, 0, 3),
+	PIN_FIELD_BASE(35, 35, 1, 0x040, 0x10, 3, 3),
+	PIN_FIELD_BASE(44, 44, 1, 0x040, 0x10, 6, 3),
+	PIN_FIELD_BASE(45, 45, 1, 0x040, 0x10, 9, 3),
+};
+
 static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8195_pin_mode_range),
 	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8195_pin_dir_range),
@@ -773,6 +792,7 @@ static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
 	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt8195_pin_pupd_range),
 	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8195_pin_r0_range),
 	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8195_pin_r1_range),
+	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8195_pin_drv_adv_range),
 };
 
 static const char * const mt8195_pinctrl_register_base_names[] = {
@@ -801,6 +821,8 @@ static const struct mtk_pin_soc mt8195_data = {
 	.bias_get_combo = mtk_pinconf_bias_get_combo,
 	.drive_set = mtk_pinconf_drive_set_rev1,
 	.drive_get = mtk_pinconf_drive_get_rev1,
+	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
+	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,
 };
 
 static const struct of_device_id mt8195_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 72f17f26acd8..2b51f4a9b860 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -1027,6 +1027,20 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get);
 
+int mtk_pinconf_adv_drive_set_raw(struct mtk_pinctrl *hw,
+				  const struct mtk_pin_desc *desc, u32 arg)
+{
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV_ADV, arg);
+}
+EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_set_raw);
+
+int mtk_pinconf_adv_drive_get_raw(struct mtk_pinctrl *hw,
+				  const struct mtk_pin_desc *desc, u32 *val)
+{
+	return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV_ADV, val);
+}
+EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get_raw);
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_DESCRIPTION("Pin configuration library module for mediatek SoCs");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index e2aae285b5fc..fd5ce9c5dcbd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -66,6 +66,7 @@ enum {
 	PINCTRL_PIN_REG_DRV_EN,
 	PINCTRL_PIN_REG_DRV_E0,
 	PINCTRL_PIN_REG_DRV_E1,
+	PINCTRL_PIN_REG_DRV_ADV,
 	PINCTRL_PIN_REG_MAX,
 };
 
@@ -314,6 +315,10 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc, u32 arg);
 int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc, u32 *val);
+int mtk_pinconf_adv_drive_set_raw(struct mtk_pinctrl *hw,
+				  const struct mtk_pin_desc *desc, u32 arg);
+int mtk_pinconf_adv_drive_get_raw(struct mtk_pinctrl *hw,
+				  const struct mtk_pin_desc *desc, u32 *val);
 
 bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n);
 #endif /* __PINCTRL_MTK_COMMON_V2_H */
-- 
2.18.0

