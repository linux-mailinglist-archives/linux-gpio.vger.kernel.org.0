Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8D33F27E5
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Aug 2021 09:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238910AbhHTHvZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Aug 2021 03:51:25 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:55394 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S238872AbhHTHvY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Aug 2021 03:51:24 -0400
X-UUID: d1b59904a2f14868a184c7763b514239-20210820
X-UUID: d1b59904a2f14868a184c7763b514239-20210820
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <sean.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1075305483; Fri, 20 Aug 2021 15:50:42 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 15:50:40 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 15:50:40 +0800
From:   <sean.wang@mediatek.com>
To:     <sam.shih@mediatek.com>
CC:     <robh+dt@kernel.org>, <sean.wang@kernel.org>,
        <linus.walleij@linaro.org>, <matthias.bgg@gmail.com>,
        <mpm@selenic.com>, <herbert@gondor.apana.org.au>,
        <gregkh@linuxfoundation.org>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <hsinyi@chromium.org>,
        <enric.balletbo@collabora.com>, <fparent@baylibre.com>,
        <seiya.wang@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <john@phrozen.org>, <Ryder.Lee@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>
Subject: Re: [v2,06/12] pinctrl: mediatek: add support for MT7986 SoC
Date:   Fri, 20 Aug 2021 15:50:40 +0800
Message-ID: <1629445840-25510-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20210817074557.30953-5-sam.shih@mediatek.com--annotate>
References: <20210817074557.30953-5-sam.shih@mediatek.com--annotate>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

>This commit includes pinctrl driver for Mediatek MT7986
>
>The difference of pinctrl between mt7986a and mt7986b
>is that pin-41 to pin-65 do not exist on mt7986b
>
>Signed-off-by: Sam Shih <sam.shih@mediatek.com>
>
>---
>v2: applied the comment suggested by reviewers:
>    - for the pins not ballout, we can fill .name in struct mtk_pin_desc
>      as NULL and return -ENOTSUPP in gpio/pinconf ops.
>
>---
> drivers/pinctrl/mediatek/Kconfig          |    7 +
> drivers/pinctrl/mediatek/Makefile         |    1 +
> drivers/pinctrl/mediatek/pinctrl-mt7986.c | 1217 +++++++++++++++++++++
> 3 files changed, 1225 insertions(+)
> create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7986.c
>
>diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
>index 7040a7a7bd5d..66db4ac5d169 100644
>--- a/drivers/pinctrl/mediatek/Kconfig
>+++ b/drivers/pinctrl/mediatek/Kconfig
>@@ -119,6 +119,13 @@ config PINCTRL_MT7622
>	default ARM64 && ARCH_MEDIATEK
>	select PINCTRL_MTK_MOORE
>
>+config PINCTRL_MT7986
>+	bool "Mediatek MT7986 pin control"
>+	depends on OF
>+	depends on ARM64 || COMPILE_TEST
>+	default ARM64 && ARCH_MEDIATEK
>+	select PINCTRL_MTK_MOORE
>+
> config PINCTRL_MT8167
>	bool "Mediatek MT8167 pin control"
>	depends on OF
>diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
>index 1bb7f9c65bc2..1e3931d924e7 100644
>--- a/drivers/pinctrl/mediatek/Makefile
>+++ b/drivers/pinctrl/mediatek/Makefile
>@@ -17,6 +17,7 @@ obj-$(CONFIG_PINCTRL_MT6797)	+= pinctrl-mt6797.o
> obj-$(CONFIG_PINCTRL_MT7622)	+= pinctrl-mt7622.o
> obj-$(CONFIG_PINCTRL_MT7623)	+= pinctrl-mt7623.o
> obj-$(CONFIG_PINCTRL_MT7629)	+= pinctrl-mt7629.o
>+obj-$(CONFIG_PINCTRL_MT7986)	+= pinctrl-mt7986.o
> obj-$(CONFIG_PINCTRL_MT8167)	+= pinctrl-mt8167.o
> obj-$(CONFIG_PINCTRL_MT8173)	+= pinctrl-mt8173.o
> obj-$(CONFIG_PINCTRL_MT8183)	+= pinctrl-mt8183.o
>diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
>new file mode 100644
>index 000000000000..808ae4e03eb2
>--- /dev/null
>+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
>@@ -0,0 +1,1217 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * The MT7986 driver based on Linux generic pinctrl binding.
>+ *
>+ * Copyright (C) 2021 MediaTek Inc.
>+ * Author: Sam Shih <sam.shih@mediatek.com>
>+ */
>+
>+#include "pinctrl-moore.h"
>+
>+#define MT7986_PIN(_number, _name) MTK_PIN(_number, _name, 0, _number, DRV_GRP4)
>+#define MT7986_NOT_BALLOUT_PIN(_number) { .number = _number }

I preferred explict set .name to NULL to indicate the pin is not ball out.

>+
>+#define PIN_FIELD_BASE(_s_pin, _e_pin, _i_base, _s_addr, _x_addrs, _s_bit,	\
>+			   _x_bits)														\
>+	PIN_FIELD_CALC(_s_pin, _e_pin, _i_base, _s_addr, _x_addrs, _s_bit,		\
>+			   _x_bits, 32, 0)
>+
>+/**
>+ * enum - Locking variants of the iocfg bases
>+ *
>+ * MT7986 have multiple bases to program pin configuration listed as the below:
>+ * iocfg_rt:0x11c30000, iocfg_rb:0x11c40000, iocfg_lt:0x11e20000,
>+ * iocfg_lb:0x11e30000, iocfg_tr:0x11f00000, iocfg_tl:0x11f10000,
>+ * _i_based could be used to indicate what base the pin should be mapped into.
>+ *
>+ * Each iocfg register base control different group of pads on the SoC
>+ *
>+ *
>+ *  chip carrier
>+ *
>+ *      A  B  C  D  E  F  G  H
>+ *    +------------------------+
>+ *  8 | o  o  o  o  o  o  o  o |
>+ *  7 | o  o  o  o  o  o  o  o |
>+ *  6 | o  o  o  o  o  o  o  o |
>+ *  5 | o  o  o  o  o  o  o  o |
>+ *  4 | o  o  o  o  o  o  o  o |
>+ *  3 | o  o  o  o  o  o  o  o |
>+ *  2 | o  o  o  o  o  o  o  o |
>+ *  1 | o  o  o  o  o  o  o  o |
>+ *    +------------------------+
>+ *
>+ *  inside Chip carrier
>+ *
>+ *      A  B  C  D  E  F  G  H
>+ *    +------------------------+
>+ *  8 |                        |
>+ *  7 |        TL  TR          |
>+ *  6 |      +---------+       |
>+ *  5 |   LT |         | RT    |
>+ *  4 |      |         |       |
>+ *  3 |   LB |         | RB    |
>+ *  2 |      +---------+       |
>+ *  1 |                        |
>+ *    +------------------------+
>+ *
>+ */
>+
>+enum {
>+	GPIO_BASE,
>+	IOCFG_RT_BASE,
>+	IOCFG_RB_BASE,
>+	IOCFG_LT_BASE,
>+	IOCFG_LB_BASE,
>+	IOCFG_TR_BASE,
>+	IOCFG_TL_BASE,
>+};
>+
>+static const char *const mt7986_pinctrl_register_base_names[] = {
>+	"gpio_base", "iocfg_rt_base", "iocfg_rb_base", "iocfg_lt_base",
>+	"iocfg_lb_base", "iocfg_tr_base", "iocfg_tl_base",
>+};
>+
>+static const struct mtk_pin_field_calc mt7986_pin_mode_range[] = {
>+	PIN_FIELD(0, 40, 0x300, 0x10, 0, 4),
>+	PIN_FIELD(41, 65, 0x350, 0x10, 4, 4),
>+	PIN_FIELD(66, 68, 0x380, 0x10, 8, 4),
>+	PIN_FIELD(69, 100, 0x380, 0x10, 20, 4),
>+};
>+
>+static const struct mtk_pin_field_calc mt7986_pin_dir_range[] = {
>+	PIN_FIELD(0, 40, 0x0, 0x10, 0, 1),
>+	PIN_FIELD(41, 65, 0x10, 0x10, 9, 1),
>+	PIN_FIELD(66, 68, 0x20, 0x10, 2, 1),
>+	PIN_FIELD(69, 100, 0x20, 0x10, 5, 1),
>+};
>+
>+static const struct mtk_pin_field_calc mt7986_pin_di_range[] = {
>+	PIN_FIELD(0, 40, 0x200, 0x10, 0, 1),
>+	PIN_FIELD(41, 65, 0x210, 0x10, 9, 1),
>+	PIN_FIELD(66, 68, 0x220, 0x10, 2, 1),
>+	PIN_FIELD(69, 100, 0x220, 0x10, 5, 1),
>+};
>+
>+static const struct mtk_pin_field_calc mt7986_pin_do_range[] = {
>+	PIN_FIELD(0, 40, 0x100, 0x10, 0, 1),
>+	PIN_FIELD(41, 65, 0x110, 0x10, 9, 1),
>+	PIN_FIELD(66, 68, 0x120, 0x10, 2, 1),
>+	PIN_FIELD(69, 100, 0x120, 0x10, 5, 1),
>+};
>+
>+static const struct mtk_pin_field_calc mt7986_pin_ies_range[] = {
>+	PIN_FIELD_BASE(0, 0, IOCFG_RB_BASE, 0x40, 0x10, 17, 1),
>+	PIN_FIELD_BASE(1, 1, IOCFG_LT_BASE, 0x20, 0x10, 10, 1),
>+	PIN_FIELD_BASE(2, 2, IOCFG_LT_BASE, 0x20, 0x10, 11, 1),
>+	PIN_FIELD_BASE(3, 3, IOCFG_LB_BASE, 0x20, 0x10, 0, 1),
>+	PIN_FIELD_BASE(4, 4, IOCFG_LB_BASE, 0x20, 0x10, 1, 1),
>+	PIN_FIELD_BASE(5, 5, IOCFG_RB_BASE, 0x40, 0x10, 0, 1),
>+	PIN_FIELD_BASE(6, 6, IOCFG_RB_BASE, 0x40, 0x10, 1, 1),
>+	PIN_FIELD_BASE(7, 7, IOCFG_LT_BASE, 0x20, 0x10, 0, 1),
>+	PIN_FIELD_BASE(8, 8, IOCFG_LT_BASE, 0x20, 0x10, 1, 1),
>+	PIN_FIELD_BASE(9, 9, IOCFG_LT_BASE, 0x20, 0x10, 2, 1),
>+	PIN_FIELD_BASE(10, 10, IOCFG_LT_BASE, 0x20, 0x10, 3, 1),
>+	PIN_FIELD_BASE(11, 11, IOCFG_RB_BASE, 0x40, 0x10, 8, 1),
>+	PIN_FIELD_BASE(12, 12, IOCFG_RB_BASE, 0x40, 0x10, 9, 1),
>+	PIN_FIELD_BASE(13, 13, IOCFG_RB_BASE, 0x40, 0x10, 10, 1),
>+	PIN_FIELD_BASE(14, 14, IOCFG_RB_BASE, 0x40, 0x10, 11, 1),
>+	PIN_FIELD_BASE(15, 15, IOCFG_RB_BASE, 0x40, 0x10, 2, 1),
>+	PIN_FIELD_BASE(16, 16, IOCFG_RB_BASE, 0x40, 0x10, 3, 1),
>+	PIN_FIELD_BASE(17, 17, IOCFG_RB_BASE, 0x40, 0x10, 4, 1),
>+	PIN_FIELD_BASE(18, 18, IOCFG_RB_BASE, 0x40, 0x10, 5, 1),
>+	PIN_FIELD_BASE(19, 19, IOCFG_RB_BASE, 0x40, 0x10, 6, 1),
>+	PIN_FIELD_BASE(20, 20, IOCFG_RB_BASE, 0x40, 0x10, 7, 1),

Actually, we can merge the consecutive entries into one to reduce the table size
For example, we can merge those entries pin 15 ~ 20 into one, from

PIN_FIELD_BASE(15, 15, IOCFG_RB_BASE, 0x40, 0x10, 2, 1),
PIN_FIELD_BASE(16, 16, IOCFG_RB_BASE, 0x40, 0x10, 3, 1),
PIN_FIELD_BASE(17, 17, IOCFG_RB_BASE, 0x40, 0x10, 4, 1),
PIN_FIELD_BASE(18, 18, IOCFG_RB_BASE, 0x40, 0x10, 5, 1),
PIN_FIELD_BASE(19, 19, IOCFG_RB_BASE, 0x40, 0x10, 6, 1),
PIN_FIELD_BASE(20, 20, IOCFG_RB_BASE, 0x40, 0x10, 7, 1),

to

PIN_FIELD_BASE(15, 20, IOCFG_RB_BASE, 0x40, 0x10, 2, 1).

Also please consider merging all the similar occurrences elsewhere to optimize them.

>+	PIN_FIELD_BASE(21, 21, IOCFG_RT_BASE, 0x30, 0x10, 12, 1),
>+	PIN_FIELD_BASE(22, 22, IOCFG_RT_BASE, 0x30, 0x10, 13, 1),
>+	PIN_FIELD_BASE(23, 23, IOCFG_RT_BASE, 0x30, 0x10, 14, 1),
>+	PIN_FIELD_BASE(24, 24, IOCFG_RT_BASE, 0x30, 0x10, 18, 1),
>+	PIN_FIELD_BASE(25, 25, IOCFG_RT_BASE, 0x30, 0x10, 17, 1),
>+	PIN_FIELD_BASE(26, 26, IOCFG_RT_BASE, 0x30, 0x10, 15, 1),
>+	PIN_FIELD_BASE(27, 27, IOCFG_RT_BASE, 0x30, 0x10, 16, 1),

<snip>
