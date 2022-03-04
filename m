Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9E8B4CCF10
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Mar 2022 08:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbiCDHbF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Mar 2022 02:31:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbiCDHbF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Mar 2022 02:31:05 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A009E2BB35;
        Thu,  3 Mar 2022 23:30:13 -0800 (PST)
X-UUID: 12d7aecf83114613a0bf3dbde39a0804-20220304
X-UUID: 12d7aecf83114613a0bf3dbde39a0804-20220304
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <guodong.liu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1038937608; Fri, 04 Mar 2022 15:30:07 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 4 Mar 2022 15:30:06 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Mar
 2022 15:30:05 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Mar 2022 15:30:04 +0800
Message-ID: <f10e3958656ee04f96ac7fb620d58d963842b064.camel@mediatek.com>
Subject: Re: [PATCH v5 2/3] pinctrl: add pinctrl driver on mt8186
From:   Guodong Liu <guodong.liu@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>
CC:     Sean Wang <sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Fri, 4 Mar 2022 15:30:04 +0800
In-Reply-To: <20220216032124.28067-3-guodong.liu@mediatek.com>
References: <20220216032124.28067-1-guodong.liu@mediatek.com>
         <20220216032124.28067-3-guodong.liu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-----Original Message-----
From: Guodong Liu <guodong.liu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <
robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean
Wang <sean.wang@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-gpio@vger.kernel.org, 
devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
Project_Global_Chrome_Upstream_Group@mediatek.com, Guodong Liu <
guodong.liu@mediatek.com>
Subject: [PATCH v5 2/3] pinctrl: add pinctrl driver on mt8186
Date: Wed, 16 Feb 2022 11:21:23 +0800

Hello Angelo & Chen-Yu

    This patch is related to mt8186 pinctrl.
    Could you spare your time to review our patch?
    Thanks for your big support!
BRs,
Guodong

This commit includes pinctrl driver for mt8186.

Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8186.c     | 1271 ++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h | 2186 +++++++++++++++++
 4 files changed, 3465 insertions(+)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8186.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h

diff --git a/drivers/pinctrl/mediatek/Kconfig
b/drivers/pinctrl/mediatek/Kconfig
index 66db4ac5d169..8dca1ef04965 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -147,6 +147,13 @@ config PINCTRL_MT8183
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
+config PINCTRL_MT8186
+	bool "Mediatek MT8186 pin control"
+	depends on OF
+	depends on ARM64 || COMPILE_TEST
+	default ARM64 && ARCH_MEDIATEK
+	select PINCTRL_MTK_PARIS
+
 config PINCTRL_MT8192
 	bool "Mediatek MT8192 pin control"
 	depends on OF
diff --git a/drivers/pinctrl/mediatek/Makefile
b/drivers/pinctrl/mediatek/Makefile
index 90f43bb9d9a7..31c3784c6089 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_PINCTRL_MT7986)	+= pinctrl-mt7986.o
 obj-$(CONFIG_PINCTRL_MT8167)	+= pinctrl-mt8167.o
 obj-$(CONFIG_PINCTRL_MT8173)	+= pinctrl-mt8173.o
 obj-$(CONFIG_PINCTRL_MT8183)	+= pinctrl-mt8183.o
+obj-$(CONFIG_PINCTRL_MT8186)	+= pinctrl-mt8186.o
 obj-$(CONFIG_PINCTRL_MT8192)	+= pinctrl-mt8192.o
 obj-$(CONFIG_PINCTRL_MT8195)    += pinctrl-mt8195.o
 obj-$(CONFIG_PINCTRL_MT8365)	+= pinctrl-mt8365.o
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8186.c
b/drivers/pinctrl/mediatek/pinctrl-mt8186.c
new file mode 100644
index 000000000000..eeedab38c2b8
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8186.c
@@ -0,0 +1,1271 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ *
+ * Author: Guodong Liu <guodong.liu@mediatek.com>
+ *
+ */
+
+#include "pinctrl-mtk-mt8186.h"
+#include "pinctrl-paris.h"
+
+/* MT8186 have multiple bases to program pin configuration listed as
the below:
+ * iocfg[0]:0x10005000, iocfg[1]:0x10002000, iocfg[2]:0x10002200,
+ * iocfg[3]:0x10002400, iocfg[4]:0x10002600, iocfg[5]:0x10002800,
+ * iocfg[6]:0x10002C00.
+ * _i_based could be used to indicate what base the pin should be
mapped into.
+ */
+
+#define PIN_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit,
x_bits) \
+	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit,
x_bits, 32, 0)
+
+#define PINS_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit,
x_bits) \
+	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit,
x_bits, 32, 1)
+
+static const struct mtk_pin_field_calc mt8186_pin_mode_range[] = {
+	PIN_FIELD(0, 184, 0x300, 0x10, 0, 4),
+};
+
+static const struct mtk_pin_field_calc mt8186_pin_dir_range[] = {
+	PIN_FIELD(0, 184, 0x0, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8186_pin_di_range[] = {
+	PIN_FIELD(0, 184, 0x200, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8186_pin_do_range[] = {
+	PIN_FIELD(0, 184, 0x100, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8186_pin_ies_range[] = {
+	PIN_FIELD_BASE(0, 0, 6, 0x0030, 0x10, 13, 1),
+	PIN_FIELD_BASE(1, 1, 6, 0x0030, 0x10, 14, 1),
+	PIN_FIELD_BASE(2, 2, 6, 0x0030, 0x10, 17, 1),
+	PIN_FIELD_BASE(3, 3, 6, 0x0030, 0x10, 18, 1),
+	PIN_FIELD_BASE(4, 4, 6, 0x0030, 0x10, 19, 1),
+	PIN_FIELD_BASE(5, 5, 6, 0x0030, 0x10, 20, 1),
+	PIN_FIELD_BASE(6, 6, 4, 0x0020, 0x10, 19, 1),
+	PIN_FIELD_BASE(7, 7, 4, 0x0020, 0x10, 20, 1),
+	PIN_FIELD_BASE(8, 8, 4, 0x0020, 0x10, 21, 1),
+	PIN_FIELD_BASE(9, 9, 4, 0x0020, 0x10, 22, 1),
+	PIN_FIELD_BASE(10, 10, 4, 0x0020, 0x10, 16, 1),
+	PIN_FIELD_BASE(11, 11, 4, 0x0020, 0x10, 17, 1),
+	PIN_FIELD_BASE(12, 12, 4, 0x0020, 0x10, 18, 1),
+	PIN_FIELD_BASE(13, 13, 3, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(14, 14, 3, 0x0040, 0x10, 1, 1),
+	PIN_FIELD_BASE(15, 15, 6, 0x0030, 0x10, 15, 1),
+	PIN_FIELD_BASE(16, 16, 6, 0x0030, 0x10, 16, 1),
+	PIN_FIELD_BASE(17, 17, 5, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(18, 18, 5, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(19, 19, 5, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(20, 20, 5, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(21, 21, 5, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(22, 22, 5, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(23, 23, 5, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(24, 24, 5, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(25, 25, 5, 0x0050, 0x10, 18, 1),
+	PIN_FIELD_BASE(26, 26, 5, 0x0050, 0x10, 15, 1),
+	PIN_FIELD_BASE(27, 27, 5, 0x0050, 0x10, 17, 1),
+	PIN_FIELD_BASE(28, 28, 5, 0x0050, 0x10, 16, 1),
+	PIN_FIELD_BASE(29, 29, 6, 0x0030, 0x10, 0, 1),
+	PIN_FIELD_BASE(30, 30, 6, 0x0030, 0x10, 1, 1),
+	PIN_FIELD_BASE(31, 31, 6, 0x0030, 0x10, 2, 1),
+	PIN_FIELD_BASE(32, 32, 2, 0x0040, 0x10, 25, 1),
+	PIN_FIELD_BASE(33, 33, 2, 0x0040, 0x10, 27, 1),
+	PIN_FIELD_BASE(34, 34, 2, 0x0040, 0x10, 26, 1),
+	PIN_FIELD_BASE(35, 35, 2, 0x0040, 0x10, 28, 1),
+	PIN_FIELD_BASE(36, 36, 2, 0x0040, 0x10, 9, 1),
+	PIN_FIELD_BASE(37, 37, 2, 0x0040, 0x10, 10, 1),
+	PIN_FIELD_BASE(38, 38, 2, 0x0040, 0x10, 12, 1),
+	PIN_FIELD_BASE(39, 39, 2, 0x0040, 0x10, 11, 1),
+	PIN_FIELD_BASE(40, 40, 2, 0x0040, 0x10, 13, 1),
+	PIN_FIELD_BASE(41, 41, 2, 0x0040, 0x10, 14, 1),
+	PIN_FIELD_BASE(42, 42, 2, 0x0040, 0x10, 16, 1),
+	PIN_FIELD_BASE(43, 43, 2, 0x0040, 0x10, 15, 1),
+	PIN_FIELD_BASE(44, 44, 5, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(45, 45, 5, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(46, 46, 5, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(47, 47, 5, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(48, 48, 2, 0x0040, 0x10, 17, 1),
+	PIN_FIELD_BASE(49, 49, 2, 0x0040, 0x10, 18, 1),
+	PIN_FIELD_BASE(50, 50, 2, 0x0040, 0x10, 20, 1),
+	PIN_FIELD_BASE(51, 51, 2, 0x0040, 0x10, 19, 1),
+	PIN_FIELD_BASE(52, 52, 3, 0x0040, 0x10, 18, 1),
+	PIN_FIELD_BASE(53, 53, 3, 0x0040, 0x10, 19, 1),
+	PIN_FIELD_BASE(54, 54, 3, 0x0040, 0x10, 21, 1),
+	PIN_FIELD_BASE(55, 55, 3, 0x0040, 0x10, 20, 1),
+	PIN_FIELD_BASE(56, 56, 5, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(57, 57, 5, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(58, 58, 5, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(59, 59, 5, 0x0050, 0x10, 14, 1),
+	PIN_FIELD_BASE(60, 60, 3, 0x0040, 0x10, 27, 1),
+	PIN_FIELD_BASE(61, 61, 3, 0x0040, 0x10, 22, 1),
+	PIN_FIELD_BASE(62, 62, 3, 0x0040, 0x10, 28, 1),
+	PIN_FIELD_BASE(63, 63, 3, 0x0040, 0x10, 23, 1),
+	PIN_FIELD_BASE(64, 64, 3, 0x0040, 0x10, 24, 1),
+	PIN_FIELD_BASE(65, 65, 3, 0x0040, 0x10, 25, 1),
+	PIN_FIELD_BASE(66, 66, 3, 0x0040, 0x10, 26, 1),
+	PIN_FIELD_BASE(67, 67, 1, 0x0050, 0x10, 18, 1),
+	PIN_FIELD_BASE(68, 68, 1, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(69, 69, 1, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(70, 70, 1, 0x0050, 0x10, 19, 1),
+	PIN_FIELD_BASE(71, 71, 1, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(72, 72, 1, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(73, 73, 1, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(74, 74, 1, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(75, 75, 1, 0x0050, 0x10, 14, 1),
+	PIN_FIELD_BASE(76, 76, 1, 0x0050, 0x10, 15, 1),
+	PIN_FIELD_BASE(77, 77, 1, 0x0050, 0x10, 16, 1),
+	PIN_FIELD_BASE(78, 78, 1, 0x0050, 0x10, 17, 1),
+	PIN_FIELD_BASE(79, 79, 5, 0x0050, 0x10, 24, 1),
+	PIN_FIELD_BASE(80, 80, 5, 0x0050, 0x10, 25, 1),
+	PIN_FIELD_BASE(81, 81, 5, 0x0050, 0x10, 26, 1),
+	PIN_FIELD_BASE(82, 82, 5, 0x0050, 0x10, 27, 1),
+	PIN_FIELD_BASE(83, 83, 6, 0x0030, 0x10, 3, 1),
+	PIN_FIELD_BASE(84, 84, 3, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(85, 85, 3, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(86, 86, 3, 0x0040, 0x10, 6, 1),
+	PIN_FIELD_BASE(87, 87, 3, 0x0040, 0x10, 7, 1),
+	PIN_FIELD_BASE(88, 88, 3, 0x0040, 0x10, 8, 1),
+	PIN_FIELD_BASE(89, 89, 3, 0x0040, 0x10, 9, 1),
+	PIN_FIELD_BASE(90, 90, 3, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(91, 91, 3, 0x0040, 0x10, 29, 1),
+	PIN_FIELD_BASE(92, 92, 3, 0x0040, 0x10, 31, 1),
+	PIN_FIELD_BASE(93, 93, 3, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(94, 94, 3, 0x0040, 0x10, 30, 1),
+	PIN_FIELD_BASE(95, 95, 3, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(96, 96, 2, 0x0040, 0x10, 1, 1),
+	PIN_FIELD_BASE(97, 97, 2, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(98, 98, 2, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(99, 99, 4, 0x0020, 0x10, 14, 1),
+	PIN_FIELD_BASE(100, 100, 4, 0x0020, 0x10, 15, 1),
+	PIN_FIELD_BASE(101, 101, 4, 0x0020, 0x10, 13, 1),
+	PIN_FIELD_BASE(102, 102, 4, 0x0020, 0x10, 12, 1),
+	PIN_FIELD_BASE(103, 103, 4, 0x0020, 0x10, 0, 1),
+	PIN_FIELD_BASE(104, 104, 4, 0x0020, 0x10, 1, 1),
+	PIN_FIELD_BASE(105, 105, 4, 0x0020, 0x10, 4, 1),
+	PIN_FIELD_BASE(106, 106, 4, 0x0020, 0x10, 5, 1),
+	PIN_FIELD_BASE(107, 107, 4, 0x0020, 0x10, 6, 1),
+	PIN_FIELD_BASE(108, 108, 4, 0x0020, 0x10, 7, 1),
+	PIN_FIELD_BASE(109, 109, 4, 0x0020, 0x10, 8, 1),
+	PIN_FIELD_BASE(110, 110, 4, 0x0020, 0x10, 9, 1),
+	PIN_FIELD_BASE(111, 111, 4, 0x0020, 0x10, 10, 1),
+	PIN_FIELD_BASE(112, 112, 4, 0x0020, 0x10, 11, 1),
+	PIN_FIELD_BASE(113, 113, 4, 0x0020, 0x10, 2, 1),
+	PIN_FIELD_BASE(114, 114, 4, 0x0020, 0x10, 3, 1),
+	PIN_FIELD_BASE(115, 115, 3, 0x0040, 0x10, 10, 1),
+	PIN_FIELD_BASE(116, 116, 3, 0x0040, 0x10, 13, 1),
+	PIN_FIELD_BASE(117, 117, 3, 0x0040, 0x10, 11, 1),
+	PIN_FIELD_BASE(118, 118, 3, 0x0040, 0x10, 12, 1),
+	PIN_FIELD_BASE(119, 119, 5, 0x0050, 0x10, 22, 1),
+	PIN_FIELD_BASE(120, 120, 5, 0x0050, 0x10, 19, 1),
+	PIN_FIELD_BASE(121, 121, 5, 0x0050, 0x10, 20, 1),
+	PIN_FIELD_BASE(122, 122, 5, 0x0050, 0x10, 21, 1),
+	PIN_FIELD_BASE(123, 123, 5, 0x0050, 0x10, 23, 1),
+	PIN_FIELD_BASE(124, 124, 5, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(125, 125, 5, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(126, 126, 5, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(127, 127, 3, 0x0040, 0x10, 14, 1),
+	PIN_FIELD_BASE(128, 128, 3, 0x0040, 0x10, 16, 1),
+	PIN_FIELD_BASE(129, 129, 5, 0x0050, 0x10, 28, 1),
+	PIN_FIELD_BASE(130, 130, 5, 0x0050, 0x10, 30, 1),
+	PIN_FIELD_BASE(131, 131, 5, 0x0050, 0x10, 29, 1),
+	PIN_FIELD_BASE(132, 132, 5, 0x0050, 0x10, 31, 1),
+	PIN_FIELD_BASE(133, 133, 1, 0x0050, 0x10, 21, 1),
+	PIN_FIELD_BASE(134, 134, 1, 0x0050, 0x10, 24, 1),
+	PIN_FIELD_BASE(135, 135, 6, 0x0030, 0x10, 21, 1),
+	PIN_FIELD_BASE(136, 136, 6, 0x0030, 0x10, 24, 1),
+	PIN_FIELD_BASE(137, 137, 1, 0x0050, 0x10, 22, 1),
+	PIN_FIELD_BASE(138, 138, 1, 0x0050, 0x10, 25, 1),
+	PIN_FIELD_BASE(139, 139, 2, 0x0040, 0x10, 7, 1),
+	PIN_FIELD_BASE(140, 140, 2, 0x0040, 0x10, 8, 1),
+	PIN_FIELD_BASE(141, 141, 3, 0x0040, 0x10, 15, 1),
+	PIN_FIELD_BASE(142, 142, 3, 0x0040, 0x10, 17, 1),
+	PIN_FIELD_BASE(143, 143, 6, 0x0030, 0x10, 22, 1),
+	PIN_FIELD_BASE(144, 144, 6, 0x0030, 0x10, 25, 1),
+	PIN_FIELD_BASE(145, 145, 6, 0x0030, 0x10, 23, 1),
+	PIN_FIELD_BASE(146, 146, 6, 0x0030, 0x10, 26, 1),
+	PIN_FIELD_BASE(147, 147, 4, 0x0020, 0x10, 23, 1),
+	PIN_FIELD_BASE(148, 148, 4, 0x0020, 0x10, 24, 1),
+	PIN_FIELD_BASE(149, 149, 4, 0x0020, 0x10, 25, 1),
+	PIN_FIELD_BASE(150, 150, 4, 0x0020, 0x10, 26, 1),
+	PIN_FIELD_BASE(151, 151, 4, 0x0020, 0x10, 27, 1),
+	PIN_FIELD_BASE(152, 152, 4, 0x0020, 0x10, 28, 1),
+	PIN_FIELD_BASE(153, 153, 4, 0x0020, 0x10, 29, 1),
+	PIN_FIELD_BASE(154, 154, 4, 0x0020, 0x10, 30, 1),
+	PIN_FIELD_BASE(155, 155, 4, 0x0020, 0x10, 31, 1),
+	PIN_FIELD_BASE(156, 156, 4, 0x0030, 0x10, 0, 1),
+	PIN_FIELD_BASE(157, 157, 2, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(158, 158, 2, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(159, 159, 2, 0x0040, 0x10, 6, 1),
+	PIN_FIELD_BASE(160, 160, 2, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(161, 161, 2, 0x0040, 0x10, 23, 1),
+	PIN_FIELD_BASE(162, 162, 2, 0x0040, 0x10, 24, 1),
+	PIN_FIELD_BASE(163, 163, 1, 0x0050, 0x10, 23, 1),
+	PIN_FIELD_BASE(164, 164, 1, 0x0050, 0x10, 20, 1),
+	PIN_FIELD_BASE(165, 165, 1, 0x0050, 0x10, 26, 1),
+	PIN_FIELD_BASE(166, 166, 1, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(167, 167, 1, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(168, 168, 1, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(169, 169, 1, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(170, 170, 1, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(171, 171, 1, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(172, 172, 1, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(173, 173, 1, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(174, 174, 6, 0x0030, 0x10, 7, 1),
+	PIN_FIELD_BASE(175, 175, 6, 0x0030, 0x10, 8, 1),
+	PIN_FIELD_BASE(176, 176, 6, 0x0030, 0x10, 4, 1),
+	PIN_FIELD_BASE(177, 177, 6, 0x0030, 0x10, 5, 1),
+	PIN_FIELD_BASE(178, 178, 6, 0x0030, 0x10, 6, 1),
+	PIN_FIELD_BASE(179, 179, 6, 0x0030, 0x10, 9, 1),
+	PIN_FIELD_BASE(180, 180, 6, 0x0030, 0x10, 10, 1),
+	PIN_FIELD_BASE(181, 181, 6, 0x0030, 0x10, 11, 1),
+	PIN_FIELD_BASE(182, 182, 6, 0x0030, 0x10, 12, 1),
+	PIN_FIELD_BASE(183, 183, 2, 0x0040, 0x10, 21, 1),
+	PIN_FIELD_BASE(184, 184, 2, 0x0040, 0x10, 22, 1),
+};
+
+static const struct mtk_pin_field_calc mt8186_pin_smt_range[] = {
+	PIN_FIELD_BASE(0, 0, 6, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(1, 1, 6, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(2, 2, 6, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(3, 3, 6, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(4, 4, 6, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(5, 5, 6, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(6, 6, 4, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(7, 7, 4, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(8, 8, 4, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(9, 9, 4, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(10, 10, 4, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(11, 11, 4, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(12, 12, 4, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(13, 13, 3, 0x00e0, 0x10, 11, 1),
+	PIN_FIELD_BASE(14, 14, 3, 0x00e0, 0x10, 11, 1),
+	PIN_FIELD_BASE(15, 15, 6, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(16, 16, 6, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(17, 17, 5, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(18, 18, 5, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(19, 19, 5, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(20, 20, 5, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(21, 21, 5, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(22, 22, 5, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(23, 23, 5, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(24, 24, 5, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(25, 25, 5, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(26, 26, 5, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(27, 27, 5, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(28, 28, 5, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(29, 29, 6, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(30, 30, 6, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(31, 31, 6, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(32, 32, 2, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(33, 33, 2, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(34, 34, 2, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(35, 35, 2, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(36, 36, 2, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(37, 37, 2, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(38, 38, 2, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(39, 39, 2, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(40, 40, 2, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(41, 41, 2, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(42, 42, 2, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(43, 43, 2, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(44, 44, 5, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(45, 45, 5, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(46, 46, 5, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(47, 47, 5, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(48, 48, 2, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(49, 49, 2, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(50, 50, 2, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(51, 51, 2, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(52, 52, 3, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(53, 53, 3, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(54, 54, 3, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(55, 55, 3, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(56, 56, 5, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(57, 57, 5, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(58, 58, 5, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(59, 59, 5, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(60, 60, 3, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(61, 61, 3, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(62, 62, 3, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(63, 63, 3, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(64, 64, 3, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(65, 65, 3, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(66, 66, 3, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(67, 67, 1, 0x00f0, 0x10, 10, 1),
+	PIN_FIELD_BASE(68, 68, 1, 0x00f0, 0x10, 0, 1),
+	PIN_FIELD_BASE(69, 69, 1, 0x00f0, 0x10, 1, 1),
+	PIN_FIELD_BASE(70, 70, 1, 0x00f0, 0x10, 11, 1),
+	PIN_FIELD_BASE(71, 71, 1, 0x00f0, 0x10, 2, 1),
+	PIN_FIELD_BASE(72, 72, 1, 0x00f0, 0x10, 3, 1),
+	PIN_FIELD_BASE(73, 73, 1, 0x00f0, 0x10, 4, 1),
+	PIN_FIELD_BASE(74, 74, 1, 0x00f0, 0x10, 5, 1),
+	PIN_FIELD_BASE(75, 75, 1, 0x00f0, 0x10, 6, 1),
+	PIN_FIELD_BASE(76, 76, 1, 0x00f0, 0x10, 7, 1),
+	PIN_FIELD_BASE(77, 77, 1, 0x00f0, 0x10, 8, 1),
+	PIN_FIELD_BASE(78, 78, 1, 0x00f0, 0x10, 9, 1),
+	PIN_FIELD_BASE(79, 79, 5, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(80, 80, 5, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(81, 81, 5, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(82, 82, 5, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(83, 83, 6, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(84, 84, 3, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(85, 85, 3, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(86, 86, 3, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(87, 87, 3, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(88, 88, 3, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(89, 89, 3, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(90, 90, 3, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(91, 91, 3, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(92, 92, 3, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(93, 93, 3, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(94, 94, 3, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(95, 95, 3, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(96, 96, 2, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(97, 97, 2, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(98, 98, 2, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(99, 99, 4, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(100, 100, 4, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(101, 101, 4, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(102, 102, 4, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(103, 103, 4, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(104, 104, 4, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(105, 105, 4, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(106, 106, 4, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(107, 107, 4, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(108, 108, 4, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(109, 109, 4, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(110, 110, 4, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(111, 111, 4, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(112, 112, 4, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(113, 113, 4, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(114, 114, 4, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(115, 115, 3, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(116, 116, 3, 0x00e0, 0x10, 11, 1),
+	PIN_FIELD_BASE(117, 117, 3, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(118, 118, 3, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(119, 119, 5, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(120, 120, 5, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(121, 121, 5, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(122, 122, 5, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(123, 123, 5, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(124, 124, 5, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(125, 125, 5, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(126, 126, 5, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(127, 127, 3, 0x00e0, 0x10, 12, 1),
+	PIN_FIELD_BASE(128, 128, 3, 0x00e0, 0x10, 14, 1),
+	PIN_FIELD_BASE(129, 129, 5, 0x00e0, 0x10, 11, 1),
+	PIN_FIELD_BASE(130, 130, 5, 0x00e0, 0x10, 13, 1),
+	PIN_FIELD_BASE(131, 131, 5, 0x00e0, 0x10, 12, 1),
+	PIN_FIELD_BASE(132, 132, 5, 0x00e0, 0x10, 14, 1),
+	PIN_FIELD_BASE(133, 133, 1, 0x00f0, 0x10, 15, 1),
+	PIN_FIELD_BASE(134, 134, 1, 0x00f0, 0x10, 17, 1),
+	PIN_FIELD_BASE(135, 135, 6, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(136, 136, 6, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(137, 137, 1, 0x00f0, 0x10, 16, 1),
+	PIN_FIELD_BASE(138, 138, 1, 0x00f0, 0x10, 18, 1),
+	PIN_FIELD_BASE(139, 139, 2, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(140, 140, 2, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(141, 141, 3, 0x00e0, 0x10, 13, 1),
+	PIN_FIELD_BASE(142, 142, 3, 0x00e0, 0x10, 15, 1),
+	PIN_FIELD_BASE(143, 143, 6, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(144, 144, 6, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(145, 145, 6, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(146, 146, 6, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(147, 147, 4, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(148, 148, 4, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(149, 149, 4, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(150, 150, 4, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(151, 151, 4, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(152, 152, 4, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(153, 153, 4, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(154, 154, 4, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(155, 155, 4, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(156, 156, 4, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(157, 157, 2, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(158, 158, 2, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(159, 159, 2, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(160, 160, 2, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(161, 161, 2, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(162, 162, 2, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(163, 163, 1, 0x00f0, 0x10, 14, 1),
+	PIN_FIELD_BASE(164, 164, 1, 0x00f0, 0x10, 12, 1),
+	PIN_FIELD_BASE(165, 165, 1, 0x00f0, 0x10, 12, 1),
+	PIN_FIELD_BASE(166, 166, 1, 0x00f0, 0x10, 13, 1),
+	PIN_FIELD_BASE(167, 167, 1, 0x00f0, 0x10, 13, 1),
+	PIN_FIELD_BASE(168, 168, 1, 0x00f0, 0x10, 12, 1),
+	PIN_FIELD_BASE(169, 169, 1, 0x00f0, 0x10, 14, 1),
+	PIN_FIELD_BASE(170, 170, 1, 0x00f0, 0x10, 13, 1),
+	PIN_FIELD_BASE(171, 171, 1, 0x00f0, 0x10, 13, 1),
+	PIN_FIELD_BASE(172, 172, 1, 0x00f0, 0x10, 14, 1),
+	PIN_FIELD_BASE(173, 173, 1, 0x00f0, 0x10, 12, 1),
+	PIN_FIELD_BASE(174, 174, 6, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(175, 175, 6, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(176, 176, 6, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(177, 177, 6, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(178, 178, 6, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(179, 179, 6, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(180, 180, 6, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(181, 181, 6, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(182, 182, 6, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(183, 183, 2, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(184, 184, 2, 0x0090, 0x10, 10, 1),
+};
+
+static const struct mtk_pin_field_calc mt8186_pin_pu_range[] = {
+	PIN_FIELD_BASE(0, 0, 6, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(1, 1, 6, 0x0050, 0x10, 14, 1),
+	PIN_FIELD_BASE(2, 2, 6, 0x0050, 0x10, 17, 1),
+	PIN_FIELD_BASE(3, 3, 6, 0x0050, 0x10, 18, 1),
+	PIN_FIELD_BASE(4, 4, 6, 0x0050, 0x10, 19, 1),
+	PIN_FIELD_BASE(5, 5, 6, 0x0050, 0x10, 20, 1),
+	PIN_FIELD_BASE(6, 6, 4, 0x0060, 0x10, 19, 1),
+	PIN_FIELD_BASE(7, 7, 4, 0x0060, 0x10, 20, 1),
+	PIN_FIELD_BASE(8, 8, 4, 0x0060, 0x10, 21, 1),
+	PIN_FIELD_BASE(9, 9, 4, 0x0060, 0x10, 22, 1),
+	PIN_FIELD_BASE(10, 10, 4, 0x0060, 0x10, 16, 1),
+	PIN_FIELD_BASE(11, 11, 4, 0x0060, 0x10, 17, 1),
+	PIN_FIELD_BASE(12, 12, 4, 0x0060, 0x10, 18, 1),
+	PIN_FIELD_BASE(13, 13, 3, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(14, 14, 3, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(15, 15, 6, 0x0050, 0x10, 15, 1),
+	PIN_FIELD_BASE(16, 16, 6, 0x0050, 0x10, 16, 1),
+	PIN_FIELD_BASE(17, 17, 5, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(18, 18, 5, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(19, 19, 5, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(20, 20, 5, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(21, 21, 5, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(22, 22, 5, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(23, 23, 5, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(24, 24, 5, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(25, 25, 5, 0x0090, 0x10, 18, 1),
+	PIN_FIELD_BASE(26, 26, 5, 0x0090, 0x10, 15, 1),
+	PIN_FIELD_BASE(27, 27, 5, 0x0090, 0x10, 17, 1),
+	PIN_FIELD_BASE(28, 28, 5, 0x0090, 0x10, 16, 1),
+	PIN_FIELD_BASE(29, 29, 6, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(30, 30, 6, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(31, 31, 6, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(32, 32, 2, 0x0060, 0x10, 25, 1),
+	PIN_FIELD_BASE(33, 33, 2, 0x0060, 0x10, 27, 1),
+	PIN_FIELD_BASE(34, 34, 2, 0x0060, 0x10, 26, 1),
+	PIN_FIELD_BASE(35, 35, 2, 0x0060, 0x10, 28, 1),
+	PIN_FIELD_BASE(36, 36, 2, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(37, 37, 2, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(38, 38, 2, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(39, 39, 2, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(40, 40, 2, 0x0060, 0x10, 13, 1),
+	PIN_FIELD_BASE(41, 41, 2, 0x0060, 0x10, 14, 1),
+	PIN_FIELD_BASE(42, 42, 2, 0x0060, 0x10, 16, 1),
+	PIN_FIELD_BASE(43, 43, 2, 0x0060, 0x10, 15, 1),
+	PIN_FIELD_BASE(44, 44, 5, 0x0090, 0x10, 28, 1),
+	PIN_FIELD_BASE(45, 45, 5, 0x0090, 0x10, 29, 1),
+	PIN_FIELD_BASE(46, 46, 5, 0x0090, 0x10, 31, 1),
+	PIN_FIELD_BASE(47, 47, 5, 0x0090, 0x10, 30, 1),
+	PIN_FIELD_BASE(48, 48, 2, 0x0060, 0x10, 17, 1),
+	PIN_FIELD_BASE(49, 49, 2, 0x0060, 0x10, 18, 1),
+	PIN_FIELD_BASE(50, 50, 2, 0x0060, 0x10, 20, 1),
+	PIN_FIELD_BASE(51, 51, 2, 0x0060, 0x10, 19, 1),
+	PIN_FIELD_BASE(52, 52, 3, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(53, 53, 3, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(54, 54, 3, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(55, 55, 3, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(56, 56, 5, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(57, 57, 5, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(58, 58, 5, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(59, 59, 5, 0x0090, 0x10, 14, 1),
+	PIN_FIELD_BASE(60, 60, 3, 0x0080, 0x10, 21, 1),
+	PIN_FIELD_BASE(61, 61, 3, 0x0080, 0x10, 16, 1),
+	PIN_FIELD_BASE(62, 62, 3, 0x0080, 0x10, 22, 1),
+	PIN_FIELD_BASE(63, 63, 3, 0x0080, 0x10, 17, 1),
+	PIN_FIELD_BASE(64, 64, 3, 0x0080, 0x10, 18, 1),
+	PIN_FIELD_BASE(65, 65, 3, 0x0080, 0x10, 19, 1),
+	PIN_FIELD_BASE(66, 66, 3, 0x0080, 0x10, 20, 1),
+	PIN_FIELD_BASE(83, 83, 6, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(90, 90, 3, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(91, 91, 3, 0x0080, 0x10, 23, 1),
+	PIN_FIELD_BASE(92, 92, 3, 0x0080, 0x10, 25, 1),
+	PIN_FIELD_BASE(93, 93, 3, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(94, 94, 3, 0x0080, 0x10, 24, 1),
+	PIN_FIELD_BASE(95, 95, 3, 0x0080, 0x10, 26, 1),
+	PIN_FIELD_BASE(96, 96, 2, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(97, 97, 2, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(98, 98, 2, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(99, 99, 4, 0x0060, 0x10, 14, 1),
+	PIN_FIELD_BASE(100, 100, 4, 0x0060, 0x10, 15, 1),
+	PIN_FIELD_BASE(101, 101, 4, 0x0060, 0x10, 13, 1),
+	PIN_FIELD_BASE(102, 102, 4, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(103, 103, 4, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(104, 104, 4, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(105, 105, 4, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(106, 106, 4, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(107, 107, 4, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(108, 108, 4, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(109, 109, 4, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(110, 110, 4, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(111, 111, 4, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(112, 112, 4, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(113, 113, 4, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(114, 114, 4, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(115, 115, 3, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(116, 116, 3, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(117, 117, 3, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(118, 118, 3, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(119, 119, 5, 0x0090, 0x10, 22, 1),
+	PIN_FIELD_BASE(120, 120, 5, 0x0090, 0x10, 19, 1),
+	PIN_FIELD_BASE(121, 121, 5, 0x0090, 0x10, 20, 1),
+	PIN_FIELD_BASE(122, 122, 5, 0x0090, 0x10, 21, 1),
+	PIN_FIELD_BASE(123, 123, 5, 0x0090, 0x10, 23, 1),
+	PIN_FIELD_BASE(124, 124, 5, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(125, 125, 5, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(126, 126, 5, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(127, 127, 3, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(128, 128, 3, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(129, 129, 5, 0x0090, 0x10, 24, 1),
+	PIN_FIELD_BASE(130, 130, 5, 0x0090, 0x10, 26, 1),
+	PIN_FIELD_BASE(131, 131, 5, 0x0090, 0x10, 25, 1),
+	PIN_FIELD_BASE(132, 132, 5, 0x0090, 0x10, 27, 1),
+	PIN_FIELD_BASE(133, 133, 1, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(134, 134, 1, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(135, 135, 6, 0x0050, 0x10, 21, 1),
+	PIN_FIELD_BASE(136, 136, 6, 0x0050, 0x10, 24, 1),
+	PIN_FIELD_BASE(137, 137, 1, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(138, 138, 1, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(139, 139, 2, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(140, 140, 2, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(141, 141, 3, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(142, 142, 3, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(143, 143, 6, 0x0050, 0x10, 22, 1),
+	PIN_FIELD_BASE(144, 144, 6, 0x0050, 0x10, 25, 1),
+	PIN_FIELD_BASE(145, 145, 6, 0x0050, 0x10, 23, 1),
+	PIN_FIELD_BASE(146, 146, 6, 0x0050, 0x10, 26, 1),
+	PIN_FIELD_BASE(147, 147, 4, 0x0060, 0x10, 23, 1),
+	PIN_FIELD_BASE(148, 148, 4, 0x0060, 0x10, 24, 1),
+	PIN_FIELD_BASE(149, 149, 4, 0x0060, 0x10, 25, 1),
+	PIN_FIELD_BASE(150, 150, 4, 0x0060, 0x10, 26, 1),
+	PIN_FIELD_BASE(151, 151, 4, 0x0060, 0x10, 27, 1),
+	PIN_FIELD_BASE(152, 152, 4, 0x0060, 0x10, 28, 1),
+	PIN_FIELD_BASE(153, 153, 4, 0x0060, 0x10, 29, 1),
+	PIN_FIELD_BASE(154, 154, 4, 0x0060, 0x10, 30, 1),
+	PIN_FIELD_BASE(155, 155, 4, 0x0060, 0x10, 31, 1),
+	PIN_FIELD_BASE(156, 156, 4, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(157, 157, 2, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(158, 158, 2, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(159, 159, 2, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(160, 160, 2, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(161, 161, 2, 0x0060, 0x10, 23, 1),
+	PIN_FIELD_BASE(162, 162, 2, 0x0060, 0x10, 24, 1),
+	PIN_FIELD_BASE(163, 163, 1, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(164, 164, 1, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(165, 165, 1, 0x0080, 0x10, 16, 1),
+	PIN_FIELD_BASE(166, 166, 1, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(167, 167, 1, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(168, 168, 1, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(169, 169, 1, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(170, 170, 1, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(171, 171, 1, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(172, 172, 1, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(173, 173, 1, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(174, 174, 6, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(175, 175, 6, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(176, 176, 6, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(177, 177, 6, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(178, 178, 6, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(179, 179, 6, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(180, 180, 6, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(181, 181, 6, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(182, 182, 6, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(183, 183, 2, 0x0060, 0x10, 21, 1),
+	PIN_FIELD_BASE(184, 184, 2, 0x0060, 0x10, 22, 1),
+};
+
+static const struct mtk_pin_field_calc mt8186_pin_pd_range[] = {
+	PIN_FIELD_BASE(0, 0, 6, 0x0040, 0x10, 13, 1),
+	PIN_FIELD_BASE(1, 1, 6, 0x0040, 0x10, 14, 1),
+	PIN_FIELD_BASE(2, 2, 6, 0x0040, 0x10, 17, 1),
+	PIN_FIELD_BASE(3, 3, 6, 0x0040, 0x10, 18, 1),
+	PIN_FIELD_BASE(4, 4, 6, 0x0040, 0x10, 19, 1),
+	PIN_FIELD_BASE(5, 5, 6, 0x0040, 0x10, 20, 1),
+	PIN_FIELD_BASE(6, 6, 4, 0x0040, 0x10, 19, 1),
+	PIN_FIELD_BASE(7, 7, 4, 0x0040, 0x10, 20, 1),
+	PIN_FIELD_BASE(8, 8, 4, 0x0040, 0x10, 21, 1),
+	PIN_FIELD_BASE(9, 9, 4, 0x0040, 0x10, 22, 1),
+	PIN_FIELD_BASE(10, 10, 4, 0x0040, 0x10, 16, 1),
+	PIN_FIELD_BASE(11, 11, 4, 0x0040, 0x10, 17, 1),
+	PIN_FIELD_BASE(12, 12, 4, 0x0040, 0x10, 18, 1),
+	PIN_FIELD_BASE(13, 13, 3, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(14, 14, 3, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(15, 15, 6, 0x0040, 0x10, 15, 1),
+	PIN_FIELD_BASE(16, 16, 6, 0x0040, 0x10, 16, 1),
+	PIN_FIELD_BASE(17, 17, 5, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(18, 18, 5, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(19, 19, 5, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(20, 20, 5, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(21, 21, 5, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(22, 22, 5, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(23, 23, 5, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(24, 24, 5, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(25, 25, 5, 0x0070, 0x10, 18, 1),
+	PIN_FIELD_BASE(26, 26, 5, 0x0070, 0x10, 15, 1),
+	PIN_FIELD_BASE(27, 27, 5, 0x0070, 0x10, 17, 1),
+	PIN_FIELD_BASE(28, 28, 5, 0x0070, 0x10, 16, 1),
+	PIN_FIELD_BASE(29, 29, 6, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(30, 30, 6, 0x0040, 0x10, 1, 1),
+	PIN_FIELD_BASE(31, 31, 6, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(32, 32, 2, 0x0050, 0x10, 25, 1),
+	PIN_FIELD_BASE(33, 33, 2, 0x0050, 0x10, 27, 1),
+	PIN_FIELD_BASE(34, 34, 2, 0x0050, 0x10, 26, 1),
+	PIN_FIELD_BASE(35, 35, 2, 0x0050, 0x10, 28, 1),
+	PIN_FIELD_BASE(36, 36, 2, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(37, 37, 2, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(38, 38, 2, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(39, 39, 2, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(40, 40, 2, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(41, 41, 2, 0x0050, 0x10, 14, 1),
+	PIN_FIELD_BASE(42, 42, 2, 0x0050, 0x10, 16, 1),
+	PIN_FIELD_BASE(43, 43, 2, 0x0050, 0x10, 15, 1),
+	PIN_FIELD_BASE(44, 44, 5, 0x0070, 0x10, 28, 1),
+	PIN_FIELD_BASE(45, 45, 5, 0x0070, 0x10, 29, 1),
+	PIN_FIELD_BASE(46, 46, 5, 0x0070, 0x10, 31, 1),
+	PIN_FIELD_BASE(47, 47, 5, 0x0070, 0x10, 30, 1),
+	PIN_FIELD_BASE(48, 48, 2, 0x0050, 0x10, 17, 1),
+	PIN_FIELD_BASE(49, 49, 2, 0x0050, 0x10, 18, 1),
+	PIN_FIELD_BASE(50, 50, 2, 0x0050, 0x10, 20, 1),
+	PIN_FIELD_BASE(51, 51, 2, 0x0050, 0x10, 19, 1),
+	PIN_FIELD_BASE(52, 52, 3, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(53, 53, 3, 0x0060, 0x10, 13, 1),
+	PIN_FIELD_BASE(54, 54, 3, 0x0060, 0x10, 15, 1),
+	PIN_FIELD_BASE(55, 55, 3, 0x0060, 0x10, 14, 1),
+	PIN_FIELD_BASE(56, 56, 5, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(57, 57, 5, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(58, 58, 5, 0x0070, 0x10, 13, 1),
+	PIN_FIELD_BASE(59, 59, 5, 0x0070, 0x10, 14, 1),
+	PIN_FIELD_BASE(60, 60, 3, 0x0060, 0x10, 21, 1),
+	PIN_FIELD_BASE(61, 61, 3, 0x0060, 0x10, 16, 1),
+	PIN_FIELD_BASE(62, 62, 3, 0x0060, 0x10, 22, 1),
+	PIN_FIELD_BASE(63, 63, 3, 0x0060, 0x10, 17, 1),
+	PIN_FIELD_BASE(64, 64, 3, 0x0060, 0x10, 18, 1),
+	PIN_FIELD_BASE(65, 65, 3, 0x0060, 0x10, 19, 1),
+	PIN_FIELD_BASE(66, 66, 3, 0x0060, 0x10, 20, 1),
+	PIN_FIELD_BASE(83, 83, 6, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(90, 90, 3, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(91, 91, 3, 0x0060, 0x10, 23, 1),
+	PIN_FIELD_BASE(92, 92, 3, 0x0060, 0x10, 25, 1),
+	PIN_FIELD_BASE(93, 93, 3, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(94, 94, 3, 0x0060, 0x10, 24, 1),
+	PIN_FIELD_BASE(95, 95, 3, 0x0060, 0x10, 26, 1),
+	PIN_FIELD_BASE(96, 96, 2, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(97, 97, 2, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(98, 98, 2, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(99, 99, 4, 0x0040, 0x10, 14, 1),
+	PIN_FIELD_BASE(100, 100, 4, 0x0040, 0x10, 15, 1),
+	PIN_FIELD_BASE(101, 101, 4, 0x0040, 0x10, 13, 1),
+	PIN_FIELD_BASE(102, 102, 4, 0x0040, 0x10, 12, 1),
+	PIN_FIELD_BASE(103, 103, 4, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(104, 104, 4, 0x0040, 0x10, 1, 1),
+	PIN_FIELD_BASE(105, 105, 4, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(106, 106, 4, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(107, 107, 4, 0x0040, 0x10, 6, 1),
+	PIN_FIELD_BASE(108, 108, 4, 0x0040, 0x10, 7, 1),
+	PIN_FIELD_BASE(109, 109, 4, 0x0040, 0x10, 8, 1),
+	PIN_FIELD_BASE(110, 110, 4, 0x0040, 0x10, 9, 1),
+	PIN_FIELD_BASE(111, 111, 4, 0x0040, 0x10, 10, 1),
+	PIN_FIELD_BASE(112, 112, 4, 0x0040, 0x10, 11, 1),
+	PIN_FIELD_BASE(113, 113, 4, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(114, 114, 4, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(115, 115, 3, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(116, 116, 3, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(117, 117, 3, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(118, 118, 3, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(119, 119, 5, 0x0070, 0x10, 22, 1),
+	PIN_FIELD_BASE(120, 120, 5, 0x0070, 0x10, 19, 1),
+	PIN_FIELD_BASE(121, 121, 5, 0x0070, 0x10, 20, 1),
+	PIN_FIELD_BASE(122, 122, 5, 0x0070, 0x10, 21, 1),
+	PIN_FIELD_BASE(123, 123, 5, 0x0070, 0x10, 23, 1),
+	PIN_FIELD_BASE(124, 124, 5, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(125, 125, 5, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(126, 126, 5, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(127, 127, 3, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(128, 128, 3, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(129, 129, 5, 0x0070, 0x10, 24, 1),
+	PIN_FIELD_BASE(130, 130, 5, 0x0070, 0x10, 26, 1),
+	PIN_FIELD_BASE(131, 131, 5, 0x0070, 0x10, 25, 1),
+	PIN_FIELD_BASE(132, 132, 5, 0x0070, 0x10, 27, 1),
+	PIN_FIELD_BASE(133, 133, 1, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(134, 134, 1, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(135, 135, 6, 0x0040, 0x10, 21, 1),
+	PIN_FIELD_BASE(136, 136, 6, 0x0040, 0x10, 24, 1),
+	PIN_FIELD_BASE(137, 137, 1, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(138, 138, 1, 0x0060, 0x10, 13, 1),
+	PIN_FIELD_BASE(139, 139, 2, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(140, 140, 2, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(141, 141, 3, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(142, 142, 3, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(143, 143, 6, 0x0040, 0x10, 22, 1),
+	PIN_FIELD_BASE(144, 144, 6, 0x0040, 0x10, 25, 1),
+	PIN_FIELD_BASE(145, 145, 6, 0x0040, 0x10, 23, 1),
+	PIN_FIELD_BASE(146, 146, 6, 0x0040, 0x10, 26, 1),
+	PIN_FIELD_BASE(147, 147, 4, 0x0040, 0x10, 23, 1),
+	PIN_FIELD_BASE(148, 148, 4, 0x0040, 0x10, 24, 1),
+	PIN_FIELD_BASE(149, 149, 4, 0x0040, 0x10, 25, 1),
+	PIN_FIELD_BASE(150, 150, 4, 0x0040, 0x10, 26, 1),
+	PIN_FIELD_BASE(151, 151, 4, 0x0040, 0x10, 27, 1),
+	PIN_FIELD_BASE(152, 152, 4, 0x0040, 0x10, 28, 1),
+	PIN_FIELD_BASE(153, 153, 4, 0x0040, 0x10, 29, 1),
+	PIN_FIELD_BASE(154, 154, 4, 0x0040, 0x10, 30, 1),
+	PIN_FIELD_BASE(155, 155, 4, 0x0040, 0x10, 31, 1),
+	PIN_FIELD_BASE(156, 156, 4, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(157, 157, 2, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(158, 158, 2, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(159, 159, 2, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(160, 160, 2, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(161, 161, 2, 0x0050, 0x10, 23, 1),
+	PIN_FIELD_BASE(162, 162, 2, 0x0050, 0x10, 24, 1),
+	PIN_FIELD_BASE(163, 163, 1, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(164, 164, 1, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(165, 165, 1, 0x0060, 0x10, 16, 1),
+	PIN_FIELD_BASE(166, 166, 1, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(167, 167, 1, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(168, 168, 1, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(169, 169, 1, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(170, 170, 1, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(171, 171, 1, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(172, 172, 1, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(173, 173, 1, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(174, 174, 6, 0x0040, 0x10, 7, 1),
+	PIN_FIELD_BASE(175, 175, 6, 0x0040, 0x10, 8, 1),
+	PIN_FIELD_BASE(176, 176, 6, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(177, 177, 6, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(178, 178, 6, 0x0040, 0x10, 6, 1),
+	PIN_FIELD_BASE(179, 179, 6, 0x0040, 0x10, 9, 1),
+	PIN_FIELD_BASE(180, 180, 6, 0x0040, 0x10, 10, 1),
+	PIN_FIELD_BASE(181, 181, 6, 0x0040, 0x10, 11, 1),
+	PIN_FIELD_BASE(182, 182, 6, 0x0040, 0x10, 12, 1),
+	PIN_FIELD_BASE(183, 183, 2, 0x0050, 0x10, 21, 1),
+	PIN_FIELD_BASE(184, 184, 2, 0x0050, 0x10, 22, 1),
+};
+
+static const struct mtk_pin_field_calc mt8186_pin_pupd_range[] = {
+	PIN_FIELD_BASE(67, 67, 1, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(68, 68, 1, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(69, 69, 1, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(70, 70, 1, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(71, 71, 1, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(72, 72, 1, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(73, 73, 1, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(74, 74, 1, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(75, 75, 1, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(76, 76, 1, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(77, 77, 1, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(78, 78, 1, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(79, 79, 5, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(80, 80, 5, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(81, 81, 5, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(82, 82, 5, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(84, 84, 3, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(85, 85, 3, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(86, 86, 3, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(87, 87, 3, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(88, 88, 3, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(89, 89, 3, 0x0070, 0x10, 5, 1),
+};
+
+static const struct mtk_pin_field_calc mt8186_pin_r0_range[] = {
+	PIN_FIELD_BASE(67, 67, 1, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(68, 68, 1, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(69, 69, 1, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(70, 70, 1, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(71, 71, 1, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(72, 72, 1, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(73, 73, 1, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(74, 74, 1, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(75, 75, 1, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(76, 76, 1, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(77, 77, 1, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(78, 78, 1, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(79, 79, 5, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(80, 80, 5, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(81, 81, 5, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(82, 82, 5, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(84, 84, 3, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(85, 85, 3, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(86, 86, 3, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(87, 87, 3, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(88, 88, 3, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(89, 89, 3, 0x0090, 0x10, 5, 1),
+};
+
+static const struct mtk_pin_field_calc mt8186_pin_r1_range[] = {
+	PIN_FIELD_BASE(67, 67, 1, 0x00a0, 0x10, 10, 1),
+	PIN_FIELD_BASE(68, 68, 1, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(69, 69, 1, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(70, 70, 1, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(71, 71, 1, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(72, 72, 1, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(73, 73, 1, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(74, 74, 1, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(75, 75, 1, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(76, 76, 1, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(77, 77, 1, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(78, 78, 1, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(79, 79, 5, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(80, 80, 5, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(81, 81, 5, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(82, 82, 5, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(84, 84, 3, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(85, 85, 3, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(86, 86, 3, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(87, 87, 3, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(88, 88, 3, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(89, 89, 3, 0x00a0, 0x10, 5, 1),
+};
+
+static const struct mtk_pin_field_calc mt8186_pin_drv_range[] = {
+	PIN_FIELD_BASE(0, 0, 6, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(1, 1, 6, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(2, 2, 6, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(3, 3, 6, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(4, 4, 6, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(5, 5, 6, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(6, 6, 4, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(7, 7, 4, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(8, 8, 4, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(9, 9, 4, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(10, 10, 4, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(11, 11, 4, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(12, 12, 4, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(13, 13, 3, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(14, 14, 3, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(15, 15, 6, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(16, 16, 6, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(17, 17, 5, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(18, 18, 5, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(19, 19, 5, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(20, 20, 5, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(21, 21, 5, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(22, 22, 5, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(23, 23, 5, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(24, 24, 5, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(25, 25, 5, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(26, 26, 5, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(27, 27, 5, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(28, 28, 5, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(29, 29, 6, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(30, 30, 6, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(31, 31, 6, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(32, 32, 2, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(33, 33, 2, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(34, 34, 2, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(35, 35, 2, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(36, 36, 2, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(37, 37, 2, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(38, 38, 2, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(39, 39, 2, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(40, 40, 2, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(41, 41, 2, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(42, 42, 2, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(43, 43, 2, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(44, 44, 5, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(45, 45, 5, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(46, 46, 5, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(47, 47, 5, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(48, 48, 2, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(49, 49, 2, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(50, 50, 2, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(51, 51, 2, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(52, 52, 3, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(53, 53, 3, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(54, 54, 3, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(55, 55, 3, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(56, 56, 5, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(57, 57, 5, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(58, 58, 5, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(59, 59, 5, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(60, 60, 3, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(61, 61, 3, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(62, 62, 3, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(63, 63, 3, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(64, 64, 3, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(65, 65, 3, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(66, 66, 3, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(67, 67, 1, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(68, 68, 1, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(69, 69, 1, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(70, 70, 1, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(71, 71, 1, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(72, 72, 1, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(73, 73, 1, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(74, 74, 1, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(75, 75, 1, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(76, 76, 1, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(77, 77, 1, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(78, 78, 1, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(79, 79, 5, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(80, 80, 5, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(81, 81, 5, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(82, 82, 5, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(83, 83, 6, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(84, 84, 3, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(85, 85, 3, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(86, 86, 3, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(87, 87, 3, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(88, 88, 3, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(89, 89, 3, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(90, 90, 3, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(91, 91, 3, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(92, 92, 3, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(93, 93, 3, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(94, 94, 3, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(95, 95, 3, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(96, 96, 2, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(97, 97, 2, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(98, 98, 2, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(99, 99, 4, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(100, 100, 4, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(101, 101, 4, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(102, 102, 4, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(103, 103, 4, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(104, 104, 4, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(105, 105, 4, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(106, 106, 4, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(107, 107, 4, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(108, 108, 4, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(109, 109, 4, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(110, 110, 4, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(111, 111, 4, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(112, 112, 4, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(113, 113, 4, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(114, 114, 4, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(115, 115, 3, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(116, 116, 3, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(117, 117, 3, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(118, 118, 3, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(119, 119, 5, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(120, 120, 5, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(121, 121, 5, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(122, 122, 5, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(123, 123, 5, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(124, 124, 5, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(125, 125, 5, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(126, 126, 5, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(127, 127, 3, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(128, 128, 3, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(129, 129, 5, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(130, 130, 5, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(131, 131, 5, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(132, 132, 5, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(133, 133, 1, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(134, 134, 1, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(135, 135, 6, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(136, 136, 6, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(137, 137, 1, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(138, 138, 1, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(139, 139, 2, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(140, 140, 2, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(141, 141, 3, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(142, 142, 3, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(143, 143, 6, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(144, 144, 6, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(145, 145, 6, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(146, 146, 6, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(147, 147, 4, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(148, 148, 4, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(149, 149, 4, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(150, 150, 4, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(151, 151, 4, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(152, 152, 4, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(153, 153, 4, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(154, 154, 4, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(155, 155, 4, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(156, 156, 4, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(157, 157, 2, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(158, 158, 2, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(159, 159, 2, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(160, 160, 2, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(161, 161, 2, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(162, 162, 2, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(163, 163, 1, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(165, 165, 1, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(166, 166, 1, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(167, 167, 1, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(168, 168, 1, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(169, 169, 1, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(170, 170, 1, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(171, 171, 1, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(172, 172, 1, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(173, 173, 1, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(174, 174, 6, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(175, 175, 6, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(176, 176, 6, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(177, 177, 6, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(178, 178, 6, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(179, 179, 6, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(180, 180, 6, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(181, 181, 6, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(182, 182, 6, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(183, 183, 2, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(184, 184, 2, 0x0010, 0x10, 0, 3),
+};
+
+static const struct mtk_pin_field_calc mt8186_pin_drv_adv_range[] = {
+	PIN_FIELD_BASE(127, 127, 3, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(128, 128, 3, 0x0030, 0x10, 6, 3),
+	PIN_FIELD_BASE(129, 129, 5, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(130, 130, 5, 0x0030, 0x10, 6, 3),
+	PIN_FIELD_BASE(131, 131, 5, 0x0030, 0x10, 3, 3),
+	PIN_FIELD_BASE(132, 132, 5, 0x0030, 0x10, 9, 3),
+	PIN_FIELD_BASE(133, 133, 1, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(134, 134, 1, 0x0030, 0x10, 6, 3),
+	PIN_FIELD_BASE(135, 135, 6, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(136, 136, 6, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(137, 137, 1, 0x0030, 0x10, 3, 3),
+	PIN_FIELD_BASE(138, 138, 1, 0x0030, 0x10, 9, 3),
+	PIN_FIELD_BASE(139, 139, 2, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(140, 140, 2, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(141, 141, 3, 0x0030, 0x10, 3, 3),
+	PIN_FIELD_BASE(142, 142, 3, 0x0030, 0x10, 9, 3),
+	PIN_FIELD_BASE(143, 143, 6, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(144, 144, 6, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(145, 145, 6, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(146, 146, 6, 0x0020, 0x10, 15, 3),
+};
+
+static const struct mtk_pin_field_calc mt8186_pin_rsel_range[] = {
+	PIN_FIELD_BASE(127, 127, 3, 0x00d0, 0x10, 0, 2),
+	PIN_FIELD_BASE(128, 128, 3, 0x00d0, 0x10, 4, 2),
+	PIN_FIELD_BASE(129, 129, 5, 0x00d0, 0x10, 0, 2),
+	PIN_FIELD_BASE(130, 130, 5, 0x00d0, 0x10, 4, 2),
+	PIN_FIELD_BASE(131, 131, 5, 0x00d0, 0x10, 2, 2),
+	PIN_FIELD_BASE(132, 132, 5, 0x00d0, 0x10, 6, 2),
+	PIN_FIELD_BASE(133, 133, 1, 0x00e0, 0x10, 0, 2),
+	PIN_FIELD_BASE(134, 134, 1, 0x00e0, 0x10, 4, 2),
+	PIN_FIELD_BASE(135, 135, 6, 0x0070, 0x10, 0, 2),
+	PIN_FIELD_BASE(136, 136, 6, 0x0070, 0x10, 6, 2),
+	PIN_FIELD_BASE(137, 137, 1, 0x00e0, 0x10, 2, 2),
+	PIN_FIELD_BASE(138, 138, 1, 0x00e0, 0x10, 6, 2),
+	PIN_FIELD_BASE(139, 139, 2, 0x0080, 0x10, 0, 2),
+	PIN_FIELD_BASE(140, 140, 2, 0x0080, 0x10, 2, 2),
+	PIN_FIELD_BASE(141, 141, 3, 0x00d0, 0x10, 2, 2),
+	PIN_FIELD_BASE(142, 142, 3, 0x00d0, 0x10, 6, 2),
+	PIN_FIELD_BASE(143, 143, 6, 0x0070, 0x10, 2, 2),
+	PIN_FIELD_BASE(144, 144, 6, 0x0070, 0x10, 8, 2),
+	PIN_FIELD_BASE(145, 145, 6, 0x0070, 0x10, 4, 2),
+	PIN_FIELD_BASE(146, 146, 6, 0x0070, 0x10, 10, 2),
+};
+
+static const struct mtk_pin_rsel mt8186_pin_rsel_val_range[] = {
+	PIN_RSEL(127, 128, 0x0, 75000, 75000),
+	PIN_RSEL(127, 128, 0x1, 10000, 75000),
+	PIN_RSEL(127, 128, 0x2, 5000, 5000),
+	PIN_RSEL(127, 128, 0x3, 1000, 5000),
+	PIN_RSEL(129, 130, 0x0, 75000, 75000),
+	PIN_RSEL(129, 130, 0x1, 10000, 75000),
+	PIN_RSEL(129, 130, 0x2, 5000, 5000),
+	PIN_RSEL(129, 130, 0x3, 1000, 5000),
+	PIN_RSEL(131, 132, 0x0, 75000, 75000),
+	PIN_RSEL(131, 132, 0x1, 10000, 75000),
+	PIN_RSEL(131, 132, 0x2, 5000, 5000),
+	PIN_RSEL(131, 132, 0x3, 1000, 5000),
+	PIN_RSEL(133, 134, 0x0, 75000, 75000),
+	PIN_RSEL(133, 134, 0x1, 10000, 75000),
+	PIN_RSEL(133, 134, 0x2, 5000, 5000),
+	PIN_RSEL(133, 134, 0x3, 1000, 5000),
+	PIN_RSEL(135, 136, 0x0, 75000, 75000),
+	PIN_RSEL(135, 136, 0x1, 10000, 75000),
+	PIN_RSEL(135, 136, 0x2, 5000, 5000),
+	PIN_RSEL(135, 136, 0x3, 1000, 5000),
+	PIN_RSEL(137, 138, 0x0, 75000, 75000),
+	PIN_RSEL(137, 138, 0x1, 10000, 75000),
+	PIN_RSEL(137, 138, 0x2, 5000, 5000),
+	PIN_RSEL(137, 138, 0x3, 1000, 5000),
+	PIN_RSEL(139, 140, 0x0, 75000, 75000),
+	PIN_RSEL(139, 140, 0x1, 10000, 75000),
+	PIN_RSEL(139, 140, 0x2, 5000, 5000),
+	PIN_RSEL(139, 140, 0x3, 1000, 5000),
+	PIN_RSEL(141, 142, 0x0, 75000, 75000),
+	PIN_RSEL(141, 142, 0x1, 10000, 75000),
+	PIN_RSEL(141, 142, 0x2, 5000, 5000),
+	PIN_RSEL(141, 142, 0x3, 1000, 5000),
+	PIN_RSEL(143, 144, 0x0, 75000, 75000),
+	PIN_RSEL(143, 144, 0x1, 10000, 75000),
+	PIN_RSEL(143, 144, 0x2, 5000, 5000),
+	PIN_RSEL(143, 144, 0x3, 1000, 5000),
+	PIN_RSEL(145, 146, 0x0, 75000, 75000),
+	PIN_RSEL(145, 146, 0x1, 10000, 75000),
+	PIN_RSEL(145, 146, 0x2, 5000, 5000),
+	PIN_RSEL(145, 146, 0x3, 1000, 5000),
+};
+
+static const unsigned int mt8186_pull_type[] = {
+	MTK_PULL_PU_PD_TYPE,/*0*/		MTK_PULL_PU_PD_TYPE,/*1
*/
+	MTK_PULL_PU_PD_TYPE,/*2*/		MTK_PULL_PU_PD_TYPE,/*3
*/
+	MTK_PULL_PU_PD_TYPE,/*4*/		MTK_PULL_PU_PD_TYPE,/*5
*/
+	MTK_PULL_PU_PD_TYPE,/*6*/		MTK_PULL_PU_PD_TYPE,/*7
*/
+	MTK_PULL_PU_PD_TYPE,/*8*/		MTK_PULL_PU_PD_TYPE,/*9
*/
+	MTK_PULL_PU_PD_TYPE,/*10*/		MTK_PULL_PU_PD_TYPE,/*1
1*/
+	MTK_PULL_PU_PD_TYPE,/*12*/		MTK_PULL_PU_PD_TYPE,/*1
3*/
+	MTK_PULL_PU_PD_TYPE,/*14*/		MTK_PULL_PU_PD_TYPE,/*1
5*/
+	MTK_PULL_PU_PD_TYPE,/*16*/		MTK_PULL_PU_PD_TYPE,/*1
7*/
+	MTK_PULL_PU_PD_TYPE,/*18*/		MTK_PULL_PU_PD_TYPE,/*1
9*/
+	MTK_PULL_PU_PD_TYPE,/*20*/		MTK_PULL_PU_PD_TYPE,/*2
1*/
+	MTK_PULL_PU_PD_TYPE,/*22*/		MTK_PULL_PU_PD_TYPE,/*2
3*/
+	MTK_PULL_PU_PD_TYPE,/*24*/		MTK_PULL_PU_PD_TYPE,/*2
5*/
+	MTK_PULL_PU_PD_TYPE,/*26*/		MTK_PULL_PU_PD_TYPE,/*2
7*/
+	MTK_PULL_PU_PD_TYPE,/*28*/		MTK_PULL_PU_PD_TYPE,/*2
9*/
+	MTK_PULL_PU_PD_TYPE,/*30*/		MTK_PULL_PU_PD_TYPE,/*3
1*/
+	MTK_PULL_PU_PD_TYPE,/*32*/		MTK_PULL_PU_PD_TYPE,/*3
3*/
+	MTK_PULL_PU_PD_TYPE,/*34*/		MTK_PULL_PU_PD_TYPE,/*3
5*/
+	MTK_PULL_PU_PD_TYPE,/*36*/		MTK_PULL_PU_PD_TYPE,/*3
7*/
+	MTK_PULL_PU_PD_TYPE,/*38*/		MTK_PULL_PU_PD_TYPE,/*3
9*/
+	MTK_PULL_PU_PD_TYPE,/*40*/		MTK_PULL_PU_PD_TYPE,/*4
1*/
+	MTK_PULL_PU_PD_TYPE,/*42*/		MTK_PULL_PU_PD_TYPE,/*4
3*/
+	MTK_PULL_PU_PD_TYPE,/*44*/		MTK_PULL_PU_PD_TYPE,/*4
5*/
+	MTK_PULL_PU_PD_TYPE,/*46*/		MTK_PULL_PU_PD_TYPE,/*4
7*/
+	MTK_PULL_PU_PD_TYPE,/*48*/		MTK_PULL_PU_PD_TYPE,/*4
9*/
+	MTK_PULL_PU_PD_TYPE,/*50*/		MTK_PULL_PU_PD_TYPE,/*5
1*/
+	MTK_PULL_PU_PD_TYPE,/*52*/		MTK_PULL_PU_PD_TYPE,/*5
3*/
+	MTK_PULL_PU_PD_TYPE,/*54*/		MTK_PULL_PU_PD_TYPE,/*5
5*/
+	MTK_PULL_PU_PD_TYPE,/*56*/		MTK_PULL_PU_PD_TYPE,/*5
7*/
+	MTK_PULL_PU_PD_TYPE,/*58*/		MTK_PULL_PU_PD_TYPE,/*5
9*/
+	MTK_PULL_PU_PD_TYPE,/*60*/		MTK_PULL_PU_PD_TYPE,/*6
1*/
+	MTK_PULL_PU_PD_TYPE,/*62*/		MTK_PULL_PU_PD_TYPE,/*6
3*/
+	MTK_PULL_PU_PD_TYPE,/*64*/		MTK_PULL_PU_PD_TYPE,/*6
5*/
+	MTK_PULL_PU_PD_TYPE,/*66*/		MTK_PULL_PUPD_R1R0_TYPE
,/*67*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*68*/		MTK_PULL_PUPD_R1R0_TYPE
,/*69*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*70*/		MTK_PULL_PUPD_R1R0_TYPE
,/*71*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*72*/		MTK_PULL_PUPD_R1R0_TYPE
,/*73*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*74*/		MTK_PULL_PUPD_R1R0_TYPE
,/*75*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*76*/		MTK_PULL_PUPD_R1R0_TYPE
,/*77*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*78*/		MTK_PULL_PUPD_R1R0_TYPE
,/*79*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*80*/		MTK_PULL_PUPD_R1R0_TYPE
,/*81*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*82*/		MTK_PULL_PU_PD_TYPE,/*8
3*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*84*/		MTK_PULL_PUPD_R1R0_TYPE
,/*85*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*86*/		MTK_PULL_PUPD_R1R0_TYPE
,/*87*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*88*/		MTK_PULL_PUPD_R1R0_TYPE
,/*89*/
+	MTK_PULL_PU_PD_TYPE,/*90*/		MTK_PULL_PU_PD_TYPE,/*9
1*/
+	MTK_PULL_PU_PD_TYPE,/*92*/		MTK_PULL_PU_PD_TYPE,/*9
3*/
+	MTK_PULL_PU_PD_TYPE,/*94*/		MTK_PULL_PU_PD_TYPE,/*9
5*/
+	MTK_PULL_PU_PD_TYPE,/*96*/		MTK_PULL_PU_PD_TYPE,/*9
7*/
+	MTK_PULL_PU_PD_TYPE,/*98*/		MTK_PULL_PU_PD_TYPE,/*9
9*/
+	MTK_PULL_PU_PD_TYPE,/*100*/		MTK_PULL_PU_PD_TYPE,/*1
01*/
+	MTK_PULL_PU_PD_TYPE,/*102*/		MTK_PULL_PU_PD_TYPE,/*1
03*/
+	MTK_PULL_PU_PD_TYPE,/*104*/		MTK_PULL_PU_PD_TYPE,/*1
05*/
+	MTK_PULL_PU_PD_TYPE,/*106*/		MTK_PULL_PU_PD_TYPE,/*1
07*/
+	MTK_PULL_PU_PD_TYPE,/*108*/		MTK_PULL_PU_PD_TYPE,/*1
09*/
+	MTK_PULL_PU_PD_TYPE,/*110*/		MTK_PULL_PU_PD_TYPE,/*1
11*/
+	MTK_PULL_PU_PD_TYPE,/*112*/		MTK_PULL_PU_PD_TYPE,/*1
13*/
+	MTK_PULL_PU_PD_TYPE,/*114*/		MTK_PULL_PU_PD_TYPE,/*1
15*/
+	MTK_PULL_PU_PD_TYPE,/*116*/		MTK_PULL_PU_PD_TYPE,/*1
17*/
+	MTK_PULL_PU_PD_TYPE,/*118*/		MTK_PULL_PU_PD_TYPE,/*1
19*/
+	MTK_PULL_PU_PD_TYPE,/*120*/		MTK_PULL_PU_PD_TYPE,/*1
21*/
+	MTK_PULL_PU_PD_TYPE,/*122*/		MTK_PULL_PU_PD_TYPE,/*1
23*/
+	MTK_PULL_PU_PD_TYPE,/*124*/		MTK_PULL_PU_PD_TYPE,/*1
25*/
+	MTK_PULL_PU_PD_TYPE,/*126*/		MTK_PULL_PU_PD_RSEL_TYP
E,/*127*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*128*/	MTK_PULL_PU_PD_RSEL_TYP
E,/*129*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*130*/	MTK_PULL_PU_PD_RSEL_TYP
E,/*131*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*132*/	MTK_PULL_PU_PD_RSEL_TYP
E,/*133*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*134*/	MTK_PULL_PU_PD_RSEL_TYP
E,/*135*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*136*/	MTK_PULL_PU_PD_RSEL_TYP
E,/*137*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*138*/	MTK_PULL_PU_PD_RSEL_TYP
E,/*139*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*140*/	MTK_PULL_PU_PD_RSEL_TYP
E,/*141*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*142*/	MTK_PULL_PU_PD_RSEL_TYP
E,/*143*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*144*/	MTK_PULL_PU_PD_RSEL_TYP
E,/*145*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*146*/	MTK_PULL_PU_PD_TYPE,/*1
47*/
+	MTK_PULL_PU_PD_TYPE,/*148*/		MTK_PULL_PU_PD_TYPE,/*1
49*/
+	MTK_PULL_PU_PD_TYPE,/*150*/		MTK_PULL_PU_PD_TYPE,/*1
51*/
+	MTK_PULL_PU_PD_TYPE,/*152*/		MTK_PULL_PU_PD_TYPE,/*1
53*/
+	MTK_PULL_PU_PD_TYPE,/*154*/		MTK_PULL_PU_PD_TYPE,/*1
55*/
+	MTK_PULL_PU_PD_TYPE,/*156*/		MTK_PULL_PU_PD_TYPE,/*1
57*/
+	MTK_PULL_PU_PD_TYPE,/*158*/		MTK_PULL_PU_PD_TYPE,/*1
59*/
+	MTK_PULL_PU_PD_TYPE,/*160*/		MTK_PULL_PU_PD_TYPE,/*1
61*/
+	MTK_PULL_PU_PD_TYPE,/*162*/		MTK_PULL_PU_PD_TYPE,/*1
63*/
+	MTK_PULL_PU_PD_TYPE,/*164*/		MTK_PULL_PU_PD_TYPE,/*1
65*/
+	MTK_PULL_PU_PD_TYPE,/*166*/		MTK_PULL_PU_PD_TYPE,/*1
67*/
+	MTK_PULL_PU_PD_TYPE,/*168*/		MTK_PULL_PU_PD_TYPE,/*1
69*/
+	MTK_PULL_PU_PD_TYPE,/*170*/		MTK_PULL_PU_PD_TYPE,/*1
71*/
+	MTK_PULL_PU_PD_TYPE,/*172*/		MTK_PULL_PU_PD_TYPE,/*1
73*/
+	MTK_PULL_PU_PD_TYPE,/*174*/		MTK_PULL_PU_PD_TYPE,/*1
75*/
+	MTK_PULL_PU_PD_TYPE,/*176*/		MTK_PULL_PU_PD_TYPE,/*1
77*/
+	MTK_PULL_PU_PD_TYPE,/*178*/		MTK_PULL_PU_PD_TYPE,/*1
79*/
+	MTK_PULL_PU_PD_TYPE,/*180*/		MTK_PULL_PU_PD_TYPE,/*1
81*/
+	MTK_PULL_PU_PD_TYPE,/*182*/		MTK_PULL_PU_PD_TYPE,/*1
83*/
+	MTK_PULL_PU_PD_TYPE,/*184*/
+};
+
+static const struct mtk_pin_reg_calc
mt8186_reg_cals[PINCTRL_PIN_REG_MAX] = {
+	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8186_pin_mode_range),
+	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8186_pin_dir_range),
+	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt8186_pin_di_range),
+	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt8186_pin_do_range),
+	[PINCTRL_PIN_REG_SR] = MTK_RANGE(mt8186_pin_dir_range),
+	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt8186_pin_smt_range),
+	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt8186_pin_ies_range),
+	[PINCTRL_PIN_REG_PU] = MTK_RANGE(mt8186_pin_pu_range),
+	[PINCTRL_PIN_REG_PD] = MTK_RANGE(mt8186_pin_pd_range),
+	[PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt8186_pin_drv_range),
+	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt8186_pin_pupd_range),
+	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8186_pin_r0_range),
+	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8186_pin_r1_range),
+	[PINCTRL_PIN_REG_DRV_ADV] =
MTK_RANGE(mt8186_pin_drv_adv_range),
+	[PINCTRL_PIN_REG_RSEL]	= MTK_RANGE(mt8186_pin_rsel_range),
+
+};
+
+static const char * const mt8186_pinctrl_register_base_names[] = {
+	"iocfg0", "iocfg_lt", "iocfg_lm", "iocfg_lb", "iocfg_bl",
+	"iocfg_rb", "iocfg_rt",
+};
+
+static const struct mtk_eint_hw mt8186_eint_hw = {
+	.port_mask = 0xf,
+	.ports     = 7,
+	.ap_num    = 217,
+	.db_cnt    = 32,
+};
+
+static const struct mtk_pin_soc mt8186_data = {
+	.reg_cal = mt8186_reg_cals,
+	.pins = mtk_pins_mt8186,
+	.npins = ARRAY_SIZE(mtk_pins_mt8186),
+	.ngrps = ARRAY_SIZE(mtk_pins_mt8186),
+	.nfuncs = 8,
+	.gpio_m = 0,
+	.eint_hw = &mt8186_eint_hw,
+	.base_names = mt8186_pinctrl_register_base_names,
+	.nbase_names = ARRAY_SIZE(mt8186_pinctrl_register_base_names),
+	.pull_type = mt8186_pull_type,
+	.pin_rsel = mt8186_pin_rsel_val_range,
+	.npin_rsel = ARRAY_SIZE(mt8186_pin_rsel_val_range),
+	.bias_set_combo = mtk_pinconf_bias_set_combo,
+	.bias_get_combo = mtk_pinconf_bias_get_combo,
+	.drive_set = mtk_pinconf_drive_set_rev1,
+	.drive_get = mtk_pinconf_drive_get_rev1,
+	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
+	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,
+};
+
+static const struct of_device_id mt8186_pinctrl_of_match[] = {
+	{ .compatible = "mediatek,mt8186-pinctrl", },
+	{ }
+};
+static int mt8186_pinctrl_probe(struct platform_device *pdev)
+{
+	return mtk_paris_pinctrl_probe(pdev, &mt8186_data);
+}
+
+static struct platform_driver mt8186_pinctrl_driver = {
+	.driver = {
+		.name = "mt8186-pinctrl",
+		.of_match_table = mt8186_pinctrl_of_match,
+		.pm = &mtk_paris_pinctrl_pm_ops,
+	},
+	.probe = mt8186_pinctrl_probe,
+};
+
+static int __init mt8186_pinctrl_init(void)
+{
+	return platform_driver_register(&mt8186_pinctrl_driver);
+}
+
+arch_initcall(mt8186_pinctrl_init);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h
b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h
new file mode 100644
index 000000000000..464651f7b44b
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8186.h
@@ -0,0 +1,2186 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ *
+ * Author: Guodong Liu <guodong.liu@mediatek.com>
+ *
+ */
+
+#ifndef __PINCTRL_MTK_MT8186_H
+#define __PINCTRL_MTK_MT8186_H
+
+#include "pinctrl-paris.h"
+
+static const struct mtk_pin_desc mtk_pins_mt8186[] = {
+	MTK_PIN(
+		0, "GPIO0",
+		MTK_EINT_FUNCTION(0, 0),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO0"),
+		MTK_FUNCTION(1, "I2S0_MCK"),
+		MTK_FUNCTION(2, "SPI0_CLK_B"),
+		MTK_FUNCTION(3, "I2S2_MCK"),
+		MTK_FUNCTION(4, "CMFLASH0"),
+		MTK_FUNCTION(5, "SCP_SPI0_CK"),
+		MTK_FUNCTION(6, "TP_GPIO0_AO"),
+		MTK_FUNCTION(7, "dbg_mon_a0")
+	),
+
+	MTK_PIN(
+		1, "GPIO1",
+		MTK_EINT_FUNCTION(0, 1),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO1"),
+		MTK_FUNCTION(1, "I2S0_BCK"),
+		MTK_FUNCTION(2, "SPI0_CSB_B"),
+		MTK_FUNCTION(3, "I2S2_BCK"),
+		MTK_FUNCTION(4, "CMFLASH1"),
+		MTK_FUNCTION(5, "SCP_SPI0_CS"),
+		MTK_FUNCTION(6, "TP_GPIO1_AO")
+	),
+
+	MTK_PIN(
+		2, "GPIO2",
+		MTK_EINT_FUNCTION(0, 2),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO2"),
+		MTK_FUNCTION(1, "I2S0_LRCK"),
+		MTK_FUNCTION(2, "SPI0_MO_B"),
+		MTK_FUNCTION(3, "I2S2_LRCK"),
+		MTK_FUNCTION(4, "CMFLASH2"),
+		MTK_FUNCTION(5, "SCP_SPI0_MO"),
+		MTK_FUNCTION(6, "TP_GPIO2_AO")
+	),
+
+	MTK_PIN(
+		3, "GPIO3",
+		MTK_EINT_FUNCTION(0, 3),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO3"),
+		MTK_FUNCTION(1, "I2S0_DI"),
+		MTK_FUNCTION(2, "SPI0_MI_B"),
+		MTK_FUNCTION(3, "I2S2_DI"),
+		MTK_FUNCTION(4, "SRCLKENAI1"),
+		MTK_FUNCTION(5, "SCP_SPI0_MI"),
+		MTK_FUNCTION(6, "TP_GPIO3_AO")
+	),
+
+	MTK_PIN(
+		4, "GPIO4",
+		MTK_EINT_FUNCTION(0, 4),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO4"),
+		MTK_FUNCTION(1, "I2S3_DO"),
+		MTK_FUNCTION(3, "I2S1_DO"),
+		MTK_FUNCTION(6, "TP_GPIO4_AO")
+	),
+
+	MTK_PIN(
+		5, "GPIO5",
+		MTK_EINT_FUNCTION(0, 5),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO5"),
+		MTK_FUNCTION(1, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(6, "TP_GPIO5_AO")
+	),
+
+	MTK_PIN(
+		6, "GPIO6",
+		MTK_EINT_FUNCTION(0, 6),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO6"),
+		MTK_FUNCTION(1, "I2S3_MCK"),
+		MTK_FUNCTION(2, "SPI1_CLK_B"),
+		MTK_FUNCTION(3, "I2S1_MCK"),
+		MTK_FUNCTION(4, "DPI_DATA22"),
+		MTK_FUNCTION(6, "TP_GPIO6_AO")
+	),
+
+	MTK_PIN(
+		7, "GPIO7",
+		MTK_EINT_FUNCTION(0, 7),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO7"),
+		MTK_FUNCTION(1, "I2S3_BCK"),
+		MTK_FUNCTION(2, "SPI1_CSB_B"),
+		MTK_FUNCTION(3, "I2S1_BCK"),
+		MTK_FUNCTION(4, "DPI_DATA23"),
+		MTK_FUNCTION(6, "TP_GPIO7_AO")
+	),
+
+	MTK_PIN(
+		8, "GPIO8",
+		MTK_EINT_FUNCTION(0, 8),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO8"),
+		MTK_FUNCTION(1, "I2S3_LRCK"),
+		MTK_FUNCTION(2, "SPI1_MO_B"),
+		MTK_FUNCTION(3, "I2S1_LRCK"),
+		MTK_FUNCTION(4, "CONN_UART0_RXD"),
+		MTK_FUNCTION(5, "SSPM_URXD_AO"),
+		MTK_FUNCTION(6, "ADSP_UART_RX"),
+		MTK_FUNCTION(7, "CONN_MCU_DBGACK_N")
+	),
+
+	MTK_PIN(
+		9, "GPIO9",
+		MTK_EINT_FUNCTION(0, 9),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO9"),
+		MTK_FUNCTION(1, "I2S3_DO"),
+		MTK_FUNCTION(2, "SPI1_MI_B"),
+		MTK_FUNCTION(3, "I2S1_DO"),
+		MTK_FUNCTION(4, "CONN_UART0_TXD"),
+		MTK_FUNCTION(5, "SSPM_UTXD_AO"),
+		MTK_FUNCTION(6, "ADSP_UART_TX"),
+		MTK_FUNCTION(7, "CONN_MCU_DBGI_N")
+	),
+
+	MTK_PIN(
+		10, "GPIO10",
+		MTK_EINT_FUNCTION(0, 10),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO10"),
+		MTK_FUNCTION(1, "I2S0_MCK"),
+		MTK_FUNCTION(2, "SPI4_CLK_A"),
+		MTK_FUNCTION(3, "I2S2_MCK"),
+		MTK_FUNCTION(4, "SPM_JTAG_TDI"),
+		MTK_FUNCTION(5, "SCP_JTAG_TDI"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TDI"),
+		MTK_FUNCTION(7, "CONN_MCU_TDI")
+	),
+
+	MTK_PIN(
+		11, "GPIO11",
+		MTK_EINT_FUNCTION(0, 11),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO11"),
+		MTK_FUNCTION(1, "I2S0_BCK"),
+		MTK_FUNCTION(2, "SPI4_CSB_A"),
+		MTK_FUNCTION(3, "I2S2_BCK"),
+		MTK_FUNCTION(4, "SPM_JTAG_TRSTN"),
+		MTK_FUNCTION(5, "SCP_JTAG_TRSTN"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TRSTN"),
+		MTK_FUNCTION(7, "CONN_MCU_TRST_B")
+	),
+
+	MTK_PIN(
+		12, "GPIO12",
+		MTK_EINT_FUNCTION(0, 12),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO12"),
+		MTK_FUNCTION(1, "I2S0_LRCK"),
+		MTK_FUNCTION(2, "SPI4_MO_A"),
+		MTK_FUNCTION(3, "I2S2_LRCK"),
+		MTK_FUNCTION(4, "SPM_JTAG_TCK"),
+		MTK_FUNCTION(5, "SCP_JTAG_TCK"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TCK"),
+		MTK_FUNCTION(7, "CONN_MCU_TCK")
+	),
+
+	MTK_PIN(
+		13, "GPIO13",
+		MTK_EINT_FUNCTION(0, 13),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO13"),
+		MTK_FUNCTION(1, "I2S0_DI"),
+		MTK_FUNCTION(2, "SPI4_MI_A"),
+		MTK_FUNCTION(3, "I2S2_DI"),
+		MTK_FUNCTION(4, "SPM_JTAG_TDO"),
+		MTK_FUNCTION(5, "SCP_JTAG_TDO"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TDO"),
+		MTK_FUNCTION(7, "CONN_MCU_TDO")
+	),
+
+	MTK_PIN(
+		14, "GPIO14",
+		MTK_EINT_FUNCTION(0, 14),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO14"),
+		MTK_FUNCTION(3, "CLKM0"),
+		MTK_FUNCTION(4, "SPM_JTAG_TMS"),
+		MTK_FUNCTION(5, "SCP_JTAG_TMS"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TMS"),
+		MTK_FUNCTION(7, "CONN_MCU_TMS")
+	),
+
+	MTK_PIN(
+		15, "GPIO15",
+		MTK_EINT_FUNCTION(0, 15),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO15"),
+		MTK_FUNCTION(1, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(2, "SRCLKENAI1"),
+		MTK_FUNCTION(3, "CLKM1"),
+		MTK_FUNCTION(4, "PWM0")
+	),
+
+	MTK_PIN(
+		16, "GPIO16",
+		MTK_EINT_FUNCTION(0, 16),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO16"),
+		MTK_FUNCTION(1, "CONN_WIFI_TXD"),
+		MTK_FUNCTION(2, "SRCLKENAI0"),
+		MTK_FUNCTION(3, "CLKM2"),
+		MTK_FUNCTION(4, "PWM1")
+	),
+
+	MTK_PIN(
+		17, "GPIO17",
+		MTK_EINT_FUNCTION(0, 17),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO17"),
+		MTK_FUNCTION(3, "CLKM3"),
+		MTK_FUNCTION(4, "PWM2"),
+		MTK_FUNCTION(7, "dbg_mon_a32")
+	),
+
+	MTK_PIN(
+		18, "GPIO18",
+		MTK_EINT_FUNCTION(0, 18),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO18"),
+		MTK_FUNCTION(2, "CMVREF0"),
+		MTK_FUNCTION(6, "SPI2_CLK_B"),
+		MTK_FUNCTION(7, "dbg_mon_a26")
+	),
+
+	MTK_PIN(
+		19, "GPIO19",
+		MTK_EINT_FUNCTION(0, 19),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO19"),
+		MTK_FUNCTION(2, "CMVREF1"),
+		MTK_FUNCTION(5, "ANT_SEL3"),
+		MTK_FUNCTION(6, "SPI2_CSB_B"),
+		MTK_FUNCTION(7, "dbg_mon_a2")
+	),
+
+	MTK_PIN(
+		20, "GPIO20",
+		MTK_EINT_FUNCTION(0, 20),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO20"),
+		MTK_FUNCTION(2, "CMVREF2"),
+		MTK_FUNCTION(5, "ANT_SEL4"),
+		MTK_FUNCTION(6, "SPI2_MO_B"),
+		MTK_FUNCTION(7, "dbg_mon_a3")
+	),
+
+	MTK_PIN(
+		21, "GPIO21",
+		MTK_EINT_FUNCTION(0, 21),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO21"),
+		MTK_FUNCTION(1, "I2S0_MCK"),
+		MTK_FUNCTION(2, "I2S1_MCK"),
+		MTK_FUNCTION(3, "I2S3_MCK"),
+		MTK_FUNCTION(5, "ANT_SEL5"),
+		MTK_FUNCTION(6, "SPI2_MI_B"),
+		MTK_FUNCTION(7, "dbg_mon_a4")
+	),
+
+	MTK_PIN(
+		22, "GPIO22",
+		MTK_EINT_FUNCTION(0, 22),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO22"),
+		MTK_FUNCTION(1, "I2S0_BCK"),
+		MTK_FUNCTION(2, "I2S1_BCK"),
+		MTK_FUNCTION(3, "I2S3_BCK"),
+		MTK_FUNCTION(4, "TDM_RX_LRCK"),
+		MTK_FUNCTION(5, "ANT_SEL6"),
+		MTK_FUNCTION(7, "dbg_mon_a5")
+	),
+
+	MTK_PIN(
+		23, "GPIO23",
+		MTK_EINT_FUNCTION(0, 23),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO23"),
+		MTK_FUNCTION(1, "I2S0_LRCK"),
+		MTK_FUNCTION(2, "I2S1_LRCK"),
+		MTK_FUNCTION(3, "I2S3_LRCK"),
+		MTK_FUNCTION(4, "TDM_RX_BCK"),
+		MTK_FUNCTION(5, "ANT_SEL7"),
+		MTK_FUNCTION(7, "dbg_mon_a6")
+	),
+
+	MTK_PIN(
+		24, "GPIO24",
+		MTK_EINT_FUNCTION(0, 24),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO24"),
+		MTK_FUNCTION(1, "I2S0_DI"),
+		MTK_FUNCTION(2, "I2S1_DO"),
+		MTK_FUNCTION(3, "I2S3_DO"),
+		MTK_FUNCTION(4, "TDM_RX_MCK"),
+		MTK_FUNCTION(7, "dbg_mon_a7")
+	),
+
+	MTK_PIN(
+		25, "GPIO25",
+		MTK_EINT_FUNCTION(0, 25),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO25"),
+		MTK_FUNCTION(1, "I2S2_MCK"),
+		MTK_FUNCTION(2, "PCM_CLK"),
+		MTK_FUNCTION(3, "SPI4_CLK_B"),
+		MTK_FUNCTION(4, "TDM_RX_DATA0"),
+		MTK_FUNCTION(7, "dbg_mon_a8")
+	),
+
+	MTK_PIN(
+		26, "GPIO26",
+		MTK_EINT_FUNCTION(0, 26),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO26"),
+		MTK_FUNCTION(1, "I2S2_BCK"),
+		MTK_FUNCTION(2, "PCM_SYNC"),
+		MTK_FUNCTION(3, "SPI4_CSB_B"),
+		MTK_FUNCTION(4, "TDM_RX_DATA1"),
+		MTK_FUNCTION(7, "dbg_mon_a9")
+	),
+
+	MTK_PIN(
+		27, "GPIO27",
+		MTK_EINT_FUNCTION(0, 27),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO27"),
+		MTK_FUNCTION(1, "I2S2_LRCK"),
+		MTK_FUNCTION(2, "PCM_DI"),
+		MTK_FUNCTION(3, "SPI4_MO_B"),
+		MTK_FUNCTION(4, "TDM_RX_DATA2"),
+		MTK_FUNCTION(7, "dbg_mon_a10")
+	),
+
+	MTK_PIN(
+		28, "GPIO28",
+		MTK_EINT_FUNCTION(0, 28),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO28"),
+		MTK_FUNCTION(1, "I2S2_DI"),
+		MTK_FUNCTION(2, "PCM_DO"),
+		MTK_FUNCTION(3, "SPI4_MI_B"),
+		MTK_FUNCTION(4, "TDM_RX_DATA3")
+	),
+
+	MTK_PIN(
+		29, "GPIO29",
+		MTK_EINT_FUNCTION(0, 29),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO29"),
+		MTK_FUNCTION(1, "ANT_SEL0"),
+		MTK_FUNCTION(2, "GPS_L1_ELNA_EN")
+	),
+
+	MTK_PIN(
+		30, "GPIO30",
+		MTK_EINT_FUNCTION(0, 30),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO30"),
+		MTK_FUNCTION(1, "ANT_SEL1")
+	),
+
+	MTK_PIN(
+		31, "GPIO31",
+		MTK_EINT_FUNCTION(0, 31),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO31"),
+		MTK_FUNCTION(1, "ANT_SEL2"),
+		MTK_FUNCTION(2, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(3, "SRCLKENAI1")
+	),
+
+	MTK_PIN(
+		32, "GPIO32",
+		MTK_EINT_FUNCTION(0, 32),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO32"),
+		MTK_FUNCTION(1, "URXD0"),
+		MTK_FUNCTION(2, "UTXD0"),
+		MTK_FUNCTION(3, "ADSP_UART_RX"),
+		MTK_FUNCTION(4, "TP_URXD1_AO")
+	),
+
+	MTK_PIN(
+		33, "GPIO33",
+		MTK_EINT_FUNCTION(0, 33),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO33"),
+		MTK_FUNCTION(1, "UTXD0"),
+		MTK_FUNCTION(2, "URXD0"),
+		MTK_FUNCTION(3, "ADSP_UART_TX"),
+		MTK_FUNCTION(4, "TP_UTXD1_AO")
+	),
+
+	MTK_PIN(
+		34, "GPIO34",
+		MTK_EINT_FUNCTION(0, 34),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO34"),
+		MTK_FUNCTION(1, "URXD1"),
+		MTK_FUNCTION(2, "TP_URXD2_AO"),
+		MTK_FUNCTION(3, "SSPM_URXD_AO"),
+		MTK_FUNCTION(4, "ADSP_UART_RX"),
+		MTK_FUNCTION(5, "CONN_UART0_RXD")
+	),
+
+	MTK_PIN(
+		35, "GPIO35",
+		MTK_EINT_FUNCTION(0, 35),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO35"),
+		MTK_FUNCTION(1, "UTXD1"),
+		MTK_FUNCTION(2, "TP_UTXD2_AO"),
+		MTK_FUNCTION(3, "SSPM_UTXD_AO"),
+		MTK_FUNCTION(4, "ADSP_UART_TX"),
+		MTK_FUNCTION(5, "CONN_UART0_TXD"),
+		MTK_FUNCTION(6, "CONN_WIFI_TXD")
+	),
+
+	MTK_PIN(
+		36, "GPIO36",
+		MTK_EINT_FUNCTION(0, 36),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO36"),
+		MTK_FUNCTION(1, "SPI0_CLK_A"),
+		MTK_FUNCTION(2, "CLKM0"),
+		MTK_FUNCTION(4, "SCP_SPI0_CK"),
+		MTK_FUNCTION(5, "SPINOR_CK"),
+		MTK_FUNCTION(7, "dbg_mon_a11")
+	),
+
+	MTK_PIN(
+		37, "GPIO37",
+		MTK_EINT_FUNCTION(0, 37),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO37"),
+		MTK_FUNCTION(1, "SPI0_CSB_A"),
+		MTK_FUNCTION(2, "CLKM1"),
+		MTK_FUNCTION(3, "PWM0"),
+		MTK_FUNCTION(4, "SCP_SPI0_CS"),
+		MTK_FUNCTION(5, "SPINOR_CS"),
+		MTK_FUNCTION(7, "dbg_mon_a12")
+	),
+
+	MTK_PIN(
+		38, "GPIO38",
+		MTK_EINT_FUNCTION(0, 38),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO38"),
+		MTK_FUNCTION(1, "SPI0_MO_A"),
+		MTK_FUNCTION(2, "CLKM2"),
+		MTK_FUNCTION(3, "PWM1"),
+		MTK_FUNCTION(4, "SCP_SPI0_MO"),
+		MTK_FUNCTION(5, "SPINOR_IO0"),
+		MTK_FUNCTION(7, "dbg_mon_a13")
+	),
+
+	MTK_PIN(
+		39, "GPIO39",
+		MTK_EINT_FUNCTION(0, 39),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO39"),
+		MTK_FUNCTION(1, "SPI0_MI_A"),
+		MTK_FUNCTION(2, "CLKM3"),
+		MTK_FUNCTION(3, "PWM2"),
+		MTK_FUNCTION(4, "SCP_SPI0_MI"),
+		MTK_FUNCTION(5, "SPINOR_IO1"),
+		MTK_FUNCTION(7, "dbg_mon_a14")
+	),
+
+	MTK_PIN(
+		40, "GPIO40",
+		MTK_EINT_FUNCTION(0, 40),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO40"),
+		MTK_FUNCTION(1, "SPI1_CLK_A"),
+		MTK_FUNCTION(2, "SCP_SPI1_CK"),
+		MTK_FUNCTION(4, "UCTS0"),
+		MTK_FUNCTION(5, "SPINOR_IO2"),
+		MTK_FUNCTION(6, "TP_UCTS1_AO"),
+		MTK_FUNCTION(7, "dbg_mon_a15")
+	),
+
+	MTK_PIN(
+		41, "GPIO41",
+		MTK_EINT_FUNCTION(0, 41),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO41"),
+		MTK_FUNCTION(1, "SPI1_CSB_A"),
+		MTK_FUNCTION(2, "SCP_SPI1_CS"),
+		MTK_FUNCTION(3, "PWM0"),
+		MTK_FUNCTION(4, "URTS0"),
+		MTK_FUNCTION(5, "SPINOR_IO3"),
+		MTK_FUNCTION(6, "TP_URTS1_AO"),
+		MTK_FUNCTION(7, "dbg_mon_a16")
+	),
+
+	MTK_PIN(
+		42, "GPIO42",
+		MTK_EINT_FUNCTION(0, 42),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO42"),
+		MTK_FUNCTION(1, "SPI1_MO_A"),
+		MTK_FUNCTION(2, "SCP_SPI1_MO"),
+		MTK_FUNCTION(3, "PWM1"),
+		MTK_FUNCTION(4, "UCTS1"),
+		MTK_FUNCTION(6, "TP_UCTS2_AO"),
+		MTK_FUNCTION(7, "dbg_mon_a17")
+	),
+
+	MTK_PIN(
+		43, "GPIO43",
+		MTK_EINT_FUNCTION(0, 43),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO43"),
+		MTK_FUNCTION(1, "SPI1_MI_A"),
+		MTK_FUNCTION(2, "SCP_SPI1_MI"),
+		MTK_FUNCTION(3, "PWM2"),
+		MTK_FUNCTION(4, "URTS1"),
+		MTK_FUNCTION(6, "TP_URTS2_AO"),
+		MTK_FUNCTION(7, "dbg_mon_a18")
+	),
+
+	MTK_PIN(
+		44, "GPIO44",
+		MTK_EINT_FUNCTION(0, 44),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO44"),
+		MTK_FUNCTION(1, "SPI2_CLK_A"),
+		MTK_FUNCTION(2, "SCP_SPI0_CK"),
+		MTK_FUNCTION(7, "dbg_mon_a19")
+	),
+
+	MTK_PIN(
+		45, "GPIO45",
+		MTK_EINT_FUNCTION(0, 45),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO45"),
+		MTK_FUNCTION(1, "SPI2_CSB_A"),
+		MTK_FUNCTION(2, "SCP_SPI0_CS"),
+		MTK_FUNCTION(7, "dbg_mon_a20")
+	),
+
+	MTK_PIN(
+		46, "GPIO46",
+		MTK_EINT_FUNCTION(0, 46),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO46"),
+		MTK_FUNCTION(1, "SPI2_MO_A"),
+		MTK_FUNCTION(2, "SCP_SPI0_MO"),
+		MTK_FUNCTION(7, "dbg_mon_a21")
+	),
+
+	MTK_PIN(
+		47, "GPIO47",
+		MTK_EINT_FUNCTION(0, 47),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO47"),
+		MTK_FUNCTION(1, "SPI2_MI_A"),
+		MTK_FUNCTION(2, "SCP_SPI0_MI"),
+		MTK_FUNCTION(7, "dbg_mon_a22")
+	),
+
+	MTK_PIN(
+		48, "GPIO48",
+		MTK_EINT_FUNCTION(0, 48),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO48"),
+		MTK_FUNCTION(1, "SPI3_CLK"),
+		MTK_FUNCTION(2, "TP_URXD1_AO"),
+		MTK_FUNCTION(3, "TP_URXD2_AO"),
+		MTK_FUNCTION(4, "URXD1"),
+		MTK_FUNCTION(5, "I2S2_MCK"),
+		MTK_FUNCTION(6, "SCP_SPI0_CK")
+	),
+
+	MTK_PIN(
+		49, "GPIO49",
+		MTK_EINT_FUNCTION(0, 49),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO49"),
+		MTK_FUNCTION(1, "SPI3_CSB"),
+		MTK_FUNCTION(2, "TP_UTXD1_AO"),
+		MTK_FUNCTION(3, "TP_UTXD2_AO"),
+		MTK_FUNCTION(4, "UTXD1"),
+		MTK_FUNCTION(5, "I2S2_BCK"),
+		MTK_FUNCTION(6, "SCP_SPI0_CS")
+	),
+
+	MTK_PIN(
+		50, "GPIO50",
+		MTK_EINT_FUNCTION(0, 50),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO50"),
+		MTK_FUNCTION(1, "SPI3_MO"),
+		MTK_FUNCTION(5, "I2S2_LRCK"),
+		MTK_FUNCTION(6, "SCP_SPI0_MO")
+	),
+
+	MTK_PIN(
+		51, "GPIO51",
+		MTK_EINT_FUNCTION(0, 51),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO51"),
+		MTK_FUNCTION(1, "SPI3_MI"),
+		MTK_FUNCTION(5, "I2S2_DI"),
+		MTK_FUNCTION(6, "SCP_SPI0_MI")
+	),
+
+	MTK_PIN(
+		52, "GPIO52",
+		MTK_EINT_FUNCTION(0, 52),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO52"),
+		MTK_FUNCTION(1, "SPI5_CLK"),
+		MTK_FUNCTION(2, "I2S2_MCK"),
+		MTK_FUNCTION(3, "I2S1_MCK"),
+		MTK_FUNCTION(4, "SCP_SPI1_CK"),
+		MTK_FUNCTION(5, "LVTS_26M"),
+		MTK_FUNCTION(6, "DFD_TCK_XI"),
+		MTK_FUNCTION(7, "dbg_mon_b30")
+	),
+
+	MTK_PIN(
+		53, "GPIO53",
+		MTK_EINT_FUNCTION(0, 53),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO53"),
+		MTK_FUNCTION(1, "SPI5_CSB"),
+		MTK_FUNCTION(2, "I2S2_BCK"),
+		MTK_FUNCTION(3, "I2S1_BCK"),
+		MTK_FUNCTION(4, "SCP_SPI1_CS"),
+		MTK_FUNCTION(5, "LVTS_FOUT"),
+		MTK_FUNCTION(6, "DFD_TDI"),
+		MTK_FUNCTION(7, "dbg_mon_b31")
+	),
+
+	MTK_PIN(
+		54, "GPIO54",
+		MTK_EINT_FUNCTION(0, 54),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO54"),
+		MTK_FUNCTION(1, "SPI5_MO"),
+		MTK_FUNCTION(2, "I2S2_LRCK"),
+		MTK_FUNCTION(3, "I2S1_LRCK"),
+		MTK_FUNCTION(4, "SCP_SPI1_MO"),
+		MTK_FUNCTION(5, "LVTS_SCK"),
+		MTK_FUNCTION(6, "DFD_TDO"),
+		MTK_FUNCTION(7, "dbg_mon_a1")
+	),
+
+	MTK_PIN(
+		55, "GPIO55",
+		MTK_EINT_FUNCTION(0, 55),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO55"),
+		MTK_FUNCTION(1, "SPI5_MI"),
+		MTK_FUNCTION(2, "I2S2_DI"),
+		MTK_FUNCTION(3, "I2S1_DO"),
+		MTK_FUNCTION(4, "SCP_SPI1_MI"),
+		MTK_FUNCTION(5, "LVTS_SDO"),
+		MTK_FUNCTION(6, "DFD_TMS"),
+		MTK_FUNCTION(7, "dbg_mon_b32")
+	),
+
+	MTK_PIN(
+		56, "GPIO56",
+		MTK_EINT_FUNCTION(0, 56),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO56"),
+		MTK_FUNCTION(1, "I2S1_DO"),
+		MTK_FUNCTION(2, "I2S3_DO"),
+		MTK_FUNCTION(7, "dbg_mon_a23")
+	),
+
+	MTK_PIN(
+		57, "GPIO57",
+		MTK_EINT_FUNCTION(0, 57),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO57"),
+		MTK_FUNCTION(1, "I2S1_BCK"),
+		MTK_FUNCTION(2, "I2S3_BCK"),
+		MTK_FUNCTION(7, "dbg_mon_a24")
+	),
+
+	MTK_PIN(
+		58, "GPIO58",
+		MTK_EINT_FUNCTION(0, 58),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO58"),
+		MTK_FUNCTION(1, "I2S1_LRCK"),
+		MTK_FUNCTION(2, "I2S3_LRCK"),
+		MTK_FUNCTION(7, "dbg_mon_a25")
+	),
+
+	MTK_PIN(
+		59, "GPIO59",
+		MTK_EINT_FUNCTION(0, 59),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO59"),
+		MTK_FUNCTION(1, "I2S1_MCK"),
+		MTK_FUNCTION(2, "I2S3_MCK"),
+		MTK_FUNCTION(7, "dbg_mon_a27")
+	),
+
+	MTK_PIN(
+		60, "GPIO60",
+		MTK_EINT_FUNCTION(0, 60),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO60"),
+		MTK_FUNCTION(1, "TDM_RX_LRCK"),
+		MTK_FUNCTION(2, "ANT_SEL3"),
+		MTK_FUNCTION(5, "CONN_MCU_DBGACK_N")
+	),
+
+	MTK_PIN(
+		61, "GPIO61",
+		MTK_EINT_FUNCTION(0, 61),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO61"),
+		MTK_FUNCTION(1, "TDM_RX_BCK"),
+		MTK_FUNCTION(2, "ANT_SEL4"),
+		MTK_FUNCTION(4, "SPINOR_CK"),
+		MTK_FUNCTION(5, "CONN_MCU_DBGI_N")
+	),
+
+	MTK_PIN(
+		62, "GPIO62",
+		MTK_EINT_FUNCTION(0, 62),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO62"),
+		MTK_FUNCTION(1, "TDM_RX_MCK"),
+		MTK_FUNCTION(2, "ANT_SEL5"),
+		MTK_FUNCTION(4, "SPINOR_CS"),
+		MTK_FUNCTION(5, "CONN_MCU_TDI")
+	),
+
+	MTK_PIN(
+		63, "GPIO63",
+		MTK_EINT_FUNCTION(0, 63),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO63"),
+		MTK_FUNCTION(1, "TDM_RX_DATA0"),
+		MTK_FUNCTION(2, "ANT_SEL6"),
+		MTK_FUNCTION(4, "SPINOR_IO0"),
+		MTK_FUNCTION(5, "CONN_MCU_TRST_B")
+	),
+
+	MTK_PIN(
+		64, "GPIO64",
+		MTK_EINT_FUNCTION(0, 64),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO64"),
+		MTK_FUNCTION(1, "TDM_RX_DATA1"),
+		MTK_FUNCTION(2, "ANT_SEL7"),
+		MTK_FUNCTION(3, "PWM0"),
+		MTK_FUNCTION(4, "SPINOR_IO1"),
+		MTK_FUNCTION(5, "CONN_MCU_TCK")
+	),
+
+	MTK_PIN(
+		65, "GPIO65",
+		MTK_EINT_FUNCTION(0, 65),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO65"),
+		MTK_FUNCTION(1, "TDM_RX_DATA2"),
+		MTK_FUNCTION(2, "UCTS0"),
+		MTK_FUNCTION(3, "PWM1"),
+		MTK_FUNCTION(4, "SPINOR_IO2"),
+		MTK_FUNCTION(5, "CONN_MCU_TDO"),
+		MTK_FUNCTION(6, "TP_UCTS1_AO"),
+		MTK_FUNCTION(7, "TP_UCTS2_AO")
+	),
+
+	MTK_PIN(
+		66, "GPIO66",
+		MTK_EINT_FUNCTION(0, 66),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO66"),
+		MTK_FUNCTION(1, "TDM_RX_DATA3"),
+		MTK_FUNCTION(2, "URTS0"),
+		MTK_FUNCTION(3, "PWM2"),
+		MTK_FUNCTION(4, "SPINOR_IO3"),
+		MTK_FUNCTION(5, "CONN_MCU_TMS"),
+		MTK_FUNCTION(6, "TP_URTS1_AO"),
+		MTK_FUNCTION(7, "TP_URTS2_AO")
+	),
+
+	MTK_PIN(
+		67, "GPIO67",
+		MTK_EINT_FUNCTION(0, 67),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO67"),
+		MTK_FUNCTION(1, "MSDC0_DSL")
+	),
+
+	MTK_PIN(
+		68, "GPIO68",
+		MTK_EINT_FUNCTION(0, 68),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO68"),
+		MTK_FUNCTION(1, "MSDC0_CLK")
+	),
+
+	MTK_PIN(
+		69, "GPIO69",
+		MTK_EINT_FUNCTION(0, 69),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO69"),
+		MTK_FUNCTION(1, "MSDC0_CMD")
+	),
+
+	MTK_PIN(
+		70, "GPIO70",
+		MTK_EINT_FUNCTION(0, 70),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO70"),
+		MTK_FUNCTION(1, "MSDC0_RSTB")
+	),
+
+	MTK_PIN(
+		71, "GPIO71",
+		MTK_EINT_FUNCTION(0, 71),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO71"),
+		MTK_FUNCTION(1, "MSDC0_DAT0")
+	),
+
+	MTK_PIN(
+		72, "GPIO72",
+		MTK_EINT_FUNCTION(0, 72),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO72"),
+		MTK_FUNCTION(1, "MSDC0_DAT1")
+	),
+
+	MTK_PIN(
+		73, "GPIO73",
+		MTK_EINT_FUNCTION(0, 73),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO73"),
+		MTK_FUNCTION(1, "MSDC0_DAT2")
+	),
+
+	MTK_PIN(
+		74, "GPIO74",
+		MTK_EINT_FUNCTION(0, 74),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO74"),
+		MTK_FUNCTION(1, "MSDC0_DAT3")
+	),
+
+	MTK_PIN(
+		75, "GPIO75",
+		MTK_EINT_FUNCTION(0, 75),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO75"),
+		MTK_FUNCTION(1, "MSDC0_DAT4")
+	),
+
+	MTK_PIN(
+		76, "GPIO76",
+		MTK_EINT_FUNCTION(0, 76),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO76"),
+		MTK_FUNCTION(1, "MSDC0_DAT5")
+	),
+
+	MTK_PIN(
+		77, "GPIO77",
+		MTK_EINT_FUNCTION(0, 77),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO77"),
+		MTK_FUNCTION(1, "MSDC0_DAT6")
+	),
+
+	MTK_PIN(
+		78, "GPIO78",
+		MTK_EINT_FUNCTION(0, 78),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO78"),
+		MTK_FUNCTION(1, "MSDC0_DAT7")
+	),
+
+	MTK_PIN(
+		79, "GPIO79",
+		MTK_EINT_FUNCTION(0, 79),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO79"),
+		MTK_FUNCTION(1, "KPCOL0")
+	),
+
+	MTK_PIN(
+		80, "GPIO80",
+		MTK_EINT_FUNCTION(0, 80),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO80"),
+		MTK_FUNCTION(1, "KPCOL1"),
+		MTK_FUNCTION(2, "GPS_L1_ELNA_EN"),
+		MTK_FUNCTION(3, "PWM0"),
+		MTK_FUNCTION(4, "CLKM0")
+	),
+
+	MTK_PIN(
+		81, "GPIO81",
+		MTK_EINT_FUNCTION(0, 81),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO81"),
+		MTK_FUNCTION(1, "KPROW0"),
+		MTK_FUNCTION(3, "PWM1"),
+		MTK_FUNCTION(4, "CLKM1")
+	),
+
+	MTK_PIN(
+		82, "GPIO82",
+		MTK_EINT_FUNCTION(0, 82),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO82"),
+		MTK_FUNCTION(1, "KPROW1"),
+		MTK_FUNCTION(3, "PWM2"),
+		MTK_FUNCTION(4, "CLKM2")
+	),
+
+	MTK_PIN(
+		83, "GPIO83",
+		MTK_EINT_FUNCTION(0, 83),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO83"),
+		MTK_FUNCTION(1, "AP_GOOD"),
+		MTK_FUNCTION(2, "GPS_PPS"),
+		MTK_FUNCTION(4, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(7, "dbg_mon_a28")
+	),
+
+	MTK_PIN(
+		84, "GPIO84",
+		MTK_EINT_FUNCTION(0, 84),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO84"),
+		MTK_FUNCTION(1, "MSDC1_CLK"),
+		MTK_FUNCTION(2, "ADSP_JTAG_TCK"),
+		MTK_FUNCTION(4, "UDI_TCK"),
+		MTK_FUNCTION(5, "CONN_DSP_JCK"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TCK"),
+		MTK_FUNCTION(7, "DFD_TCK_XI")
+	),
+
+	MTK_PIN(
+		85, "GPIO85",
+		MTK_EINT_FUNCTION(0, 85),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO85"),
+		MTK_FUNCTION(1, "MSDC1_CMD"),
+		MTK_FUNCTION(2, "ADSP_JTAG_TMS"),
+		MTK_FUNCTION(3, "CONN_MCU_AICE_TMSC"),
+		MTK_FUNCTION(4, "UDI_TMS"),
+		MTK_FUNCTION(5, "CONN_DSP_JMS"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TMS"),
+		MTK_FUNCTION(7, "DFD_TMS")
+	),
+
+	MTK_PIN(
+		86, "GPIO86",
+		MTK_EINT_FUNCTION(0, 86),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO86"),
+		MTK_FUNCTION(1, "MSDC1_DAT0"),
+		MTK_FUNCTION(2, "ADSP_JTAG_TDI"),
+		MTK_FUNCTION(4, "UDI_TDI"),
+		MTK_FUNCTION(5, "CONN_DSP_JDI"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TDI"),
+		MTK_FUNCTION(7, "DFD_TDI")
+	),
+
+	MTK_PIN(
+		87, "GPIO87",
+		MTK_EINT_FUNCTION(0, 87),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO87"),
+		MTK_FUNCTION(1, "MSDC1_DAT1"),
+		MTK_FUNCTION(2, "ADSP_JTAG_TDO"),
+		MTK_FUNCTION(4, "UDI_TDO"),
+		MTK_FUNCTION(5, "CONN_DSP_JDO"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TDO"),
+		MTK_FUNCTION(7, "DFD_TDO")
+	),
+
+	MTK_PIN(
+		88, "GPIO88",
+		MTK_EINT_FUNCTION(0, 88),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO88"),
+		MTK_FUNCTION(1, "MSDC1_DAT2"),
+		MTK_FUNCTION(2, "ADSP_JTAG_TRSTN"),
+		MTK_FUNCTION(3, "CONN_MCU_AICE_TCKC"),
+		MTK_FUNCTION(4, "UDI_NTRST"),
+		MTK_FUNCTION(5, "CONN_WIFI_TXD"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TRSTN")
+	),
+
+	MTK_PIN(
+		89, "GPIO89",
+		MTK_EINT_FUNCTION(0, 89),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO89"),
+		MTK_FUNCTION(1, "MSDC1_DAT3"),
+		MTK_FUNCTION(5, "CONN_DSP_JINTP")
+	),
+
+	MTK_PIN(
+		90, "GPIO90",
+		MTK_EINT_FUNCTION(0, 90),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO90"),
+		MTK_FUNCTION(1, "IDDIG_P0"),
+		MTK_FUNCTION(4, "PGD_HV_HSC_PWR4"),
+		MTK_FUNCTION(5, "GDU_SUM_TROOP2_2")
+	),
+
+	MTK_PIN(
+		91, "GPIO91",
+		MTK_EINT_FUNCTION(0, 91),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO91"),
+		MTK_FUNCTION(1, "USB_DRVVBUS_P0"),
+		MTK_FUNCTION(4, "PGD_HV_HSC_PWR5"),
+		MTK_FUNCTION(5, "GDU_TROOPS_DET0")
+	),
+
+	MTK_PIN(
+		92, "GPIO92",
+		MTK_EINT_FUNCTION(0, 92),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO92"),
+		MTK_FUNCTION(1, "VBUS_VALID_P0"),
+		MTK_FUNCTION(4, "PGD_DA_EFUSE_RDY"),
+		MTK_FUNCTION(5, "GDU_TROOPS_DET1")
+	),
+
+	MTK_PIN(
+		93, "GPIO93",
+		MTK_EINT_FUNCTION(0, 93),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO93"),
+		MTK_FUNCTION(1, "IDDIG_P1"),
+		MTK_FUNCTION(2, "PWM0"),
+		MTK_FUNCTION(3, "CLKM0"),
+		MTK_FUNCTION(4, "PGD_DA_EFUSE_RDY_PRE"),
+		MTK_FUNCTION(5, "GDU_TROOPS_DET2")
+	),
+
+	MTK_PIN(
+		94, "GPIO94",
+		MTK_EINT_FUNCTION(0, 94),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO94"),
+		MTK_FUNCTION(1, "USB_DRVVBUS_P1"),
+		MTK_FUNCTION(2, "PWM1"),
+		MTK_FUNCTION(3, "CLKM1"),
+		MTK_FUNCTION(4, "PGD_DA_PWRGD_RESET")
+	),
+
+	MTK_PIN(
+		95, "GPIO95",
+		MTK_EINT_FUNCTION(0, 95),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO95"),
+		MTK_FUNCTION(1, "VBUS_VALID_P1"),
+		MTK_FUNCTION(2, "PWM2"),
+		MTK_FUNCTION(3, "CLKM2"),
+		MTK_FUNCTION(4, "PGD_DA_PWRGD_ENB")
+	),
+
+	MTK_PIN(
+		96, "GPIO96",
+		MTK_EINT_FUNCTION(0, 96),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO96"),
+		MTK_FUNCTION(1, "DSI_TE"),
+		MTK_FUNCTION(7, "dbg_mon_a29")
+	),
+
+	MTK_PIN(
+		97, "GPIO97",
+		MTK_EINT_FUNCTION(0, 97),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO97"),
+		MTK_FUNCTION(1, "DISP_PWM"),
+		MTK_FUNCTION(7, "dbg_mon_a30")
+	),
+
+	MTK_PIN(
+		98, "GPIO98",
+		MTK_EINT_FUNCTION(0, 98),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO98"),
+		MTK_FUNCTION(1, "LCM_RST")
+	),
+
+	MTK_PIN(
+		99, "GPIO99",
+		MTK_EINT_FUNCTION(0, 99),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO99"),
+		MTK_FUNCTION(1, "DPI_PCLK"),
+		MTK_FUNCTION(2, "GPS_L1_ELNA_EN"),
+		MTK_FUNCTION(3, "SSPM_JTAG_TCK"),
+		MTK_FUNCTION(5, "ANT_SEL0"),
+		MTK_FUNCTION(6, "TP_GPIO0_AO"),
+		MTK_FUNCTION(7, "PGD_LV_LSC_PWR0")
+	),
+
+	MTK_PIN(
+		100, "GPIO100",
+		MTK_EINT_FUNCTION(0, 100),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO100"),
+		MTK_FUNCTION(1, "DPI_VSYNC"),
+		MTK_FUNCTION(2, "KPCOL2"),
+		MTK_FUNCTION(3, "SSPM_JTAG_TMS"),
+		MTK_FUNCTION(5, "ANT_SEL1"),
+		MTK_FUNCTION(6, "TP_GPIO1_AO"),
+		MTK_FUNCTION(7, "PGD_LV_LSC_PWR1")
+	),
+
+	MTK_PIN(
+		101, "GPIO101",
+		MTK_EINT_FUNCTION(0, 101),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO101"),
+		MTK_FUNCTION(1, "DPI_HSYNC"),
+		MTK_FUNCTION(2, "KPROW2"),
+		MTK_FUNCTION(3, "SSPM_JTAG_TDI"),
+		MTK_FUNCTION(5, "ANT_SEL2"),
+		MTK_FUNCTION(6, "TP_GPIO2_AO"),
+		MTK_FUNCTION(7, "PGD_LV_LSC_PWR2")
+	),
+
+	MTK_PIN(
+		102, "GPIO102",
+		MTK_EINT_FUNCTION(0, 102),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO102"),
+		MTK_FUNCTION(1, "DPI_DE"),
+		MTK_FUNCTION(3, "SSPM_JTAG_TDO"),
+		MTK_FUNCTION(5, "ANT_SEL3"),
+		MTK_FUNCTION(6, "TP_GPIO3_AO"),
+		MTK_FUNCTION(7, "PGD_LV_LSC_PWR3")
+	),
+
+	MTK_PIN(
+		103, "GPIO103",
+		MTK_EINT_FUNCTION(0, 103),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO103"),
+		MTK_FUNCTION(1, "DPI_DATA0"),
+		MTK_FUNCTION(3, "SSPM_JTAG_TRSTN"),
+		MTK_FUNCTION(4, "CLKM0"),
+		MTK_FUNCTION(5, "ANT_SEL4"),
+		MTK_FUNCTION(6, "TP_GPIO4_AO"),
+		MTK_FUNCTION(7, "PGD_LV_LSC_PWR4")
+	),
+
+	MTK_PIN(
+		104, "GPIO104",
+		MTK_EINT_FUNCTION(0, 104),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO104"),
+		MTK_FUNCTION(1, "DPI_DATA1"),
+		MTK_FUNCTION(2, "GPS_PPS"),
+		MTK_FUNCTION(3, "UCTS2"),
+		MTK_FUNCTION(4, "CLKM1"),
+		MTK_FUNCTION(5, "ANT_SEL5"),
+		MTK_FUNCTION(6, "TP_GPIO5_AO"),
+		MTK_FUNCTION(7, "PGD_LV_LSC_PWR5")
+	),
+
+	MTK_PIN(
+		105, "GPIO105",
+		MTK_EINT_FUNCTION(0, 105),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO105"),
+		MTK_FUNCTION(1, "DPI_DATA2"),
+		MTK_FUNCTION(2, "CONN_TCXOENA_REQ"),
+		MTK_FUNCTION(3, "URTS2"),
+		MTK_FUNCTION(4, "CLKM2"),
+		MTK_FUNCTION(5, "ANT_SEL6"),
+		MTK_FUNCTION(6, "TP_GPIO6_AO"),
+		MTK_FUNCTION(7, "PGD_LV_HSC_PWR0")
+	),
+
+	MTK_PIN(
+		106, "GPIO106",
+		MTK_EINT_FUNCTION(0, 106),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO106"),
+		MTK_FUNCTION(1, "DPI_DATA3"),
+		MTK_FUNCTION(2, "TP_UTXD1_AO"),
+		MTK_FUNCTION(3, "UTXD2"),
+		MTK_FUNCTION(4, "PWM0"),
+		MTK_FUNCTION(5, "ANT_SEL7"),
+		MTK_FUNCTION(6, "TP_GPIO7_AO"),
+		MTK_FUNCTION(7, "PGD_LV_HSC_PWR1")
+	),
+
+	MTK_PIN(
+		107, "GPIO107",
+		MTK_EINT_FUNCTION(0, 107),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO107"),
+		MTK_FUNCTION(1, "DPI_DATA4"),
+		MTK_FUNCTION(2, "TP_URXD1_AO"),
+		MTK_FUNCTION(3, "URXD2"),
+		MTK_FUNCTION(4, "PWM1"),
+		MTK_FUNCTION(6, "GDU_SUM_TROOP0_0"),
+		MTK_FUNCTION(7, "PGD_LV_HSC_PWR2")
+	),
+
+	MTK_PIN(
+		108, "GPIO108",
+		MTK_EINT_FUNCTION(0, 108),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO108"),
+		MTK_FUNCTION(1, "DPI_DATA5"),
+		MTK_FUNCTION(2, "TP_UCTS1_AO"),
+		MTK_FUNCTION(3, "UCTS0"),
+		MTK_FUNCTION(4, "PWM2"),
+		MTK_FUNCTION(6, "GDU_SUM_TROOP0_1"),
+		MTK_FUNCTION(7, "PGD_LV_HSC_PWR3")
+	),
+
+	MTK_PIN(
+		109, "GPIO109",
+		MTK_EINT_FUNCTION(0, 109),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO109"),
+		MTK_FUNCTION(1, "DPI_DATA6"),
+		MTK_FUNCTION(2, "TP_URTS1_AO"),
+		MTK_FUNCTION(3, "URTS0"),
+		MTK_FUNCTION(4, "I2S0_DI"),
+		MTK_FUNCTION(5, "I2S2_DI"),
+		MTK_FUNCTION(6, "GDU_SUM_TROOP0_2"),
+		MTK_FUNCTION(7, "PGD_LV_HSC_PWR4")
+	),
+
+	MTK_PIN(
+		110, "GPIO110",
+		MTK_EINT_FUNCTION(0, 110),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO110"),
+		MTK_FUNCTION(1, "DPI_DATA7"),
+		MTK_FUNCTION(2, "TP_UCTS2_AO"),
+		MTK_FUNCTION(3, "UCTS1"),
+		MTK_FUNCTION(4, "I2S3_BCK"),
+		MTK_FUNCTION(5, "I2S1_BCK"),
+		MTK_FUNCTION(6, "GDU_SUM_TROOP1_0"),
+		MTK_FUNCTION(7, "PGD_LV_HSC_PWR5")
+	),
+
+	MTK_PIN(
+		111, "GPIO111",
+		MTK_EINT_FUNCTION(0, 111),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO111"),
+		MTK_FUNCTION(1, "DPI_DATA8"),
+		MTK_FUNCTION(2, "TP_URTS2_AO"),
+		MTK_FUNCTION(3, "URTS1"),
+		MTK_FUNCTION(4, "I2S3_MCK"),
+		MTK_FUNCTION(5, "I2S1_MCK"),
+		MTK_FUNCTION(6, "GDU_SUM_TROOP1_1"),
+		MTK_FUNCTION(7, "PGD_HV_HSC_PWR0")
+	),
+
+	MTK_PIN(
+		112, "GPIO112",
+		MTK_EINT_FUNCTION(0, 112),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO112"),
+		MTK_FUNCTION(1, "DPI_DATA9"),
+		MTK_FUNCTION(2, "TP_URXD2_AO"),
+		MTK_FUNCTION(3, "URXD1"),
+		MTK_FUNCTION(4, "I2S3_LRCK"),
+		MTK_FUNCTION(5, "I2S1_LRCK"),
+		MTK_FUNCTION(6, "GDU_SUM_TROOP1_2"),
+		MTK_FUNCTION(7, "PGD_HV_HSC_PWR1")
+	),
+
+	MTK_PIN(
+		113, "GPIO113",
+		MTK_EINT_FUNCTION(0, 113),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO113"),
+		MTK_FUNCTION(1, "DPI_DATA10"),
+		MTK_FUNCTION(2, "TP_UTXD2_AO"),
+		MTK_FUNCTION(3, "UTXD1"),
+		MTK_FUNCTION(4, "I2S3_DO"),
+		MTK_FUNCTION(5, "I2S1_DO"),
+		MTK_FUNCTION(6, "GDU_SUM_TROOP2_0"),
+		MTK_FUNCTION(7, "PGD_HV_HSC_PWR2")
+	),
+
+	MTK_PIN(
+		114, "GPIO114",
+		MTK_EINT_FUNCTION(0, 114),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO114"),
+		MTK_FUNCTION(1, "DPI_DATA11"),
+		MTK_FUNCTION(6, "GDU_SUM_TROOP2_1"),
+		MTK_FUNCTION(7, "PGD_HV_HSC_PWR3")
+	),
+
+	MTK_PIN(
+		115, "GPIO115",
+		MTK_EINT_FUNCTION(0, 115),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO115"),
+		MTK_FUNCTION(1, "PCM_CLK"),
+		MTK_FUNCTION(2, "I2S0_BCK"),
+		MTK_FUNCTION(3, "I2S2_BCK")
+	),
+
+	MTK_PIN(
+		116, "GPIO116",
+		MTK_EINT_FUNCTION(0, 116),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO116"),
+		MTK_FUNCTION(1, "PCM_SYNC"),
+		MTK_FUNCTION(2, "I2S0_LRCK"),
+		MTK_FUNCTION(3, "I2S2_LRCK")
+	),
+
+	MTK_PIN(
+		117, "GPIO117",
+		MTK_EINT_FUNCTION(0, 117),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO117"),
+		MTK_FUNCTION(1, "PCM_DI"),
+		MTK_FUNCTION(2, "I2S0_DI"),
+		MTK_FUNCTION(3, "I2S2_DI")
+	),
+
+	MTK_PIN(
+		118, "GPIO118",
+		MTK_EINT_FUNCTION(0, 118),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO118"),
+		MTK_FUNCTION(1, "PCM_DO"),
+		MTK_FUNCTION(2, "I2S0_MCK"),
+		MTK_FUNCTION(3, "I2S2_MCK"),
+		MTK_FUNCTION(4, "I2S3_DO"),
+		MTK_FUNCTION(5, "I2S1_DO")
+	),
+
+	MTK_PIN(
+		119, "GPIO119",
+		MTK_EINT_FUNCTION(0, 119),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO119"),
+		MTK_FUNCTION(1, "JTMS_SEL1"),
+		MTK_FUNCTION(2, "UDI_TMS"),
+		MTK_FUNCTION(3, "DFD_TMS"),
+		MTK_FUNCTION(4, "SPM_JTAG_TMS"),
+		MTK_FUNCTION(5, "SCP_JTAG_TMS"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TMS")
+	),
+
+	MTK_PIN(
+		120, "GPIO120",
+		MTK_EINT_FUNCTION(0, 120),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO120"),
+		MTK_FUNCTION(1, "JTCK_SEL1"),
+		MTK_FUNCTION(2, "UDI_TCK"),
+		MTK_FUNCTION(3, "DFD_TCK_XI"),
+		MTK_FUNCTION(4, "SPM_JTAG_TCK"),
+		MTK_FUNCTION(5, "SCP_JTAG_TCK"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TCK")
+	),
+
+	MTK_PIN(
+		121, "GPIO121",
+		MTK_EINT_FUNCTION(0, 121),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO121"),
+		MTK_FUNCTION(1, "JTDI_SEL1"),
+		MTK_FUNCTION(2, "UDI_TDI"),
+		MTK_FUNCTION(3, "DFD_TDI"),
+		MTK_FUNCTION(4, "SPM_JTAG_TDI"),
+		MTK_FUNCTION(5, "SCP_JTAG_TDI"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TDI")
+	),
+
+	MTK_PIN(
+		122, "GPIO122",
+		MTK_EINT_FUNCTION(0, 122),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO122"),
+		MTK_FUNCTION(1, "JTDO_SEL1"),
+		MTK_FUNCTION(2, "UDI_TDO"),
+		MTK_FUNCTION(3, "DFD_TDO"),
+		MTK_FUNCTION(4, "SPM_JTAG_TDO"),
+		MTK_FUNCTION(5, "SCP_JTAG_TDO"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TDO")
+	),
+
+	MTK_PIN(
+		123, "GPIO123",
+		MTK_EINT_FUNCTION(0, 123),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO123"),
+		MTK_FUNCTION(1, "JTRSTN_SEL1"),
+		MTK_FUNCTION(2, "UDI_NTRST"),
+		MTK_FUNCTION(4, "SPM_JTAG_TRSTN"),
+		MTK_FUNCTION(5, "SCP_JTAG_TRSTN"),
+		MTK_FUNCTION(6, "ADSP_JTAG_TRSTN")
+	),
+
+	MTK_PIN(
+		124, "GPIO124",
+		MTK_EINT_FUNCTION(0, 124),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO124"),
+		MTK_FUNCTION(1, "CMMCLK0"),
+		MTK_FUNCTION(2, "CLKM0"),
+		MTK_FUNCTION(3, "PWM0")
+	),
+
+	MTK_PIN(
+		125, "GPIO125",
+		MTK_EINT_FUNCTION(0, 125),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO125"),
+		MTK_FUNCTION(1, "CMMCLK1"),
+		MTK_FUNCTION(2, "CLKM1"),
+		MTK_FUNCTION(3, "PWM1"),
+		MTK_FUNCTION(7, "dbg_mon_b0")
+	),
+
+	MTK_PIN(
+		126, "GPIO126",
+		MTK_EINT_FUNCTION(0, 126),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO126"),
+		MTK_FUNCTION(1, "CMMCLK2"),
+		MTK_FUNCTION(2, "CLKM2"),
+		MTK_FUNCTION(3, "PWM2"),
+		MTK_FUNCTION(7, "dbg_mon_b1")
+	),
+
+	MTK_PIN(
+		127, "GPIO127",
+		MTK_EINT_FUNCTION(0, 127),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO127"),
+		MTK_FUNCTION(1, "SCL0"),
+		MTK_FUNCTION(4, "SCP_SCL0"),
+		MTK_FUNCTION(5, "SCP_SCL1")
+	),
+
+	MTK_PIN(
+		128, "GPIO128",
+		MTK_EINT_FUNCTION(0, 128),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO128"),
+		MTK_FUNCTION(1, "SDA0"),
+		MTK_FUNCTION(4, "SCP_SDA0"),
+		MTK_FUNCTION(5, "SCP_SDA1")
+	),
+
+	MTK_PIN(
+		129, "GPIO129",
+		MTK_EINT_FUNCTION(0, 129),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO129"),
+		MTK_FUNCTION(1, "SCL1"),
+		MTK_FUNCTION(4, "SCP_SCL0"),
+		MTK_FUNCTION(5, "SCP_SCL1"),
+		MTK_FUNCTION(7, "dbg_mon_b4")
+	),
+
+	MTK_PIN(
+		130, "GPIO130",
+		MTK_EINT_FUNCTION(0, 130),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO130"),
+		MTK_FUNCTION(1, "SDA1"),
+		MTK_FUNCTION(4, "SCP_SDA0"),
+		MTK_FUNCTION(5, "SCP_SDA1"),
+		MTK_FUNCTION(7, "dbg_mon_b5")
+	),
+
+	MTK_PIN(
+		131, "GPIO131",
+		MTK_EINT_FUNCTION(0, 131),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO131"),
+		MTK_FUNCTION(1, "SCL2"),
+		MTK_FUNCTION(2, "SSPM_UTXD_AO"),
+		MTK_FUNCTION(3, "CONN_UART0_TXD"),
+		MTK_FUNCTION(4, "SCP_SCL0"),
+		MTK_FUNCTION(5, "SCP_SCL1"),
+		MTK_FUNCTION(7, "dbg_mon_b6")
+	),
+
+	MTK_PIN(
+		132, "GPIO132",
+		MTK_EINT_FUNCTION(0, 132),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO132"),
+		MTK_FUNCTION(1, "SDA2"),
+		MTK_FUNCTION(2, "SSPM_URXD_AO"),
+		MTK_FUNCTION(3, "CONN_UART0_RXD"),
+		MTK_FUNCTION(4, "SCP_SDA0"),
+		MTK_FUNCTION(5, "SCP_SDA1"),
+		MTK_FUNCTION(7, "dbg_mon_b7")
+	),
+
+	MTK_PIN(
+		133, "GPIO133",
+		MTK_EINT_FUNCTION(0, 133),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO133"),
+		MTK_FUNCTION(1, "SCL3"),
+		MTK_FUNCTION(4, "SCP_SCL0"),
+		MTK_FUNCTION(5, "SCP_SCL1"),
+		MTK_FUNCTION(7, "dbg_mon_b8")
+	),
+
+	MTK_PIN(
+		134, "GPIO134",
+		MTK_EINT_FUNCTION(0, 134),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO134"),
+		MTK_FUNCTION(1, "SDA3"),
+		MTK_FUNCTION(3, "GPS_PPS"),
+		MTK_FUNCTION(4, "SCP_SDA0"),
+		MTK_FUNCTION(5, "SCP_SDA1"),
+		MTK_FUNCTION(7, "dbg_mon_b9")
+	),
+
+	MTK_PIN(
+		135, "GPIO135",
+		MTK_EINT_FUNCTION(0, 135),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO135"),
+		MTK_FUNCTION(1, "SCL4"),
+		MTK_FUNCTION(2, "TP_UTXD1_AO"),
+		MTK_FUNCTION(3, "UTXD1"),
+		MTK_FUNCTION(4, "SCP_SCL0"),
+		MTK_FUNCTION(5, "SCP_SCL1"),
+		MTK_FUNCTION(7, "dbg_mon_b10")
+	),
+
+	MTK_PIN(
+		136, "GPIO136",
+		MTK_EINT_FUNCTION(0, 136),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO136"),
+		MTK_FUNCTION(1, "SDA4"),
+		MTK_FUNCTION(2, "TP_URXD1_AO"),
+		MTK_FUNCTION(3, "URXD1"),
+		MTK_FUNCTION(4, "SCP_SDA0"),
+		MTK_FUNCTION(5, "SCP_SDA1"),
+		MTK_FUNCTION(7, "dbg_mon_b11")
+	),
+
+	MTK_PIN(
+		137, "GPIO137",
+		MTK_EINT_FUNCTION(0, 137),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO137"),
+		MTK_FUNCTION(1, "SCL5"),
+		MTK_FUNCTION(2, "UTXD2"),
+		MTK_FUNCTION(3, "UCTS1"),
+		MTK_FUNCTION(4, "SCP_SCL0"),
+		MTK_FUNCTION(5, "SCP_SCL1")
+	),
+
+	MTK_PIN(
+		138, "GPIO138",
+		MTK_EINT_FUNCTION(0, 138),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO138"),
+		MTK_FUNCTION(1, "SDA5"),
+		MTK_FUNCTION(2, "URXD2"),
+		MTK_FUNCTION(3, "URTS1"),
+		MTK_FUNCTION(4, "SCP_SDA0"),
+		MTK_FUNCTION(5, "SCP_SDA1")
+	),
+
+	MTK_PIN(
+		139, "GPIO139",
+		MTK_EINT_FUNCTION(0, 139),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO139"),
+		MTK_FUNCTION(1, "SCL6"),
+		MTK_FUNCTION(2, "UTXD1"),
+		MTK_FUNCTION(3, "TP_UTXD1_AO"),
+		MTK_FUNCTION(4, "SCP_SCL0"),
+		MTK_FUNCTION(5, "SCP_SCL1"),
+		MTK_FUNCTION(7, "dbg_mon_b12")
+	),
+
+	MTK_PIN(
+		140, "GPIO140",
+		MTK_EINT_FUNCTION(0, 140),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO140"),
+		MTK_FUNCTION(1, "SDA6"),
+		MTK_FUNCTION(2, "URXD1"),
+		MTK_FUNCTION(3, "TP_URXD1_AO"),
+		MTK_FUNCTION(4, "SCP_SDA0"),
+		MTK_FUNCTION(5, "SCP_SDA1"),
+		MTK_FUNCTION(7, "dbg_mon_b13")
+	),
+
+	MTK_PIN(
+		141, "GPIO141",
+		MTK_EINT_FUNCTION(0, 141),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO141"),
+		MTK_FUNCTION(1, "SCL7"),
+		MTK_FUNCTION(2, "URTS0"),
+		MTK_FUNCTION(3, "TP_URTS1_AO"),
+		MTK_FUNCTION(4, "SCP_SCL0"),
+		MTK_FUNCTION(5, "SCP_SCL1"),
+		MTK_FUNCTION(6, "UDI_TCK"),
+		MTK_FUNCTION(7, "dbg_mon_b14")
+	),
+
+	MTK_PIN(
+		142, "GPIO142",
+		MTK_EINT_FUNCTION(0, 142),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO142"),
+		MTK_FUNCTION(1, "SDA7"),
+		MTK_FUNCTION(2, "UCTS0"),
+		MTK_FUNCTION(3, "TP_UCTS1_AO"),
+		MTK_FUNCTION(4, "SCP_SDA0"),
+		MTK_FUNCTION(5, "SCP_SDA1")
+	),
+
+	MTK_PIN(
+		143, "GPIO143",
+		MTK_EINT_FUNCTION(0, 143),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO143"),
+		MTK_FUNCTION(1, "SCL8"),
+		MTK_FUNCTION(4, "SCP_SCL0"),
+		MTK_FUNCTION(5, "SCP_SCL1"),
+		MTK_FUNCTION(7, "dbg_mon_b16")
+	),
+
+	MTK_PIN(
+		144, "GPIO144",
+		MTK_EINT_FUNCTION(0, 144),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO144"),
+		MTK_FUNCTION(1, "SDA8"),
+		MTK_FUNCTION(4, "SCP_SDA0"),
+		MTK_FUNCTION(5, "SCP_SDA1"),
+		MTK_FUNCTION(7, "dbg_mon_b17")
+	),
+
+	MTK_PIN(
+		145, "GPIO145",
+		MTK_EINT_FUNCTION(0, 145),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO145"),
+		MTK_FUNCTION(1, "SCL9"),
+		MTK_FUNCTION(2, "CMVREF1"),
+		MTK_FUNCTION(3, "GPS_PPS"),
+		MTK_FUNCTION(4, "SCP_SCL0"),
+		MTK_FUNCTION(5, "SCP_SCL1"),
+		MTK_FUNCTION(7, "dbg_mon_b18")
+	),
+
+	MTK_PIN(
+		146, "GPIO146",
+		MTK_EINT_FUNCTION(0, 146),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO146"),
+		MTK_FUNCTION(1, "SDA9"),
+		MTK_FUNCTION(2, "CMVREF0"),
+		MTK_FUNCTION(4, "SCP_SDA0"),
+		MTK_FUNCTION(5, "SCP_SDA1"),
+		MTK_FUNCTION(7, "dbg_mon_b19")
+	),
+
+	MTK_PIN(
+		147, "GPIO147",
+		MTK_EINT_FUNCTION(0, 147),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO147"),
+		MTK_FUNCTION(1, "CMFLASH0"),
+		MTK_FUNCTION(2, "LVTS_SDI"),
+		MTK_FUNCTION(3, "DPI_DATA12"),
+		MTK_FUNCTION(4, "TP_GPIO0_AO"),
+		MTK_FUNCTION(5, "ANT_SEL3"),
+		MTK_FUNCTION(6, "DFD_TCK_XI"),
+		MTK_FUNCTION(7, "dbg_mon_b20")
+	),
+
+	MTK_PIN(
+		148, "GPIO148",
+		MTK_EINT_FUNCTION(0, 148),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO148"),
+		MTK_FUNCTION(1, "CMFLASH1"),
+		MTK_FUNCTION(2, "LVTS_SCF"),
+		MTK_FUNCTION(3, "DPI_DATA13"),
+		MTK_FUNCTION(4, "TP_GPIO1_AO"),
+		MTK_FUNCTION(5, "ANT_SEL4"),
+		MTK_FUNCTION(6, "DFD_TMS"),
+		MTK_FUNCTION(7, "dbg_mon_b21")
+	),
+
+	MTK_PIN(
+		149, "GPIO149",
+		MTK_EINT_FUNCTION(0, 149),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO149"),
+		MTK_FUNCTION(1, "CMFLASH2"),
+		MTK_FUNCTION(2, "CLKM0"),
+		MTK_FUNCTION(3, "DPI_DATA14"),
+		MTK_FUNCTION(4, "TP_GPIO2_AO"),
+		MTK_FUNCTION(5, "ANT_SEL5"),
+		MTK_FUNCTION(6, "DFD_TDI"),
+		MTK_FUNCTION(7, "dbg_mon_b22")
+	),
+
+	MTK_PIN(
+		150, "GPIO150",
+		MTK_EINT_FUNCTION(0, 150),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO150"),
+		MTK_FUNCTION(2, "CLKM1"),
+		MTK_FUNCTION(3, "DPI_DATA15"),
+		MTK_FUNCTION(4, "TP_GPIO3_AO"),
+		MTK_FUNCTION(5, "ANT_SEL6"),
+		MTK_FUNCTION(6, "DFD_TDO"),
+		MTK_FUNCTION(7, "dbg_mon_b23")
+	),
+
+	MTK_PIN(
+		151, "GPIO151",
+		MTK_EINT_FUNCTION(0, 151),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO151"),
+		MTK_FUNCTION(1, "GPS_L1_ELNA_EN"),
+		MTK_FUNCTION(2, "CLKM2"),
+		MTK_FUNCTION(3, "DPI_DATA16"),
+		MTK_FUNCTION(4, "TP_GPIO4_AO"),
+		MTK_FUNCTION(5, "ANT_SEL7"),
+		MTK_FUNCTION(6, "UDI_TMS"),
+		MTK_FUNCTION(7, "dbg_mon_b24")
+	),
+
+	MTK_PIN(
+		152, "GPIO152",
+		MTK_EINT_FUNCTION(0, 152),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO152"),
+		MTK_FUNCTION(2, "CLKM3"),
+		MTK_FUNCTION(3, "DPI_DATA17"),
+		MTK_FUNCTION(4, "TP_GPIO5_AO")
+	),
+
+	MTK_PIN(
+		153, "GPIO153",
+		MTK_EINT_FUNCTION(0, 153),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO153"),
+		MTK_FUNCTION(1, "CONN_TCXOENA_REQ"),
+		MTK_FUNCTION(3, "DPI_DATA18"),
+		MTK_FUNCTION(4, "TP_GPIO6_AO"),
+		MTK_FUNCTION(6, "UDI_TDI"),
+		MTK_FUNCTION(7, "dbg_mon_b26")
+	),
+
+	MTK_PIN(
+		154, "GPIO154",
+		MTK_EINT_FUNCTION(0, 154),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO154"),
+		MTK_FUNCTION(1, "PWM0"),
+		MTK_FUNCTION(2, "CMVREF2"),
+		MTK_FUNCTION(3, "DPI_DATA19"),
+		MTK_FUNCTION(4, "TP_GPIO7_AO"),
+		MTK_FUNCTION(6, "UDI_TDO"),
+		MTK_FUNCTION(7, "dbg_mon_b27")
+	),
+
+	MTK_PIN(
+		155, "GPIO155",
+		MTK_EINT_FUNCTION(0, 155),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO155"),
+		MTK_FUNCTION(1, "PWM1"),
+		MTK_FUNCTION(2, "CMVREF1"),
+		MTK_FUNCTION(3, "DPI_DATA20"),
+		MTK_FUNCTION(6, "UDI_NTRST"),
+		MTK_FUNCTION(7, "dbg_mon_b28")
+	),
+
+	MTK_PIN(
+		156, "GPIO156",
+		MTK_EINT_FUNCTION(0, 156),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO156"),
+		MTK_FUNCTION(1, "PWM2"),
+		MTK_FUNCTION(2, "CMVREF0"),
+		MTK_FUNCTION(3, "DPI_DATA21")
+	),
+
+	MTK_PIN(
+		157, "GPIO157",
+		MTK_EINT_FUNCTION(0, 157),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO157"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_CSN")
+	),
+
+	MTK_PIN(
+		158, "GPIO158",
+		MTK_EINT_FUNCTION(0, 158),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO158"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_CK")
+	),
+
+	MTK_PIN(
+		159, "GPIO159",
+		MTK_EINT_FUNCTION(0, 159),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO159"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_MO"),
+		MTK_FUNCTION(2, "PWRAP_SPI0_MI")
+	),
+
+	MTK_PIN(
+		160, "GPIO160",
+		MTK_EINT_FUNCTION(0, 160),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO160"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_MI"),
+		MTK_FUNCTION(2, "PWRAP_SPI0_MO")
+	),
+
+	MTK_PIN(
+		161, "GPIO161",
+		MTK_EINT_FUNCTION(0, 161),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO161"),
+		MTK_FUNCTION(1, "SRCLKENA0")
+	),
+
+	MTK_PIN(
+		162, "GPIO162",
+		MTK_EINT_FUNCTION(0, 162),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO162"),
+		MTK_FUNCTION(1, "SRCLKENA1"),
+		MTK_FUNCTION(7, "dbg_mon_a31")
+	),
+
+	MTK_PIN(
+		163, "GPIO163",
+		MTK_EINT_FUNCTION(0, 163),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO163"),
+		MTK_FUNCTION(1, "SCP_VREQ_VAO"),
+		MTK_FUNCTION(2, "DVFSRC_EXT_REQ")
+	),
+
+	MTK_PIN(
+		164, "GPIO164",
+		MTK_EINT_FUNCTION(0, 164),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO164"),
+		MTK_FUNCTION(1, "RTC32K_CK")
+	),
+
+	MTK_PIN(
+		165, "GPIO165",
+		MTK_EINT_FUNCTION(0, 165),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO165"),
+		MTK_FUNCTION(1, "WATCHDOG")
+	),
+
+	MTK_PIN(
+		166, "GPIO166",
+		MTK_EINT_FUNCTION(0, 166),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO166"),
+		MTK_FUNCTION(1, "AUD_CLK_MOSI"),
+		MTK_FUNCTION(2, "AUD_CLK_MISO"),
+		MTK_FUNCTION(3, "I2S1_MCK")
+	),
+
+	MTK_PIN(
+		167, "GPIO167",
+		MTK_EINT_FUNCTION(0, 167),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO167"),
+		MTK_FUNCTION(1, "AUD_SYNC_MOSI"),
+		MTK_FUNCTION(2, "AUD_SYNC_MISO"),
+		MTK_FUNCTION(3, "I2S1_BCK")
+	),
+
+	MTK_PIN(
+		168, "GPIO168",
+		MTK_EINT_FUNCTION(0, 168),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO168"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI0"),
+		MTK_FUNCTION(2, "AUD_DAT_MISO0"),
+		MTK_FUNCTION(3, "I2S1_LRCK")
+	),
+
+	MTK_PIN(
+		169, "GPIO169",
+		MTK_EINT_FUNCTION(0, 169),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO169"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI1"),
+		MTK_FUNCTION(2, "AUD_DAT_MISO1"),
+		MTK_FUNCTION(3, "I2S1_DO")
+	),
+
+	MTK_PIN(
+		170, "GPIO170",
+		MTK_EINT_FUNCTION(0, 170),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO170"),
+		MTK_FUNCTION(1, "AUD_CLK_MISO"),
+		MTK_FUNCTION(2, "AUD_CLK_MOSI"),
+		MTK_FUNCTION(3, "I2S2_MCK")
+	),
+
+	MTK_PIN(
+		171, "GPIO171",
+		MTK_EINT_FUNCTION(0, 171),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO171"),
+		MTK_FUNCTION(1, "AUD_SYNC_MISO"),
+		MTK_FUNCTION(2, "AUD_SYNC_MOSI"),
+		MTK_FUNCTION(3, "I2S2_BCK")
+	),
+
+	MTK_PIN(
+		172, "GPIO172",
+		MTK_EINT_FUNCTION(0, 172),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO172"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO0"),
+		MTK_FUNCTION(2, "AUD_DAT_MOSI0"),
+		MTK_FUNCTION(3, "I2S2_LRCK"),
+		MTK_FUNCTION(4, "VOW_DAT_MISO")
+	),
+
+	MTK_PIN(
+		173, "GPIO173",
+		MTK_EINT_FUNCTION(0, 173),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO173"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO1"),
+		MTK_FUNCTION(2, "AUD_DAT_MOSI1"),
+		MTK_FUNCTION(3, "I2S2_DI"),
+		MTK_FUNCTION(4, "VOW_CLK_MISO")
+	),
+
+	MTK_PIN(
+		174, "GPIO174",
+		MTK_EINT_FUNCTION(0, 174),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO174"),
+		MTK_FUNCTION(1, "CONN_TOP_CLK"),
+		MTK_FUNCTION(2, "AUXIF_CLK"),
+		MTK_FUNCTION(3, "DFD_TCK_XI"),
+		MTK_FUNCTION(7, "dbg_mon_b3")
+	),
+
+	MTK_PIN(
+		175, "GPIO175",
+		MTK_EINT_FUNCTION(0, 175),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO175"),
+		MTK_FUNCTION(1, "CONN_TOP_DATA"),
+		MTK_FUNCTION(2, "AUXIF_ST"),
+		MTK_FUNCTION(3, "DFD_TMS"),
+		MTK_FUNCTION(7, "dbg_mon_b15")
+	),
+
+	MTK_PIN(
+		176, "GPIO176",
+		MTK_EINT_FUNCTION(0, 176),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO176"),
+		MTK_FUNCTION(1, "CONN_BT_CLK"),
+		MTK_FUNCTION(3, "DFD_TDI"),
+		MTK_FUNCTION(7, "dbg_mon_b2")
+	),
+
+	MTK_PIN(
+		177, "GPIO177",
+		MTK_EINT_FUNCTION(0, 177),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO177"),
+		MTK_FUNCTION(1, "CONN_BT_DATA"),
+		MTK_FUNCTION(3, "DFD_TDO")
+	),
+
+	MTK_PIN(
+		178, "GPIO178",
+		MTK_EINT_FUNCTION(0, 178),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO178"),
+		MTK_FUNCTION(1, "CONN_HRST_B"),
+		MTK_FUNCTION(3, "UDI_TMS"),
+		MTK_FUNCTION(7, "dbg_mon_b25")
+	),
+
+	MTK_PIN(
+		179, "GPIO179",
+		MTK_EINT_FUNCTION(0, 179),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO179"),
+		MTK_FUNCTION(1, "CONN_WB_PTA"),
+		MTK_FUNCTION(3, "UDI_TCK"),
+		MTK_FUNCTION(7, "dbg_mon_b29")
+	),
+
+	MTK_PIN(
+		180, "GPIO180",
+		MTK_EINT_FUNCTION(0, 180),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO180"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL0"),
+		MTK_FUNCTION(3, "UDI_TDI")
+	),
+
+	MTK_PIN(
+		181, "GPIO181",
+		MTK_EINT_FUNCTION(0, 181),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO181"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL1"),
+		MTK_FUNCTION(3, "UDI_TDO")
+	),
+
+	MTK_PIN(
+		182, "GPIO182",
+		MTK_EINT_FUNCTION(0, 182),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO182"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL2"),
+		MTK_FUNCTION(3, "UDI_NTRST")
+	),
+
+	MTK_PIN(
+		183, "GPIO183",
+		MTK_EINT_FUNCTION(0, 183),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO183"),
+		MTK_FUNCTION(1, "SPMI_SCL")
+	),
+
+	MTK_PIN(
+		184, "GPIO184",
+		MTK_EINT_FUNCTION(0, 184),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO184"),
+		MTK_FUNCTION(1, "SPMI_SDA")
+	),
+
+	MTK_PIN(
+		185, "GPIO185",
+		MTK_EINT_FUNCTION(0, 197),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		186, "GPIO186",
+		MTK_EINT_FUNCTION(0, 198),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		187, "GPIO187",
+		MTK_EINT_FUNCTION(0, 199),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		188, "GPIO188",
+		MTK_EINT_FUNCTION(0, 200),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		189, "GPIO189",
+		MTK_EINT_FUNCTION(0, 201),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		190, "GPIO190",
+		MTK_EINT_FUNCTION(0, 202),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		191, "GPIO191",
+		MTK_EINT_FUNCTION(0, 203),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		192, "GPIO192",
+		MTK_EINT_FUNCTION(0, 204),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		193, "GPIO193",
+		MTK_EINT_FUNCTION(0, 205),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		194, "GPIO194",
+		MTK_EINT_FUNCTION(0, 206),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		195, "GPIO195",
+		MTK_EINT_FUNCTION(0, 207),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		196, "GPIO196",
+		MTK_EINT_FUNCTION(0, 208),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	)
+};
+
+#endif /* __PINCTRL_MTK_MT8186_H */

