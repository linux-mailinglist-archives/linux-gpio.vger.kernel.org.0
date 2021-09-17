Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCCC40EF41
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 04:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242814AbhIQCdu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 22:33:50 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:35524 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S242793AbhIQCdt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 22:33:49 -0400
X-UUID: cb0cf0dc4afc464a959ffdd56053cfb6-20210917
X-UUID: cb0cf0dc4afc464a959ffdd56053cfb6-20210917
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1873398482; Fri, 17 Sep 2021 10:32:26 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 10:32:24 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Sep 2021 10:32:23 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>,
        <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
        <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v12 5/5] pinctrl: mediatek: add rsel setting on MT8195
Date:   Fri, 17 Sep 2021 10:32:16 +0800
Message-ID: <20210917023216.18384-6-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917023216.18384-1-zhiyong.tao@mediatek.com>
References: <20210917023216.18384-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I2C pins's resistance value can be controlled by rsel register.
This patch provides rsel (resistance selection) setting on MT8195

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8195.c | 133 ++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
index a7500e18bb1d..9ba86c80c07a 100644
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
-- 
2.25.1

