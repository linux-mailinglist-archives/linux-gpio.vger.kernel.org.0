Return-Path: <linux-gpio+bounces-18675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 685C2A846BE
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 16:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4F2A3B3F79
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 14:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F74293456;
	Thu, 10 Apr 2025 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WAOrqzdL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D4A28EA4F;
	Thu, 10 Apr 2025 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296062; cv=none; b=mDquhcGX7kC5+feWEy0cCPCNfyn3vSlopFohK8kmzh+O2iWANZYZjudXS/eoDRt/BpIz2kXPPu6LYKHrI6KOX1HfmhMyAXcNcRRvPzXmvS0jERmrNIvlnF2t7ygns2B+4b0+NKux4Q/uxse8vjQ0a6YGFSMaOW/YiUbVd754pSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296062; c=relaxed/simple;
	bh=S5egUeajfL6cjAuhRi62/lV8ihNbwNWnZZEhbhxedhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iaB0/a5HsZbzfIAd8Ln1clgHH1Tck0CSO5KKoU8Rp4xycZF9AcZ/k5vF0j0qdt7wzEK/pBgCbtZqKapGWoQxK/F0p6Xpuvt/iTAAS0dco/gr4ubMDMy8wqk+IYZk/AIlMuJXBIH/hSyyJYoL9Jq7G8pQc1bNIlgbADAof6bTyeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WAOrqzdL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296054;
	bh=S5egUeajfL6cjAuhRi62/lV8ihNbwNWnZZEhbhxedhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WAOrqzdLmJkQVcC7NQBki7aZwaJxYVezchPEMT0fksrSfdYKvjTY9JO9MhDj84X4g
	 9iBzWJJRUqp2Z/Xmdh8RMsWIX9Naf6bEObe4mtlE3udUtOaAsOmdThhfCFhfJEDuIZ
	 xXo4UGhrTzbByZbZJT1Wu/GlK/Wlpb8y6r8vDB5OGLNjvFNB4SyFQSVm2TT3K4K7UW
	 IBxWl97oEhrumnGCvcpNZ/5+1Ug6x+gr1eg+Eury+z9CoRuH7YhWM3PNjTZU8ZCL10
	 iqozyJnmX6aU4gxIM/chRG7EFib96S1LdFbCDsHKYGkHVmj9Ld6rj2FhKNvW1Zld/S
	 Y5rH/odE2ub3w==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 034FD17E10F7;
	Thu, 10 Apr 2025 16:40:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 2/3] pinctrl: mediatek: Add pinctrl driver for MT6893 Dimensity 1200
Date: Thu, 10 Apr 2025 16:40:43 +0200
Message-ID: <20250410144044.476060-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
References: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the MediaTek Dimensity 1200 (MT6893) SoC's
GPIO/pinmux controller.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/Kconfig              |   10 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6893.c     |  879 +++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6893.h | 2283 +++++++++++++++++
 4 files changed, 3173 insertions(+)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6893.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6893.h

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 58f32818a0e6..8912498f5af4 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -181,6 +181,16 @@ config PINCTRL_MT6797
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
+config PINCTRL_MT6893
+	bool "MediaTek Dimensity MT6893 pin control"
+	depends on OF
+	depends on ARM64 || COMPILE_TEST
+	default ARM64 && ARCH_MEDIATEK
+	select PINCTRL_MTK_PARIS
+	help
+	  Say yes here to support pin controller and gpio driver
+	  on the MediaTek Dimensity 1200 MT6893 Smartphone SoC.
+
 config PINCTRL_MT7622
 	bool "MediaTek MT7622 pin control"
 	depends on OF
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index 721ae83476d0..16a1eb3b848e 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_PINCTRL_MT6765)		+= pinctrl-mt6765.o
 obj-$(CONFIG_PINCTRL_MT6779)		+= pinctrl-mt6779.o
 obj-$(CONFIG_PINCTRL_MT6795)		+= pinctrl-mt6795.o
 obj-$(CONFIG_PINCTRL_MT6797)		+= pinctrl-mt6797.o
+obj-$(CONFIG_PINCTRL_MT6893)		+= pinctrl-mt6893.o
 obj-$(CONFIG_PINCTRL_MT7622)		+= pinctrl-mt7622.o
 obj-$(CONFIG_PINCTRL_MT7623)		+= pinctrl-mt7623.o
 obj-$(CONFIG_PINCTRL_MT7629)		+= pinctrl-mt7629.o
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6893.c b/drivers/pinctrl/mediatek/pinctrl-mt6893.c
new file mode 100644
index 000000000000..468ce0109b07
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6893.c
@@ -0,0 +1,879 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 MediaTek Inc.
+ * Copyright (C) 2024 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/module.h>
+#include "pinctrl-mtk-mt6893.h"
+#include "pinctrl-paris.h"
+
+#define PIN_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits)  \
+	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits, \
+		32, 0)
+
+#define PINS_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits) \
+	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits, \
+		32, 1)
+
+static const struct mtk_pin_field_calc mt6893_pin_mode_range[] = {
+	PIN_FIELD(0, 219, 0x0300, 0x10, 0, 4),
+};
+
+static const struct mtk_pin_field_calc mt6893_pin_dir_range[] = {
+	PIN_FIELD(0, 219, 0x0000, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt6893_pin_di_range[] = {
+	PIN_FIELD(0, 219, 0x0200, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt6893_pin_do_range[] = {
+	PIN_FIELD(0, 219, 0x0100, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt6893_pin_smt_range[] = {
+	PINS_FIELD_BASE(0, 9, 2, 0x00f0, 0x10, 7, 1),
+	PINS_FIELD_BASE(10, 15, 1, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(16, 17, 5, 0x00c0, 0x10, 8, 1),
+	PINS_FIELD_BASE(18, 25, 7, 0x00f0, 0x10, 1, 1),
+	PINS_FIELD_BASE(26, 30, 6, 0x00e0, 0x10, 6, 1),
+	PINS_FIELD_BASE(31, 35, 6, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(36, 36, 6, 0x00e0, 0x10, 16, 1),
+	PINS_FIELD_BASE(37, 39, 6, 0x00e0, 0x10, 15, 1),
+	PIN_FIELD_BASE(40, 41, 6, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(42, 42, 6, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(43, 44, 6, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(45, 45, 6, 0x00e0, 0x10, 12, 1),
+	PIN_FIELD_BASE(46, 46, 6, 0x00e0, 0x10, 14, 1),
+	PIN_FIELD_BASE(47, 47, 6, 0x00e0, 0x10, 13, 1),
+	PIN_FIELD_BASE(48, 49, 6, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(50, 50, 6, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(51, 52, 3, 0x0090, 0x10, 6, 1),
+	PINS_FIELD_BASE(53, 56, 3, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(57, 60, 3, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(61, 61, 3, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(62, 62, 4, 0x0050, 0x10, 1, 1),
+	PINS_FIELD_BASE(63, 73, 3, 0x0090, 0x10, 0, 1),
+	PINS_FIELD_BASE(74, 84, 4, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(85, 86, 4, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(87, 88, 4, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(89, 90, 2, 0x00f0, 0x10, 26, 1),
+	PIN_FIELD_BASE(91, 91, 2, 0x00f0, 0x10, 0, 1),
+	PINS_FIELD_BASE(92, 95, 2, 0x0100, 0x10, 0, 1),
+	PIN_FIELD_BASE(96, 96, 2, 0x00f0, 0x10, 30, 1),
+	PIN_FIELD_BASE(97, 97, 2, 0x00f0, 0x10, 28, 1),
+	PIN_FIELD_BASE(98, 98, 2, 0x00f0, 0x10, 31, 1),
+	PINS_FIELD_BASE(99, 102, 2, 0x00f0, 0x10, 29, 1),
+	PINS_FIELD_BASE(103, 105, 2, 0x00f0, 0x10, 24, 1),
+	PIN_FIELD_BASE(106, 106, 2, 0x00f0, 0x10, 25, 1),
+	PIN_FIELD_BASE(107, 108, 2, 0x00f0, 0x10, 5, 1),
+	PINS_FIELD_BASE(109, 113, 2, 0x00f0, 0x10, 8, 1),
+	PINS_FIELD_BASE(114, 116, 2, 0x00f0, 0x10, 16, 1),
+	PIN_FIELD_BASE(117, 117, 2, 0x00f0, 0x10, 17, 1),
+	PIN_FIELD_BASE(118, 118, 2, 0x00f0, 0x10, 10, 1),
+	PIN_FIELD_BASE(119, 119, 2, 0x00f0, 0x10, 18, 1),
+	PIN_FIELD_BASE(120, 120, 2, 0x00f0, 0x10, 15, 1),
+	PIN_FIELD_BASE(121, 121, 2, 0x00f0, 0x10, 23, 1),
+	PIN_FIELD_BASE(122, 122, 2, 0x00f0, 0x10, 14, 1),
+	PIN_FIELD_BASE(123, 123, 2, 0x00f0, 0x10, 22, 1),
+	PIN_FIELD_BASE(124, 124, 2, 0x00f0, 0x10, 13, 1),
+	PIN_FIELD_BASE(125, 125, 2, 0x00f0, 0x10, 21, 1),
+	PINS_FIELD_BASE(126, 129, 2, 0x00f0, 0x10, 9, 1),
+	PINS_FIELD_BASE(130, 135, 2, 0x00f0, 0x10, 4, 1),
+	PIN_FIELD_BASE(136, 138, 2, 0x00f0, 0x10, 1, 1),
+	PIN_FIELD_BASE(139, 139, 2, 0x00f0, 0x10, 12, 1),
+	PIN_FIELD_BASE(140, 140, 2, 0x00f0, 0x10, 20, 1),
+	PIN_FIELD_BASE(141, 141, 2, 0x00f0, 0x10, 11, 1),
+	PIN_FIELD_BASE(142, 142, 2, 0x00f0, 0x10, 19, 1),
+	PINS_FIELD_BASE(143, 148, 1, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(149, 151, 1, 0x0090, 0x10, 0, 1),
+	PINS_FIELD_BASE(152, 155, 5, 0x00c0, 0x10, 10, 1),
+	PIN_FIELD_BASE(156, 156, 5, 0x00c0, 0x10, 14, 1),
+	PINS_FIELD_BASE(157, 159, 5, 0x00c0, 0x10, 13, 1),
+	PIN_FIELD_BASE(160, 161, 5, 0x00c0, 0x10, 11, 1),
+	PINS_FIELD_BASE(162, 171, 5, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(172, 173, 5, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(174, 174, 5, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(175, 175, 5, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(176, 177, 5, 0x00c0, 0x10, 1, 1),
+	PINS_FIELD_BASE(178, 182, 5, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(183, 183, 7, 0x00f0, 0x10, 3, 1),
+	PINS_FIELD_BASE(184, 190, 7, 0x00f0, 0x10, 4, 1),
+	PIN_FIELD_BASE(191, 191, 7, 0x00f0, 0x10, 5, 1),
+	PIN_FIELD_BASE(192, 192, 7, 0x00f0, 0x10, 2, 1),
+	PIN_FIELD_BASE(193, 193, 7, 0x00f0, 0x10, 4, 1),
+	PIN_FIELD_BASE(194, 194, 7, 0x00f0, 0x10, 6, 1),
+	PIN_FIELD_BASE(195, 195, 7, 0x00f0, 0x10, 12, 1),
+	PINS_FIELD_BASE(196, 199, 7, 0x00f0, 0x10, 0, 1),
+	PIN_FIELD_BASE(200, 200, 7, 0x00f0, 0x10, 11, 1),
+	PIN_FIELD_BASE(201, 201, 7, 0x00f0, 0x10, 14, 1),
+	PIN_FIELD_BASE(202, 202, 7, 0x00f0, 0x10, 10, 1),
+	PIN_FIELD_BASE(203, 203, 7, 0x00f0, 0x10, 13, 1),
+	PIN_FIELD_BASE(204, 205, 6, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(206, 208, 7, 0x00f0, 0x10, 15, 1),
+	PINS_FIELD_BASE(209, 211, 7, 0x00f0, 0x10, 7, 1),
+	PIN_FIELD_BASE(212, 213, 7, 0x00f0, 0x10, 8, 1),
+	PINS_FIELD_BASE(214, 219, 7, 0x00f0, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt6893_pin_ies_range[] = {
+	PIN_FIELD_BASE(0, 9, 2, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(10, 15, 1, 0x0020, 0x10, 9, 1),
+	PIN_FIELD_BASE(16, 17, 5, 0x0030, 0x10, 21, 1),
+	PIN_FIELD_BASE(18, 25, 7, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(26, 30, 6, 0x0040, 0x10, 10, 1),
+	PIN_FIELD_BASE(31, 31, 6, 0x0040, 0x10, 6, 1),
+	PIN_FIELD_BASE(32, 32, 6, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(33, 33, 6, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(34, 34, 6, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(35, 35, 6, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(36, 39, 6, 0x0040, 0x10, 23, 1),
+	PIN_FIELD_BASE(40, 41, 6, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(42, 42, 6, 0x0040, 0x10, 9, 1),
+	PIN_FIELD_BASE(43, 44, 6, 0x0040, 0x10, 7, 1),
+	PIN_FIELD_BASE(45, 45, 6, 0x0040, 0x10, 20, 1),
+	PIN_FIELD_BASE(46, 46, 6, 0x0040, 0x10, 22, 1),
+	PIN_FIELD_BASE(47, 47, 6, 0x0040, 0x10, 21, 1),
+	PIN_FIELD_BASE(48, 49, 6, 0x0040, 0x10, 18, 1),
+	PIN_FIELD_BASE(50, 50, 6, 0x0040, 0x10, 17, 1),
+	PIN_FIELD_BASE(51, 52, 3, 0x0020, 0x10, 16, 1),
+	PIN_FIELD_BASE(53, 53, 3, 0x0020, 0x10, 21, 1),
+	PIN_FIELD_BASE(54, 54, 3, 0x0020, 0x10, 18, 1),
+	PIN_FIELD_BASE(55, 55, 3, 0x0020, 0x10, 20, 1),
+	PIN_FIELD_BASE(56, 56, 3, 0x0020, 0x10, 19, 1),
+	PIN_FIELD_BASE(57, 60, 3, 0x0020, 0x10, 12, 1),
+	PIN_FIELD_BASE(61, 61, 3, 0x0020, 0x10, 11, 1),
+	PIN_FIELD_BASE(62, 62, 4, 0x0010, 0x10, 11, 1),
+	PIN_FIELD_BASE(63, 64, 3, 0x0020, 0x10, 0, 1),
+	PIN_FIELD_BASE(65, 72, 3, 0x0020, 0x10, 3, 1),
+	PIN_FIELD_BASE(73, 73, 3, 0x0020, 0x10, 2, 1),
+	PIN_FIELD_BASE(74, 84, 4, 0x0010, 0x10, 0, 1),
+	PIN_FIELD_BASE(85, 86, 4, 0x0010, 0x10, 14, 1),
+	PIN_FIELD_BASE(87, 88, 4, 0x0010, 0x10, 12, 1),
+	PIN_FIELD_BASE(89, 90, 2, 0x0070, 0x10, 19, 1),
+	PIN_FIELD_BASE(91, 91, 2, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(92, 92, 2, 0x0070, 0x10, 28, 1),
+	PIN_FIELD_BASE(93, 93, 2, 0x0070, 0x10, 30, 1),
+	PIN_FIELD_BASE(94, 94, 2, 0x0070, 0x10, 29, 1),
+	PIN_FIELD_BASE(95, 95, 2, 0x0070, 0x10, 31, 1),
+	PIN_FIELD_BASE(96, 96, 2, 0x0070, 0x10, 26, 1),
+	PIN_FIELD_BASE(97, 97, 2, 0x0070, 0x10, 21, 1),
+	PIN_FIELD_BASE(98, 98, 2, 0x0070, 0x10, 27, 1),
+	PIN_FIELD_BASE(99, 102, 2, 0x0070, 0x10, 22, 1),
+	PIN_FIELD_BASE(103, 103, 2, 0x0070, 0x10, 17, 1),
+	PIN_FIELD_BASE(104, 104, 2, 0x0070, 0x10, 16, 1),
+	PIN_FIELD_BASE(105, 105, 2, 0x0070, 0x10, 18, 1),
+	PIN_FIELD_BASE(106, 106, 2, 0x0070, 0x10, 15, 1),
+	PIN_FIELD_BASE(107, 108, 2, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(109, 109, 2, 0x0060, 0x10, 25, 1),
+	PIN_FIELD_BASE(110, 110, 2, 0x0060, 0x10, 22, 1),
+	PIN_FIELD_BASE(111, 111, 2, 0x0060, 0x10, 24, 1),
+	PIN_FIELD_BASE(112, 112, 2, 0x0060, 0x10, 26, 1),
+	PIN_FIELD_BASE(113, 113, 2, 0x0060, 0x10, 23, 1),
+	PIN_FIELD_BASE(114, 114, 2, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(115, 115, 2, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(116, 116, 2, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(117, 117, 2, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(118, 118, 2, 0x0060, 0x10, 31, 1),
+	PIN_FIELD_BASE(119, 119, 2, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(120, 120, 2, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(121, 121, 2, 0x0070, 0x10, 14, 1),
+	PIN_FIELD_BASE(122, 122, 2, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(123, 123, 2, 0x0070, 0x10, 13, 1),
+	PIN_FIELD_BASE(124, 124, 2, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(125, 125, 2, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(126, 129, 2, 0x0060, 0x10, 27, 1),
+	PIN_FIELD_BASE(130, 132, 2, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(133, 135, 2, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(136, 138, 2, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(139, 139, 2, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(140, 140, 2, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(141, 141, 2, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(142, 142, 2, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(143, 145, 1, 0x0020, 0x10, 6, 1),
+	PIN_FIELD_BASE(146, 148, 1, 0x0020, 0x10, 3, 1),
+	PIN_FIELD_BASE(149, 151, 1, 0x0020, 0x10, 0, 1),
+	PIN_FIELD_BASE(152, 152, 5, 0x0030, 0x10, 26, 1),
+	PIN_FIELD_BASE(153, 153, 5, 0x0030, 0x10, 25, 1),
+	PIN_FIELD_BASE(154, 155, 5, 0x0030, 0x10, 23, 1),
+	PIN_FIELD_BASE(156, 158, 5, 0x0030, 0x10, 29, 1),
+	PIN_FIELD_BASE(159, 159, 5, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(160, 161, 5, 0x0030, 0x10, 27, 1),
+	PIN_FIELD_BASE(162, 171, 5, 0x0030, 0x10, 0, 1),
+	PIN_FIELD_BASE(172, 173, 5, 0x0030, 0x10, 13, 1),
+	PIN_FIELD_BASE(174, 174, 5, 0x0030, 0x10, 12, 1),
+	PIN_FIELD_BASE(175, 175, 5, 0x0030, 0x10, 15, 1),
+	PIN_FIELD_BASE(176, 177, 5, 0x0030, 0x10, 10, 1),
+	PIN_FIELD_BASE(178, 182, 5, 0x0030, 0x10, 16, 1),
+	PIN_FIELD_BASE(183, 184, 7, 0x0050, 0x10, 19, 1),
+	PIN_FIELD_BASE(185, 185, 7, 0x0050, 0x10, 22, 1),
+	PIN_FIELD_BASE(186, 186, 7, 0x0050, 0x10, 24, 1),
+	PIN_FIELD_BASE(187, 187, 7, 0x0050, 0x10, 26, 1),
+	PIN_FIELD_BASE(188, 188, 7, 0x0050, 0x10, 21, 1),
+	PIN_FIELD_BASE(189, 189, 7, 0x0050, 0x10, 25, 1),
+	PIN_FIELD_BASE(190, 191, 7, 0x0050, 0x10, 27, 1),
+	PIN_FIELD_BASE(192, 192, 7, 0x0050, 0x10, 18, 1),
+	PIN_FIELD_BASE(193, 193, 7, 0x0050, 0x10, 23, 1),
+	PIN_FIELD_BASE(194, 194, 7, 0x0050, 0x10, 29, 1),
+	PIN_FIELD_BASE(195, 195, 7, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(196, 196, 7, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(197, 197, 7, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(198, 198, 7, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(199, 199, 7, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(200, 200, 7, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(201, 201, 7, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(202, 202, 7, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(203, 203, 7, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(204, 205, 6, 0x0040, 0x10, 15, 1),
+	PIN_FIELD_BASE(206, 208, 7, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(209, 209, 7, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(210, 210, 7, 0x0050, 0x10, 31, 1),
+	PIN_FIELD_BASE(211, 211, 7, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(212, 212, 7, 0x0050, 0x10, 30, 1),
+	PIN_FIELD_BASE(213, 213, 7, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(214, 214, 7, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(215, 215, 7, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(216, 217, 7, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(218, 219, 7, 0x0050, 0x10, 1, 1),
+};
+
+static const struct mtk_pin_field_calc mt6893_pin_pu_range[] = {
+	PIN_FIELD_BASE(0, 9, 2, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(16, 17, 5, 0x0070, 0x10, 21, 1),
+	PIN_FIELD_BASE(18, 25, 7, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(26, 30, 6, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(31, 31, 6, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(32, 32, 6, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(33, 33, 6, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(34, 34, 6, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(35, 35, 6, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(36, 39, 6, 0x0080, 0x10, 17, 1),
+	PIN_FIELD_BASE(40, 41, 6, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(42, 42, 6, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(43, 44, 6, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(57, 60, 3, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(61, 61, 3, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(62, 62, 4, 0x0030, 0x10, 11, 1),
+	PIN_FIELD_BASE(63, 64, 3, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(65, 72, 3, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(73, 73, 3, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(74, 84, 4, 0x0030, 0x10, 0, 1),
+	PIN_FIELD_BASE(85, 86, 4, 0x0030, 0x10, 14, 1),
+	PIN_FIELD_BASE(87, 88, 4, 0x0030, 0x10, 12, 1),
+	PIN_FIELD_BASE(89, 90, 2, 0x00b0, 0x10, 19, 1),
+	PIN_FIELD_BASE(91, 91, 2, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(92, 92, 2, 0x00b0, 0x10, 28, 1),
+	PIN_FIELD_BASE(93, 93, 2, 0x00b0, 0x10, 30, 1),
+	PIN_FIELD_BASE(94, 94, 2, 0x00b0, 0x10, 29, 1),
+	PIN_FIELD_BASE(95, 95, 2, 0x00b0, 0x10, 31, 1),
+	PIN_FIELD_BASE(96, 96, 2, 0x00b0, 0x10, 26, 1),
+	PIN_FIELD_BASE(97, 97, 2, 0x00b0, 0x10, 21, 1),
+	PIN_FIELD_BASE(98, 98, 2, 0x00b0, 0x10, 27, 1),
+	PIN_FIELD_BASE(99, 102, 2, 0x00b0, 0x10, 22, 1),
+	PIN_FIELD_BASE(103, 103, 2, 0x00b0, 0x10, 17, 1),
+	PIN_FIELD_BASE(104, 104, 2, 0x00b0, 0x10, 16, 1),
+	PIN_FIELD_BASE(105, 105, 2, 0x00b0, 0x10, 18, 1),
+	PIN_FIELD_BASE(106, 106, 2, 0x00b0, 0x10, 15, 1),
+	PIN_FIELD_BASE(107, 108, 2, 0x00a0, 0x10, 10, 1),
+	PIN_FIELD_BASE(109, 109, 2, 0x00a0, 0x10, 25, 1),
+	PIN_FIELD_BASE(110, 110, 2, 0x00a0, 0x10, 22, 1),
+	PIN_FIELD_BASE(111, 111, 2, 0x00a0, 0x10, 24, 1),
+	PIN_FIELD_BASE(112, 112, 2, 0x00a0, 0x10, 26, 1),
+	PIN_FIELD_BASE(113, 113, 2, 0x00a0, 0x10, 23, 1),
+	PIN_FIELD_BASE(114, 114, 2, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(115, 115, 2, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(116, 116, 2, 0x00b0, 0x10, 8, 1),
+	PIN_FIELD_BASE(117, 117, 2, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(118, 118, 2, 0x00a0, 0x10, 31, 1),
+	PIN_FIELD_BASE(119, 119, 2, 0x00b0, 0x10, 9, 1),
+	PIN_FIELD_BASE(120, 120, 2, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(121, 121, 2, 0x00b0, 0x10, 14, 1),
+	PIN_FIELD_BASE(122, 122, 2, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(123, 123, 2, 0x00b0, 0x10, 13, 1),
+	PIN_FIELD_BASE(124, 124, 2, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(125, 125, 2, 0x00b0, 0x10, 12, 1),
+	PIN_FIELD_BASE(126, 129, 2, 0x00a0, 0x10, 27, 1),
+	PIN_FIELD_BASE(130, 132, 2, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(133, 135, 2, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(136, 138, 2, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(139, 139, 2, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(140, 140, 2, 0x00b0, 0x10, 11, 1),
+	PIN_FIELD_BASE(141, 141, 2, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(142, 142, 2, 0x00b0, 0x10, 10, 1),
+	PIN_FIELD_BASE(143, 145, 1, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(146, 148, 1, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(149, 151, 1, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(156, 159, 5, 0x0070, 0x10, 25, 1),
+	PIN_FIELD_BASE(160, 161, 5, 0x0070, 0x10, 23, 1),
+	PIN_FIELD_BASE(162, 171, 5, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(172, 173, 5, 0x0070, 0x10, 13, 1),
+	PIN_FIELD_BASE(174, 174, 5, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(175, 175, 5, 0x0070, 0x10, 15, 1),
+	PIN_FIELD_BASE(176, 177, 5, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(178, 182, 5, 0x0070, 0x10, 16, 1),
+	PIN_FIELD_BASE(195, 195, 7, 0x0090, 0x10, 25, 1),
+	PIN_FIELD_BASE(196, 196, 7, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(197, 197, 7, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(198, 198, 7, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(199, 199, 7, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(200, 200, 7, 0x0090, 0x10, 24, 1),
+	PIN_FIELD_BASE(201, 201, 7, 0x0090, 0x10, 27, 1),
+	PIN_FIELD_BASE(202, 202, 7, 0x0090, 0x10, 23, 1),
+	PIN_FIELD_BASE(203, 203, 7, 0x0090, 0x10, 26, 1),
+	PIN_FIELD_BASE(204, 205, 6, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(206, 208, 7, 0x0090, 0x10, 28, 1),
+	PIN_FIELD_BASE(209, 209, 7, 0x0090, 0x10, 20, 1),
+	PIN_FIELD_BASE(210, 210, 7, 0x0090, 0x10, 19, 1),
+	PIN_FIELD_BASE(211, 211, 7, 0x0090, 0x10, 21, 1),
+	PIN_FIELD_BASE(212, 212, 7, 0x0090, 0x10, 18, 1),
+	PIN_FIELD_BASE(213, 213, 7, 0x0090, 0x10, 22, 1),
+	PIN_FIELD_BASE(214, 214, 7, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(215, 215, 7, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(216, 217, 7, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(218, 219, 7, 0x0090, 0x10, 1, 1),
+};
+
+static const struct mtk_pin_field_calc mt6893_pin_pd_range[] = {
+	PIN_FIELD_BASE(0, 9, 2, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(16, 17, 5, 0x0050, 0x10, 21, 1),
+	PIN_FIELD_BASE(18, 25, 7, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(26, 30, 6, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(31, 31, 6, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(32, 32, 6, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(33, 33, 6, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(34, 34, 6, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(35, 35, 6, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(36, 39, 6, 0x0060, 0x10, 17, 1),
+	PIN_FIELD_BASE(40, 41, 6, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(42, 42, 6, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(43, 44, 6, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(57, 60, 3, 0x0030, 0x10, 12, 1),
+	PIN_FIELD_BASE(61, 61, 3, 0x0030, 0x10, 11, 1),
+	PIN_FIELD_BASE(62, 62, 4, 0x0020, 0x10, 11, 1),
+	PIN_FIELD_BASE(63, 64, 3, 0x0030, 0x10, 0, 1),
+	PIN_FIELD_BASE(65, 72, 3, 0x0030, 0x10, 3, 1),
+	PIN_FIELD_BASE(73, 73, 3, 0x0030, 0x10, 2, 1),
+	PIN_FIELD_BASE(74, 84, 4, 0x0020, 0x10, 0, 1),
+	PIN_FIELD_BASE(85, 86, 4, 0x0020, 0x10, 14, 1),
+	PIN_FIELD_BASE(87, 88, 4, 0x0020, 0x10, 12, 1),
+	PIN_FIELD_BASE(89, 90, 2, 0x0090, 0x10, 19, 1),
+	PIN_FIELD_BASE(91, 91, 2, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(92, 92, 2, 0x0090, 0x10, 28, 1),
+	PIN_FIELD_BASE(93, 93, 2, 0x0090, 0x10, 30, 1),
+	PIN_FIELD_BASE(94, 94, 2, 0x0090, 0x10, 29, 1),
+	PIN_FIELD_BASE(95, 95, 2, 0x0090, 0x10, 31, 1),
+	PIN_FIELD_BASE(96, 96, 2, 0x0090, 0x10, 26, 1),
+	PIN_FIELD_BASE(97, 97, 2, 0x0090, 0x10, 21, 1),
+	PIN_FIELD_BASE(98, 98, 2, 0x0090, 0x10, 27, 1),
+	PIN_FIELD_BASE(99, 102, 2, 0x0090, 0x10, 22, 1),
+	PIN_FIELD_BASE(103, 103, 2, 0x0090, 0x10, 17, 1),
+	PIN_FIELD_BASE(104, 104, 2, 0x0090, 0x10, 16, 1),
+	PIN_FIELD_BASE(105, 105, 2, 0x0090, 0x10, 18, 1),
+	PIN_FIELD_BASE(106, 106, 2, 0x0090, 0x10, 15, 1),
+	PIN_FIELD_BASE(107, 108, 2, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(109, 109, 2, 0x0080, 0x10, 25, 1),
+	PIN_FIELD_BASE(110, 110, 2, 0x0080, 0x10, 22, 1),
+	PIN_FIELD_BASE(111, 111, 2, 0x0080, 0x10, 24, 1),
+	PIN_FIELD_BASE(112, 112, 2, 0x0080, 0x10, 26, 1),
+	PIN_FIELD_BASE(113, 113, 2, 0x0080, 0x10, 23, 1),
+	PIN_FIELD_BASE(114, 114, 2, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(115, 115, 2, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(116, 116, 2, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(117, 117, 2, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(118, 118, 2, 0x0080, 0x10, 31, 1),
+	PIN_FIELD_BASE(119, 119, 2, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(120, 120, 2, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(121, 121, 2, 0x0090, 0x10, 14, 1),
+	PIN_FIELD_BASE(122, 122, 2, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(123, 123, 2, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(124, 124, 2, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(125, 125, 2, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(126, 129, 2, 0x0080, 0x10, 27, 1),
+	PIN_FIELD_BASE(130, 132, 2, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(133, 135, 2, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(136, 138, 2, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(139, 139, 2, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(140, 140, 2, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(141, 141, 2, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(142, 142, 2, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(143, 145, 1, 0x0030, 0x10, 6, 1),
+	PIN_FIELD_BASE(146, 148, 1, 0x0030, 0x10, 3, 1),
+	PIN_FIELD_BASE(149, 151, 1, 0x0030, 0x10, 0, 1),
+	PIN_FIELD_BASE(156, 159, 5, 0x0050, 0x10, 25, 1),
+	PIN_FIELD_BASE(160, 161, 5, 0x0050, 0x10, 23, 1),
+	PIN_FIELD_BASE(162, 171, 5, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(172, 173, 5, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(174, 174, 5, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(175, 175, 5, 0x0050, 0x10, 15, 1),
+	PIN_FIELD_BASE(176, 177, 5, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(178, 182, 5, 0x0050, 0x10, 16, 1),
+	PIN_FIELD_BASE(195, 195, 7, 0x0070, 0x10, 25, 1),
+	PIN_FIELD_BASE(196, 196, 7, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(197, 197, 7, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(198, 198, 7, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(199, 199, 7, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(200, 200, 7, 0x0070, 0x10, 24, 1),
+	PIN_FIELD_BASE(201, 201, 7, 0x0070, 0x10, 27, 1),
+	PIN_FIELD_BASE(202, 202, 7, 0x0070, 0x10, 23, 1),
+	PIN_FIELD_BASE(203, 203, 7, 0x0070, 0x10, 26, 1),
+	PIN_FIELD_BASE(204, 205, 6, 0x0060, 0x10, 15, 1),
+	PIN_FIELD_BASE(206, 208, 7, 0x0070, 0x10, 28, 1),
+	PIN_FIELD_BASE(209, 209, 7, 0x0070, 0x10, 20, 1),
+	PIN_FIELD_BASE(210, 210, 7, 0x0070, 0x10, 19, 1),
+	PIN_FIELD_BASE(211, 211, 7, 0x0070, 0x10, 21, 1),
+	PIN_FIELD_BASE(212, 212, 7, 0x0070, 0x10, 18, 1),
+	PIN_FIELD_BASE(213, 213, 7, 0x0070, 0x10, 22, 1),
+	PIN_FIELD_BASE(214, 214, 7, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(215, 215, 7, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(216, 217, 7, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(218, 219, 7, 0x0070, 0x10, 1, 1),
+};
+
+static const struct mtk_pin_field_calc mt6893_pin_drv_range[] = {
+	PINS_FIELD_BASE(0, 9, 2, 0x0000, 0x10, 21, 3),
+	PINS_FIELD_BASE(10, 15, 1, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(16, 17, 5, 0x0000, 0x10, 18, 3),
+	PINS_FIELD_BASE(18, 25, 7, 0x0000, 0x10, 3, 3),
+	PINS_FIELD_BASE(26, 30, 6, 0x0000, 0x10, 15, 3),
+	PINS_FIELD_BASE(31, 35, 6, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(36, 36, 6, 0x0010, 0x10, 7, 3),
+	PINS_FIELD_BASE(37, 39, 6, 0x0010, 0x10, 4, 3),
+	PIN_FIELD_BASE(40, 41, 6, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(42, 42, 6, 0x0000, 0x10, 12, 3),
+	PINS_FIELD_BASE(43, 44, 6, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(45, 45, 6, 0x0000, 0x10, 30, 2),
+	PIN_FIELD_BASE(46, 46, 6, 0x0010, 0x10, 2, 2),
+	PIN_FIELD_BASE(47, 47, 6, 0x0010, 0x10, 0, 2),
+	PIN_FIELD_BASE(48, 49, 6, 0x0000, 0x10, 26, 2),
+	PIN_FIELD_BASE(50, 50, 6, 0x0000, 0x10, 24, 2),
+	PIN_FIELD_BASE(51, 52, 3, 0x0000, 0x10, 18, 3),
+	PINS_FIELD_BASE(53, 56, 3, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(57, 60, 3, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(61, 61, 3, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(62, 62, 4, 0x0000, 0x10, 3, 3),
+	PINS_FIELD_BASE(63, 73, 3, 0x0000, 0x10, 0, 3),
+	PINS_FIELD_BASE(74, 84, 4, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(85, 86, 4, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(87, 88, 4, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(89, 90, 2, 0x0020, 0x10, 15, 3),
+	PIN_FIELD_BASE(91, 91, 2, 0x0000, 0x10, 0, 3),
+	PINS_FIELD_BASE(92, 95, 2, 0x0030, 0x10, 3, 3),
+	PIN_FIELD_BASE(96, 96, 2, 0x0020, 0x10, 27, 3),
+	PIN_FIELD_BASE(97, 97, 2, 0x0020, 0x10, 21, 3),
+	PIN_FIELD_BASE(98, 98, 2, 0x0030, 0x10, 0, 3),
+	PINS_FIELD_BASE(99, 102, 2, 0x0020, 0x10, 24, 3),
+	PINS_FIELD_BASE(103, 105, 2, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(106, 106, 2, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(107, 108, 2, 0x0000, 0x10, 15, 3),
+	PINS_FIELD_BASE(109, 113, 2, 0x0000, 0x10, 24, 3),
+	PINS_FIELD_BASE(114, 117, 2, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(118, 118, 2, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(119, 119, 2, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(120, 120, 2, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(121, 121, 2, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(122, 122, 2, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(123, 123, 2, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(124, 124, 2, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(125, 125, 2, 0x0020, 0x10, 0, 3),
+	PINS_FIELD_BASE(126, 129, 2, 0x0000, 0x10, 27, 3),
+	PINS_FIELD_BASE(130, 135, 2, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(136, 138, 2, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(139, 139, 2, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(140, 140, 2, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(141, 141, 2, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(142, 142, 2, 0x0010, 0x10, 24, 3),
+	PINS_FIELD_BASE(143, 148, 1, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(149, 151, 1, 0x0000, 0x10, 0, 3),
+	PINS_FIELD_BASE(152, 155, 5, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(156, 156, 5, 0x0010, 0x10, 6, 3),
+	PINS_FIELD_BASE(157, 159, 5, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(160, 160, 5, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(161, 161, 5, 0x0010, 0x10, 0, 3),
+	PINS_FIELD_BASE(162, 171, 5, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(172, 172, 5, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(173, 173, 5, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(174, 174, 5, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(175, 177, 5, 0x0000, 0x10, 3, 3),
+	PINS_FIELD_BASE(178, 182, 5, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(183, 183, 7, 0x0000, 0x10, 9, 3),
+	PINS_FIELD_BASE(184, 190, 7, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(191, 191, 7, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(192, 192, 7, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(193, 193, 7, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(194, 194, 7, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(195, 195, 7, 0x0010, 0x10, 3, 3),
+	PINS_FIELD_BASE(196, 199, 7, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(200, 200, 7, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(201, 201, 7, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(202, 202, 7, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(203, 203, 7, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(204, 205, 6, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(206, 208, 7, 0x0010, 0x10, 12, 3),
+	PINS_FIELD_BASE(209, 212, 7, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(213, 213, 7, 0x0000, 0x10, 24, 3),
+	PINS_FIELD_BASE(214, 219, 7, 0x0000, 0x10, 0, 3),
+};
+
+static const struct mtk_pin_field_calc mt6893_pin_pupd_range[] = {
+	PIN_FIELD_BASE(10, 15, 1, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(45, 45, 6, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(46, 46, 6, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(47, 47, 6, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(48, 49, 6, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(50, 50, 6, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(51, 52, 3, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(53, 53, 3, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(54, 54, 3, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(55, 55, 3, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(56, 56, 3, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(152, 152, 5, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(153, 153, 5, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(154, 155, 5, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(183, 184, 7, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(185, 185, 7, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(186, 186, 7, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(187, 187, 7, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(188, 188, 7, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(189, 189, 7, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(190, 191, 7, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(192, 192, 7, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(193, 193, 7, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(194, 194, 7, 0x0080, 0x10, 11, 1),
+};
+
+static const struct mtk_pin_field_calc mt6893_pin_r0_range[] = {
+	PIN_FIELD_BASE(10, 15, 1, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(24, 24, 7, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(25, 25, 7, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(45, 45, 6, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(46, 46, 6, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(47, 47, 6, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(48, 49, 6, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(50, 50, 6, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(51, 52, 3, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(53, 53, 3, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(54, 54, 3, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(55, 55, 3, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(56, 56, 3, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(118, 118, 2, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(119, 119, 2, 0x00e0, 0x10, 12, 1),
+	PIN_FIELD_BASE(120, 120, 2, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(121, 121, 2, 0x00e0, 0x10, 22, 1),
+	PIN_FIELD_BASE(122, 122, 2, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(123, 123, 2, 0x00e0, 0x10, 20, 1),
+	PIN_FIELD_BASE(124, 124, 2, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(125, 125, 2, 0x00e0, 0x10, 18, 1),
+	PIN_FIELD_BASE(139, 139, 2, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(140, 140, 2, 0x00e0, 0x10, 16, 1),
+	PIN_FIELD_BASE(141, 141, 2, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(142, 142, 2, 0x00e0, 0x10, 14, 1),
+	PIN_FIELD_BASE(152, 152, 5, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(153, 153, 5, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(154, 155, 5, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(160, 160, 5, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(161, 161, 5, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(183, 184, 7, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(185, 185, 7, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(186, 186, 7, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(187, 187, 7, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(188, 188, 7, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(189, 189, 7, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(190, 191, 7, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(192, 192, 7, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(193, 193, 7, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(194, 194, 7, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(200, 200, 7, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(201, 201, 7, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(202, 202, 7, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(203, 203, 7, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(204, 204, 6, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(205, 205, 6, 0x00d0, 0x10, 2, 1),
+};
+
+static const struct mtk_pin_field_calc mt6893_pin_r1_range[] = {
+	PIN_FIELD_BASE(10, 15, 1, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(24, 24, 7, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(25, 25, 7, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(45, 45, 6, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(46, 46, 6, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(47, 47, 6, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(48, 49, 6, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(50, 50, 6, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(51, 52, 3, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(53, 53, 3, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(54, 54, 3, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(55, 55, 3, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(56, 56, 3, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(118, 118, 2, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(119, 119, 2, 0x00e0, 0x10, 13, 1),
+	PIN_FIELD_BASE(120, 120, 2, 0x00e0, 0x10, 11, 1),
+	PIN_FIELD_BASE(121, 121, 2, 0x00e0, 0x10, 23, 1),
+	PIN_FIELD_BASE(122, 122, 2, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(123, 123, 2, 0x00e0, 0x10, 21, 1),
+	PIN_FIELD_BASE(124, 124, 2, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(125, 125, 2, 0x00e0, 0x10, 19, 1),
+	PIN_FIELD_BASE(139, 139, 2, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(140, 140, 2, 0x00e0, 0x10, 17, 1),
+	PIN_FIELD_BASE(141, 141, 2, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(142, 142, 2, 0x00e0, 0x10, 15, 1),
+	PIN_FIELD_BASE(152, 152, 5, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(153, 153, 5, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(154, 155, 5, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(160, 160, 5, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(161, 161, 5, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(183, 184, 7, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(185, 185, 7, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(186, 186, 7, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(187, 187, 7, 0x00b0, 0x10, 8, 1),
+	PIN_FIELD_BASE(188, 188, 7, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(189, 189, 7, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(190, 191, 7, 0x00b0, 0x10, 9, 1),
+	PIN_FIELD_BASE(192, 192, 7, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(193, 193, 7, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(194, 194, 7, 0x00b0, 0x10, 11, 1),
+	PIN_FIELD_BASE(200, 200, 7, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(201, 201, 7, 0x00e0, 0x10, 11, 1),
+	PIN_FIELD_BASE(202, 202, 7, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(203, 203, 7, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(204, 204, 6, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(205, 205, 6, 0x00d0, 0x10, 3, 1),
+};
+
+static const struct mtk_pin_field_calc mt6893_pin_drv_adv_range[] = {
+	PIN_FIELD_BASE(24, 24, 7, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(25, 25, 7, 0x0030, 0x10, 3, 3),
+	PIN_FIELD_BASE(89, 89, 2, 0x0050, 0x10, 6, 5),
+	PIN_FIELD_BASE(90, 90, 2, 0x0050, 0x10, 11, 5),
+	PIN_FIELD_BASE(118, 118, 2, 0x0040, 0x10, 0, 3),
+	PIN_FIELD_BASE(119, 119, 2, 0x0040, 0x10, 18, 3),
+	PIN_FIELD_BASE(120, 120, 2, 0x0040, 0x10, 15, 3),
+	PIN_FIELD_BASE(121, 121, 2, 0x0050, 0x10, 3, 3),
+	PIN_FIELD_BASE(122, 122, 2, 0x0040, 0x10, 12, 3),
+	PIN_FIELD_BASE(123, 123, 2, 0x0050, 0x10, 0, 3),
+	PIN_FIELD_BASE(124, 124, 2, 0x0040, 0x10, 9, 3),
+	PIN_FIELD_BASE(125, 125, 2, 0x0040, 0x10, 27, 3),
+	PIN_FIELD_BASE(139, 139, 2, 0x0040, 0x10, 6, 3),
+	PIN_FIELD_BASE(140, 140, 2, 0x0040, 0x10, 24, 3),
+	PIN_FIELD_BASE(141, 141, 2, 0x0040, 0x10, 3, 3),
+	PIN_FIELD_BASE(142, 142, 2, 0x0040, 0x10, 21, 3),
+	PIN_FIELD_BASE(160, 160, 5, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(161, 161, 5, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(200, 200, 7, 0x0030, 0x10, 9, 3),
+	PIN_FIELD_BASE(201, 201, 7, 0x0030, 0x10, 15, 3),
+	PIN_FIELD_BASE(202, 202, 7, 0x0030, 0x10, 6, 3),
+	PIN_FIELD_BASE(203, 203, 7, 0x0030, 0x10, 12, 3),
+	PIN_FIELD_BASE(204, 204, 6, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(205, 205, 6, 0x0020, 0x10, 3, 3),
+};
+
+static const struct mtk_pin_field_calc mt6893_pin_rsel_range[] = {
+	PIN_FIELD_BASE(24, 24, 7, 0x00e0, 0x10, 0, 2),
+	PIN_FIELD_BASE(25, 25, 7, 0x00e0, 0x10, 2, 2),
+	PIN_FIELD_BASE(118, 118, 2, 0x00e0, 0x10, 0, 2),
+	PIN_FIELD_BASE(119, 119, 2, 0x00e0, 0x10, 12, 2),
+	PIN_FIELD_BASE(120, 120, 2, 0x00e0, 0x10, 10, 2),
+	PIN_FIELD_BASE(121, 121, 2, 0x00e0, 0x10, 22, 2),
+	PIN_FIELD_BASE(122, 122, 2, 0x00e0, 0x10, 8, 2),
+	PIN_FIELD_BASE(123, 123, 2, 0x00e0, 0x10, 20, 2),
+	PIN_FIELD_BASE(124, 124, 2, 0x00e0, 0x10, 6, 2),
+	PIN_FIELD_BASE(125, 125, 2, 0x00e0, 0x10, 18, 2),
+	PIN_FIELD_BASE(139, 139, 2, 0x00e0, 0x10, 4, 2),
+	PIN_FIELD_BASE(140, 140, 2, 0x00e0, 0x10, 16, 2),
+	PIN_FIELD_BASE(141, 141, 2, 0x00e0, 0x10, 2, 2),
+	PIN_FIELD_BASE(142, 142, 2, 0x00e0, 0x10, 14, 2),
+	PIN_FIELD_BASE(160, 160, 5, 0x00b0, 0x10, 0, 2),
+	PIN_FIELD_BASE(161, 161, 5, 0x00b0, 0x10, 2, 2),
+	PIN_FIELD_BASE(200, 200, 7, 0x00e0, 0x10, 6, 2),
+	PIN_FIELD_BASE(201, 201, 7, 0x00e0, 0x10, 10, 2),
+	PIN_FIELD_BASE(202, 202, 7, 0x00e0, 0x10, 4, 2),
+	PIN_FIELD_BASE(203, 203, 7, 0x00e0, 0x10, 8, 2),
+	PIN_FIELD_BASE(204, 204, 6, 0x00d0, 0x10, 0, 2),
+	PIN_FIELD_BASE(205, 205, 6, 0x00d0, 0x10, 2, 2),
+};
+
+static const unsigned int mt6893_pull_type[] = {
+	MTK_PULL_PU_PD_TYPE, /* 0 */		MTK_PULL_PU_PD_TYPE, /* 1 */
+	MTK_PULL_PU_PD_TYPE, /* 2 */		MTK_PULL_PU_PD_TYPE, /* 3 */
+	MTK_PULL_PU_PD_TYPE, /* 4 */		MTK_PULL_PU_PD_TYPE, /* 5 */
+	MTK_PULL_PU_PD_TYPE, /* 6 */		MTK_PULL_PU_PD_TYPE, /* 7 */
+	MTK_PULL_PU_PD_TYPE, /* 8 */		MTK_PULL_PU_PD_TYPE, /* 9 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 10 */	MTK_PULL_PUPD_R1R0_TYPE, /* 11 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 12 */	MTK_PULL_PUPD_R1R0_TYPE, /* 13 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 14 */	MTK_PULL_PUPD_R1R0_TYPE, /* 15 */
+	MTK_PULL_PU_PD_TYPE, /* 16 */		MTK_PULL_PU_PD_TYPE, /* 17 */
+	MTK_PULL_PU_PD_TYPE, /* 18 */		MTK_PULL_PU_PD_TYPE, /* 19 */
+	MTK_PULL_PU_PD_TYPE, /* 20 */		MTK_PULL_PU_PD_TYPE, /* 21 */
+	MTK_PULL_PU_PD_TYPE, /* 22 */		MTK_PULL_PU_PD_TYPE, /* 23 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 24 */	MTK_PULL_PU_PD_RSEL_TYPE, /* 25 */
+	MTK_PULL_PU_PD_TYPE, /* 26 */		MTK_PULL_PU_PD_TYPE, /* 27 */
+	MTK_PULL_PU_PD_TYPE, /* 28 */		MTK_PULL_PU_PD_TYPE, /* 29 */
+	MTK_PULL_PU_PD_TYPE, /* 30 */		MTK_PULL_PU_PD_TYPE, /* 31 */
+	MTK_PULL_PU_PD_TYPE, /* 32 */		MTK_PULL_PU_PD_TYPE, /* 33 */
+	MTK_PULL_PU_PD_TYPE, /* 34 */		MTK_PULL_PU_PD_TYPE, /* 35 */
+	MTK_PULL_PU_PD_TYPE, /* 36 */		MTK_PULL_PU_PD_TYPE, /* 37 */
+	MTK_PULL_PU_PD_TYPE, /* 38 */		MTK_PULL_PU_PD_TYPE, /* 39 */
+	MTK_PULL_PU_PD_TYPE, /* 40 */		MTK_PULL_PU_PD_TYPE, /* 41 */
+	MTK_PULL_PU_PD_TYPE, /* 42 */		MTK_PULL_PU_PD_TYPE, /* 43 */
+	MTK_PULL_PU_PD_TYPE, /* 44 */		MTK_PULL_PUPD_R1R0_TYPE, /* 45 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 46 */	MTK_PULL_PUPD_R1R0_TYPE, /* 47 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 48 */	MTK_PULL_PUPD_R1R0_TYPE, /* 49 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 50 */	MTK_PULL_PUPD_R1R0_TYPE, /* 51 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 52 */	MTK_PULL_PUPD_R1R0_TYPE, /* 53 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 54 */	MTK_PULL_PUPD_R1R0_TYPE, /* 55 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 56 */	MTK_PULL_PU_PD_TYPE, /* 57 */
+	MTK_PULL_PU_PD_TYPE, /* 58 */		MTK_PULL_PU_PD_TYPE, /* 59 */
+	MTK_PULL_PU_PD_TYPE, /* 60 */		MTK_PULL_PU_PD_TYPE, /* 61 */
+	MTK_PULL_PU_PD_TYPE, /* 62 */		MTK_PULL_PU_PD_TYPE, /* 63 */
+	MTK_PULL_PU_PD_TYPE, /* 64 */		MTK_PULL_PU_PD_TYPE, /* 65 */
+	MTK_PULL_PU_PD_TYPE, /* 66 */		MTK_PULL_PU_PD_TYPE, /* 67 */
+	MTK_PULL_PU_PD_TYPE, /* 68 */		MTK_PULL_PU_PD_TYPE, /* 69 */
+	MTK_PULL_PU_PD_TYPE, /* 70 */		MTK_PULL_PU_PD_TYPE, /* 71 */
+	MTK_PULL_PU_PD_TYPE, /* 72 */		MTK_PULL_PU_PD_TYPE, /* 73 */
+	MTK_PULL_PU_PD_TYPE, /* 74 */		MTK_PULL_PU_PD_TYPE, /* 75 */
+	MTK_PULL_PU_PD_TYPE, /* 76 */		MTK_PULL_PU_PD_TYPE, /* 77 */
+	MTK_PULL_PU_PD_TYPE, /* 78 */		MTK_PULL_PU_PD_TYPE, /* 79 */
+	MTK_PULL_PU_PD_TYPE, /* 80 */		MTK_PULL_PU_PD_TYPE, /* 81 */
+	MTK_PULL_PU_PD_TYPE, /* 82 */		MTK_PULL_PU_PD_TYPE, /* 83 */
+	MTK_PULL_PU_PD_TYPE, /* 84 */		MTK_PULL_PU_PD_TYPE, /* 85 */
+	MTK_PULL_PU_PD_TYPE, /* 86 */		MTK_PULL_PU_PD_TYPE, /* 87 */
+	MTK_PULL_PU_PD_TYPE, /* 88 */		MTK_PULL_PU_PD_TYPE, /* 89 */
+	MTK_PULL_PU_PD_TYPE, /* 90 */		MTK_PULL_PU_PD_TYPE, /* 91 */
+	MTK_PULL_PU_PD_TYPE, /* 92 */		MTK_PULL_PU_PD_TYPE, /* 93 */
+	MTK_PULL_PU_PD_TYPE, /* 94 */		MTK_PULL_PU_PD_TYPE, /* 95 */
+	MTK_PULL_PU_PD_TYPE, /* 96 */		MTK_PULL_PU_PD_TYPE, /* 97 */
+	MTK_PULL_PU_PD_TYPE, /* 98 */		MTK_PULL_PU_PD_TYPE, /* 99 */
+	MTK_PULL_PU_PD_TYPE, /* 100 */		MTK_PULL_PU_PD_TYPE, /* 101 */
+	MTK_PULL_PU_PD_TYPE, /* 102 */		MTK_PULL_PU_PD_TYPE, /* 103 */
+	MTK_PULL_PU_PD_TYPE, /* 104 */		MTK_PULL_PU_PD_TYPE, /* 105 */
+	MTK_PULL_PU_PD_TYPE, /* 106 */		MTK_PULL_PU_PD_TYPE, /* 107 */
+	MTK_PULL_PU_PD_TYPE, /* 108 */		MTK_PULL_PU_PD_TYPE, /* 109 */
+	MTK_PULL_PU_PD_TYPE, /* 110 */		MTK_PULL_PU_PD_TYPE, /* 111 */
+	MTK_PULL_PU_PD_TYPE, /* 112 */		MTK_PULL_PU_PD_TYPE, /* 113 */
+	MTK_PULL_PU_PD_TYPE, /* 114 */		MTK_PULL_PU_PD_TYPE, /* 115 */
+	MTK_PULL_PU_PD_TYPE, /* 116 */		MTK_PULL_PU_PD_TYPE, /* 117 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 118 */	MTK_PULL_PU_PD_RSEL_TYPE, /* 119 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 120 */	MTK_PULL_PU_PD_RSEL_TYPE, /* 121 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 122 */	MTK_PULL_PU_PD_RSEL_TYPE, /* 123 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 124 */	MTK_PULL_PU_PD_RSEL_TYPE, /* 125 */
+	MTK_PULL_PU_PD_TYPE, /* 126 */		MTK_PULL_PU_PD_TYPE, /* 127 */
+	MTK_PULL_PU_PD_TYPE, /* 128 */		MTK_PULL_PU_PD_TYPE, /* 129 */
+	MTK_PULL_PU_PD_TYPE, /* 130 */		MTK_PULL_PU_PD_TYPE, /* 131 */
+	MTK_PULL_PU_PD_TYPE, /* 132 */		MTK_PULL_PU_PD_TYPE, /* 133 */
+	MTK_PULL_PU_PD_TYPE, /* 134 */		MTK_PULL_PU_PD_TYPE, /* 135 */
+	MTK_PULL_PU_PD_TYPE, /* 136 */		MTK_PULL_PU_PD_TYPE, /* 137 */
+	MTK_PULL_PU_PD_TYPE, /* 138 */		MTK_PULL_PU_PD_TYPE, /* 139 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 140 */	MTK_PULL_PU_PD_RSEL_TYPE, /* 141 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 142 */	MTK_PULL_PU_PD_TYPE, /* 143 */
+	MTK_PULL_PU_PD_TYPE, /* 144 */		MTK_PULL_PU_PD_TYPE, /* 145 */
+	MTK_PULL_PU_PD_TYPE, /* 146 */		MTK_PULL_PU_PD_TYPE, /* 147 */
+	MTK_PULL_PU_PD_TYPE, /* 148 */		MTK_PULL_PU_PD_TYPE, /* 149 */
+	MTK_PULL_PU_PD_TYPE, /* 150 */		MTK_PULL_PU_PD_TYPE, /* 151 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 152 */	MTK_PULL_PUPD_R1R0_TYPE, /* 153 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 154 */	MTK_PULL_PUPD_R1R0_TYPE, /* 155 */
+	MTK_PULL_PU_PD_TYPE, /* 156 */		MTK_PULL_PU_PD_TYPE, /* 157 */
+	MTK_PULL_PU_PD_TYPE, /* 158 */		MTK_PULL_PU_PD_TYPE, /* 159 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 160 */	MTK_PULL_PU_PD_RSEL_TYPE, /* 161 */
+	MTK_PULL_PU_PD_TYPE, /* 162 */		MTK_PULL_PU_PD_TYPE, /* 163 */
+	MTK_PULL_PU_PD_TYPE, /* 164 */		MTK_PULL_PU_PD_TYPE, /* 165 */
+	MTK_PULL_PU_PD_TYPE, /* 166 */		MTK_PULL_PU_PD_TYPE, /* 167 */
+	MTK_PULL_PU_PD_TYPE, /* 168 */		MTK_PULL_PU_PD_TYPE, /* 169 */
+	MTK_PULL_PU_PD_TYPE, /* 170 */		MTK_PULL_PU_PD_TYPE, /* 171 */
+	MTK_PULL_PU_PD_TYPE, /* 172 */		MTK_PULL_PU_PD_TYPE, /* 173 */
+	MTK_PULL_PU_PD_TYPE, /* 174 */		MTK_PULL_PU_PD_TYPE, /* 175 */
+	MTK_PULL_PU_PD_TYPE, /* 176 */		MTK_PULL_PU_PD_TYPE, /* 177 */
+	MTK_PULL_PU_PD_TYPE, /* 178 */		MTK_PULL_PU_PD_TYPE, /* 179 */
+	MTK_PULL_PU_PD_TYPE, /* 180 */		MTK_PULL_PU_PD_TYPE, /* 181 */
+	MTK_PULL_PU_PD_TYPE, /* 182 */		MTK_PULL_PUPD_R1R0_TYPE, /* 183 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 184 */	MTK_PULL_PUPD_R1R0_TYPE, /* 185 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 186 */	MTK_PULL_PUPD_R1R0_TYPE, /* 187 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 188 */	MTK_PULL_PUPD_R1R0_TYPE, /* 189 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 190 */	MTK_PULL_PUPD_R1R0_TYPE, /* 191 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 192 */	MTK_PULL_PUPD_R1R0_TYPE, /* 193 */
+	MTK_PULL_PUPD_R1R0_TYPE, /* 194 */	MTK_PULL_PU_PD_TYPE, /* 195 */
+	MTK_PULL_PU_PD_TYPE, /* 196 */		MTK_PULL_PU_PD_TYPE, /* 197 */
+	MTK_PULL_PU_PD_TYPE, /* 198 */		MTK_PULL_PU_PD_TYPE, /* 199 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 200 */	MTK_PULL_PU_PD_RSEL_TYPE, /* 201 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 202 */	MTK_PULL_PU_PD_RSEL_TYPE, /* 203 */
+	MTK_PULL_PU_PD_RSEL_TYPE, /* 204 */	MTK_PULL_PU_PD_RSEL_TYPE, /* 205 */
+	MTK_PULL_PU_PD_TYPE, /* 206 */		MTK_PULL_PU_PD_TYPE, /* 207 */
+	MTK_PULL_PU_PD_TYPE, /* 208 */		MTK_PULL_PU_PD_TYPE, /* 209 */
+	MTK_PULL_PU_PD_TYPE, /* 210 */		MTK_PULL_PU_PD_TYPE, /* 211 */
+	MTK_PULL_PU_PD_TYPE, /* 212 */		MTK_PULL_PU_PD_TYPE, /* 213 */
+	MTK_PULL_PU_PD_TYPE, /* 214 */		MTK_PULL_PU_PD_TYPE, /* 215 */
+	MTK_PULL_PU_PD_TYPE, /* 216 */		MTK_PULL_PU_PD_TYPE, /* 217 */
+	MTK_PULL_PU_PD_TYPE, /* 218 */		MTK_PULL_PU_PD_TYPE, /* 219 */
+};
+
+static const char * const mt6893_pinctrl_register_base_name[] = {
+	"base", "rm", "bm", "bl", "br", "lm", "lb", "rt", "lt", "tl",
+};
+
+static const struct mtk_pin_reg_calc mt6893_reg_cals[PINCTRL_PIN_REG_MAX] = {
+	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt6893_pin_mode_range),
+	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt6893_pin_dir_range),
+	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt6893_pin_di_range),
+	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt6893_pin_do_range),
+	[PINCTRL_PIN_REG_SR] = MTK_RANGE(mt6893_pin_dir_range),
+	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt6893_pin_smt_range),
+	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt6893_pin_ies_range),
+	[PINCTRL_PIN_REG_PU] = MTK_RANGE(mt6893_pin_pu_range),
+	[PINCTRL_PIN_REG_PD] = MTK_RANGE(mt6893_pin_pd_range),
+	[PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt6893_pin_drv_range),
+	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt6893_pin_pupd_range),
+	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt6893_pin_r0_range),
+	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt6893_pin_r1_range),
+	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt6893_pin_drv_adv_range),
+	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt6893_pin_rsel_range),
+};
+
+static const struct mtk_eint_hw mt6893_eint_hw = {
+	.port_mask = 7,
+	.ports     = 7,
+	.ap_num    = 224,
+	.db_cnt    = 32,
+	.db_time   = debounce_time_mt6765,
+};
+
+static const struct mtk_pin_soc mt6893_data = {
+	.reg_cal = mt6893_reg_cals,
+	.pins = mtk_pins_mt6893,
+	.npins = ARRAY_SIZE(mtk_pins_mt6893),
+	.ngrps = ARRAY_SIZE(mtk_pins_mt6893),
+	.eint_hw = &mt6893_eint_hw,
+	.nfuncs = 8,
+	.gpio_m = 0,
+	.base_names = mt6893_pinctrl_register_base_name,
+	.nbase_names = ARRAY_SIZE(mt6893_pinctrl_register_base_name),
+	.pull_type = mt6893_pull_type,
+	.bias_set_combo = mtk_pinconf_bias_set_combo,
+	.bias_get_combo = mtk_pinconf_bias_get_combo,
+	.drive_set = mtk_pinconf_drive_set_rev1,
+	.drive_get = mtk_pinconf_drive_get_rev1,
+	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,
+	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
+};
+
+static const struct of_device_id mt6893_pinctrl_of_match[] = {
+	{ .compatible = "mediatek,mt6893-pinctrl", .data = &mt6893_data },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver mt6893_pinctrl_driver = {
+	.driver = {
+		.name = "mt6893-pinctrl",
+		.of_match_table = mt6893_pinctrl_of_match,
+		.pm = pm_sleep_ptr(&mtk_paris_pinctrl_pm_ops)
+	},
+	.probe = mtk_paris_pinctrl_probe,
+};
+
+static int __init mt6893_pinctrl_init(void)
+{
+	return platform_driver_register(&mt6893_pinctrl_driver);
+}
+
+arch_initcall(mt6893_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT6893 Pinctrl Driver");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6893.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6893.h
new file mode 100644
index 000000000000..0d3bb16411f8
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6893.h
@@ -0,0 +1,2283 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 MediaTek Inc.
+ * Copyright (C) 2024 Collabora Ltd.
+ *
+ * Author: Andy Teng <andy.teng@mediatek.com>
+ */
+
+#ifndef __PINCTRL_MTK_MT6893_H
+#define __PINCTRL_MTK_MT6893_H
+
+#include "pinctrl-paris.h"
+
+static const struct mtk_pin_desc mtk_pins_mt6893[] = {
+	MTK_PIN(
+		0, "GPIO0",
+		MTK_EINT_FUNCTION(0, 0),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO0"),
+		MTK_FUNCTION(1, "SPI6_CLK"),
+		MTK_FUNCTION(2, "I2S5_MCK"),
+		MTK_FUNCTION(3, "PWM_0"),
+		MTK_FUNCTION(4, "MD_INT0"),
+		MTK_FUNCTION(5, "TP_GPIO0_AO")
+	),
+	MTK_PIN(
+		1, "GPIO1",
+		MTK_EINT_FUNCTION(0, 1),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO1"),
+		MTK_FUNCTION(1, "SPI6_CSB"),
+		MTK_FUNCTION(2, "I2S5_BCK"),
+		MTK_FUNCTION(3, "PWM_1"),
+		MTK_FUNCTION(4, "MD_INT1_C2K_UIM0_HOT_PLUG"),
+		MTK_FUNCTION(5, "TP_GPIO1_AO")
+	),
+	MTK_PIN(
+		2, "GPIO2",
+		MTK_EINT_FUNCTION(0, 2),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO2"),
+		MTK_FUNCTION(1, "SPI6_MI"),
+		MTK_FUNCTION(2, "I2S5_LRCK"),
+		MTK_FUNCTION(3, "PWM_2"),
+		MTK_FUNCTION(4, "MD_INT2_C2K_UIM1_HOT_PLUG"),
+		MTK_FUNCTION(5, "TP_GPIO2_AO")
+	),
+	MTK_PIN(
+		3, "GPIO3",
+		MTK_EINT_FUNCTION(0, 3),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO3"),
+		MTK_FUNCTION(1, "SPI6_MO"),
+		MTK_FUNCTION(2, "I2S5_DO"),
+		MTK_FUNCTION(3, "PWM_3"),
+		MTK_FUNCTION(4, "CLKM0"),
+		MTK_FUNCTION(5, "TP_GPIO3_AO")
+	),
+	MTK_PIN(
+		4, "GPIO4",
+		MTK_EINT_FUNCTION(0, 4),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO4"),
+		MTK_FUNCTION(1, "SPI7_A_CLK"),
+		MTK_FUNCTION(2, "I2S2_MCK"),
+		MTK_FUNCTION(3, "DMIC1_CLK"),
+		MTK_FUNCTION(4, "PCM1_DI"),
+		MTK_FUNCTION(5, "TP_GPIO4_AO")
+	),
+	MTK_PIN(
+		5, "GPIO5",
+		MTK_EINT_FUNCTION(0, 5),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO5"),
+		MTK_FUNCTION(1, "SPI7_A_CSB"),
+		MTK_FUNCTION(2, "I2S2_BCK"),
+		MTK_FUNCTION(3, "DMIC1_DAT"),
+		MTK_FUNCTION(4, "PCM1_CLK"),
+		MTK_FUNCTION(5, "TP_GPIO5_AO")
+	),
+	MTK_PIN(
+		6, "GPIO6",
+		MTK_EINT_FUNCTION(0, 6),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO6"),
+		MTK_FUNCTION(1, "SPI7_A_MI"),
+		MTK_FUNCTION(2, "I2S2_LRCK"),
+		MTK_FUNCTION(3, "DMIC_CLK"),
+		MTK_FUNCTION(4, "PCM1_SYNC"),
+		MTK_FUNCTION(5, "TP_GPIO6_AO"),
+		MTK_FUNCTION(6, "CONN_TCXOENA_REQ")
+	),
+	MTK_PIN(
+		7, "GPIO7",
+		MTK_EINT_FUNCTION(0, 7),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO7"),
+		MTK_FUNCTION(1, "SPI7_A_MO"),
+		MTK_FUNCTION(2, "I2S2_DI"),
+		MTK_FUNCTION(3, "DMIC_DAT"),
+		MTK_FUNCTION(4, "PCM1_DO0"),
+		MTK_FUNCTION(5, "TP_GPIO7_AO"),
+		MTK_FUNCTION(6, "WIFI_TXD")
+	),
+	MTK_PIN(
+		8, "GPIO8",
+		MTK_EINT_FUNCTION(0, 8),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO8"),
+		MTK_FUNCTION(1, "SRCLKENAI1"),
+		MTK_FUNCTION(2, "I2S2_DI2"),
+		MTK_FUNCTION(3, "KPCOL2"),
+		MTK_FUNCTION(4, "PCM1_DO1"),
+		MTK_FUNCTION(5, "CLKM1"),
+		MTK_FUNCTION(6, "CONN_BT_TXD")
+	),
+	MTK_PIN(
+		9, "GPIO9",
+		MTK_EINT_FUNCTION(0, 9),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO9"),
+		MTK_FUNCTION(1, "SRCLKENAI0"),
+		MTK_FUNCTION(2, "DVFSRC_EXT_REQ"),
+		MTK_FUNCTION(3, "KPROW2"),
+		MTK_FUNCTION(4, "PCM1_DO2"),
+		MTK_FUNCTION(5, "CLKM3"),
+		MTK_FUNCTION(6, "CMMCLK4")
+	),
+	MTK_PIN(
+		10, "GPIO10",
+		MTK_EINT_FUNCTION(0, 10),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO10"),
+		MTK_FUNCTION(1, "MSDC1_CLK_A"),
+		MTK_FUNCTION(2, "SPI4_B_CLK"),
+		MTK_FUNCTION(3, "I2S8_MCK"),
+		MTK_FUNCTION(4, "DSI1_TE"),
+		MTK_FUNCTION(5, "MD_INT0"),
+		MTK_FUNCTION(6, "TP_GPIO0_AO")
+	),
+	MTK_PIN(
+		11, "GPIO11",
+		MTK_EINT_FUNCTION(0, 11),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO11"),
+		MTK_FUNCTION(1, "MSDC1_CMD_A"),
+		MTK_FUNCTION(2, "SPI4_B_CSB"),
+		MTK_FUNCTION(3, "I2S8_BCK"),
+		MTK_FUNCTION(4, "LCM1_RST"),
+		MTK_FUNCTION(5, "MD_INT1_C2K_UIM0_HOT_PLUG"),
+		MTK_FUNCTION(6, "TP_GPIO1_AO")
+	),
+	MTK_PIN(
+		12, "GPIO12",
+		MTK_EINT_FUNCTION(0, 12),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO12"),
+		MTK_FUNCTION(1, "MSDC1_DAT3_A"),
+		MTK_FUNCTION(2, "SPI4_B_MI"),
+		MTK_FUNCTION(3, "I2S8_LRCK"),
+		MTK_FUNCTION(4, "DMIC1_CLK"),
+		MTK_FUNCTION(5, "MD_INT2_C2K_UIM1_HOT_PLUG"),
+		MTK_FUNCTION(6, "TP_GPIO2_AO")
+	),
+	MTK_PIN(
+		13, "GPIO13",
+		MTK_EINT_FUNCTION(0, 13),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO13"),
+		MTK_FUNCTION(1, "MSDC1_DAT0_A"),
+		MTK_FUNCTION(2, "SPI4_B_MO"),
+		MTK_FUNCTION(3, "I2S8_DI"),
+		MTK_FUNCTION(4, "DMIC1_DAT"),
+		MTK_FUNCTION(5, "ANT_SEL10"),
+		MTK_FUNCTION(6, "TP_GPIO3_AO")
+	),
+	MTK_PIN(
+		14, "GPIO14",
+		MTK_EINT_FUNCTION(0, 14),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO14"),
+		MTK_FUNCTION(1, "MSDC1_DAT2_A"),
+		MTK_FUNCTION(2, "SPI5_C_CLK"),
+		MTK_FUNCTION(3, "I2S9_MCK"),
+		MTK_FUNCTION(4, "IDDIG"),
+		MTK_FUNCTION(5, "ANT_SEL11"),
+		MTK_FUNCTION(6, "TP_GPIO4_AO")
+	),
+	MTK_PIN(
+		15, "GPIO15",
+		MTK_EINT_FUNCTION(0, 15),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO15"),
+		MTK_FUNCTION(1, "MSDC1_DAT1_A"),
+		MTK_FUNCTION(2, "SPI5_C_CSB"),
+		MTK_FUNCTION(3, "I2S9_BCK"),
+		MTK_FUNCTION(4, "USB_DRVVBUS"),
+		MTK_FUNCTION(5, "ANT_SEL12"),
+		MTK_FUNCTION(6, "TP_GPIO5_AO")
+	),
+	MTK_PIN(
+		16, "GPIO16",
+		MTK_EINT_FUNCTION(0, 16),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO16"),
+		MTK_FUNCTION(1, "SRCLKENAI1"),
+		MTK_FUNCTION(2, "SPI5_C_MI"),
+		MTK_FUNCTION(3, "I2S9_LRCK"),
+		MTK_FUNCTION(4, "KPCOL2"),
+		MTK_FUNCTION(5, "GPS_L1_ELNA_EN"),
+		MTK_FUNCTION(6, "TP_GPIO6_AO"),
+		MTK_FUNCTION(7, "DBG_MON_A30")
+	),
+	MTK_PIN(
+		17, "GPIO17",
+		MTK_EINT_FUNCTION(0, 17),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO17"),
+		MTK_FUNCTION(1, "SRCLKENAI0"),
+		MTK_FUNCTION(2, "SPI5_C_MO"),
+		MTK_FUNCTION(3, "I2S9_DO"),
+		MTK_FUNCTION(4, "KPROW2"),
+		MTK_FUNCTION(5, "GPS_L5_ELNA_EN"),
+		MTK_FUNCTION(6, "TP_GPIO7_AO"),
+		MTK_FUNCTION(7, "DBG_MON_A31")
+	),
+	MTK_PIN(
+		18, "GPIO18",
+		MTK_EINT_FUNCTION(0, 18),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO18"),
+		MTK_FUNCTION(1, "DP_TX_HPD"),
+		MTK_FUNCTION(2, "SPI4_C_MI"),
+		MTK_FUNCTION(3, "SPI1_B_MI"),
+		MTK_FUNCTION(4, "GPS_L1_ELNA_EN"),
+		MTK_FUNCTION(5, "ANT_SEL10"),
+		MTK_FUNCTION(6, "MD_INT0")
+	),
+	MTK_PIN(
+		19, "GPIO19",
+		MTK_EINT_FUNCTION(0, 19),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO19"),
+		MTK_FUNCTION(1, "SRCLKENAI1"),
+		MTK_FUNCTION(2, "SPI4_C_MO"),
+		MTK_FUNCTION(3, "SPI1_B_MO"),
+		MTK_FUNCTION(4, "GPS_L5_ELNA_EN"),
+		MTK_FUNCTION(5, "ANT_SEL11"),
+		MTK_FUNCTION(6, "MD_INT1_C2K_UIM0_HOT_PLUG")
+	),
+	MTK_PIN(
+		20, "GPIO20",
+		MTK_EINT_FUNCTION(0, 20),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO20"),
+		MTK_FUNCTION(1, "SRCLKENAI0"),
+		MTK_FUNCTION(2, "SPI4_C_CLK"),
+		MTK_FUNCTION(3, "SPI1_B_CLK"),
+		MTK_FUNCTION(4, "PWM_3"),
+		MTK_FUNCTION(5, "ANT_SEL12"),
+		MTK_FUNCTION(6, "MD_INT2_C2K_UIM1_HOT_PLUG")
+	),
+	MTK_PIN(
+		21, "GPIO21",
+		MTK_EINT_FUNCTION(0, 21),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO21"),
+		MTK_FUNCTION(1, "DP_TX_HPD"),
+		MTK_FUNCTION(2, "SPI4_C_CSB"),
+		MTK_FUNCTION(3, "SPI1_B_CSB"),
+		MTK_FUNCTION(4, "I2S7_MCK"),
+		MTK_FUNCTION(5, "I2S9_MCK"),
+		MTK_FUNCTION(6, "IDDIG")
+	),
+	MTK_PIN(
+		22, "GPIO22",
+		MTK_EINT_FUNCTION(0, 22),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO22"),
+		MTK_FUNCTION(1, "LCM1_RST"),
+		MTK_FUNCTION(2, "SPI0_C_CLK"),
+		MTK_FUNCTION(3, "SPI7_B_CLK"),
+		MTK_FUNCTION(4, "I2S7_BCK"),
+		MTK_FUNCTION(5, "I2S9_BCK"),
+		MTK_FUNCTION(6, "SCL13")
+	),
+	MTK_PIN(
+		23, "GPIO23",
+		MTK_EINT_FUNCTION(0, 23),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO23"),
+		MTK_FUNCTION(1, "DSI1_TE"),
+		MTK_FUNCTION(2, "SPI0_C_CSB"),
+		MTK_FUNCTION(3, "SPI7_B_CSB"),
+		MTK_FUNCTION(4, "I2S7_LRCK"),
+		MTK_FUNCTION(5, "I2S9_LRCK"),
+		MTK_FUNCTION(6, "SDA13")
+	),
+	MTK_PIN(
+		24, "GPIO24",
+		MTK_EINT_FUNCTION(0, 24),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO24"),
+		MTK_FUNCTION(1, "SRCLKENAI1"),
+		MTK_FUNCTION(2, "SPI0_C_MI"),
+		MTK_FUNCTION(3, "SPI7_B_MI"),
+		MTK_FUNCTION(4, "I2S6_DI"),
+		MTK_FUNCTION(5, "I2S8_DI"),
+		MTK_FUNCTION(6, "SCL_6306")
+	),
+	MTK_PIN(
+		25, "GPIO25",
+		MTK_EINT_FUNCTION(0, 25),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO25"),
+		MTK_FUNCTION(1, "SRCLKENAI0"),
+		MTK_FUNCTION(2, "SPI0_C_MO"),
+		MTK_FUNCTION(3, "SPI7_B_MO"),
+		MTK_FUNCTION(4, "I2S7_DO"),
+		MTK_FUNCTION(5, "I2S9_DO"),
+		MTK_FUNCTION(6, "SDA_6306")
+	),
+	MTK_PIN(
+		26, "GPIO26",
+		MTK_EINT_FUNCTION(0, 26),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO26"),
+		MTK_FUNCTION(1, "PWM_2"),
+		MTK_FUNCTION(2, "CLKM0"),
+		MTK_FUNCTION(3, "USB_DRVVBUS")
+	),
+	MTK_PIN(
+		27, "GPIO27",
+		MTK_EINT_FUNCTION(0, 27),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO27"),
+		MTK_FUNCTION(1, "PWM_3"),
+		MTK_FUNCTION(2, "CLKM1")
+	),
+	MTK_PIN(
+		28, "GPIO28",
+		MTK_EINT_FUNCTION(0, 28),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO28"),
+		MTK_FUNCTION(1, "PWM_0"),
+		MTK_FUNCTION(2, "CLKM2")
+	),
+	MTK_PIN(
+		29, "GPIO29",
+		MTK_EINT_FUNCTION(0, 29),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO29"),
+		MTK_FUNCTION(1, "PWM_1"),
+		MTK_FUNCTION(2, "CLKM3"),
+		MTK_FUNCTION(3, "DSI1_TE")
+	),
+	MTK_PIN(
+		30, "GPIO30",
+		MTK_EINT_FUNCTION(0, 30),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO30"),
+		MTK_FUNCTION(1, "PWM_2"),
+		MTK_FUNCTION(2, "CLKM0"),
+		MTK_FUNCTION(3, "LCM1_RST")
+	),
+	MTK_PIN(
+		31, "GPIO31",
+		MTK_EINT_FUNCTION(0, 31),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO31"),
+		MTK_FUNCTION(1, "I2S3_MCK"),
+		MTK_FUNCTION(2, "I2S1_MCK"),
+		MTK_FUNCTION(3, "I2S5_MCK"),
+		MTK_FUNCTION(4, "SRCLKENAI0"),
+		MTK_FUNCTION(5, "I2S0_MCK")
+	),
+	MTK_PIN(
+		32, "GPIO32",
+		MTK_EINT_FUNCTION(0, 32),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO32"),
+		MTK_FUNCTION(1, "I2S3_BCK"),
+		MTK_FUNCTION(2, "I2S1_BCK"),
+		MTK_FUNCTION(3, "I2S5_BCK"),
+		MTK_FUNCTION(4, "PCM0_CLK"),
+		MTK_FUNCTION(5, "I2S0_BCK")
+	),
+	MTK_PIN(
+		33, "GPIO33",
+		MTK_EINT_FUNCTION(0, 33),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO33"),
+		MTK_FUNCTION(1, "I2S3_LRCK"),
+		MTK_FUNCTION(2, "I2S1_LRCK"),
+		MTK_FUNCTION(3, "I2S5_LRCK"),
+		MTK_FUNCTION(4, "PCM0_SYNC"),
+		MTK_FUNCTION(5, "I2S0_LRCK")
+	),
+	MTK_PIN(
+		34, "GPIO34",
+		MTK_EINT_FUNCTION(0, 34),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO34"),
+		MTK_FUNCTION(1, "I2S0_DI"),
+		MTK_FUNCTION(2, "I2S2_DI"),
+		MTK_FUNCTION(3, "I2S2_DI2"),
+		MTK_FUNCTION(4, "PCM0_DI"),
+		MTK_FUNCTION(5, "I2S0_DI")
+	),
+	MTK_PIN(
+		35, "GPIO35",
+		MTK_EINT_FUNCTION(0, 35),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO35"),
+		MTK_FUNCTION(1, "I2S3_DO"),
+		MTK_FUNCTION(2, "I2S1_DO"),
+		MTK_FUNCTION(3, "I2S5_DO"),
+		MTK_FUNCTION(4, "PCM0_DO")
+	),
+	MTK_PIN(
+		36, "GPIO36",
+		MTK_EINT_FUNCTION(0, 36),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO36"),
+		MTK_FUNCTION(1, "SPI5_A_CLK"),
+		MTK_FUNCTION(2, "DMIC1_CLK"),
+		MTK_FUNCTION(3, "IDDIG"),
+		MTK_FUNCTION(4, "MD_URXD0"),
+		MTK_FUNCTION(5, "UCTS0"),
+		MTK_FUNCTION(6, "URXD1"),
+		MTK_FUNCTION(7, "DBG_MON_A0")
+	),
+	MTK_PIN(
+		37, "GPIO37",
+		MTK_EINT_FUNCTION(0, 37),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO37"),
+		MTK_FUNCTION(1, "SPI5_A_CSB"),
+		MTK_FUNCTION(2, "DMIC1_DAT"),
+		MTK_FUNCTION(3, "USB_DRVVBUS"),
+		MTK_FUNCTION(4, "MD_UTXD0"),
+		MTK_FUNCTION(5, "URTS0"),
+		MTK_FUNCTION(6, "UTXD1"),
+		MTK_FUNCTION(7, "DBG_MON_A1")
+	),
+	MTK_PIN(
+		38, "GPIO38",
+		MTK_EINT_FUNCTION(0, 38),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO38"),
+		MTK_FUNCTION(1, "SPI5_A_MI"),
+		MTK_FUNCTION(2, "DMIC_CLK"),
+		MTK_FUNCTION(3, "DSI1_TE"),
+		MTK_FUNCTION(4, "MD_URXD1"),
+		MTK_FUNCTION(5, "URXD0"),
+		MTK_FUNCTION(6, "UCTS1"),
+		MTK_FUNCTION(7, "DBG_MON_A2")
+	),
+	MTK_PIN(
+		39, "GPIO39",
+		MTK_EINT_FUNCTION(0, 39),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO39"),
+		MTK_FUNCTION(1, "SPI5_A_MO"),
+		MTK_FUNCTION(2, "DMIC_DAT"),
+		MTK_FUNCTION(3, "LCM1_RST"),
+		MTK_FUNCTION(4, "MD_UTXD1"),
+		MTK_FUNCTION(5, "UTXD0"),
+		MTK_FUNCTION(6, "URTS1"),
+		MTK_FUNCTION(7, "DBG_MON_A3")
+	),
+	MTK_PIN(
+		40, "GPIO40",
+		MTK_EINT_FUNCTION(0, 40),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO40"),
+		MTK_FUNCTION(1, "DISP_PWM"),
+		MTK_FUNCTION(7, "DBG_MON_A6")
+	),
+	MTK_PIN(
+		41, "GPIO41",
+		MTK_EINT_FUNCTION(0, 41),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO41"),
+		MTK_FUNCTION(1, "DSI_TE")
+	),
+	MTK_PIN(
+		42, "GPIO42",
+		MTK_EINT_FUNCTION(0, 42),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO42"),
+		MTK_FUNCTION(1, "LCM_RST")
+	),
+	MTK_PIN(
+		43, "GPIO43",
+		MTK_EINT_FUNCTION(0, 43),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO43"),
+		MTK_FUNCTION(1, "MD_INT1_C2K_UIM0_HOT_PLUG"),
+		MTK_FUNCTION(2, "MD_INT2_C2K_UIM1_HOT_PLUG"),
+		MTK_FUNCTION(3, "SCL_6306"),
+		MTK_FUNCTION(4, "ADSP_URXD0"),
+		MTK_FUNCTION(5, "PTA_RXD"),
+		MTK_FUNCTION(6, "SSPM_URXD_AO"),
+		MTK_FUNCTION(7, "DBG_MON_A4")
+	),
+	MTK_PIN(
+		44, "GPIO44",
+		MTK_EINT_FUNCTION(0, 44),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO44"),
+		MTK_FUNCTION(1, "MD_INT2_C2K_UIM1_HOT_PLUG"),
+		MTK_FUNCTION(2, "MD_INT1_C2K_UIM0_HOT_PLUG"),
+		MTK_FUNCTION(3, "SDA_6306"),
+		MTK_FUNCTION(4, "ADSP_UTXD0"),
+		MTK_FUNCTION(5, "PTA_TXD"),
+		MTK_FUNCTION(6, "SSPM_UTXD_AO"),
+		MTK_FUNCTION(7, "DBG_MON_A5")
+	),
+	MTK_PIN(
+		45, "GPIO45",
+		MTK_EINT_FUNCTION(0, 45),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO45"),
+		MTK_FUNCTION(1, "MD1_SIM2_SCLK"),
+		MTK_FUNCTION(2, "MD1_SIM1_SCLK"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TDI"),
+		MTK_FUNCTION(4, "APU_JTAG_TDI"),
+		MTK_FUNCTION(5, "CCU_JTAG_TDI"),
+		MTK_FUNCTION(6, "LVTS_SCK")
+	),
+	MTK_PIN(
+		46, "GPIO46",
+		MTK_EINT_FUNCTION(0, 46),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO46"),
+		MTK_FUNCTION(1, "MD1_SIM2_SRST"),
+		MTK_FUNCTION(2, "MD1_SIM1_SRST"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TMS"),
+		MTK_FUNCTION(4, "APU_JTAG_TMS"),
+		MTK_FUNCTION(5, "CCU_JTAG_TMS"),
+		MTK_FUNCTION(6, "LVTS_SDI")
+	),
+	MTK_PIN(
+		47, "GPIO47",
+		MTK_EINT_FUNCTION(0, 47),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO47"),
+		MTK_FUNCTION(1, "MD1_SIM2_SIO"),
+		MTK_FUNCTION(2, "MD1_SIM1_SIO"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TDO"),
+		MTK_FUNCTION(4, "APU_JTAG_TDO"),
+		MTK_FUNCTION(5, "CCU_JTAG_TDO"),
+		MTK_FUNCTION(6, "LVTS_SCF")
+	),
+	MTK_PIN(
+		48, "GPIO48",
+		MTK_EINT_FUNCTION(0, 48),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO48"),
+		MTK_FUNCTION(1, "MD1_SIM1_SIO"),
+		MTK_FUNCTION(2, "MD1_SIM2_SIO"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TRSTN"),
+		MTK_FUNCTION(4, "APU_JTAG_TRST"),
+		MTK_FUNCTION(5, "CCU_JTAG_TRST"),
+		MTK_FUNCTION(6, "LVTS_FOUT")
+	),
+	MTK_PIN(
+		49, "GPIO49",
+		MTK_EINT_FUNCTION(0, 49),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO49"),
+		MTK_FUNCTION(1, "MD1_SIM1_SRST"),
+		MTK_FUNCTION(2, "MD1_SIM2_SRST"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TCK"),
+		MTK_FUNCTION(4, "APU_JTAG_TCK"),
+		MTK_FUNCTION(5, "CCU_JTAG_TCK"),
+		MTK_FUNCTION(6, "LVTS_SDO")
+	),
+	MTK_PIN(
+		50, "GPIO50",
+		MTK_EINT_FUNCTION(0, 50),
+		DRV_GRP2,
+		MTK_FUNCTION(0, "GPIO50"),
+		MTK_FUNCTION(1, "MD1_SIM1_SCLK"),
+		MTK_FUNCTION(2, "MD1_SIM2_SCLK"),
+		MTK_FUNCTION(6, "LVTS_26M")
+	),
+	MTK_PIN(
+		51, "GPIO51",
+		MTK_EINT_FUNCTION(0, 51),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO51"),
+		MTK_FUNCTION(1, "MSDC1_CLK"),
+		MTK_FUNCTION(2, "PCM1_CLK"),
+		MTK_FUNCTION(3, "VPU_UDI_TCK"),
+		MTK_FUNCTION(4, "UDI_TCK"),
+		MTK_FUNCTION(5, "IPU_JTAG_TCK"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TCK"),
+		MTK_FUNCTION(7, "JTCK_SEL3")
+	),
+	MTK_PIN(
+		52, "GPIO52",
+		MTK_EINT_FUNCTION(0, 52),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO52"),
+		MTK_FUNCTION(1, "MSDC1_CMD"),
+		MTK_FUNCTION(2, "PCM1_SYNC"),
+		MTK_FUNCTION(3, "VPU_UDI_TMS"),
+		MTK_FUNCTION(4, "UDI_TMS"),
+		MTK_FUNCTION(5, "IPU_JTAG_TMS"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TMS"),
+		MTK_FUNCTION(7, "JTMS_SEL3")
+	),
+	MTK_PIN(
+		53, "GPIO53",
+		MTK_EINT_FUNCTION(0, 53),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO53"),
+		MTK_FUNCTION(1, "MSDC1_DAT3"),
+		MTK_FUNCTION(2, "PCM1_DI")
+	),
+	MTK_PIN(
+		54, "GPIO54",
+		MTK_EINT_FUNCTION(0, 54),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO54"),
+		MTK_FUNCTION(1, "MSDC1_DAT0"),
+		MTK_FUNCTION(2, "PCM1_DO0"),
+		MTK_FUNCTION(3, "VPU_UDI_TDI"),
+		MTK_FUNCTION(4, "UDI_TDI"),
+		MTK_FUNCTION(5, "IPU_JTAG_TDI"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TDI"),
+		MTK_FUNCTION(7, "JTDI_SEL3")
+	),
+	MTK_PIN(
+		55, "GPIO55",
+		MTK_EINT_FUNCTION(0, 55),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO55"),
+		MTK_FUNCTION(1, "MSDC1_DAT2"),
+		MTK_FUNCTION(2, "PCM1_DO2"),
+		MTK_FUNCTION(3, "VPU_UDI_NTRST"),
+		MTK_FUNCTION(4, "UDI_NTRST"),
+		MTK_FUNCTION(5, "IPU_JTAG_TRST"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TRSTN"),
+		MTK_FUNCTION(7, "JTRSTN_SEL3")
+	),
+	MTK_PIN(
+		56, "GPIO56",
+		MTK_EINT_FUNCTION(0, 56),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO56"),
+		MTK_FUNCTION(1, "MSDC1_DAT1"),
+		MTK_FUNCTION(2, "PCM1_DO1"),
+		MTK_FUNCTION(3, "VPU_UDI_TDO"),
+		MTK_FUNCTION(4, "UDI_TDO"),
+		MTK_FUNCTION(5, "IPU_JTAG_TDO"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TDO"),
+		MTK_FUNCTION(7, "JTDO_SEL3")
+	),
+	MTK_PIN(
+		57, "GPIO57",
+		MTK_EINT_FUNCTION(0, 57),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO57"),
+		MTK_FUNCTION(1, "MIPI2_D_SCLK"),
+		MTK_FUNCTION(7, "DBG_MON_A14")
+	),
+	MTK_PIN(
+		58, "GPIO58",
+		MTK_EINT_FUNCTION(0, 58),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO58"),
+		MTK_FUNCTION(1, "MIPI2_D_SDATA"),
+		MTK_FUNCTION(7, "DBG_MON_A15")
+	),
+	MTK_PIN(
+		59, "GPIO59",
+		MTK_EINT_FUNCTION(0, 59),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO59"),
+		MTK_FUNCTION(1, "MIPI_M_SCLK"),
+		MTK_FUNCTION(7, "DBG_MON_A17")
+	),
+	MTK_PIN(
+		60, "GPIO60",
+		MTK_EINT_FUNCTION(0, 60),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO60"),
+		MTK_FUNCTION(1, "MIPI_M_SDATA"),
+		MTK_FUNCTION(7, "DBG_MON_A18")
+	),
+	MTK_PIN(
+		61, "GPIO61",
+		MTK_EINT_FUNCTION(0, 61),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO61"),
+		MTK_FUNCTION(1, "MD_UCNT_A_TGL"),
+		MTK_FUNCTION(7, "DBG_MON_A16")
+	),
+	MTK_PIN(
+		62, "GPIO62",
+		MTK_EINT_FUNCTION(0, 62),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO62"),
+		MTK_FUNCTION(1, "DIGRF_IRQ")
+	),
+	MTK_PIN(
+		63, "GPIO63",
+		MTK_EINT_FUNCTION(0, 63),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO63"),
+		MTK_FUNCTION(1, "BPI_BUS0"),
+		MTK_FUNCTION(7, "DBG_MON_A19")
+	),
+	MTK_PIN(
+		64, "GPIO64",
+		MTK_EINT_FUNCTION(0, 64),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO64"),
+		MTK_FUNCTION(1, "BPI_BUS1"),
+		MTK_FUNCTION(7, "DBG_MON_A20")
+	),
+	MTK_PIN(
+		65, "GPIO65",
+		MTK_EINT_FUNCTION(0, 65),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO65"),
+		MTK_FUNCTION(1, "BPI_BUS2"),
+		MTK_FUNCTION(7, "DBG_MON_A21")
+	),
+	MTK_PIN(
+		66, "GPIO66",
+		MTK_EINT_FUNCTION(0, 66),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO66"),
+		MTK_FUNCTION(1, "BPI_BUS3"),
+		MTK_FUNCTION(7, "DBG_MON_A22")
+	),
+	MTK_PIN(
+		67, "GPIO67",
+		MTK_EINT_FUNCTION(0, 67),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO67"),
+		MTK_FUNCTION(1, "BPI_BUS4")
+	),
+	MTK_PIN(
+		68, "GPIO68",
+		MTK_EINT_FUNCTION(0, 68),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO68"),
+		MTK_FUNCTION(1, "BPI_BUS5")
+	),
+	MTK_PIN(
+		69, "GPIO69",
+		MTK_EINT_FUNCTION(0, 69),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO69"),
+		MTK_FUNCTION(1, "BPI_BUS6"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS6")
+	),
+	MTK_PIN(
+		70, "GPIO70",
+		MTK_EINT_FUNCTION(0, 70),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO70"),
+		MTK_FUNCTION(1, "BPI_BUS7"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS7")
+	),
+	MTK_PIN(
+		71, "GPIO71",
+		MTK_EINT_FUNCTION(0, 71),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO71"),
+		MTK_FUNCTION(1, "BPI_BUS8"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS8")
+	),
+	MTK_PIN(
+		72, "GPIO72",
+		MTK_EINT_FUNCTION(0, 72),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO72"),
+		MTK_FUNCTION(1, "BPI_BUS9"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS9")
+	),
+	MTK_PIN(
+		73, "GPIO73",
+		MTK_EINT_FUNCTION(0, 73),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO73"),
+		MTK_FUNCTION(1, "BPI_BUS10"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS10")
+	),
+	MTK_PIN(
+		74, "GPIO74",
+		MTK_EINT_FUNCTION(0, 74),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO74"),
+		MTK_FUNCTION(1, "BPI_BUS11_OLAT0"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS11_OLAT0")
+	),
+	MTK_PIN(
+		75, "GPIO75",
+		MTK_EINT_FUNCTION(0, 75),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO75"),
+		MTK_FUNCTION(1, "BPI_BUS12_OLAT1"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS12_OLAT1")
+	),
+	MTK_PIN(
+		76, "GPIO76",
+		MTK_EINT_FUNCTION(0, 76),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO76"),
+		MTK_FUNCTION(1, "BPI_BUS13_OLAT2"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS13_OLAT2")
+	),
+	MTK_PIN(
+		77, "GPIO77",
+		MTK_EINT_FUNCTION(0, 77),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO77"),
+		MTK_FUNCTION(1, "BPI_BUS14_OLAT3"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS14_OLAT3")
+	),
+	MTK_PIN(
+		78, "GPIO78",
+		MTK_EINT_FUNCTION(0, 78),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO78"),
+		MTK_FUNCTION(1, "BPI_BUS15_OLAT4"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS15_OLAT4"),
+		MTK_FUNCTION(7, "DBG_MON_A7")
+	),
+	MTK_PIN(
+		79, "GPIO79",
+		MTK_EINT_FUNCTION(0, 79),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO79"),
+		MTK_FUNCTION(1, "BPI_BUS16_OLAT5"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS16_OLAT5"),
+		MTK_FUNCTION(7, "DBG_MON_A8")
+	),
+	MTK_PIN(
+		80, "GPIO80",
+		MTK_EINT_FUNCTION(0, 80),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO80"),
+		MTK_FUNCTION(1, "BPI_BUS17_ANT0"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS17_ANT0"),
+		MTK_FUNCTION(7, "DBG_MON_A9")
+	),
+	MTK_PIN(
+		81, "GPIO81",
+		MTK_EINT_FUNCTION(0, 81),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO81"),
+		MTK_FUNCTION(1, "BPI_BUS18_ANT1"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS18_ANT1"),
+		MTK_FUNCTION(7, "DBG_MON_A10")
+	),
+	MTK_PIN(
+		82, "GPIO82",
+		MTK_EINT_FUNCTION(0, 82),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO82"),
+		MTK_FUNCTION(1, "BPI_BUS19_ANT2"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS19_ANT2"),
+		MTK_FUNCTION(7, "DBG_MON_A11")
+	),
+	MTK_PIN(
+		83, "GPIO83",
+		MTK_EINT_FUNCTION(0, 83),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO83"),
+		MTK_FUNCTION(1, "BPI_BUS20_ANT3"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS20_ANT3"),
+		MTK_FUNCTION(7, "DBG_MON_A12")
+	),
+	MTK_PIN(
+		84, "GPIO84",
+		MTK_EINT_FUNCTION(0, 84),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO84"),
+		MTK_FUNCTION(1, "BPI_BUS21_ANT4"),
+		MTK_FUNCTION(2, "CONN_BPI_BUS21_ANT4"),
+		MTK_FUNCTION(7, "DBG_MON_A13")
+	),
+	MTK_PIN(
+		85, "GPIO85",
+		MTK_EINT_FUNCTION(0, 85),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO85"),
+		MTK_FUNCTION(1, "MIPI1_D_SCLK"),
+		MTK_FUNCTION(2, "CONN_MIPI1_SCLK")
+	),
+	MTK_PIN(
+		86, "GPIO86",
+		MTK_EINT_FUNCTION(0, 86),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO86"),
+		MTK_FUNCTION(1, "MIPI1_D_SDATA"),
+		MTK_FUNCTION(2, "CONN_MIPI1_SDATA")
+	),
+	MTK_PIN(
+		87, "GPIO87",
+		MTK_EINT_FUNCTION(0, 87),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO87"),
+		MTK_FUNCTION(1, "MIPI0_D_SCLK"),
+		MTK_FUNCTION(2, "CONN_MIPI0_SCLK")
+	),
+	MTK_PIN(
+		88, "GPIO88",
+		MTK_EINT_FUNCTION(0, 88),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO88"),
+		MTK_FUNCTION(1, "MIPI0_D_SDATA"),
+		MTK_FUNCTION(2, "CONN_MIPI0_SDATA")
+	),
+	MTK_PIN(
+		89, "GPIO89",
+		MTK_EINT_FUNCTION(0, 89),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO89"),
+		MTK_FUNCTION(1, "SPMI_SCL"),
+		MTK_FUNCTION(2, "SCL10")
+	),
+	MTK_PIN(
+		90, "GPIO90",
+		MTK_EINT_FUNCTION(0, 90),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO90"),
+		MTK_FUNCTION(1, "SPMI_SDA"),
+		MTK_FUNCTION(2, "SDA10")
+	),
+	MTK_PIN(
+		91, "GPIO91",
+		MTK_EINT_FUNCTION(0, 91),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO91"),
+		MTK_FUNCTION(1, "AP_GOOD")
+	),
+	MTK_PIN(
+		92, "GPIO92",
+		MTK_EINT_FUNCTION(0, 92),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO92"),
+		MTK_FUNCTION(1, "URXD0"),
+		MTK_FUNCTION(2, "MD_URXD0"),
+		MTK_FUNCTION(3, "MD_URXD1"),
+		MTK_FUNCTION(4, "SSPM_URXD_AO"),
+		MTK_FUNCTION(5, "CONN_BGF_UART0_RXD")
+	),
+	MTK_PIN(
+		93, "GPIO93",
+		MTK_EINT_FUNCTION(0, 93),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO93"),
+		MTK_FUNCTION(1, "UTXD0"),
+		MTK_FUNCTION(2, "MD_UTXD0"),
+		MTK_FUNCTION(3, "MD_UTXD1"),
+		MTK_FUNCTION(4, "SSPM_UTXD_AO"),
+		MTK_FUNCTION(5, "CONN_BGF_UART0_TXD"),
+		MTK_FUNCTION(6, "WIFI_TXD")
+	),
+	MTK_PIN(
+		94, "GPIO94",
+		MTK_EINT_FUNCTION(0, 94),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO94"),
+		MTK_FUNCTION(1, "URXD1"),
+		MTK_FUNCTION(2, "ADSP_URXD0"),
+		MTK_FUNCTION(3, "MD32_0_RXD"),
+		MTK_FUNCTION(4, "SSPM_URXD_AO"),
+		MTK_FUNCTION(5, "TP_URXD1_AO"),
+		MTK_FUNCTION(6, "TP_URXD2_AO"),
+		MTK_FUNCTION(7, "MBISTREADEN_TRIGGER")
+	),
+	MTK_PIN(
+		95, "GPIO95",
+		MTK_EINT_FUNCTION(0, 95),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO95"),
+		MTK_FUNCTION(1, "UTXD1"),
+		MTK_FUNCTION(2, "ADSP_UTXD0"),
+		MTK_FUNCTION(3, "MD32_0_TXD"),
+		MTK_FUNCTION(4, "SSPM_UTXD_AO"),
+		MTK_FUNCTION(5, "TP_UTXD1_AO"),
+		MTK_FUNCTION(6, "TP_UTXD2_AO"),
+		MTK_FUNCTION(7, "MBISTWRITEEN_TRIGGER")
+	),
+	MTK_PIN(
+		96, "GPIO96",
+		MTK_EINT_FUNCTION(0, 96),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO96"),
+		MTK_FUNCTION(1, "TDM_LRCK"),
+		MTK_FUNCTION(2, "I2S7_LRCK"),
+		MTK_FUNCTION(3, "I2S9_LRCK"),
+		MTK_FUNCTION(4, "SPI4_A_CLK"),
+		MTK_FUNCTION(5, "ADSP_JTAG0_TDI"),
+		MTK_FUNCTION(6, "CONN_BGF_DSP_L1_JDI"),
+		MTK_FUNCTION(7, "IO_JTAG_TDI")
+	),
+	MTK_PIN(
+		97, "GPIO97",
+		MTK_EINT_FUNCTION(0, 97),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO97"),
+		MTK_FUNCTION(1, "TDM_BCK"),
+		MTK_FUNCTION(2, "I2S7_BCK"),
+		MTK_FUNCTION(3, "I2S9_BCK"),
+		MTK_FUNCTION(4, "SPI4_A_CSB"),
+		MTK_FUNCTION(5, "ADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(6, "CONN_BGF_DSP_L1_JINTP"),
+		MTK_FUNCTION(7, "IO_JTAG_TRSTN")
+	),
+	MTK_PIN(
+		98, "GPIO98",
+		MTK_EINT_FUNCTION(0, 98),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO98"),
+		MTK_FUNCTION(1, "TDM_MCK"),
+		MTK_FUNCTION(2, "I2S7_MCK"),
+		MTK_FUNCTION(3, "I2S9_MCK"),
+		MTK_FUNCTION(4, "SPI4_A_MI"),
+		MTK_FUNCTION(5, "ADSP_JTAG0_TCK"),
+		MTK_FUNCTION(6, "CONN_BGF_DSP_L1_JCK"),
+		MTK_FUNCTION(7, "IO_JTAG_TCK")
+	),
+	MTK_PIN(
+		99, "GPIO99",
+		MTK_EINT_FUNCTION(0, 99),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO99"),
+		MTK_FUNCTION(1, "TDM_DATA0"),
+		MTK_FUNCTION(2, "I2S6_DI"),
+		MTK_FUNCTION(3, "I2S8_DI"),
+		MTK_FUNCTION(4, "SPI4_A_MO"),
+		MTK_FUNCTION(5, "ADSP_JTAG0_TDO"),
+		MTK_FUNCTION(6, "CONN_BGF_DSP_L1_JDO"),
+		MTK_FUNCTION(7, "IO_JTAG_TDO")
+	),
+	MTK_PIN(
+		100, "GPIO100",
+		MTK_EINT_FUNCTION(0, 100),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO100"),
+		MTK_FUNCTION(1, "TDM_DATA1"),
+		MTK_FUNCTION(2, "I2S7_DO"),
+		MTK_FUNCTION(3, "I2S9_DO"),
+		MTK_FUNCTION(4, "DP_TX_HPD"),
+		MTK_FUNCTION(5, "ADSP_JTAG0_TMS"),
+		MTK_FUNCTION(6, "CONN_BGF_DSP_L1_JMS"),
+		MTK_FUNCTION(7, "IO_JTAG_TMS")
+	),
+	MTK_PIN(
+		101, "GPIO101",
+		MTK_EINT_FUNCTION(0, 101),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO101"),
+		MTK_FUNCTION(1, "TDM_DATA2"),
+		MTK_FUNCTION(2, "DMIC1_CLK"),
+		MTK_FUNCTION(3, "SRCLKENAI0"),
+		MTK_FUNCTION(4, "SPI5_B_CLK"),
+		MTK_FUNCTION(5, "CLKM0"),
+		MTK_FUNCTION(7, "DAP_MD32_SWD")
+	),
+	MTK_PIN(
+		102, "GPIO102",
+		MTK_EINT_FUNCTION(0, 102),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO102"),
+		MTK_FUNCTION(1, "TDM_DATA3"),
+		MTK_FUNCTION(2, "DMIC1_DAT"),
+		MTK_FUNCTION(3, "SRCLKENAI1"),
+		MTK_FUNCTION(4, "SPI5_B_CSB"),
+		MTK_FUNCTION(5, "DP_TX_HPD"),
+		MTK_FUNCTION(6, "DVFSRC_EXT_REQ"),
+		MTK_FUNCTION(7, "DAP_MD32_SWCK")
+	),
+	MTK_PIN(
+		103, "GPIO103",
+		MTK_EINT_FUNCTION(0, 103),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO103"),
+		MTK_FUNCTION(1, "SPI0_A_MI"),
+		MTK_FUNCTION(2, "SCP_SPI0_MI"),
+		MTK_FUNCTION(5, "DFD_TDO"),
+		MTK_FUNCTION(6, "SPM_JTAG_TDO"),
+		MTK_FUNCTION(7, "JTDO_SEL1")
+	),
+	MTK_PIN(
+		104, "GPIO104",
+		MTK_EINT_FUNCTION(0, 104),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO104"),
+		MTK_FUNCTION(1, "SPI0_A_CSB"),
+		MTK_FUNCTION(2, "SCP_SPI0_CS"),
+		MTK_FUNCTION(5, "DFD_TMS"),
+		MTK_FUNCTION(6, "SPM_JTAG_TMS"),
+		MTK_FUNCTION(7, "JTMS_SEL1")
+	),
+	MTK_PIN(
+		105, "GPIO105",
+		MTK_EINT_FUNCTION(0, 105),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO105"),
+		MTK_FUNCTION(1, "SPI0_A_MO"),
+		MTK_FUNCTION(2, "SCP_SPI0_MO"),
+		MTK_FUNCTION(3, "SCP_SDA0"),
+		MTK_FUNCTION(5, "DFD_TDI"),
+		MTK_FUNCTION(6, "SPM_JTAG_TDI"),
+		MTK_FUNCTION(7, "JTDI_SEL1")
+	),
+	MTK_PIN(
+		106, "GPIO106",
+		MTK_EINT_FUNCTION(0, 106),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO106"),
+		MTK_FUNCTION(1, "SPI0_A_CLK"),
+		MTK_FUNCTION(2, "SCP_SPI0_CK"),
+		MTK_FUNCTION(3, "SCP_SCL0"),
+		MTK_FUNCTION(5, "DFD_TCK_XI"),
+		MTK_FUNCTION(6, "SPM_JTAG_TCK"),
+		MTK_FUNCTION(7, "JTCK_SEL1")
+	),
+	MTK_PIN(
+		107, "GPIO107",
+		MTK_EINT_FUNCTION(0, 107),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO107"),
+		MTK_FUNCTION(1, "DMIC_CLK"),
+		MTK_FUNCTION(2, "PWM_0"),
+		MTK_FUNCTION(3, "CLKM2"),
+		MTK_FUNCTION(4, "SPI5_B_MI"),
+		MTK_FUNCTION(6, "SPM_JTAG_TRSTN"),
+		MTK_FUNCTION(7, "JTRSTN_SEL1")
+	),
+	MTK_PIN(
+		108, "GPIO108",
+		MTK_EINT_FUNCTION(0, 108),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO108"),
+		MTK_FUNCTION(1, "DMIC_DAT"),
+		MTK_FUNCTION(2, "PWM_1"),
+		MTK_FUNCTION(3, "CLKM3"),
+		MTK_FUNCTION(4, "SPI5_B_MO"),
+		MTK_FUNCTION(7, "DAP_SONIC_SWD")
+	),
+	MTK_PIN(
+		109, "GPIO109",
+		MTK_EINT_FUNCTION(0, 109),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO109"),
+		MTK_FUNCTION(1, "I2S1_MCK"),
+		MTK_FUNCTION(2, "I2S3_MCK"),
+		MTK_FUNCTION(3, "I2S2_MCK"),
+		MTK_FUNCTION(4, "DP_TX_HPD"),
+		MTK_FUNCTION(5, "I2S2_MCK"),
+		MTK_FUNCTION(6, "SRCLKENAI0"),
+		MTK_FUNCTION(7, "DAP_SONIC_SWCK")
+	),
+	MTK_PIN(
+		110, "GPIO110",
+		MTK_EINT_FUNCTION(0, 110),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO110"),
+		MTK_FUNCTION(1, "I2S1_BCK"),
+		MTK_FUNCTION(2, "I2S3_BCK"),
+		MTK_FUNCTION(3, "I2S2_BCK"),
+		MTK_FUNCTION(4, "PCM0_CLK"),
+		MTK_FUNCTION(5, "I2S2_BCK"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_TDO")
+	),
+	MTK_PIN(
+		111, "GPIO111",
+		MTK_EINT_FUNCTION(0, 111),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO111"),
+		MTK_FUNCTION(1, "I2S1_LRCK"),
+		MTK_FUNCTION(2, "I2S3_LRCK"),
+		MTK_FUNCTION(3, "I2S2_LRCK"),
+		MTK_FUNCTION(4, "PCM0_SYNC"),
+		MTK_FUNCTION(5, "I2S2_LRCK"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_TDI")
+	),
+	MTK_PIN(
+		112, "GPIO112",
+		MTK_EINT_FUNCTION(0, 112),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO112"),
+		MTK_FUNCTION(1, "I2S2_DI"),
+		MTK_FUNCTION(2, "I2S0_DI"),
+		MTK_FUNCTION(3, "I2S2_DI2"),
+		MTK_FUNCTION(4, "PCM0_DI"),
+		MTK_FUNCTION(5, "I2S2_DI"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_TMS")
+	),
+	MTK_PIN(
+		113, "GPIO113",
+		MTK_EINT_FUNCTION(0, 113),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO113"),
+		MTK_FUNCTION(1, "I2S1_DO"),
+		MTK_FUNCTION(2, "I2S3_DO"),
+		MTK_FUNCTION(3, "I2S5_DO"),
+		MTK_FUNCTION(4, "PCM0_DO"),
+		MTK_FUNCTION(5, "I2S2_DI2"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_TCK")
+	),
+	MTK_PIN(
+		114, "GPIO114",
+		MTK_EINT_FUNCTION(0, 114),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO114"),
+		MTK_FUNCTION(1, "SPI2_MI"),
+		MTK_FUNCTION(2, "SCP_SPI2_MI"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_TRST_B")
+	),
+	MTK_PIN(
+		115, "GPIO115",
+		MTK_EINT_FUNCTION(0, 115),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO115"),
+		MTK_FUNCTION(1, "SPI2_CSB"),
+		MTK_FUNCTION(2, "SCP_SPI2_CS"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_DBGI_N")
+	),
+	MTK_PIN(
+		116, "GPIO116",
+		MTK_EINT_FUNCTION(0, 116),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO116"),
+		MTK_FUNCTION(1, "SPI2_MO"),
+		MTK_FUNCTION(2, "SCP_SPI2_MO"),
+		MTK_FUNCTION(3, "SCP_SDA1"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_DBGACK_N")
+	),
+	MTK_PIN(
+		117, "GPIO117",
+		MTK_EINT_FUNCTION(0, 117),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO117"),
+		MTK_FUNCTION(1, "SPI2_CLK"),
+		MTK_FUNCTION(2, "SCP_SPI2_CK"),
+		MTK_FUNCTION(3, "SCP_SCL1")
+	),
+	MTK_PIN(
+		118, "GPIO118",
+		MTK_EINT_FUNCTION(0, 118),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO118"),
+		MTK_FUNCTION(1, "SCL1"),
+		MTK_FUNCTION(2, "SCP_SCL0"),
+		MTK_FUNCTION(3, "SCP_SCL1")
+	),
+	MTK_PIN(
+		119, "GPIO119",
+		MTK_EINT_FUNCTION(0, 119),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO119"),
+		MTK_FUNCTION(1, "SDA1"),
+		MTK_FUNCTION(2, "SCP_SDA0"),
+		MTK_FUNCTION(3, "SCP_SDA1")
+	),
+	MTK_PIN(
+		120, "GPIO120",
+		MTK_EINT_FUNCTION(0, 120),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO120"),
+		MTK_FUNCTION(1, "SCL9")
+	),
+	MTK_PIN(
+		121, "GPIO121",
+		MTK_EINT_FUNCTION(0, 121),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO121"),
+		MTK_FUNCTION(1, "SDA9")
+	),
+	MTK_PIN(
+		122, "GPIO122",
+		MTK_EINT_FUNCTION(0, 122),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO122"),
+		MTK_FUNCTION(1, "SCL8")
+	),
+	MTK_PIN(
+		123, "GPIO123",
+		MTK_EINT_FUNCTION(0, 123),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO123"),
+		MTK_FUNCTION(1, "SDA8")
+	),
+	MTK_PIN(
+		124, "GPIO124",
+		MTK_EINT_FUNCTION(0, 124),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO124"),
+		MTK_FUNCTION(1, "SCL7"),
+		MTK_FUNCTION(2, "DMIC1_CLK")
+	),
+	MTK_PIN(
+		125, "GPIO125",
+		MTK_EINT_FUNCTION(0, 125),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO125"),
+		MTK_FUNCTION(1, "SDA7"),
+		MTK_FUNCTION(2, "DMIC1_DAT")
+	),
+	MTK_PIN(
+		126, "GPIO126",
+		MTK_EINT_FUNCTION(0, 126),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO126"),
+		MTK_FUNCTION(1, "CMFLASH0"),
+		MTK_FUNCTION(2, "PWM_2"),
+		MTK_FUNCTION(3, "TP_UCTS1_AO"),
+		MTK_FUNCTION(4, "UCTS0"),
+		MTK_FUNCTION(5, "SCL11"),
+		MTK_FUNCTION(6, "MD32_1_GPIO0")
+	),
+	MTK_PIN(
+		127, "GPIO127",
+		MTK_EINT_FUNCTION(0, 127),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO127"),
+		MTK_FUNCTION(1, "CMFLASH1"),
+		MTK_FUNCTION(2, "PWM_3"),
+		MTK_FUNCTION(3, "TP_URTS1_AO"),
+		MTK_FUNCTION(4, "URTS0"),
+		MTK_FUNCTION(5, "SDA11"),
+		MTK_FUNCTION(6, "MD32_1_GPIO1")
+	),
+	MTK_PIN(
+		128, "GPIO128",
+		MTK_EINT_FUNCTION(0, 128),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO128"),
+		MTK_FUNCTION(1, "CMFLASH2"),
+		MTK_FUNCTION(2, "PWM_0"),
+		MTK_FUNCTION(3, "TP_UCTS2_AO"),
+		MTK_FUNCTION(4, "UCTS1"),
+		MTK_FUNCTION(5, "SCL12"),
+		MTK_FUNCTION(6, "MD32_1_GPIO2")
+	),
+	MTK_PIN(
+		129, "GPIO129",
+		MTK_EINT_FUNCTION(0, 129),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO129"),
+		MTK_FUNCTION(1, "CMFLASH3"),
+		MTK_FUNCTION(2, "PWM_1"),
+		MTK_FUNCTION(3, "TP_URTS2_AO"),
+		MTK_FUNCTION(4, "URTS1"),
+		MTK_FUNCTION(5, "SDA12")
+	),
+	MTK_PIN(
+		130, "GPIO130",
+		MTK_EINT_FUNCTION(0, 130),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO130"),
+		MTK_FUNCTION(1, "CMVREF0"),
+		MTK_FUNCTION(2, "ANT_SEL10"),
+		MTK_FUNCTION(3, "SCP_JTAG0_TDO"),
+		MTK_FUNCTION(4, "MD32_0_JTAG_TDO"),
+		MTK_FUNCTION(5, "SCL11"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_TDO"),
+		MTK_FUNCTION(7, "DBG_MON_A23")
+	),
+	MTK_PIN(
+		131, "GPIO131",
+		MTK_EINT_FUNCTION(0, 131),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO131"),
+		MTK_FUNCTION(1, "CMVREF1"),
+		MTK_FUNCTION(2, "ANT_SEL11"),
+		MTK_FUNCTION(3, "SCP_JTAG0_TDI"),
+		MTK_FUNCTION(4, "MD32_0_JTAG_TDI"),
+		MTK_FUNCTION(5, "SDA11"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_TDI"),
+		MTK_FUNCTION(7, "DBG_MON_A26")
+	),
+	MTK_PIN(
+		132, "GPIO132",
+		MTK_EINT_FUNCTION(0, 132),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO132"),
+		MTK_FUNCTION(1, "CMVREF2"),
+		MTK_FUNCTION(2, "ANT_SEL12"),
+		MTK_FUNCTION(3, "SCP_JTAG0_TMS"),
+		MTK_FUNCTION(4, "MD32_0_JTAG_TMS"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_TMS"),
+		MTK_FUNCTION(7, "DBG_MON_A28")
+	),
+	MTK_PIN(
+		133, "GPIO133",
+		MTK_EINT_FUNCTION(0, 133),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO133"),
+		MTK_FUNCTION(1, "CMVREF3"),
+		MTK_FUNCTION(2, "GPS_L1_ELNA_EN"),
+		MTK_FUNCTION(3, "SCP_JTAG0_TCK"),
+		MTK_FUNCTION(4, "MD32_0_JTAG_TCK"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_TCK"),
+		MTK_FUNCTION(7, "DBG_MON_A24")
+	),
+	MTK_PIN(
+		134, "GPIO134",
+		MTK_EINT_FUNCTION(0, 134),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO134"),
+		MTK_FUNCTION(1, "CMVREF4"),
+		MTK_FUNCTION(2, "GPS_L5_ELNA_EN"),
+		MTK_FUNCTION(3, "SCP_JTAG0_TRSTN"),
+		MTK_FUNCTION(4, "MD32_0_JTAG_TRST"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_TRST_B"),
+		MTK_FUNCTION(7, "DBG_MON_A27")
+	),
+	MTK_PIN(
+		135, "GPIO135",
+		MTK_EINT_FUNCTION(0, 135),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO135"),
+		MTK_FUNCTION(1, "PWM_0"),
+		MTK_FUNCTION(2, "SRCLKENAI1"),
+		MTK_FUNCTION(3, "MD_URXD0"),
+		MTK_FUNCTION(4, "MD32_0_RXD"),
+		MTK_FUNCTION(5, "CONN_TCXOENA_REQ"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_DBGI_N"),
+		MTK_FUNCTION(7, "DBG_MON_A29")
+	),
+	MTK_PIN(
+		136, "GPIO136",
+		MTK_EINT_FUNCTION(0, 136),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO136"),
+		MTK_FUNCTION(1, "CMMCLK3"),
+		MTK_FUNCTION(2, "CLKM1"),
+		MTK_FUNCTION(3, "MD_UTXD0"),
+		MTK_FUNCTION(4, "MD32_0_TXD"),
+		MTK_FUNCTION(5, "CONN_BT_TXD"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_DBGACK_N"),
+		MTK_FUNCTION(7, "DBG_MON_A25")
+	),
+	MTK_PIN(
+		137, "GPIO137",
+		MTK_EINT_FUNCTION(0, 137),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO137"),
+		MTK_FUNCTION(1, "CMMCLK4"),
+		MTK_FUNCTION(2, "CLKM2"),
+		MTK_FUNCTION(3, "MD_URXD1"),
+		MTK_FUNCTION(4, "MD32_1_RXD"),
+		MTK_FUNCTION(5, "ILDO_DOUT0"),
+		MTK_FUNCTION(6, "CONN_BGF_UART0_RXD")
+	),
+	MTK_PIN(
+		138, "GPIO138",
+		MTK_EINT_FUNCTION(0, 138),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO138"),
+		MTK_FUNCTION(1, "CMMCLK5"),
+		MTK_FUNCTION(2, "CLKM3"),
+		MTK_FUNCTION(3, "MD_UTXD1"),
+		MTK_FUNCTION(4, "MD32_1_TXD"),
+		MTK_FUNCTION(5, "ILDO_DOUT1"),
+		MTK_FUNCTION(6, "CONN_BGF_UART0_TXD")
+	),
+	MTK_PIN(
+		139, "GPIO139",
+		MTK_EINT_FUNCTION(0, 139),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO139"),
+		MTK_FUNCTION(1, "SCL4")
+	),
+	MTK_PIN(
+		140, "GPIO140",
+		MTK_EINT_FUNCTION(0, 140),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO140"),
+		MTK_FUNCTION(1, "SDA4")
+	),
+	MTK_PIN(
+		141, "GPIO141",
+		MTK_EINT_FUNCTION(0, 141),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO141"),
+		MTK_FUNCTION(1, "SCL2")
+	),
+	MTK_PIN(
+		142, "GPIO142",
+		MTK_EINT_FUNCTION(0, 142),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO142"),
+		MTK_FUNCTION(1, "SDA2")
+	),
+	MTK_PIN(
+		143, "GPIO143",
+		MTK_EINT_FUNCTION(0, 143),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO143"),
+		MTK_FUNCTION(1, "CMVREF0"),
+		MTK_FUNCTION(2, "SPI3_CLK"),
+		MTK_FUNCTION(3, "ADSP_JTAG1_TDO"),
+		MTK_FUNCTION(4, "SCP_JTAG1_TDO"),
+		MTK_FUNCTION(5, "MD32_1_JTAG_TDO"),
+		MTK_FUNCTION(6, "CONN_BGF_DSP_L5_JDO")
+	),
+	MTK_PIN(
+		144, "GPIO144",
+		MTK_EINT_FUNCTION(0, 144),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO144"),
+		MTK_FUNCTION(1, "CMVREF1"),
+		MTK_FUNCTION(2, "SPI3_CSB"),
+		MTK_FUNCTION(3, "ADSP_JTAG1_TDI"),
+		MTK_FUNCTION(4, "SCP_JTAG1_TDI"),
+		MTK_FUNCTION(5, "MD32_1_JTAG_TDI"),
+		MTK_FUNCTION(6, "CONN_BGF_DSP_L5_JDI")
+	),
+	MTK_PIN(
+		145, "GPIO145",
+		MTK_EINT_FUNCTION(0, 145),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO145"),
+		MTK_FUNCTION(1, "CMVREF2"),
+		MTK_FUNCTION(2, "SPI3_MI"),
+		MTK_FUNCTION(3, "ADSP_JTAG1_TMS"),
+		MTK_FUNCTION(4, "SCP_JTAG1_TMS"),
+		MTK_FUNCTION(5, "MD32_1_JTAG_TMS"),
+		MTK_FUNCTION(6, "CONN_BGF_DSP_L5_JMS")
+	),
+	MTK_PIN(
+		146, "GPIO146",
+		MTK_EINT_FUNCTION(0, 146),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO146"),
+		MTK_FUNCTION(1, "CMVREF3"),
+		MTK_FUNCTION(2, "SPI3_MO"),
+		MTK_FUNCTION(3, "ADSP_JTAG1_TCK"),
+		MTK_FUNCTION(4, "SCP_JTAG1_TCK"),
+		MTK_FUNCTION(5, "MD32_1_JTAG_TCK"),
+		MTK_FUNCTION(6, "CONN_BGF_DSP_L5_JCK")
+	),
+	MTK_PIN(
+		147, "GPIO147",
+		MTK_EINT_FUNCTION(0, 147),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO147"),
+		MTK_FUNCTION(1, "CMVREF4"),
+		MTK_FUNCTION(2, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(3, "ADSP_JTAG1_TRSTN"),
+		MTK_FUNCTION(4, "SCP_JTAG1_TRSTN"),
+		MTK_FUNCTION(5, "MD32_1_JTAG_TRST"),
+		MTK_FUNCTION(6, "CONN_BGF_DSP_L5_JINTP")
+	),
+	MTK_PIN(
+		148, "GPIO148",
+		MTK_EINT_FUNCTION(0, 148),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO148"),
+		MTK_FUNCTION(1, "PWM_1"),
+		MTK_FUNCTION(2, "AGPS_SYNC"),
+		MTK_FUNCTION(3, "CMMCLK5"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_AICE_TMSC")
+	),
+	MTK_PIN(
+		149, "GPIO149",
+		MTK_EINT_FUNCTION(0, 149),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO149"),
+		MTK_FUNCTION(1, "CMMCLK0"),
+		MTK_FUNCTION(2, "CLKM0"),
+		MTK_FUNCTION(3, "MD32_0_GPIO0"),
+		MTK_FUNCTION(6, "CONN_WF_MCU_AICE_TCKC")
+	),
+	MTK_PIN(
+		150, "GPIO150",
+		MTK_EINT_FUNCTION(0, 150),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO150"),
+		MTK_FUNCTION(1, "CMMCLK1"),
+		MTK_FUNCTION(2, "CLKM1"),
+		MTK_FUNCTION(3, "MD32_0_GPIO1"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_AICE_TMSC")
+	),
+	MTK_PIN(
+		151, "GPIO151",
+		MTK_EINT_FUNCTION(0, 151),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO151"),
+		MTK_FUNCTION(1, "CMMCLK2"),
+		MTK_FUNCTION(2, "CLKM2"),
+		MTK_FUNCTION(3, "MD32_0_GPIO2"),
+		MTK_FUNCTION(6, "CONN_BGF_MCU_AICE_TCKC")
+	),
+	MTK_PIN(
+		152, "GPIO152",
+		MTK_EINT_FUNCTION(0, 152),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO152"),
+		MTK_FUNCTION(1, "KPROW1"),
+		MTK_FUNCTION(2, "PWM_2"),
+		MTK_FUNCTION(3, "IDDIG"),
+		MTK_FUNCTION(4, "DP_TX_HPD"),
+		MTK_FUNCTION(5, "DSI1_TE"),
+		MTK_FUNCTION(6, "MBISTREADEN_TRIGGER"),
+		MTK_FUNCTION(7, "DBG_MON_B2")
+	),
+	MTK_PIN(
+		153, "GPIO153",
+		MTK_EINT_FUNCTION(0, 153),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO153"),
+		MTK_FUNCTION(1, "KPROW0"),
+		MTK_FUNCTION(7, "DBG_MON_B1")
+	),
+	MTK_PIN(
+		154, "GPIO154",
+		MTK_EINT_FUNCTION(0, 154),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO154"),
+		MTK_FUNCTION(1, "KPCOL0"),
+		MTK_FUNCTION(7, "DBG_MON_A32")
+	),
+	MTK_PIN(
+		155, "GPIO155",
+		MTK_EINT_FUNCTION(0, 155),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO155"),
+		MTK_FUNCTION(1, "KPCOL1"),
+		MTK_FUNCTION(2, "PWM_3"),
+		MTK_FUNCTION(3, "USB_DRVVBUS"),
+		MTK_FUNCTION(4, "CONN_TCXOENA_REQ"),
+		MTK_FUNCTION(5, "LCM1_RST"),
+		MTK_FUNCTION(6, "MBISTWRITEEN_TRIGGER"),
+		MTK_FUNCTION(7, "DBG_MON_B0")
+	),
+	MTK_PIN(
+		156, "GPIO156",
+		MTK_EINT_FUNCTION(0, 156),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO156"),
+		MTK_FUNCTION(1, "SPI1_A_CLK"),
+		MTK_FUNCTION(2, "SCP_SPI1_A_CK"),
+		MTK_FUNCTION(3, "MRG_CLK"),
+		MTK_FUNCTION(4, "AGPS_SYNC"),
+		MTK_FUNCTION(5, "SCL12"),
+		MTK_FUNCTION(7, "DBG_MON_B3")
+	),
+	MTK_PIN(
+		157, "GPIO157",
+		MTK_EINT_FUNCTION(0, 157),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO157"),
+		MTK_FUNCTION(1, "SPI1_A_CSB"),
+		MTK_FUNCTION(2, "SCP_SPI1_A_CS"),
+		MTK_FUNCTION(3, "MRG_SYNC"),
+		MTK_FUNCTION(4, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(5, "SDA12"),
+		MTK_FUNCTION(7, "DBG_MON_B4")
+	),
+	MTK_PIN(
+		158, "GPIO158",
+		MTK_EINT_FUNCTION(0, 158),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO158"),
+		MTK_FUNCTION(1, "SPI1_A_MI"),
+		MTK_FUNCTION(2, "SCP_SPI1_A_MI"),
+		MTK_FUNCTION(3, "MRG_DI"),
+		MTK_FUNCTION(4, "PTA_RXD"),
+		MTK_FUNCTION(5, "SCL13"),
+		MTK_FUNCTION(7, "DBG_MON_B5")
+	),
+	MTK_PIN(
+		159, "GPIO159",
+		MTK_EINT_FUNCTION(0, 159),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO159"),
+		MTK_FUNCTION(1, "SPI1_A_MO"),
+		MTK_FUNCTION(2, "SCP_SPI1_A_MO"),
+		MTK_FUNCTION(3, "MRG_DO"),
+		MTK_FUNCTION(4, "PTA_TXD"),
+		MTK_FUNCTION(5, "SDA13"),
+		MTK_FUNCTION(7, "DBG_MON_B6")
+	),
+	MTK_PIN(
+		160, "GPIO160",
+		MTK_EINT_FUNCTION(0, 160),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO160"),
+		MTK_FUNCTION(1, "SCL3"),
+		MTK_FUNCTION(2, "SCP_SCL0"),
+		MTK_FUNCTION(3, "SCP_SCL1")
+	),
+	MTK_PIN(
+		161, "GPIO161",
+		MTK_EINT_FUNCTION(0, 161),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO161"),
+		MTK_FUNCTION(1, "SDA3"),
+		MTK_FUNCTION(2, "SCP_SDA0"),
+		MTK_FUNCTION(3, "SCP_SDA1")
+	),
+	MTK_PIN(
+		162, "GPIO162",
+		MTK_EINT_FUNCTION(0, 162),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO162"),
+		MTK_FUNCTION(1, "ANT_SEL0"),
+		MTK_FUNCTION(2, "GPS_L1_ELNA_EN"),
+		MTK_FUNCTION(7, "DBG_MON_B7")
+	),
+	MTK_PIN(
+		163, "GPIO163",
+		MTK_EINT_FUNCTION(0, 163),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO163"),
+		MTK_FUNCTION(1, "ANT_SEL1"),
+		MTK_FUNCTION(2, "GPS_L5_ELNA_EN"),
+		MTK_FUNCTION(7, "DBG_MON_B8")
+	),
+	MTK_PIN(
+		164, "GPIO164",
+		MTK_EINT_FUNCTION(0, 164),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO164"),
+		MTK_FUNCTION(1, "ANT_SEL2"),
+		MTK_FUNCTION(2, "SCP_SPI1_B_CK"),
+		MTK_FUNCTION(3, "TP_URXD1_AO"),
+		MTK_FUNCTION(5, "UCTS0"),
+		MTK_FUNCTION(7, "DBG_MON_B9")
+	),
+	MTK_PIN(
+		165, "GPIO165",
+		MTK_EINT_FUNCTION(0, 165),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO165"),
+		MTK_FUNCTION(1, "ANT_SEL3"),
+		MTK_FUNCTION(2, "SCP_SPI1_B_CS"),
+		MTK_FUNCTION(3, "TP_UTXD1_AO"),
+		MTK_FUNCTION(4, "CONN_TCXOENA_REQ"),
+		MTK_FUNCTION(5, "URTS0"),
+		MTK_FUNCTION(7, "DBG_MON_B10")
+	),
+	MTK_PIN(
+		166, "GPIO166",
+		MTK_EINT_FUNCTION(0, 166),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO166"),
+		MTK_FUNCTION(1, "ANT_SEL4"),
+		MTK_FUNCTION(2, "SCP_SPI1_B_MI"),
+		MTK_FUNCTION(3, "TP_URXD2_AO"),
+		MTK_FUNCTION(4, "SRCLKENAI1"),
+		MTK_FUNCTION(5, "UCTS1"),
+		MTK_FUNCTION(7, "DBG_MON_B11")
+	),
+	MTK_PIN(
+		167, "GPIO167",
+		MTK_EINT_FUNCTION(0, 167),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO167"),
+		MTK_FUNCTION(1, "ANT_SEL5"),
+		MTK_FUNCTION(2, "SCP_SPI1_B_MO"),
+		MTK_FUNCTION(3, "TP_UTXD2_AO"),
+		MTK_FUNCTION(4, "SRCLKENAI0"),
+		MTK_FUNCTION(5, "URTS1"),
+		MTK_FUNCTION(7, "DBG_MON_B12")
+	),
+	MTK_PIN(
+		168, "GPIO168",
+		MTK_EINT_FUNCTION(0, 168),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO168"),
+		MTK_FUNCTION(1, "ANT_SEL6"),
+		MTK_FUNCTION(2, "SPI0_B_CLK"),
+		MTK_FUNCTION(3, "TP_UCTS1_AO"),
+		MTK_FUNCTION(4, "KPCOL2"),
+		MTK_FUNCTION(5, "MD_UCTS0"),
+		MTK_FUNCTION(6, "SCL12"),
+		MTK_FUNCTION(7, "DBG_MON_B13")
+	),
+	MTK_PIN(
+		169, "GPIO169",
+		MTK_EINT_FUNCTION(0, 169),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO169"),
+		MTK_FUNCTION(1, "ANT_SEL7"),
+		MTK_FUNCTION(2, "SPI0_B_CSB"),
+		MTK_FUNCTION(3, "TP_URTS1_AO"),
+		MTK_FUNCTION(4, "KPROW2"),
+		MTK_FUNCTION(5, "MD_URTS0"),
+		MTK_FUNCTION(6, "SDA12"),
+		MTK_FUNCTION(7, "DBG_MON_B14")
+	),
+	MTK_PIN(
+		170, "GPIO170",
+		MTK_EINT_FUNCTION(0, 170),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO170"),
+		MTK_FUNCTION(1, "ANT_SEL8"),
+		MTK_FUNCTION(2, "SPI0_B_MI"),
+		MTK_FUNCTION(3, "TP_UCTS2_AO"),
+		MTK_FUNCTION(4, "SRCLKENAI1"),
+		MTK_FUNCTION(5, "MD_UCTS1"),
+		MTK_FUNCTION(6, "SCL13")
+	),
+	MTK_PIN(
+		171, "GPIO171",
+		MTK_EINT_FUNCTION(0, 171),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO171"),
+		MTK_FUNCTION(1, "ANT_SEL9"),
+		MTK_FUNCTION(2, "SPI0_B_MO"),
+		MTK_FUNCTION(3, "TP_URTS2_AO"),
+		MTK_FUNCTION(4, "SRCLKENAI0"),
+		MTK_FUNCTION(5, "MD_URTS1"),
+		MTK_FUNCTION(6, "SDA13")
+	),
+	MTK_PIN(
+		172, "GPIO172",
+		MTK_EINT_FUNCTION(0, 172),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO172"),
+		MTK_FUNCTION(1, "CONN_TOP_CLK"),
+		MTK_FUNCTION(2, "AUXIF_CLK0"),
+		MTK_FUNCTION(7, "DBG_MON_B18")
+	),
+	MTK_PIN(
+		173, "GPIO173",
+		MTK_EINT_FUNCTION(0, 173),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO173"),
+		MTK_FUNCTION(1, "CONN_TOP_DATA"),
+		MTK_FUNCTION(2, "AUXIF_ST0"),
+		MTK_FUNCTION(7, "DBG_MON_B19")
+	),
+	MTK_PIN(
+		174, "GPIO174",
+		MTK_EINT_FUNCTION(0, 174),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO174"),
+		MTK_FUNCTION(1, "CONN_HRST_B"),
+		MTK_FUNCTION(7, "DBG_MON_B17")
+	),
+	MTK_PIN(
+		175, "GPIO175",
+		MTK_EINT_FUNCTION(0, 175),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO175"),
+		MTK_FUNCTION(1, "CONN_WB_PTA"),
+		MTK_FUNCTION(7, "DBG_MON_B20")
+	),
+	MTK_PIN(
+		176, "GPIO176",
+		MTK_EINT_FUNCTION(0, 176),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO176"),
+		MTK_FUNCTION(1, "CONN_BT_CLK"),
+		MTK_FUNCTION(2, "AUXIF_CLK1"),
+		MTK_FUNCTION(7, "DBG_MON_B15")
+	),
+	MTK_PIN(
+		177, "GPIO177",
+		MTK_EINT_FUNCTION(0, 177),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO177"),
+		MTK_FUNCTION(1, "CONN_BT_DATA"),
+		MTK_FUNCTION(2, "AUXIF_ST1"),
+		MTK_FUNCTION(7, "DBG_MON_B16")
+	),
+	MTK_PIN(
+		178, "GPIO178",
+		MTK_EINT_FUNCTION(0, 178),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO178"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL0"),
+		MTK_FUNCTION(7, "DBG_MON_B21")
+	),
+	MTK_PIN(
+		179, "GPIO179",
+		MTK_EINT_FUNCTION(0, 179),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO179"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL1"),
+		MTK_FUNCTION(2, "UFS_MPHY_SCL"),
+		MTK_FUNCTION(7, "DBG_MON_B22")
+	),
+	MTK_PIN(
+		180, "GPIO180",
+		MTK_EINT_FUNCTION(0, 180),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO180"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL2"),
+		MTK_FUNCTION(2, "UFS_MPHY_SDA"),
+		MTK_FUNCTION(7, "DBG_MON_B23")
+	),
+	MTK_PIN(
+		181, "GPIO181",
+		MTK_EINT_FUNCTION(0, 181),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO181"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL3"),
+		MTK_FUNCTION(2, "UFS_UNIPRO_SDA")
+	),
+	MTK_PIN(
+		182, "GPIO182",
+		MTK_EINT_FUNCTION(0, 182),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO182"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL4"),
+		MTK_FUNCTION(2, "UFS_UNIPRO_SCL")
+	),
+	MTK_PIN(
+		183, "GPIO183",
+		MTK_EINT_FUNCTION(0, 183),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO183"),
+		MTK_FUNCTION(1, "MSDC0_CMD")
+	),
+	MTK_PIN(
+		184, "GPIO184",
+		MTK_EINT_FUNCTION(0, 184),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO184"),
+		MTK_FUNCTION(1, "MSDC0_DAT0")
+	),
+	MTK_PIN(
+		185, "GPIO185",
+		MTK_EINT_FUNCTION(0, 185),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO185"),
+		MTK_FUNCTION(1, "MSDC0_DAT2")
+	),
+	MTK_PIN(
+		186, "GPIO186",
+		MTK_EINT_FUNCTION(0, 186),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO186"),
+		MTK_FUNCTION(1, "MSDC0_DAT4")
+	),
+	MTK_PIN(
+		187, "GPIO187",
+		MTK_EINT_FUNCTION(0, 187),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO187"),
+		MTK_FUNCTION(1, "MSDC0_DAT6")
+	),
+	MTK_PIN(
+		188, "GPIO188",
+		MTK_EINT_FUNCTION(0, 188),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO188"),
+		MTK_FUNCTION(1, "MSDC0_DAT1")
+	),
+	MTK_PIN(
+		189, "GPIO189",
+		MTK_EINT_FUNCTION(0, 189),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO189"),
+		MTK_FUNCTION(1, "MSDC0_DAT5")
+	),
+	MTK_PIN(
+		190, "GPIO190",
+		MTK_EINT_FUNCTION(0, 190),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO190"),
+		MTK_FUNCTION(1, "MSDC0_DAT7")
+	),
+	MTK_PIN(
+		191, "GPIO191",
+		MTK_EINT_FUNCTION(0, 191),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO191"),
+		MTK_FUNCTION(1, "MSDC0_DSL"),
+		MTK_FUNCTION(2, "GPS_L1_ELNA_EN"),
+		MTK_FUNCTION(3, "IDDIG"),
+		MTK_FUNCTION(4, "DMIC_CLK"),
+		MTK_FUNCTION(5, "DSI1_TE")
+	),
+	MTK_PIN(
+		192, "GPIO192",
+		MTK_EINT_FUNCTION(0, 192),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO192"),
+		MTK_FUNCTION(1, "MSDC0_CLK"),
+		MTK_FUNCTION(2, "GPS_L5_ELNA_EN"),
+		MTK_FUNCTION(3, "USB_DRVVBUS"),
+		MTK_FUNCTION(4, "DMIC_DAT"),
+		MTK_FUNCTION(5, "LCM1_RST")
+	),
+	MTK_PIN(
+		193, "GPIO193",
+		MTK_EINT_FUNCTION(0, 193),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO193"),
+		MTK_FUNCTION(1, "MSDC0_DAT3")
+	),
+	MTK_PIN(
+		194, "GPIO194",
+		MTK_EINT_FUNCTION(0, 194),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO194"),
+		MTK_FUNCTION(1, "MSDC0_RSTB")
+	),
+	MTK_PIN(
+		195, "GPIO195",
+		MTK_EINT_FUNCTION(0, 195),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO195"),
+		MTK_FUNCTION(1, "SCP_VREQ_VAO"),
+		MTK_FUNCTION(2, "DVFSRC_EXT_REQ")
+	),
+	MTK_PIN(
+		196, "GPIO196",
+		MTK_EINT_FUNCTION(0, 196),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO196"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI2"),
+		MTK_FUNCTION(7, "DBG_MON_B27")
+	),
+	MTK_PIN(
+		197, "GPIO197",
+		MTK_EINT_FUNCTION(0, 197),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO197"),
+		MTK_FUNCTION(1, "AUD_NLE_MOSI1"),
+		MTK_FUNCTION(2, "AUD_CLK_MISO"),
+		MTK_FUNCTION(3, "I2S2_MCK"),
+		MTK_FUNCTION(4, "I2S6_MCK"),
+		MTK_FUNCTION(5, "I2S8_MCK"),
+		MTK_FUNCTION(6, "UFS_UNIPRO_SDA"),
+		MTK_FUNCTION(7, "DBG_MON_B28")
+	),
+	MTK_PIN(
+		198, "GPIO198",
+		MTK_EINT_FUNCTION(0, 198),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO198"),
+		MTK_FUNCTION(1, "AUD_NLE_MOSI0"),
+		MTK_FUNCTION(2, "AUD_SYNC_MISO"),
+		MTK_FUNCTION(3, "I2S2_BCK"),
+		MTK_FUNCTION(4, "I2S6_BCK"),
+		MTK_FUNCTION(5, "I2S8_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_B29")
+	),
+	MTK_PIN(
+		199, "GPIO199",
+		MTK_EINT_FUNCTION(0, 199),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO199"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO2"),
+		MTK_FUNCTION(3, "I2S2_DI2"),
+		MTK_FUNCTION(7, "DBG_MON_B32")
+	),
+	MTK_PIN(
+		200, "GPIO200",
+		MTK_EINT_FUNCTION(0, 200),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO200"),
+		MTK_FUNCTION(1, "SCL6"),
+		MTK_FUNCTION(2, "SCP_SCL0"),
+		MTK_FUNCTION(3, "SCP_SCL1"),
+		MTK_FUNCTION(4, "SCL_6306")
+	),
+	MTK_PIN(
+		201, "GPIO201",
+		MTK_EINT_FUNCTION(0, 201),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO201"),
+		MTK_FUNCTION(1, "SDA6"),
+		MTK_FUNCTION(2, "SCP_SDA0"),
+		MTK_FUNCTION(3, "SCP_SDA1"),
+		MTK_FUNCTION(4, "SDA_6306")
+	),
+	MTK_PIN(
+		202, "GPIO202",
+		MTK_EINT_FUNCTION(0, 202),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO202"),
+		MTK_FUNCTION(1, "SCL5")
+	),
+	MTK_PIN(
+		203, "GPIO203",
+		MTK_EINT_FUNCTION(0, 203),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO203"),
+		MTK_FUNCTION(1, "SDA5")
+	),
+	MTK_PIN(
+		204, "GPIO204",
+		MTK_EINT_FUNCTION(0, 204),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO204"),
+		MTK_FUNCTION(1, "SCL0"),
+		MTK_FUNCTION(2, "SPI4_C_CLK"),
+		MTK_FUNCTION(3, "SPI7_B_CLK")
+	),
+	MTK_PIN(
+		205, "GPIO205",
+		MTK_EINT_FUNCTION(0, 205),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO205"),
+		MTK_FUNCTION(1, "SDA0"),
+		MTK_FUNCTION(2, "SPI4_C_CSB"),
+		MTK_FUNCTION(3, "SPI7_B_CSB")
+	),
+	MTK_PIN(
+		206, "GPIO206",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO206"),
+		MTK_FUNCTION(1, "SRCLKENA0")
+	),
+	MTK_PIN(
+		207, "GPIO207",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO207"),
+		MTK_FUNCTION(1, "SRCLKENA1")
+	),
+	MTK_PIN(
+		208, "GPIO208",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO208"),
+		MTK_FUNCTION(1, "WATCHDOG")
+	),
+	MTK_PIN(
+		209, "GPIO209",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO209"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_MI"),
+		MTK_FUNCTION(2, "PWRAP_SPI0_MO")
+	),
+	MTK_PIN(
+		210, "GPIO210",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO210"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_CSN")
+	),
+	MTK_PIN(
+		211, "GPIO211",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO211"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_MO"),
+		MTK_FUNCTION(2, "PWRAP_SPI0_MI")
+	),
+	MTK_PIN(
+		212, "GPIO212",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO212"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_CK")
+	),
+	MTK_PIN(
+		213, "GPIO213",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO213"),
+		MTK_FUNCTION(1, "RTC32K_CK")
+	),
+	MTK_PIN(
+		214, "GPIO214",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO214"),
+		MTK_FUNCTION(1, "AUD_CLK_MOSI"),
+		MTK_FUNCTION(3, "I2S1_MCK"),
+		MTK_FUNCTION(4, "I2S7_MCK"),
+		MTK_FUNCTION(5, "I2S9_MCK"),
+		MTK_FUNCTION(6, "UFS_UNIPRO_SCL")
+	),
+	MTK_PIN(
+		215, "GPIO215",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO215"),
+		MTK_FUNCTION(1, "AUD_SYNC_MOSI"),
+		MTK_FUNCTION(3, "I2S1_BCK"),
+		MTK_FUNCTION(4, "I2S7_BCK"),
+		MTK_FUNCTION(5, "I2S9_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_B24")
+	),
+	MTK_PIN(
+		216, "GPIO216",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO216"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI0"),
+		MTK_FUNCTION(3, "I2S1_LRCK"),
+		MTK_FUNCTION(4, "I2S7_LRCK"),
+		MTK_FUNCTION(5, "I2S9_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_B25")
+	),
+	MTK_PIN(
+		217, "GPIO217",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO217"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI1"),
+		MTK_FUNCTION(3, "I2S1_DO"),
+		MTK_FUNCTION(4, "I2S7_DO"),
+		MTK_FUNCTION(5, "I2S9_DO"),
+		MTK_FUNCTION(6, "UFS_MPHY_SDA"),
+		MTK_FUNCTION(7, "DBG_MON_B26")
+	),
+	MTK_PIN(
+		218, "GPIO218",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO218"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO0"),
+		MTK_FUNCTION(2, "VOW_DAT_MISO"),
+		MTK_FUNCTION(3, "I2S2_LRCK"),
+		MTK_FUNCTION(4, "I2S6_LRCK"),
+		MTK_FUNCTION(5, "I2S8_LRCK"),
+		MTK_FUNCTION(7, "DBG_MON_B30")
+	),
+	MTK_PIN(
+		219, "GPIO219",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO219"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO1"),
+		MTK_FUNCTION(2, "VOW_CLK_MISO"),
+		MTK_FUNCTION(3, "I2S2_DI"),
+		MTK_FUNCTION(4, "I2S6_DI"),
+		MTK_FUNCTION(5, "I2S8_DI"),
+		MTK_FUNCTION(6, "UFS_MPHY_SCL"),
+		MTK_FUNCTION(7, "DBG_MON_B31")
+	),
+	MTK_PIN(
+		220, "GPIO220",
+		MTK_EINT_FUNCTION(0, 216),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		221, "GPIO221",
+		MTK_EINT_FUNCTION(0, 217),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		222, "GPIO222",
+		MTK_EINT_FUNCTION(0, 218),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		223, "GPIO223",
+		MTK_EINT_FUNCTION(0, 219),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		224, "GPIO224",
+		MTK_EINT_FUNCTION(0, 220),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		225, "GPIO225",
+		MTK_EINT_FUNCTION(0, 222),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		226, "GPIO226",
+		MTK_EINT_FUNCTION(0, 223),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+};
+
+#endif /* __PINCTRL_MTK_MT6893_H */
-- 
2.49.0


