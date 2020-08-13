Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E8F243550
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 09:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHMHt0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 03:49:26 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:39088 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbgHMHt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 03:49:26 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 07D7nAfN5028965, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 07D7nAfN5028965
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 13 Aug 2020 15:49:10 +0800
Received: from RTEXMB05.realtek.com.tw (172.21.6.98) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:49:10 +0800
Received: from RTEXMB05.realtek.com.tw (172.21.6.98) by
 RTEXMB05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:49:09 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXMB01.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server id
 15.1.1779.2 via Frontend Transport; Thu, 13 Aug 2020 15:49:09 +0800
From:   TY Chang <tychang@realtek.com>
To:     <linux-realtek-soc@lists.infradead.org>, <afaerber@suse.de>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 9/9] pinctrl: realtek: DHC: Add suspend/resume callback function.
Date:   Thu, 13 Aug 2020 15:49:08 +0800
Message-ID: <20200813074908.889-10-tychang@realtek.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813074908.889-1-tychang@realtek.com>
References: <20200813074908.889-1-tychang@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add suspend and resume callback function for
Realtek DHC SoC pinctrl driver.

Signed-off-by: TY Chang <tychang@realtek.com>
---
 drivers/pinctrl/realtek/pinctrl-rtd.c     | 39 +++++++++++++
 drivers/pinctrl/realtek/pinctrl-rtd1195.h | 33 +++++++++++
 drivers/pinctrl/realtek/pinctrl-rtd1295.h | 67 ++++++++++++++++++++++-
 3 files changed, 138 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 5dc4fac9c8bb..2fc2d4d46928 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -77,6 +77,12 @@ struct rtd_pin_desc {
 		}
 
 
+struct rtd_pin_reg_list {
+	unsigned int reg_offset;
+	unsigned int val;
+};
+
+
 #define RTK_PIN_CONFIG(_name, _reg_off, _base_bit, _pud_en_off, \
 		_pud_sel_off, _curr_off, _smt_off, _curr_type) \
 	{ \
@@ -120,6 +126,8 @@ struct rtd_pinctrl_desc {
 	unsigned int num_configs;
 	const struct rtd_pin_sconfig_desc *sconfigs;
 	unsigned int num_sconfigs;
+	struct rtd_pin_reg_list *lists;
+	unsigned int num_regs;
 };
 
 #define PCONF_UNSUPP 0xffffffff
@@ -643,8 +651,39 @@ static int rtd_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int rtd_pinctrl_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct rtd_pinctrl *data = platform_get_drvdata(pdev);
+	struct rtd_pin_reg_list *list;
+	int i;
+
+	for (i = 0; i < data->info->num_regs; i++) {
+		list = &data->info->lists[i];
+		list->val = readl(data->base + list->reg_offset);
+	}
+
+	return 0;
+}
+
+static int rtd_pinctrl_resume(struct platform_device *pdev)
+{
+	struct rtd_pinctrl *data = platform_get_drvdata(pdev);
+	const struct rtd_pin_reg_list *list;
+	int i;
+
+	for (i = 0; i < data->info->num_regs; i++) {
+		list = &data->info->lists[i];
+		writel(list->val, data->base + list->reg_offset);
+	}
+
+	return 0;
+}
+
+
 static struct platform_driver rtd_pinctrl_driver = {
 	.probe = rtd_pinctrl_probe,
+	.suspend = rtd_pinctrl_suspend,
+	.resume = rtd_pinctrl_resume,
 	.driver = {
 		.name = "rtd-pinctrl",
 		.of_match_table	= rtd_pinctrl_dt_ids,
diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1195.h b/drivers/pinctrl/realtek/pinctrl-rtd1195.h
index 74139345083c..c9d6e7894d66 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd1195.h
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1195.h
@@ -358,6 +358,16 @@ static const struct rtd_pin_config_desc rtd1195_iso_configs[] = {
 };
 
 
+static struct rtd_pin_reg_list rtd1195_iso_reg_lists[] = {
+	{.reg_offset = 0x0},
+	{.reg_offset = 0x4},
+	{.reg_offset = 0x8},
+	{.reg_offset = 0xc},
+	{.reg_offset = 0x10},
+	{.reg_offset = 0x14},
+};
+
+
 static const struct rtd_pinctrl_desc rtd1195_iso_pinctrl_desc = {
 	.pins = rtd1195_iso_pins,
 	.num_pins = ARRAY_SIZE(rtd1195_iso_pins),
@@ -369,6 +379,8 @@ static const struct rtd_pinctrl_desc rtd1195_iso_pinctrl_desc = {
 	.num_muxes = ARRAY_SIZE(rtd1195_iso_muxes),
 	.configs = rtd1195_iso_configs,
 	.num_configs = ARRAY_SIZE(rtd1195_iso_configs),
+	.lists = rtd1195_iso_reg_lists,
+	.num_regs = ARRAY_SIZE(rtd1195_iso_reg_lists),
 };
 
 /* CRT */
@@ -1110,6 +1122,25 @@ static const struct rtd_pin_config_desc rtd1195_crt_configs[] = {
 	RTK_PIN_CONFIG(sensor_cko_1, 0x9c, 28, 1, 0, 2, 3, PADDRI_2_4),
 };
 
+static struct rtd_pin_reg_list rtd1195_crt_reg_lists[] = {
+	{.reg_offset = 0x60},
+	{.reg_offset = 0x64},
+	{.reg_offset = 0x68},
+	{.reg_offset = 0x6c},
+	{.reg_offset = 0x70},
+	{.reg_offset = 0x74},
+	{.reg_offset = 0x78},
+	{.reg_offset = 0x7c},
+	{.reg_offset = 0x80},
+	{.reg_offset = 0x84},
+	{.reg_offset = 0x88},
+	{.reg_offset = 0x8c},
+	{.reg_offset = 0x90},
+	{.reg_offset = 0x94},
+	{.reg_offset = 0x98},
+	{.reg_offset = 0x9c},
+};
+
 
 static const struct rtd_pinctrl_desc rtd1195_crt_pinctrl_desc = {
 	.pins = rtd1195_crt_pins,
@@ -1122,6 +1153,8 @@ static const struct rtd_pinctrl_desc rtd1195_crt_pinctrl_desc = {
 	.num_muxes = ARRAY_SIZE(rtd1195_crt_muxes),
 	.configs = rtd1195_crt_configs,
 	.num_configs = ARRAY_SIZE(rtd1195_crt_configs),
+	.lists = rtd1195_crt_reg_lists,
+	.num_regs = ARRAY_SIZE(rtd1195_crt_reg_lists),
 };
 
 #endif
diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1295.h b/drivers/pinctrl/realtek/pinctrl-rtd1295.h
index 84feacabae7d..27026c47b307 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd1295.h
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1295.h
@@ -525,7 +525,17 @@ static const struct rtd_pin_config_desc rtd1295_iso_configs[] = {
 	RTK_PIN_CONFIG(iso_gpio_34, 0x20, 4, 1, 0, 2, 3, 2),
 };
 
-
+static struct rtd_pin_reg_list rtd1295_iso_reg_lists[] = {
+	{.reg_offset = 0x0},
+	{.reg_offset = 0x4},
+	{.reg_offset = 0x8},
+	{.reg_offset = 0xc},
+	{.reg_offset = 0x10},
+	{.reg_offset = 0x14},
+	{.reg_offset = 0x18},
+	{.reg_offset = 0x1c},
+	{.reg_offset = 0x20},
+};
 
 static const struct rtd_pinctrl_desc rtd1295_iso_pinctrl_desc = {
 	.pins = rtd1295_iso_pins,
@@ -538,6 +548,8 @@ static const struct rtd_pinctrl_desc rtd1295_iso_pinctrl_desc = {
 	.num_muxes = ARRAY_SIZE(rtd1295_iso_muxes),
 	.configs = rtd1295_iso_configs,
 	.num_configs = ARRAY_SIZE(rtd1295_iso_configs),
+	.lists = rtd1295_iso_reg_lists,
+	.num_regs = ARRAY_SIZE(rtd1295_iso_reg_lists),
 };
 
 /* SB2 */
@@ -1225,6 +1237,28 @@ static const struct rtd_pin_config_desc rtd1295_sb2_configs[] = {
 	RTK_PIN_CONFIG(rgmii1_rxd_3, 0x78, 12, 1, 0, 2, 3, PADDRI_4_8),
 };
 
+static struct rtd_pin_reg_list rtd1295_sb2_reg_lists[] = {
+	{.reg_offset = 0x8},
+	{.reg_offset = 0xc},
+	{.reg_offset = 0x10},
+	{.reg_offset = 0x14},
+	{.reg_offset = 0x28},
+	{.reg_offset = 0x14},
+	{.reg_offset = 0x2c},
+	{.reg_offset = 0x30},
+	{.reg_offset = 0x34},
+	{.reg_offset = 0x38},
+	{.reg_offset = 0x3c},
+	{.reg_offset = 0x60},
+	{.reg_offset = 0x64},
+	{.reg_offset = 0x68},
+	{.reg_offset = 0x6c},
+	{.reg_offset = 0x70},
+	{.reg_offset = 0x74},
+	{.reg_offset = 0x78},
+	{.reg_offset = 0x7c},
+};
+
 
 static const struct rtd_pinctrl_desc rtd1295_sb2_pinctrl_desc = {
 	.pins = rtd1295_sb2_pins,
@@ -1237,6 +1271,8 @@ static const struct rtd_pinctrl_desc rtd1295_sb2_pinctrl_desc = {
 	.num_muxes = ARRAY_SIZE(rtd1295_sb2_muxes),
 	.configs = rtd1295_sb2_configs,
 	.num_configs = ARRAY_SIZE(rtd1295_sb2_configs),
+	.lists = rtd1295_sb2_reg_lists,
+	.num_regs = ARRAY_SIZE(rtd1295_sb2_reg_lists),
 };
 
 /* Disp */
@@ -1373,6 +1409,12 @@ static const struct rtd_pin_config_desc rtd1295_disp_configs[] = {
 	RTK_PIN_CONFIG(ao_sd_3, 0x4, 24, 1, 0, 2, 3, PADDRI_2_4),
 };
 
+static struct rtd_pin_reg_list rtd1295_disp_reg_lists[] = {
+	{.reg_offset = 0x0},
+	{.reg_offset = 0x4},
+	{.reg_offset = 0x8},
+};
+
 
 static const struct rtd_pinctrl_desc rtd1295_disp_pinctrl_desc = {
 	.pins = rtd1295_disp_pins,
@@ -1385,6 +1427,8 @@ static const struct rtd_pinctrl_desc rtd1295_disp_pinctrl_desc = {
 	.num_muxes = ARRAY_SIZE(rtd1295_disp_muxes),
 	.configs = rtd1295_disp_configs,
 	.num_configs = ARRAY_SIZE(rtd1295_disp_configs),
+	.lists = rtd1295_disp_reg_lists,
+	.num_regs = ARRAY_SIZE(rtd1295_disp_reg_lists),
 };
 
 /* CR */
@@ -1857,6 +1901,25 @@ static const struct rtd_pin_sconfig_desc rtd1295_cr_sconfigs[] = {
 	RTK_PIN_SCONFIG(sdio_data_3, 0x40, 24, 4, 28, 4),
 };
 
+static struct rtd_pin_reg_list rtd1295_cr_reg_lists[] = {
+	{.reg_offset = 0x0},
+	{.reg_offset = 0x4},
+	{.reg_offset = 0x8},
+	{.reg_offset = 0xc},
+	{.reg_offset = 0x10},
+	{.reg_offset = 0x14},
+	{.reg_offset = 0x18},
+	{.reg_offset = 0x1c},
+	{.reg_offset = 0x20},
+	{.reg_offset = 0x24},
+	{.reg_offset = 0x28},
+	{.reg_offset = 0x2c},
+	{.reg_offset = 0x30},
+	{.reg_offset = 0x34},
+	{.reg_offset = 0x38},
+	{.reg_offset = 0x3c},
+	{.reg_offset = 0x40},
+};
 
 
 static const struct rtd_pinctrl_desc rtd1295_cr_pinctrl_desc = {
@@ -1872,6 +1935,8 @@ static const struct rtd_pinctrl_desc rtd1295_cr_pinctrl_desc = {
 	.num_configs = ARRAY_SIZE(rtd1295_cr_configs),
 	.sconfigs = rtd1295_cr_sconfigs,
 	.num_sconfigs = ARRAY_SIZE(rtd1295_cr_sconfigs),
+	.lists = rtd1295_cr_reg_lists,
+	.num_regs = ARRAY_SIZE(rtd1295_cr_reg_lists),
 };
 
 #endif
-- 
2.28.0

