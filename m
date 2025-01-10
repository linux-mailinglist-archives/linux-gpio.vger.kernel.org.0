Return-Path: <linux-gpio+bounces-14630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFA3A08E66
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 11:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1537188BAFF
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 10:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73CD206F06;
	Fri, 10 Jan 2025 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FqGF+CcA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B40714D6F9;
	Fri, 10 Jan 2025 10:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506060; cv=none; b=VXLtmKnoom6pGQFlDUL1/9vGzpsFtqd+mhKVVJy/LpLmVJhIRS2dP+amoDDvFV2ESg27Xk2Ztcbc16MTcLBYM7N7np6HfgPhXxqaq0Z5dGPr4WWHwgMXMjtQrEq8wWQ8MhXC7HZVSH6XH3mpaeAOt3sQWfnP9MisKoFwVcbM9+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506060; c=relaxed/simple;
	bh=IWMvpybdsTxMf+2kpcUlX/+E8fZpR8zPflYEyG9VQzA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YtJLWJ6wQF6S0qTlXdjpKBKR72rcQtgpckh3QzQNrm0uF+JCdwalDcwRCeDCdUUZek9mkvR3UWyQ9PrdiQD2seRoZOcXoHIGvZU0HK4rR6gJPNoeEykxAVcsFGaFLxZPiJEdHjiG6+Wvnp5GnWSPOYrzXBA/VmsrFNR2ml/HtIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=FqGF+CcA; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 484f42d4cf4011ef99858b75a2457dd9-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+hTclkOO+Ha4sTy0nFRBpwwWTuCBCImgtFlhvtgHRqg=;
	b=FqGF+CcAYps7qnPfWc1OSBHBokqWaovme7wW8TfSD9FDDxV89qpePin38Z0ufrvAiP0zjLjfiTXsIvRfeUOD3OIJmDcYZRUzDyPr6DMpvOFy4CHhkIXtzarPGw8S4xDwLRHPDi37OxzXceJs0jcKulS+A4VI0aUEWP95lVKEAPk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:5ae6ab8a-2045-4eb6-ad89-26a95dd9383f,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:817f4d13-8831-4185-8e40-f83b1917e828,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,OSH
X-CID-BAS: 2,OSH,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 484f42d4cf4011ef99858b75a2457dd9-20250110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1262610902; Fri, 10 Jan 2025 18:47:26 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 18:47:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 18:47:24 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>,
	Lei Xue <lei.xue@mediatek.com>, <wenbin.mei@mediatek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Guodong Liu <guodong.liu@mediatek.com>,
	Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH v2 2/2] pinctrl: mediatek: add mt8196 driver
Date: Fri, 10 Jan 2025 18:42:29 +0800
Message-ID: <20250110104703.13625-3-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250110104703.13625-1-ot_cathy.xu@mediatek.com>
References: <20250110104703.13625-1-ot_cathy.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Guodong Liu <guodong.liu@mediatek.com>

Add pinctrl driver support for MediaTek Soc mt8196.

Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     | 1764 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 2789 +++++++++++++++++
 4 files changed, 4566 insertions(+)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index a417a031659c..149a78e4216e 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -256,6 +256,18 @@ config PINCTRL_MT8195
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
+config PINCTRL_MT8196
+	bool "MediaTek MT8196 pin control"
+	depends on OF
+	depends on ARM64 || COMPILE_TEST
+	default ARM64 && ARCH_MEDIATEK
+	select PINCTRL_MTK_PARIS
+	help
+	  Say yes here to support pin controller and gpio driver
+	  on MediaTek MT8196 SoC.
+	  In MTK platform, we support virtual gpio and use it to
+	  map specific eint which doesn't have real gpio pin.
+
 config PINCTRL_MT8365
 	bool "MediaTek MT8365 pin control"
 	depends on OF
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index 1405d434218e..b4a39c1bafb7 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_PINCTRL_MT8186)		+= pinctrl-mt8186.o
 obj-$(CONFIG_PINCTRL_MT8188)		+= pinctrl-mt8188.o
 obj-$(CONFIG_PINCTRL_MT8192)		+= pinctrl-mt8192.o
 obj-$(CONFIG_PINCTRL_MT8195)		+= pinctrl-mt8195.o
+obj-$(CONFIG_PINCTRL_MT8196)		+= pinctrl-mt8196.o
 obj-$(CONFIG_PINCTRL_MT8365)		+= pinctrl-mt8365.o
 obj-$(CONFIG_PINCTRL_MT8516)		+= pinctrl-mt8516.o
 obj-$(CONFIG_PINCTRL_MT6397)		+= pinctrl-mt6397.o
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8196.c b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
new file mode 100644
index 000000000000..8388f4861a46
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
@@ -0,0 +1,1764 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Mediatek Inc.
+ * Author: Guodong Liu <Guodong.Liu@mediatek.com>
+ */
+
+#include <linux/module.h>
+#include "pinctrl-mtk-mt8196.h"
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
+static const struct mtk_pin_field_calc mt8196_pin_mode_range[] = {
+	PIN_FIELD(0, 270, 0x0300, 0x10, 0, 4),
+};
+
+static const struct mtk_pin_field_calc mt8196_pin_dir_range[] = {
+	PIN_FIELD(0, 270, 0x0000, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8196_pin_di_range[] = {
+	PIN_FIELD(0, 270, 0x0200, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8196_pin_do_range[] = {
+	PIN_FIELD(0, 270, 0x0100, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8196_pin_smt_range[] = {
+	PIN_FIELD_BASE(0, 0, 8, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(1, 1, 8, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(2, 2, 11, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(3, 3, 11, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(4, 4, 11, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(5, 5, 11, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(6, 6, 11, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(7, 7, 11, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(8, 8, 11, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(9, 9, 9, 0x0120, 0x10, 13, 1),
+	PIN_FIELD_BASE(10, 10, 9, 0x0120, 0x10, 12, 1),
+	PIN_FIELD_BASE(11, 11, 8, 0x00d0, 0x10, 2, 1),
+	PIN_FIELD_BASE(12, 12, 9, 0x0120, 0x10, 15, 1),
+	PIN_FIELD_BASE(13, 13, 6, 0x0120, 0x10, 3, 1),
+	PIN_FIELD_BASE(14, 14, 3, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(15, 15, 6, 0x0120, 0x10, 0, 1),
+	PIN_FIELD_BASE(16, 16, 6, 0x0120, 0x10, 3, 1),
+	PIN_FIELD_BASE(17, 17, 6, 0x0120, 0x10, 3, 1),
+	PIN_FIELD_BASE(18, 18, 6, 0x0120, 0x10, 1, 1),
+	PIN_FIELD_BASE(19, 19, 6, 0x0120, 0x10, 2, 1),
+	PIN_FIELD_BASE(20, 20, 3, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(21, 21, 2, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(22, 22, 2, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(23, 23, 2, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(24, 24, 2, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(25, 25, 2, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(26, 26, 2, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(27, 27, 2, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(28, 28, 2, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(29, 29, 2, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(30, 30, 2, 0x00b0, 0x10, 8, 1),
+	PIN_FIELD_BASE(31, 31, 2, 0x00b0, 0x10, 8, 1),
+	PIN_FIELD_BASE(32, 32, 1, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(33, 33, 1, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(34, 34, 1, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(35, 35, 1, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(36, 36, 1, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(37, 37, 1, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(38, 38, 1, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(39, 39, 8, 0x00d0, 0x10, 4, 1),
+	PIN_FIELD_BASE(40, 40, 8, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(41, 41, 8, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(42, 42, 8, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(43, 43, 8, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(44, 44, 8, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(45, 45, 8, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(46, 46, 8, 0x00d0, 0x10, 6, 1),
+	PIN_FIELD_BASE(47, 47, 8, 0x00d0, 0x10, 9, 1),
+	PIN_FIELD_BASE(48, 48, 8, 0x00d0, 0x10, 7, 1),
+	PIN_FIELD_BASE(49, 49, 8, 0x00d0, 0x10, 10, 1),
+	PIN_FIELD_BASE(50, 50, 8, 0x00d0, 0x10, 8, 1),
+	PIN_FIELD_BASE(51, 51, 8, 0x00d0, 0x10, 11, 1),
+	PIN_FIELD_BASE(52, 52, 9, 0x0120, 0x10, 7, 1),
+	PIN_FIELD_BASE(53, 53, 9, 0x0120, 0x10, 8, 1),
+	PIN_FIELD_BASE(54, 54, 9, 0x0120, 0x10, 2, 1),
+	PIN_FIELD_BASE(55, 55, 9, 0x0120, 0x10, 1, 1),
+	PIN_FIELD_BASE(56, 56, 9, 0x0120, 0x10, 5, 1),
+	PIN_FIELD_BASE(57, 57, 9, 0x0120, 0x10, 6, 1),
+	PIN_FIELD_BASE(58, 58, 9, 0x0120, 0x10, 3, 1),
+	PIN_FIELD_BASE(59, 59, 9, 0x0120, 0x10, 4, 1),
+	PIN_FIELD_BASE(60, 60, 9, 0x0120, 0x10, 19, 1),
+	PIN_FIELD_BASE(61, 61, 9, 0x0120, 0x10, 10, 1),
+	PIN_FIELD_BASE(62, 62, 9, 0x0120, 0x10, 9, 1),
+	PIN_FIELD_BASE(63, 63, 9, 0x0120, 0x10, 14, 1),
+	PIN_FIELD_BASE(64, 64, 9, 0x0120, 0x10, 0, 1),
+	PIN_FIELD_BASE(65, 65, 9, 0x0120, 0x10, 11, 1),
+	PIN_FIELD_BASE(66, 66, 9, 0x0120, 0x10, 16, 1),
+	PIN_FIELD_BASE(67, 67, 9, 0x0120, 0x10, 18, 1),
+	PIN_FIELD_BASE(68, 68, 9, 0x0120, 0x10, 18, 1),
+	PIN_FIELD_BASE(69, 69, 9, 0x0120, 0x10, 18, 1),
+	PIN_FIELD_BASE(70, 70, 9, 0x0120, 0x10, 17, 1),
+	PIN_FIELD_BASE(71, 71, 9, 0x0120, 0x10, 17, 1),
+	PIN_FIELD_BASE(72, 72, 9, 0x0120, 0x10, 18, 1),
+	PIN_FIELD_BASE(73, 73, 9, 0x0120, 0x10, 17, 1),
+	PIN_FIELD_BASE(74, 74, 9, 0x0120, 0x10, 17, 1),
+	PIN_FIELD_BASE(75, 75, 10, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(76, 76, 10, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(77, 77, 10, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(78, 78, 10, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(79, 79, 10, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(80, 80, 10, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(81, 81, 11, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(82, 82, 11, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(83, 83, 11, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(84, 84, 11, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(85, 85, 11, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(86, 86, 11, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(87, 87, 11, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(88, 88, 11, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(89, 89, 11, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(90, 90, 11, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(91, 91, 12, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(92, 92, 12, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(93, 93, 12, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(94, 94, 12, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(95, 95, 12, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(96, 96, 12, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(97, 97, 12, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(98, 98, 12, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(99, 99, 12, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(100, 100, 12, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(101, 101, 12, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(102, 102, 12, 0x00c0, 0x10, 10, 1),
+	PIN_FIELD_BASE(103, 103, 12, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(104, 104, 12, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(105, 105, 12, 0x00c0, 0x10, 11, 1),
+	PIN_FIELD_BASE(106, 106, 5, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(107, 107, 5, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(108, 108, 5, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(109, 109, 5, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(110, 110, 5, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(111, 111, 5, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(112, 112, 5, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(113, 113, 5, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(114, 114, 5, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(115, 115, 5, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(116, 116, 5, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(117, 117, 5, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(118, 118, 6, 0x0120, 0x10, 6, 1),
+	PIN_FIELD_BASE(119, 119, 6, 0x0120, 0x10, 7, 1),
+	PIN_FIELD_BASE(120, 120, 6, 0x0120, 0x10, 9, 1),
+	PIN_FIELD_BASE(121, 121, 6, 0x0120, 0x10, 8, 1),
+	PIN_FIELD_BASE(122, 122, 6, 0x0120, 0x10, 3, 1),
+	PIN_FIELD_BASE(123, 123, 6, 0x0120, 0x10, 4, 1),
+	PIN_FIELD_BASE(124, 124, 6, 0x0120, 0x10, 5, 1),
+	PIN_FIELD_BASE(125, 125, 7, 0x00f0, 0x10, 0, 1),
+	PIN_FIELD_BASE(126, 126, 7, 0x00f0, 0x10, 1, 1),
+	PIN_FIELD_BASE(127, 127, 7, 0x00f0, 0x10, 2, 1),
+	PIN_FIELD_BASE(128, 128, 7, 0x00f0, 0x10, 3, 1),
+	PIN_FIELD_BASE(129, 129, 7, 0x00f0, 0x10, 4, 1),
+	PIN_FIELD_BASE(130, 130, 7, 0x00f0, 0x10, 5, 1),
+	PIN_FIELD_BASE(131, 131, 7, 0x00f0, 0x10, 9, 1),
+	PIN_FIELD_BASE(132, 132, 7, 0x00f0, 0x10, 11, 1),
+	PIN_FIELD_BASE(133, 133, 7, 0x00f0, 0x10, 10, 1),
+	PIN_FIELD_BASE(134, 134, 7, 0x00f0, 0x10, 6, 1),
+	PIN_FIELD_BASE(135, 135, 7, 0x00f0, 0x10, 8, 1),
+	PIN_FIELD_BASE(136, 136, 7, 0x00f0, 0x10, 7, 1),
+	PIN_FIELD_BASE(137, 137, 4, 0x00d0, 0x10, 2, 1),
+	PIN_FIELD_BASE(138, 138, 4, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(139, 139, 4, 0x00d0, 0x10, 4, 1),
+	PIN_FIELD_BASE(140, 140, 4, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(141, 141, 4, 0x00d0, 0x10, 6, 1),
+	PIN_FIELD_BASE(142, 142, 4, 0x00d0, 0x10, 7, 1),
+	PIN_FIELD_BASE(143, 143, 4, 0x00d0, 0x10, 8, 1),
+	PIN_FIELD_BASE(144, 144, 4, 0x00d0, 0x10, 9, 1),
+	PIN_FIELD_BASE(145, 145, 4, 0x00d0, 0x10, 10, 1),
+	PIN_FIELD_BASE(146, 146, 4, 0x00d0, 0x10, 10, 1),
+	PIN_FIELD_BASE(147, 147, 4, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(148, 148, 4, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(149, 149, 4, 0x00d0, 0x10, 11, 1),
+	PIN_FIELD_BASE(150, 150, 4, 0x00d0, 0x10, 11, 1),
+	PIN_FIELD_BASE(151, 151, 4, 0x00d0, 0x10, 11, 1),
+	PIN_FIELD_BASE(152, 152, 4, 0x00d0, 0x10, 11, 1),
+	PIN_FIELD_BASE(153, 153, 4, 0x00d0, 0x10, 13, 1),
+	PIN_FIELD_BASE(154, 154, 4, 0x00d0, 0x10, 13, 1),
+	PIN_FIELD_BASE(155, 155, 4, 0x00d0, 0x10, 12, 1),
+	PIN_FIELD_BASE(156, 156, 4, 0x00d0, 0x10, 12, 1),
+	PIN_FIELD_BASE(157, 157, 2, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(158, 158, 2, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(159, 159, 2, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(160, 160, 3, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(161, 161, 3, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(162, 162, 3, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(163, 163, 3, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(164, 164, 3, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(165, 165, 3, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(166, 166, 3, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(167, 167, 3, 0x00c0, 0x10, 10, 1),
+	PIN_FIELD_BASE(168, 168, 3, 0x00c0, 0x10, 11, 1),
+	PIN_FIELD_BASE(169, 169, 3, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(170, 170, 3, 0x00c0, 0x10, 12, 1),
+	PIN_FIELD_BASE(171, 171, 3, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(172, 172, 3, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(173, 173, 3, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(174, 174, 1, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(175, 175, 1, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(176, 176, 1, 0x00c0, 0x10, 10, 1),
+	PIN_FIELD_BASE(177, 177, 1, 0x00c0, 0x10, 11, 1),
+	PIN_FIELD_BASE(178, 178, 1, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(179, 179, 1, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(180, 180, 1, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(181, 181, 1, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(182, 182, 1, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(183, 183, 1, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(184, 184, 1, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(185, 185, 1, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(186, 186, 13, 0x0110, 0x10, 14, 1),
+	PIN_FIELD_BASE(187, 187, 13, 0x0110, 0x10, 14, 1),
+	PIN_FIELD_BASE(188, 188, 13, 0x0110, 0x10, 4, 1),
+	PIN_FIELD_BASE(189, 189, 13, 0x0110, 0x10, 9, 1),
+	PIN_FIELD_BASE(190, 190, 13, 0x0110, 0x10, 5, 1),
+	PIN_FIELD_BASE(191, 191, 13, 0x0110, 0x10, 10, 1),
+	PIN_FIELD_BASE(192, 192, 13, 0x0110, 0x10, 0, 1),
+	PIN_FIELD_BASE(193, 193, 13, 0x0110, 0x10, 15, 1),
+	PIN_FIELD_BASE(194, 194, 13, 0x0110, 0x10, 6, 1),
+	PIN_FIELD_BASE(195, 195, 13, 0x0110, 0x10, 11, 1),
+	PIN_FIELD_BASE(196, 196, 13, 0x0110, 0x10, 1, 1),
+	PIN_FIELD_BASE(197, 197, 13, 0x0110, 0x10, 16, 1),
+	PIN_FIELD_BASE(198, 198, 13, 0x0110, 0x10, 7, 1),
+	PIN_FIELD_BASE(199, 199, 13, 0x0110, 0x10, 12, 1),
+	PIN_FIELD_BASE(200, 200, 13, 0x0110, 0x10, 19, 1),
+	PIN_FIELD_BASE(201, 201, 13, 0x0110, 0x10, 22, 1),
+	PIN_FIELD_BASE(202, 202, 13, 0x0110, 0x10, 8, 1),
+	PIN_FIELD_BASE(203, 203, 13, 0x0110, 0x10, 13, 1),
+	PIN_FIELD_BASE(204, 204, 13, 0x0110, 0x10, 2, 1),
+	PIN_FIELD_BASE(205, 205, 13, 0x0110, 0x10, 3, 1),
+	PIN_FIELD_BASE(206, 206, 13, 0x0110, 0x10, 18, 1),
+	PIN_FIELD_BASE(207, 207, 13, 0x0110, 0x10, 17, 1),
+	PIN_FIELD_BASE(208, 208, 13, 0x0110, 0x10, 17, 1),
+	PIN_FIELD_BASE(209, 209, 13, 0x0110, 0x10, 17, 1),
+	PIN_FIELD_BASE(210, 210, 14, 0x0130, 0x10, 0, 1),
+	PIN_FIELD_BASE(211, 211, 14, 0x0130, 0x10, 1, 1),
+	PIN_FIELD_BASE(212, 212, 14, 0x0130, 0x10, 2, 1),
+	PIN_FIELD_BASE(213, 213, 14, 0x0130, 0x10, 3, 1),
+	PIN_FIELD_BASE(214, 214, 13, 0x0110, 0x10, 20, 1),
+	PIN_FIELD_BASE(215, 215, 13, 0x0110, 0x10, 21, 1),
+	PIN_FIELD_BASE(216, 216, 14, 0x0130, 0x10, 11, 1),
+	PIN_FIELD_BASE(217, 217, 14, 0x0130, 0x10, 11, 1),
+	PIN_FIELD_BASE(218, 218, 14, 0x0130, 0x10, 11, 1),
+	PIN_FIELD_BASE(219, 219, 14, 0x0130, 0x10, 4, 1),
+	PIN_FIELD_BASE(220, 220, 14, 0x0130, 0x10, 11, 1),
+	PIN_FIELD_BASE(221, 221, 14, 0x0130, 0x10, 12, 1),
+	PIN_FIELD_BASE(222, 222, 14, 0x0130, 0x10, 22, 1),
+	PIN_FIELD_BASE(223, 223, 14, 0x0130, 0x10, 21, 1),
+	PIN_FIELD_BASE(224, 224, 14, 0x0130, 0x10, 5, 1),
+	PIN_FIELD_BASE(225, 225, 14, 0x0130, 0x10, 6, 1),
+	PIN_FIELD_BASE(226, 226, 14, 0x0130, 0x10, 7, 1),
+	PIN_FIELD_BASE(227, 227, 14, 0x0130, 0x10, 8, 1),
+	PIN_FIELD_BASE(228, 228, 14, 0x0130, 0x10, 9, 1),
+	PIN_FIELD_BASE(229, 229, 14, 0x0130, 0x10, 10, 1),
+	PIN_FIELD_BASE(230, 230, 15, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(231, 231, 15, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(232, 232, 15, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(233, 233, 15, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(234, 234, 15, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(235, 235, 15, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(236, 236, 15, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(237, 237, 15, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(238, 238, 15, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(239, 239, 15, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(240, 240, 15, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(241, 241, 15, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(242, 242, 15, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(243, 243, 15, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(244, 244, 15, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(245, 245, 15, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(246, 246, 15, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(247, 247, 15, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(248, 248, 15, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(249, 249, 15, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(250, 250, 15, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(251, 251, 3, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(252, 252, 3, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(253, 253, 3, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(254, 254, 3, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(255, 255, 3, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(256, 256, 3, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(257, 257, 3, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(258, 258, 3, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(259, 259, 14, 0x0130, 0x10, 13, 1),
+	PIN_FIELD_BASE(260, 260, 14, 0x0130, 0x10, 14, 1),
+	PIN_FIELD_BASE(261, 261, 14, 0x0130, 0x10, 15, 1),
+	PIN_FIELD_BASE(262, 262, 14, 0x0130, 0x10, 16, 1),
+	PIN_FIELD_BASE(263, 263, 14, 0x0130, 0x10, 17, 1),
+	PIN_FIELD_BASE(264, 264, 14, 0x0130, 0x10, 18, 1),
+	PIN_FIELD_BASE(265, 265, 14, 0x0130, 0x10, 19, 1),
+	PIN_FIELD_BASE(266, 266, 14, 0x0130, 0x10, 20, 1),
+	PIN_FIELD_BASE(267, 267, 15, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(268, 268, 15, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(269, 269, 15, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(270, 270, 15, 0x00e0, 0x10, 7, 1),
+};
+
+static const struct mtk_pin_field_calc mt8196_pin_ies_range[] = {
+	PIN_FIELD_BASE(0, 0, 8, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(1, 1, 8, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(2, 2, 11, 0x0040, 0x10, 1, 1),
+	PIN_FIELD_BASE(3, 3, 11, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(4, 4, 11, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(5, 5, 11, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(6, 6, 11, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(7, 7, 11, 0x0040, 0x10, 6, 1),
+	PIN_FIELD_BASE(8, 8, 11, 0x0040, 0x10, 7, 1),
+	PIN_FIELD_BASE(9, 9, 9, 0x0070, 0x10, 14, 1),
+	PIN_FIELD_BASE(10, 10, 9, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(11, 11, 8, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(12, 12, 9, 0x0070, 0x10, 13, 1),
+	PIN_FIELD_BASE(13, 13, 6, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(14, 14, 3, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(15, 15, 6, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(16, 16, 6, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(17, 17, 6, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(18, 18, 6, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(19, 19, 6, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(20, 20, 3, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(21, 21, 2, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(22, 22, 2, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(23, 23, 2, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(24, 24, 2, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(25, 25, 2, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(26, 26, 2, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(27, 27, 2, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(28, 28, 2, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(29, 29, 2, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(30, 30, 2, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(31, 31, 2, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(32, 32, 1, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(33, 33, 1, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(34, 34, 1, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(35, 35, 1, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(36, 36, 1, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(37, 37, 1, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(38, 38, 1, 0x0050, 0x10, 14, 1),
+	PIN_FIELD_BASE(39, 39, 8, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(40, 40, 8, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(41, 41, 8, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(42, 42, 8, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(43, 43, 8, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(44, 44, 8, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(45, 45, 8, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(46, 46, 8, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(47, 47, 8, 0x0060, 0x10, 13, 1),
+	PIN_FIELD_BASE(48, 48, 8, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(49, 49, 8, 0x0060, 0x10, 14, 1),
+	PIN_FIELD_BASE(50, 50, 8, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(51, 51, 8, 0x0060, 0x10, 15, 1),
+	PIN_FIELD_BASE(52, 52, 9, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(53, 53, 9, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(54, 54, 9, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(55, 55, 9, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(56, 56, 9, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(57, 57, 9, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(58, 58, 9, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(59, 59, 9, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(60, 60, 9, 0x0070, 0x10, 19, 1),
+	PIN_FIELD_BASE(61, 61, 9, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(62, 62, 9, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(63, 63, 9, 0x0070, 0x10, 18, 1),
+	PIN_FIELD_BASE(64, 64, 9, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(65, 65, 9, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(66, 66, 9, 0x0070, 0x10, 24, 1),
+	PIN_FIELD_BASE(67, 67, 9, 0x0070, 0x10, 22, 1),
+	PIN_FIELD_BASE(68, 68, 9, 0x0070, 0x10, 21, 1),
+	PIN_FIELD_BASE(69, 69, 9, 0x0070, 0x10, 25, 1),
+	PIN_FIELD_BASE(70, 70, 9, 0x0070, 0x10, 16, 1),
+	PIN_FIELD_BASE(71, 71, 9, 0x0070, 0x10, 15, 1),
+	PIN_FIELD_BASE(72, 72, 9, 0x0070, 0x10, 23, 1),
+	PIN_FIELD_BASE(73, 73, 9, 0x0070, 0x10, 20, 1),
+	PIN_FIELD_BASE(74, 74, 9, 0x0070, 0x10, 17, 1),
+	PIN_FIELD_BASE(75, 75, 10, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(76, 76, 10, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(77, 77, 10, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(78, 78, 10, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(79, 79, 10, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(80, 80, 10, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(81, 81, 11, 0x0040, 0x10, 9, 1),
+	PIN_FIELD_BASE(82, 82, 11, 0x0040, 0x10, 10, 1),
+	PIN_FIELD_BASE(83, 83, 11, 0x0040, 0x10, 12, 1),
+	PIN_FIELD_BASE(84, 84, 11, 0x0040, 0x10, 11, 1),
+	PIN_FIELD_BASE(85, 85, 11, 0x0040, 0x10, 13, 1),
+	PIN_FIELD_BASE(86, 86, 11, 0x0040, 0x10, 14, 1),
+	PIN_FIELD_BASE(87, 87, 11, 0x0040, 0x10, 16, 1),
+	PIN_FIELD_BASE(88, 88, 11, 0x0040, 0x10, 15, 1),
+	PIN_FIELD_BASE(89, 89, 11, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(90, 90, 11, 0x0040, 0x10, 8, 1),
+	PIN_FIELD_BASE(91, 91, 12, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(92, 92, 12, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(93, 93, 12, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(94, 94, 12, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(95, 95, 12, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(96, 96, 12, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(97, 97, 12, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(98, 98, 12, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(99, 99, 12, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(100, 100, 12, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(101, 101, 12, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(102, 102, 12, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(103, 103, 12, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(104, 104, 12, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(105, 105, 12, 0x0050, 0x10, 14, 1),
+	PIN_FIELD_BASE(106, 106, 5, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(107, 107, 5, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(108, 108, 5, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(109, 109, 5, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(110, 110, 5, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(111, 111, 5, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(112, 112, 5, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(113, 113, 5, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(114, 114, 5, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(115, 115, 5, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(116, 116, 5, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(117, 117, 5, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(118, 118, 6, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(119, 119, 6, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(120, 120, 6, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(121, 121, 6, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(122, 122, 6, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(123, 123, 6, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(124, 124, 6, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(125, 125, 7, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(126, 126, 7, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(127, 127, 7, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(128, 128, 7, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(129, 129, 7, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(130, 130, 7, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(131, 131, 7, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(132, 132, 7, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(133, 133, 7, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(134, 134, 7, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(135, 135, 7, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(136, 136, 7, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(137, 137, 4, 0x0040, 0x10, 10, 1),
+	PIN_FIELD_BASE(138, 138, 4, 0x0040, 0x10, 11, 1),
+	PIN_FIELD_BASE(139, 139, 4, 0x0040, 0x10, 12, 1),
+	PIN_FIELD_BASE(140, 140, 4, 0x0040, 0x10, 13, 1),
+	PIN_FIELD_BASE(141, 141, 4, 0x0040, 0x10, 14, 1),
+	PIN_FIELD_BASE(142, 142, 4, 0x0040, 0x10, 15, 1),
+	PIN_FIELD_BASE(143, 143, 4, 0x0040, 0x10, 16, 1),
+	PIN_FIELD_BASE(144, 144, 4, 0x0040, 0x10, 17, 1),
+	PIN_FIELD_BASE(145, 145, 4, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(146, 146, 4, 0x0040, 0x10, 1, 1),
+	PIN_FIELD_BASE(147, 147, 4, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(148, 148, 4, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(149, 149, 4, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(150, 150, 4, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(151, 151, 4, 0x0040, 0x10, 6, 1),
+	PIN_FIELD_BASE(152, 152, 4, 0x0040, 0x10, 7, 1),
+	PIN_FIELD_BASE(153, 153, 4, 0x0040, 0x10, 9, 1),
+	PIN_FIELD_BASE(154, 154, 4, 0x0040, 0x10, 8, 1),
+	PIN_FIELD_BASE(155, 155, 4, 0x0040, 0x10, 18, 1),
+	PIN_FIELD_BASE(156, 156, 4, 0x0040, 0x10, 19, 1),
+	PIN_FIELD_BASE(157, 157, 2, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(158, 158, 2, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(159, 159, 2, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(160, 160, 3, 0x0050, 0x10, 22, 1),
+	PIN_FIELD_BASE(161, 161, 3, 0x0050, 0x10, 20, 1),
+	PIN_FIELD_BASE(162, 162, 3, 0x0050, 0x10, 23, 1),
+	PIN_FIELD_BASE(163, 163, 3, 0x0050, 0x10, 21, 1),
+	PIN_FIELD_BASE(164, 164, 3, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(165, 165, 3, 0x0050, 0x10, 14, 1),
+	PIN_FIELD_BASE(166, 166, 3, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(167, 167, 3, 0x0050, 0x10, 15, 1),
+	PIN_FIELD_BASE(168, 168, 3, 0x0050, 0x10, 16, 1),
+	PIN_FIELD_BASE(169, 169, 3, 0x0050, 0x10, 17, 1),
+	PIN_FIELD_BASE(170, 170, 3, 0x0050, 0x10, 19, 1),
+	PIN_FIELD_BASE(171, 171, 3, 0x0050, 0x10, 18, 1),
+	PIN_FIELD_BASE(172, 172, 3, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(173, 173, 3, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(174, 174, 1, 0x0050, 0x10, 15, 1),
+	PIN_FIELD_BASE(175, 175, 1, 0x0050, 0x10, 16, 1),
+	PIN_FIELD_BASE(176, 176, 1, 0x0050, 0x10, 17, 1),
+	PIN_FIELD_BASE(177, 177, 1, 0x0050, 0x10, 18, 1),
+	PIN_FIELD_BASE(178, 178, 1, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(179, 179, 1, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(180, 180, 1, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(181, 181, 1, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(182, 182, 1, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(183, 183, 1, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(184, 184, 1, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(185, 185, 1, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(186, 186, 13, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(187, 187, 13, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(188, 188, 13, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(189, 189, 13, 0x0090, 0x10, 17, 1),
+	PIN_FIELD_BASE(190, 190, 13, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(191, 191, 13, 0x0090, 0x10, 18, 1),
+	PIN_FIELD_BASE(192, 192, 13, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(193, 193, 13, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(194, 194, 13, 0x0090, 0x10, 14, 1),
+	PIN_FIELD_BASE(195, 195, 13, 0x0090, 0x10, 19, 1),
+	PIN_FIELD_BASE(196, 196, 13, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(197, 197, 13, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(198, 198, 13, 0x0090, 0x10, 15, 1),
+	PIN_FIELD_BASE(199, 199, 13, 0x0090, 0x10, 20, 1),
+	PIN_FIELD_BASE(200, 200, 13, 0x0090, 0x10, 22, 1),
+	PIN_FIELD_BASE(201, 201, 13, 0x0090, 0x10, 25, 1),
+	PIN_FIELD_BASE(202, 202, 13, 0x0090, 0x10, 16, 1),
+	PIN_FIELD_BASE(203, 203, 13, 0x0090, 0x10, 21, 1),
+	PIN_FIELD_BASE(204, 204, 13, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(205, 205, 13, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(206, 206, 13, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(207, 207, 13, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(208, 208, 13, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(209, 209, 13, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(210, 210, 14, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(211, 211, 14, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(212, 212, 14, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(213, 213, 14, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(214, 214, 13, 0x0090, 0x10, 23, 1),
+	PIN_FIELD_BASE(215, 215, 13, 0x0090, 0x10, 24, 1),
+	PIN_FIELD_BASE(216, 216, 14, 0x0060, 0x10, 13, 1),
+	PIN_FIELD_BASE(217, 217, 14, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(218, 218, 14, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(219, 219, 14, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(220, 220, 14, 0x0060, 0x10, 22, 1),
+	PIN_FIELD_BASE(221, 221, 14, 0x0060, 0x10, 23, 1),
+	PIN_FIELD_BASE(222, 222, 14, 0x0060, 0x10, 25, 1),
+	PIN_FIELD_BASE(223, 223, 14, 0x0060, 0x10, 24, 1),
+	PIN_FIELD_BASE(224, 224, 14, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(225, 225, 14, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(226, 226, 14, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(227, 227, 14, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(228, 228, 14, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(229, 229, 14, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(230, 230, 15, 0x0040, 0x10, 13, 1),
+	PIN_FIELD_BASE(231, 231, 15, 0x0040, 0x10, 14, 1),
+	PIN_FIELD_BASE(232, 232, 15, 0x0040, 0x10, 10, 1),
+	PIN_FIELD_BASE(233, 233, 15, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(234, 234, 15, 0x0040, 0x10, 3, 1),
+	PIN_FIELD_BASE(235, 235, 15, 0x0040, 0x10, 1, 1),
+	PIN_FIELD_BASE(236, 236, 15, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(237, 237, 15, 0x0040, 0x10, 6, 1),
+	PIN_FIELD_BASE(238, 238, 15, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(239, 239, 15, 0x0040, 0x10, 23, 1),
+	PIN_FIELD_BASE(240, 240, 15, 0x0040, 0x10, 22, 1),
+	PIN_FIELD_BASE(241, 241, 15, 0x0040, 0x10, 16, 1),
+	PIN_FIELD_BASE(242, 242, 15, 0x0040, 0x10, 17, 1),
+	PIN_FIELD_BASE(243, 243, 15, 0x0040, 0x10, 15, 1),
+	PIN_FIELD_BASE(244, 244, 15, 0x0040, 0x10, 12, 1),
+	PIN_FIELD_BASE(245, 245, 15, 0x0040, 0x10, 9, 1),
+	PIN_FIELD_BASE(246, 246, 15, 0x0040, 0x10, 8, 1),
+	PIN_FIELD_BASE(247, 247, 15, 0x0040, 0x10, 7, 1),
+	PIN_FIELD_BASE(248, 248, 15, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(249, 249, 15, 0x0040, 0x10, 24, 1),
+	PIN_FIELD_BASE(250, 250, 15, 0x0040, 0x10, 11, 1),
+	PIN_FIELD_BASE(251, 251, 3, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(252, 252, 3, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(253, 253, 3, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(254, 254, 3, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(255, 255, 3, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(256, 256, 3, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(257, 257, 3, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(258, 258, 3, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(259, 259, 14, 0x0060, 0x10, 14, 1),
+	PIN_FIELD_BASE(260, 260, 14, 0x0060, 0x10, 15, 1),
+	PIN_FIELD_BASE(261, 261, 14, 0x0060, 0x10, 16, 1),
+	PIN_FIELD_BASE(262, 262, 14, 0x0060, 0x10, 17, 1),
+	PIN_FIELD_BASE(263, 263, 14, 0x0060, 0x10, 18, 1),
+	PIN_FIELD_BASE(264, 264, 14, 0x0060, 0x10, 19, 1),
+	PIN_FIELD_BASE(265, 265, 14, 0x0060, 0x10, 20, 1),
+	PIN_FIELD_BASE(266, 266, 14, 0x0060, 0x10, 21, 1),
+	PIN_FIELD_BASE(267, 267, 15, 0x0040, 0x10, 20, 1),
+	PIN_FIELD_BASE(268, 268, 15, 0x0040, 0x10, 21, 1),
+	PIN_FIELD_BASE(269, 269, 15, 0x0040, 0x10, 18, 1),
+	PIN_FIELD_BASE(270, 270, 15, 0x0040, 0x10, 19, 1),
+};
+
+static const struct mtk_pin_field_calc mt8196_pin_pupd_range[] = {
+	PIN_FIELD_BASE(60, 60, 9, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(125, 125, 7, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(126, 126, 7, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(127, 127, 7, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(128, 128, 7, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(129, 129, 7, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(130, 130, 7, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(131, 131, 7, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(132, 132, 7, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(133, 133, 7, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(134, 134, 7, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(135, 135, 7, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(136, 136, 7, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(137, 137, 4, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(138, 138, 4, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(139, 139, 4, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(140, 140, 4, 0x0070, 0x10, 13, 1),
+	PIN_FIELD_BASE(141, 141, 4, 0x0070, 0x10, 14, 1),
+	PIN_FIELD_BASE(142, 142, 4, 0x0070, 0x10, 15, 1),
+	PIN_FIELD_BASE(143, 143, 4, 0x0070, 0x10, 16, 1),
+	PIN_FIELD_BASE(144, 144, 4, 0x0070, 0x10, 17, 1),
+	PIN_FIELD_BASE(145, 145, 4, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(146, 146, 4, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(147, 147, 4, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(148, 148, 4, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(149, 149, 4, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(150, 150, 4, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(151, 151, 4, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(152, 152, 4, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(153, 153, 4, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(154, 154, 4, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(155, 155, 4, 0x0070, 0x10, 18, 1),
+	PIN_FIELD_BASE(156, 156, 4, 0x0070, 0x10, 19, 1),
+	PIN_FIELD_BASE(217, 217, 14, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(218, 218, 14, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(219, 219, 14, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(224, 224, 14, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(225, 225, 14, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(226, 226, 14, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(227, 227, 14, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(228, 228, 14, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(229, 229, 14, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(259, 259, 14, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(260, 260, 14, 0x00a0, 0x10, 10, 1),
+	PIN_FIELD_BASE(261, 261, 14, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(262, 262, 14, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(263, 263, 14, 0x00a0, 0x10, 13, 1),
+	PIN_FIELD_BASE(264, 264, 14, 0x00a0, 0x10, 14, 1),
+	PIN_FIELD_BASE(265, 265, 14, 0x00a0, 0x10, 15, 1),
+	PIN_FIELD_BASE(266, 266, 14, 0x00a0, 0x10, 16, 1),
+	PIN_FIELD_BASE(267, 267, 15, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(268, 268, 15, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(269, 269, 15, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(270, 270, 15, 0x0080, 0x10, 1, 1),
+};
+
+static const struct mtk_pin_field_calc mt8196_pin_r0_range[] = {
+	PIN_FIELD_BASE(60, 60, 9, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(125, 125, 7, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(126, 126, 7, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(127, 127, 7, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(128, 128, 7, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(129, 129, 7, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(130, 130, 7, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(131, 131, 7, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(132, 132, 7, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(133, 133, 7, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(134, 134, 7, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(135, 135, 7, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(136, 136, 7, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(137, 137, 4, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(138, 138, 4, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(139, 139, 4, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(140, 140, 4, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(141, 141, 4, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(142, 142, 4, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(143, 143, 4, 0x0080, 0x10, 16, 1),
+	PIN_FIELD_BASE(144, 144, 4, 0x0080, 0x10, 17, 1),
+	PIN_FIELD_BASE(145, 145, 4, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(146, 146, 4, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(147, 147, 4, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(148, 148, 4, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(149, 149, 4, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(150, 150, 4, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(151, 151, 4, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(152, 152, 4, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(153, 153, 4, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(154, 154, 4, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(155, 155, 4, 0x0080, 0x10, 18, 1),
+	PIN_FIELD_BASE(156, 156, 4, 0x0080, 0x10, 19, 1),
+	PIN_FIELD_BASE(217, 217, 14, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(218, 218, 14, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(219, 219, 14, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(224, 224, 14, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(225, 225, 14, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(226, 226, 14, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(227, 227, 14, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(228, 228, 14, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(229, 229, 14, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(259, 259, 14, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(260, 260, 14, 0x00c0, 0x10, 10, 1),
+	PIN_FIELD_BASE(261, 261, 14, 0x00c0, 0x10, 11, 1),
+	PIN_FIELD_BASE(262, 262, 14, 0x00c0, 0x10, 12, 1),
+	PIN_FIELD_BASE(263, 263, 14, 0x00c0, 0x10, 13, 1),
+	PIN_FIELD_BASE(264, 264, 14, 0x00c0, 0x10, 14, 1),
+	PIN_FIELD_BASE(265, 265, 14, 0x00c0, 0x10, 15, 1),
+	PIN_FIELD_BASE(266, 266, 14, 0x00c0, 0x10, 16, 1),
+	PIN_FIELD_BASE(267, 267, 15, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(268, 268, 15, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(269, 269, 15, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(270, 270, 15, 0x00a0, 0x10, 1, 1),
+};
+
+static const struct mtk_pin_field_calc mt8196_pin_r1_range[] = {
+	PIN_FIELD_BASE(60, 60, 9, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(125, 125, 7, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(126, 126, 7, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(127, 127, 7, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(128, 128, 7, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(129, 129, 7, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(130, 130, 7, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(131, 131, 7, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(132, 132, 7, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(133, 133, 7, 0x00a0, 0x10, 10, 1),
+	PIN_FIELD_BASE(134, 134, 7, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(135, 135, 7, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(136, 136, 7, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(137, 137, 4, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(138, 138, 4, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(139, 139, 4, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(140, 140, 4, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(141, 141, 4, 0x0090, 0x10, 14, 1),
+	PIN_FIELD_BASE(142, 142, 4, 0x0090, 0x10, 15, 1),
+	PIN_FIELD_BASE(143, 143, 4, 0x0090, 0x10, 16, 1),
+	PIN_FIELD_BASE(144, 144, 4, 0x0090, 0x10, 17, 1),
+	PIN_FIELD_BASE(145, 145, 4, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(146, 146, 4, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(147, 147, 4, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(148, 148, 4, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(149, 149, 4, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(150, 150, 4, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(151, 151, 4, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(152, 152, 4, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(153, 153, 4, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(154, 154, 4, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(155, 155, 4, 0x0090, 0x10, 18, 1),
+	PIN_FIELD_BASE(156, 156, 4, 0x0090, 0x10, 19, 1),
+	PIN_FIELD_BASE(217, 217, 14, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(218, 218, 14, 0x00d0, 0x10, 2, 1),
+	PIN_FIELD_BASE(219, 219, 14, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(224, 224, 14, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(225, 225, 14, 0x00d0, 0x10, 4, 1),
+	PIN_FIELD_BASE(226, 226, 14, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(227, 227, 14, 0x00d0, 0x10, 6, 1),
+	PIN_FIELD_BASE(228, 228, 14, 0x00d0, 0x10, 7, 1),
+	PIN_FIELD_BASE(229, 229, 14, 0x00d0, 0x10, 8, 1),
+	PIN_FIELD_BASE(259, 259, 14, 0x00d0, 0x10, 9, 1),
+	PIN_FIELD_BASE(260, 260, 14, 0x00d0, 0x10, 10, 1),
+	PIN_FIELD_BASE(261, 261, 14, 0x00d0, 0x10, 11, 1),
+	PIN_FIELD_BASE(262, 262, 14, 0x00d0, 0x10, 12, 1),
+	PIN_FIELD_BASE(263, 263, 14, 0x00d0, 0x10, 13, 1),
+	PIN_FIELD_BASE(264, 264, 14, 0x00d0, 0x10, 14, 1),
+	PIN_FIELD_BASE(265, 265, 14, 0x00d0, 0x10, 15, 1),
+	PIN_FIELD_BASE(266, 266, 14, 0x00d0, 0x10, 16, 1),
+	PIN_FIELD_BASE(267, 267, 15, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(268, 268, 15, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(269, 269, 15, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(270, 270, 15, 0x00b0, 0x10, 1, 1),
+};
+
+static const struct mtk_pin_field_calc mt8196_pin_pu_range[] = {
+	PIN_FIELD_BASE(0, 0, 8, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(1, 1, 8, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(2, 2, 11, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(3, 3, 11, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(4, 4, 11, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(5, 5, 11, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(6, 6, 11, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(7, 7, 11, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(8, 8, 11, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(9, 9, 9, 0x00c0, 0x10, 14, 1),
+	PIN_FIELD_BASE(10, 10, 9, 0x00c0, 0x10, 12, 1),
+	PIN_FIELD_BASE(11, 11, 8, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(12, 12, 9, 0x00c0, 0x10, 13, 1),
+	PIN_FIELD_BASE(13, 13, 6, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(14, 14, 3, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(15, 15, 6, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(16, 16, 6, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(17, 17, 6, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(18, 18, 6, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(19, 19, 6, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(20, 20, 3, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(21, 21, 2, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(22, 22, 2, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(23, 23, 2, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(24, 24, 2, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(25, 25, 2, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(26, 26, 2, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(27, 27, 2, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(28, 28, 2, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(29, 29, 2, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(30, 30, 2, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(31, 31, 2, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(32, 32, 1, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(33, 33, 1, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(34, 34, 1, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(35, 35, 1, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(36, 36, 1, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(37, 37, 1, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(38, 38, 1, 0x0090, 0x10, 14, 1),
+	PIN_FIELD_BASE(39, 39, 8, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(40, 40, 8, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(41, 41, 8, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(42, 42, 8, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(43, 43, 8, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(44, 44, 8, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(45, 45, 8, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(46, 46, 8, 0x00a0, 0x10, 10, 1),
+	PIN_FIELD_BASE(47, 47, 8, 0x00a0, 0x10, 13, 1),
+	PIN_FIELD_BASE(48, 48, 8, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(49, 49, 8, 0x00a0, 0x10, 14, 1),
+	PIN_FIELD_BASE(50, 50, 8, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(51, 51, 8, 0x00a0, 0x10, 15, 1),
+	PIN_FIELD_BASE(52, 52, 9, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(53, 53, 9, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(54, 54, 9, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(55, 55, 9, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(56, 56, 9, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(57, 57, 9, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(58, 58, 9, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(59, 59, 9, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(61, 61, 9, 0x00c0, 0x10, 10, 1),
+	PIN_FIELD_BASE(62, 62, 9, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(63, 63, 9, 0x00c0, 0x10, 18, 1),
+	PIN_FIELD_BASE(64, 64, 9, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(65, 65, 9, 0x00c0, 0x10, 11, 1),
+	PIN_FIELD_BASE(66, 66, 9, 0x00c0, 0x10, 24, 1),
+	PIN_FIELD_BASE(67, 67, 9, 0x00c0, 0x10, 21, 1),
+	PIN_FIELD_BASE(68, 68, 9, 0x00c0, 0x10, 20, 1),
+	PIN_FIELD_BASE(69, 69, 9, 0x00c0, 0x10, 25, 1),
+	PIN_FIELD_BASE(70, 70, 9, 0x00c0, 0x10, 16, 1),
+	PIN_FIELD_BASE(71, 71, 9, 0x00c0, 0x10, 15, 1),
+	PIN_FIELD_BASE(72, 72, 9, 0x00c0, 0x10, 23, 1),
+	PIN_FIELD_BASE(73, 73, 9, 0x00c0, 0x10, 19, 1),
+	PIN_FIELD_BASE(74, 74, 9, 0x00c0, 0x10, 17, 1),
+	PIN_FIELD_BASE(75, 75, 10, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(76, 76, 10, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(77, 77, 10, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(78, 78, 10, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(79, 79, 10, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(80, 80, 10, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(81, 81, 11, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(82, 82, 11, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(83, 83, 11, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(84, 84, 11, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(85, 85, 11, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(86, 86, 11, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(87, 87, 11, 0x0080, 0x10, 16, 1),
+	PIN_FIELD_BASE(88, 88, 11, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(89, 89, 11, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(90, 90, 11, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(91, 91, 12, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(92, 92, 12, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(93, 93, 12, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(94, 94, 12, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(95, 95, 12, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(96, 96, 12, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(97, 97, 12, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(98, 98, 12, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(99, 99, 12, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(100, 100, 12, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(101, 101, 12, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(102, 102, 12, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(103, 103, 12, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(104, 104, 12, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(105, 105, 12, 0x0090, 0x10, 14, 1),
+	PIN_FIELD_BASE(106, 106, 5, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(107, 107, 5, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(108, 108, 5, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(109, 109, 5, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(110, 110, 5, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(111, 111, 5, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(112, 112, 5, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(113, 113, 5, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(114, 114, 5, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(115, 115, 5, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(116, 116, 5, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(117, 117, 5, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(118, 118, 6, 0x00b0, 0x10, 9, 1),
+	PIN_FIELD_BASE(119, 119, 6, 0x00b0, 0x10, 10, 1),
+	PIN_FIELD_BASE(120, 120, 6, 0x00b0, 0x10, 12, 1),
+	PIN_FIELD_BASE(121, 121, 6, 0x00b0, 0x10, 11, 1),
+	PIN_FIELD_BASE(122, 122, 6, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(123, 123, 6, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(124, 124, 6, 0x00b0, 0x10, 8, 1),
+	PIN_FIELD_BASE(157, 157, 2, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(158, 158, 2, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(159, 159, 2, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(160, 160, 3, 0x0090, 0x10, 22, 1),
+	PIN_FIELD_BASE(161, 161, 3, 0x0090, 0x10, 20, 1),
+	PIN_FIELD_BASE(162, 162, 3, 0x0090, 0x10, 23, 1),
+	PIN_FIELD_BASE(163, 163, 3, 0x0090, 0x10, 21, 1),
+	PIN_FIELD_BASE(164, 164, 3, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(165, 165, 3, 0x0090, 0x10, 14, 1),
+	PIN_FIELD_BASE(166, 166, 3, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(167, 167, 3, 0x0090, 0x10, 15, 1),
+	PIN_FIELD_BASE(168, 168, 3, 0x0090, 0x10, 16, 1),
+	PIN_FIELD_BASE(169, 169, 3, 0x0090, 0x10, 17, 1),
+	PIN_FIELD_BASE(170, 170, 3, 0x0090, 0x10, 19, 1),
+	PIN_FIELD_BASE(171, 171, 3, 0x0090, 0x10, 18, 1),
+	PIN_FIELD_BASE(172, 172, 3, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(173, 173, 3, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(174, 174, 1, 0x0090, 0x10, 15, 1),
+	PIN_FIELD_BASE(175, 175, 1, 0x0090, 0x10, 16, 1),
+	PIN_FIELD_BASE(176, 176, 1, 0x0090, 0x10, 17, 1),
+	PIN_FIELD_BASE(177, 177, 1, 0x0090, 0x10, 18, 1),
+	PIN_FIELD_BASE(178, 178, 1, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(179, 179, 1, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(180, 180, 1, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(181, 181, 1, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(182, 182, 1, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(183, 183, 1, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(184, 184, 1, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(185, 185, 1, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(186, 186, 13, 0x00d0, 0x10, 4, 1),
+	PIN_FIELD_BASE(187, 187, 13, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(188, 188, 13, 0x00d0, 0x10, 12, 1),
+	PIN_FIELD_BASE(189, 189, 13, 0x00d0, 0x10, 17, 1),
+	PIN_FIELD_BASE(190, 190, 13, 0x00d0, 0x10, 13, 1),
+	PIN_FIELD_BASE(191, 191, 13, 0x00d0, 0x10, 18, 1),
+	PIN_FIELD_BASE(192, 192, 13, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(193, 193, 13, 0x00d0, 0x10, 6, 1),
+	PIN_FIELD_BASE(194, 194, 13, 0x00d0, 0x10, 14, 1),
+	PIN_FIELD_BASE(195, 195, 13, 0x00d0, 0x10, 19, 1),
+	PIN_FIELD_BASE(196, 196, 13, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(197, 197, 13, 0x00d0, 0x10, 7, 1),
+	PIN_FIELD_BASE(198, 198, 13, 0x00d0, 0x10, 15, 1),
+	PIN_FIELD_BASE(199, 199, 13, 0x00d0, 0x10, 20, 1),
+	PIN_FIELD_BASE(200, 200, 13, 0x00d0, 0x10, 22, 1),
+	PIN_FIELD_BASE(201, 201, 13, 0x00d0, 0x10, 25, 1),
+	PIN_FIELD_BASE(202, 202, 13, 0x00d0, 0x10, 16, 1),
+	PIN_FIELD_BASE(203, 203, 13, 0x00d0, 0x10, 21, 1),
+	PIN_FIELD_BASE(204, 204, 13, 0x00d0, 0x10, 2, 1),
+	PIN_FIELD_BASE(205, 205, 13, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(206, 206, 13, 0x00d0, 0x10, 8, 1),
+	PIN_FIELD_BASE(207, 207, 13, 0x00d0, 0x10, 9, 1),
+	PIN_FIELD_BASE(208, 208, 13, 0x00d0, 0x10, 10, 1),
+	PIN_FIELD_BASE(209, 209, 13, 0x00d0, 0x10, 11, 1),
+	PIN_FIELD_BASE(210, 210, 14, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(211, 211, 14, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(212, 212, 14, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(213, 213, 14, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(214, 214, 13, 0x00d0, 0x10, 23, 1),
+	PIN_FIELD_BASE(215, 215, 13, 0x00d0, 0x10, 24, 1),
+	PIN_FIELD_BASE(216, 216, 14, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(220, 220, 14, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(221, 221, 14, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(222, 222, 14, 0x00b0, 0x10, 8, 1),
+	PIN_FIELD_BASE(223, 223, 14, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(230, 230, 15, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(231, 231, 15, 0x0090, 0x10, 14, 1),
+	PIN_FIELD_BASE(232, 232, 15, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(233, 233, 15, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(234, 234, 15, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(235, 235, 15, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(236, 236, 15, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(237, 237, 15, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(238, 238, 15, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(239, 239, 15, 0x0090, 0x10, 19, 1),
+	PIN_FIELD_BASE(240, 240, 15, 0x0090, 0x10, 18, 1),
+	PIN_FIELD_BASE(241, 241, 15, 0x0090, 0x10, 16, 1),
+	PIN_FIELD_BASE(242, 242, 15, 0x0090, 0x10, 17, 1),
+	PIN_FIELD_BASE(243, 243, 15, 0x0090, 0x10, 15, 1),
+	PIN_FIELD_BASE(244, 244, 15, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(245, 245, 15, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(246, 246, 15, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(247, 247, 15, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(248, 248, 15, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(249, 249, 15, 0x0090, 0x10, 20, 1),
+	PIN_FIELD_BASE(250, 250, 15, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(251, 251, 3, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(252, 252, 3, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(253, 253, 3, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(254, 254, 3, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(255, 255, 3, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(256, 256, 3, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(257, 257, 3, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(258, 258, 3, 0x0090, 0x10, 9, 1),
+};
+
+static const struct mtk_pin_field_calc mt8196_pin_pd_range[] = {
+	PIN_FIELD_BASE(0, 0, 8, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(1, 1, 8, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(2, 2, 11, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(3, 3, 11, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(4, 4, 11, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(5, 5, 11, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(6, 6, 11, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(7, 7, 11, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(8, 8, 11, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(9, 9, 9, 0x00a0, 0x10, 14, 1),
+	PIN_FIELD_BASE(10, 10, 9, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(11, 11, 8, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(12, 12, 9, 0x00a0, 0x10, 13, 1),
+	PIN_FIELD_BASE(13, 13, 6, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(14, 14, 3, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(15, 15, 6, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(16, 16, 6, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(17, 17, 6, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(18, 18, 6, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(19, 19, 6, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(20, 20, 3, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(21, 21, 2, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(22, 22, 2, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(23, 23, 2, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(24, 24, 2, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(25, 25, 2, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(26, 26, 2, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(27, 27, 2, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(28, 28, 2, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(29, 29, 2, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(30, 30, 2, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(31, 31, 2, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(32, 32, 1, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(33, 33, 1, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(34, 34, 1, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(35, 35, 1, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(36, 36, 1, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(37, 37, 1, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(38, 38, 1, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(39, 39, 8, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(40, 40, 8, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(41, 41, 8, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(42, 42, 8, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(43, 43, 8, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(44, 44, 8, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(45, 45, 8, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(46, 46, 8, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(47, 47, 8, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(48, 48, 8, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(49, 49, 8, 0x0090, 0x10, 14, 1),
+	PIN_FIELD_BASE(50, 50, 8, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(51, 51, 8, 0x0090, 0x10, 15, 1),
+	PIN_FIELD_BASE(52, 52, 9, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(53, 53, 9, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(54, 54, 9, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(55, 55, 9, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(56, 56, 9, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(57, 57, 9, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(58, 58, 9, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(59, 59, 9, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(61, 61, 9, 0x00a0, 0x10, 10, 1),
+	PIN_FIELD_BASE(62, 62, 9, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(63, 63, 9, 0x00a0, 0x10, 18, 1),
+	PIN_FIELD_BASE(64, 64, 9, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(65, 65, 9, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(66, 66, 9, 0x00a0, 0x10, 24, 1),
+	PIN_FIELD_BASE(67, 67, 9, 0x00a0, 0x10, 21, 1),
+	PIN_FIELD_BASE(68, 68, 9, 0x00a0, 0x10, 20, 1),
+	PIN_FIELD_BASE(69, 69, 9, 0x00a0, 0x10, 25, 1),
+	PIN_FIELD_BASE(70, 70, 9, 0x00a0, 0x10, 16, 1),
+	PIN_FIELD_BASE(71, 71, 9, 0x00a0, 0x10, 15, 1),
+	PIN_FIELD_BASE(72, 72, 9, 0x00a0, 0x10, 23, 1),
+	PIN_FIELD_BASE(73, 73, 9, 0x00a0, 0x10, 19, 1),
+	PIN_FIELD_BASE(74, 74, 9, 0x00a0, 0x10, 17, 1),
+	PIN_FIELD_BASE(75, 75, 10, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(76, 76, 10, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(77, 77, 10, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(78, 78, 10, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(79, 79, 10, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(80, 80, 10, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(81, 81, 11, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(82, 82, 11, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(83, 83, 11, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(84, 84, 11, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(85, 85, 11, 0x0070, 0x10, 13, 1),
+	PIN_FIELD_BASE(86, 86, 11, 0x0070, 0x10, 14, 1),
+	PIN_FIELD_BASE(87, 87, 11, 0x0070, 0x10, 16, 1),
+	PIN_FIELD_BASE(88, 88, 11, 0x0070, 0x10, 15, 1),
+	PIN_FIELD_BASE(89, 89, 11, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(90, 90, 11, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(91, 91, 12, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(92, 92, 12, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(93, 93, 12, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(94, 94, 12, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(95, 95, 12, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(96, 96, 12, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(97, 97, 12, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(98, 98, 12, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(99, 99, 12, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(100, 100, 12, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(101, 101, 12, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(102, 102, 12, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(103, 103, 12, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(104, 104, 12, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(105, 105, 12, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(106, 106, 5, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(107, 107, 5, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(108, 108, 5, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(109, 109, 5, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(110, 110, 5, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(111, 111, 5, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(112, 112, 5, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(113, 113, 5, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(114, 114, 5, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(115, 115, 5, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(116, 116, 5, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(117, 117, 5, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(118, 118, 6, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(119, 119, 6, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(120, 120, 6, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(121, 121, 6, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(122, 122, 6, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(123, 123, 6, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(124, 124, 6, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(157, 157, 2, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(158, 158, 2, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(159, 159, 2, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(160, 160, 3, 0x0080, 0x10, 22, 1),
+	PIN_FIELD_BASE(161, 161, 3, 0x0080, 0x10, 20, 1),
+	PIN_FIELD_BASE(162, 162, 3, 0x0080, 0x10, 23, 1),
+	PIN_FIELD_BASE(163, 163, 3, 0x0080, 0x10, 21, 1),
+	PIN_FIELD_BASE(164, 164, 3, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(165, 165, 3, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(166, 166, 3, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(167, 167, 3, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(168, 168, 3, 0x0080, 0x10, 16, 1),
+	PIN_FIELD_BASE(169, 169, 3, 0x0080, 0x10, 17, 1),
+	PIN_FIELD_BASE(170, 170, 3, 0x0080, 0x10, 19, 1),
+	PIN_FIELD_BASE(171, 171, 3, 0x0080, 0x10, 18, 1),
+	PIN_FIELD_BASE(172, 172, 3, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(173, 173, 3, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(174, 174, 1, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(175, 175, 1, 0x0080, 0x10, 16, 1),
+	PIN_FIELD_BASE(176, 176, 1, 0x0080, 0x10, 17, 1),
+	PIN_FIELD_BASE(177, 177, 1, 0x0080, 0x10, 18, 1),
+	PIN_FIELD_BASE(178, 178, 1, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(179, 179, 1, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(180, 180, 1, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(181, 181, 1, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(182, 182, 1, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(183, 183, 1, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(184, 184, 1, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(185, 185, 1, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(186, 186, 13, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(187, 187, 13, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(188, 188, 13, 0x00c0, 0x10, 12, 1),
+	PIN_FIELD_BASE(189, 189, 13, 0x00c0, 0x10, 17, 1),
+	PIN_FIELD_BASE(190, 190, 13, 0x00c0, 0x10, 13, 1),
+	PIN_FIELD_BASE(191, 191, 13, 0x00c0, 0x10, 18, 1),
+	PIN_FIELD_BASE(192, 192, 13, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(193, 193, 13, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(194, 194, 13, 0x00c0, 0x10, 14, 1),
+	PIN_FIELD_BASE(195, 195, 13, 0x00c0, 0x10, 19, 1),
+	PIN_FIELD_BASE(196, 196, 13, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(197, 197, 13, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(198, 198, 13, 0x00c0, 0x10, 15, 1),
+	PIN_FIELD_BASE(199, 199, 13, 0x00c0, 0x10, 20, 1),
+	PIN_FIELD_BASE(200, 200, 13, 0x00c0, 0x10, 22, 1),
+	PIN_FIELD_BASE(201, 201, 13, 0x00c0, 0x10, 25, 1),
+	PIN_FIELD_BASE(202, 202, 13, 0x00c0, 0x10, 16, 1),
+	PIN_FIELD_BASE(203, 203, 13, 0x00c0, 0x10, 21, 1),
+	PIN_FIELD_BASE(204, 204, 13, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(205, 205, 13, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(206, 206, 13, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(207, 207, 13, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(208, 208, 13, 0x00c0, 0x10, 10, 1),
+	PIN_FIELD_BASE(209, 209, 13, 0x00c0, 0x10, 11, 1),
+	PIN_FIELD_BASE(210, 210, 14, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(211, 211, 14, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(212, 212, 14, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(213, 213, 14, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(214, 214, 13, 0x00c0, 0x10, 23, 1),
+	PIN_FIELD_BASE(215, 215, 13, 0x00c0, 0x10, 24, 1),
+	PIN_FIELD_BASE(216, 216, 14, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(220, 220, 14, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(221, 221, 14, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(222, 222, 14, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(223, 223, 14, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(230, 230, 15, 0x0070, 0x10, 13, 1),
+	PIN_FIELD_BASE(231, 231, 15, 0x0070, 0x10, 14, 1),
+	PIN_FIELD_BASE(232, 232, 15, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(233, 233, 15, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(234, 234, 15, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(235, 235, 15, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(236, 236, 15, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(237, 237, 15, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(238, 238, 15, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(239, 239, 15, 0x0070, 0x10, 19, 1),
+	PIN_FIELD_BASE(240, 240, 15, 0x0070, 0x10, 18, 1),
+	PIN_FIELD_BASE(241, 241, 15, 0x0070, 0x10, 16, 1),
+	PIN_FIELD_BASE(242, 242, 15, 0x0070, 0x10, 17, 1),
+	PIN_FIELD_BASE(243, 243, 15, 0x0070, 0x10, 15, 1),
+	PIN_FIELD_BASE(244, 244, 15, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(245, 245, 15, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(246, 246, 15, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(247, 247, 15, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(248, 248, 15, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(249, 249, 15, 0x0070, 0x10, 20, 1),
+	PIN_FIELD_BASE(250, 250, 15, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(251, 251, 3, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(252, 252, 3, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(253, 253, 3, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(254, 254, 3, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(255, 255, 3, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(256, 256, 3, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(257, 257, 3, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(258, 258, 3, 0x0080, 0x10, 9, 1),
+};
+
+static const struct mtk_pin_field_calc mt8196_pin_drv_range[] = {
+	PIN_FIELD_BASE(0, 0, 8, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(1, 1, 8, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(2, 2, 11, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(3, 3, 11, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(4, 4, 11, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(5, 5, 11, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(6, 6, 11, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(7, 7, 11, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(8, 8, 11, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(9, 9, 9, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(10, 10, 9, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(11, 11, 8, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(12, 12, 9, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(13, 13, 6, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(14, 14, 3, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(15, 15, 6, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(16, 16, 6, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(17, 17, 6, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(18, 18, 6, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(19, 19, 6, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(20, 20, 3, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(21, 21, 2, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(22, 22, 2, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(23, 23, 2, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(24, 24, 2, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(25, 25, 2, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(26, 26, 2, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(27, 27, 2, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(28, 28, 2, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(29, 29, 2, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(30, 30, 2, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(31, 31, 2, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(32, 32, 1, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(33, 33, 1, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(34, 34, 1, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(35, 35, 1, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(36, 36, 1, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(37, 37, 1, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(38, 38, 1, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(39, 39, 8, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(40, 40, 8, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(41, 41, 8, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(42, 42, 8, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(43, 43, 8, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(44, 44, 8, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(45, 45, 8, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(46, 46, 8, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(47, 47, 8, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(48, 48, 8, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(49, 49, 8, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(50, 50, 8, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(51, 51, 8, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(52, 52, 9, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(53, 53, 9, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(54, 54, 9, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(55, 55, 9, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(56, 56, 9, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(57, 57, 9, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(58, 58, 9, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(59, 59, 9, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(60, 60, 9, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(61, 61, 9, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(62, 62, 9, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(63, 63, 9, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(64, 64, 9, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(65, 65, 9, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(66, 66, 9, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(67, 67, 9, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(68, 68, 9, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(69, 69, 9, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(70, 70, 9, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(71, 71, 9, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(72, 72, 9, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(73, 73, 9, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(74, 74, 9, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(75, 75, 10, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(76, 76, 10, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(77, 77, 10, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(78, 78, 10, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(79, 79, 10, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(80, 80, 10, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(81, 81, 11, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(82, 82, 11, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(83, 83, 11, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(84, 84, 11, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(85, 85, 11, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(86, 86, 11, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(87, 87, 11, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(88, 88, 11, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(89, 89, 11, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(90, 90, 11, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(91, 91, 12, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(92, 92, 12, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(93, 93, 12, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(94, 94, 12, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(95, 95, 12, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(96, 96, 12, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(97, 97, 12, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(98, 98, 12, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(99, 99, 12, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(100, 100, 12, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(101, 101, 12, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(102, 102, 12, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(103, 103, 12, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(104, 104, 12, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(105, 105, 12, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(106, 106, 5, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(107, 107, 5, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(108, 108, 5, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(109, 109, 5, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(110, 110, 5, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(111, 111, 5, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(112, 112, 5, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(113, 113, 5, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(114, 114, 5, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(115, 115, 5, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(116, 116, 5, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(117, 117, 5, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(118, 118, 6, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(119, 119, 6, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(120, 120, 6, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(121, 121, 6, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(122, 122, 6, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(123, 123, 6, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(124, 124, 6, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(125, 125, 7, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(126, 126, 7, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(127, 127, 7, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(128, 128, 7, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(129, 129, 7, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(130, 130, 7, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(131, 131, 7, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(132, 132, 7, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(133, 133, 7, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(134, 134, 7, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(135, 135, 7, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(136, 136, 7, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(137, 137, 4, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(138, 138, 4, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(139, 139, 4, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(140, 140, 4, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(141, 141, 4, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(142, 142, 4, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(143, 143, 4, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(144, 144, 4, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(145, 145, 4, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(146, 146, 4, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(147, 147, 4, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(148, 148, 4, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(149, 149, 4, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(150, 150, 4, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(151, 151, 4, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(152, 152, 4, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(153, 153, 4, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(154, 154, 4, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(155, 155, 4, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(156, 156, 4, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(157, 157, 2, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(158, 158, 2, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(159, 159, 2, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(160, 160, 3, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(161, 161, 3, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(162, 162, 3, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(163, 163, 3, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(164, 164, 3, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(165, 165, 3, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(166, 166, 3, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(167, 167, 3, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(168, 168, 3, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(169, 169, 3, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(170, 170, 3, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(171, 171, 3, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(172, 172, 3, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(173, 173, 3, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(174, 174, 1, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(175, 175, 1, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(176, 176, 1, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(177, 177, 1, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(178, 178, 1, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(179, 179, 1, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(180, 180, 1, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(181, 181, 1, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(182, 182, 1, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(183, 183, 1, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(184, 184, 1, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(185, 185, 1, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(186, 186, 13, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(187, 187, 13, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(188, 188, 13, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(189, 189, 13, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(190, 190, 13, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(191, 191, 13, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(192, 192, 13, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(193, 193, 13, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(194, 194, 13, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(195, 195, 13, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(196, 196, 13, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(197, 197, 13, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(198, 198, 13, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(199, 199, 13, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(200, 200, 13, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(201, 201, 13, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(202, 202, 13, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(203, 203, 13, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(204, 204, 13, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(205, 205, 13, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(206, 206, 13, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(207, 207, 13, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(208, 208, 13, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(209, 209, 13, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(210, 210, 14, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(211, 211, 14, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(212, 212, 14, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(213, 213, 14, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(214, 214, 13, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(215, 215, 13, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(216, 216, 14, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(217, 217, 14, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(218, 218, 14, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(219, 219, 14, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(220, 220, 14, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(221, 221, 14, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(222, 222, 14, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(223, 223, 14, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(224, 224, 14, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(225, 225, 14, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(226, 226, 14, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(227, 227, 14, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(228, 228, 14, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(229, 229, 14, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(230, 230, 15, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(231, 231, 15, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(232, 232, 15, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(233, 233, 15, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(234, 234, 15, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(235, 235, 15, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(236, 236, 15, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(237, 237, 15, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(238, 238, 15, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(239, 239, 15, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(240, 240, 15, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(241, 241, 15, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(242, 242, 15, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(243, 243, 15, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(244, 244, 15, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(245, 245, 15, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(246, 246, 15, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(247, 247, 15, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(248, 248, 15, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(249, 249, 15, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(250, 250, 15, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(251, 251, 3, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(252, 252, 3, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(253, 253, 3, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(254, 254, 3, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(255, 255, 3, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(256, 256, 3, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(257, 257, 3, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(258, 258, 3, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(259, 259, 14, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(260, 260, 14, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(261, 261, 14, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(262, 262, 14, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(263, 263, 14, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(264, 264, 14, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(265, 265, 14, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(266, 266, 14, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(267, 267, 15, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(268, 268, 15, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(269, 269, 15, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(270, 270, 15, 0x0000, 0x10, 21, 3),
+};
+
+static const struct mtk_pin_field_calc mt8196_pin_drv_adv_range[] = {
+	PIN_FIELD_BASE(46, 46, 8, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(47, 47, 8, 0x0030, 0x10, 9, 3),
+	PIN_FIELD_BASE(48, 48, 8, 0x0030, 0x10, 3, 3),
+	PIN_FIELD_BASE(49, 49, 8, 0x0030, 0x10, 12, 3),
+	PIN_FIELD_BASE(50, 50, 8, 0x0030, 0x10, 6, 3),
+	PIN_FIELD_BASE(51, 51, 8, 0x0030, 0x10, 15, 3),
+	PIN_FIELD_BASE(52, 52, 9, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(53, 53, 9, 0x0030, 0x10, 3, 3),
+	PIN_FIELD_BASE(75, 75, 10, 0x0020, 0x10, 0, 5),
+	PIN_FIELD_BASE(76, 76, 10, 0x0020, 0x10, 5, 5),
+	PIN_FIELD_BASE(77, 77, 10, 0x0020, 0x10, 10, 5),
+	PIN_FIELD_BASE(78, 78, 10, 0x0020, 0x10, 15, 5),
+	PIN_FIELD_BASE(99, 99, 12, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(100, 100, 12, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(101, 101, 12, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(102, 102, 12, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(104, 104, 12, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(105, 105, 12, 0x0020, 0x10, 15, 3),
+	PIN_FIELD_BASE(123, 123, 6, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(124, 124, 6, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(164, 164, 3, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(165, 165, 3, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(166, 166, 3, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(167, 167, 3, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(168, 168, 3, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(170, 170, 3, 0x0020, 0x10, 15, 3),
+	PIN_FIELD_BASE(176, 176, 1, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(177, 177, 1, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(188, 188, 13, 0x0040, 0x10, 0, 3),
+	PIN_FIELD_BASE(189, 189, 13, 0x0040, 0x10, 15, 3),
+	PIN_FIELD_BASE(190, 190, 13, 0x0040, 0x10, 3, 3),
+	PIN_FIELD_BASE(191, 191, 13, 0x0040, 0x10, 18, 3),
+	PIN_FIELD_BASE(194, 194, 13, 0x0040, 0x10, 6, 3),
+	PIN_FIELD_BASE(195, 195, 13, 0x0040, 0x10, 21, 3),
+	PIN_FIELD_BASE(198, 198, 13, 0x0040, 0x10, 9, 3),
+	PIN_FIELD_BASE(199, 199, 13, 0x0040, 0x10, 24, 3),
+	PIN_FIELD_BASE(200, 200, 13, 0x0050, 0x10, 0, 3),
+	PIN_FIELD_BASE(201, 201, 13, 0x0050, 0x10, 9, 3),
+	PIN_FIELD_BASE(202, 202, 13, 0x0040, 0x10, 12, 3),
+	PIN_FIELD_BASE(203, 203, 13, 0x0040, 0x10, 27, 3),
+	PIN_FIELD_BASE(214, 214, 13, 0x0050, 0x10, 3, 3),
+	PIN_FIELD_BASE(215, 215, 13, 0x0050, 0x10, 6, 3),
+};
+
+static const struct mtk_pin_field_calc mt8196_pin_rsel_range[] = {
+	PIN_FIELD_BASE(46, 46, 8, 0x00c0, 0x10, 0, 3),
+	PIN_FIELD_BASE(47, 47, 8, 0x00c0, 0x10, 9, 3),
+	PIN_FIELD_BASE(48, 48, 8, 0x00c0, 0x10, 3, 3),
+	PIN_FIELD_BASE(49, 49, 8, 0x00c0, 0x10, 12, 3),
+	PIN_FIELD_BASE(50, 50, 8, 0x00c0, 0x10, 6, 3),
+	PIN_FIELD_BASE(51, 51, 8, 0x00c0, 0x10, 15, 3),
+	PIN_FIELD_BASE(52, 52, 9, 0x0110, 0x10, 0, 3),
+	PIN_FIELD_BASE(53, 53, 9, 0x0110, 0x10, 3, 3),
+	PIN_FIELD_BASE(99, 99, 12, 0x00b0, 0x10, 0, 3),
+	PIN_FIELD_BASE(100, 100, 12, 0x00b0, 0x10, 9, 3),
+	PIN_FIELD_BASE(101, 101, 12, 0x00b0, 0x10, 3, 3),
+	PIN_FIELD_BASE(102, 102, 12, 0x00b0, 0x10, 12, 3),
+	PIN_FIELD_BASE(104, 104, 12, 0x00b0, 0x10, 6, 3),
+	PIN_FIELD_BASE(105, 105, 12, 0x00b0, 0x10, 15, 3),
+	PIN_FIELD_BASE(123, 123, 6, 0x0100, 0x10, 0, 3),
+	PIN_FIELD_BASE(124, 124, 6, 0x0100, 0x10, 3, 3),
+	PIN_FIELD_BASE(164, 164, 3, 0x00b0, 0x10, 0, 3),
+	PIN_FIELD_BASE(165, 165, 3, 0x00b0, 0x10, 6, 3),
+	PIN_FIELD_BASE(166, 166, 3, 0x00b0, 0x10, 3, 3),
+	PIN_FIELD_BASE(167, 167, 3, 0x00b0, 0x10, 9, 3),
+	PIN_FIELD_BASE(168, 168, 3, 0x00b0, 0x10, 12, 3),
+	PIN_FIELD_BASE(170, 170, 3, 0x00b0, 0x10, 15, 3),
+	PIN_FIELD_BASE(176, 176, 1, 0x00b0, 0x10, 0, 3),
+	PIN_FIELD_BASE(177, 177, 1, 0x00b0, 0x10, 3, 3),
+	PIN_FIELD_BASE(188, 188, 13, 0x00f0, 0x10, 0, 3),
+	PIN_FIELD_BASE(189, 189, 13, 0x00f0, 0x10, 15, 3),
+	PIN_FIELD_BASE(190, 190, 13, 0x00f0, 0x10, 3, 3),
+	PIN_FIELD_BASE(191, 191, 13, 0x00f0, 0x10, 18, 3),
+	PIN_FIELD_BASE(194, 194, 13, 0x00f0, 0x10, 6, 3),
+	PIN_FIELD_BASE(195, 195, 13, 0x00f0, 0x10, 21, 3),
+	PIN_FIELD_BASE(198, 198, 13, 0x00f0, 0x10, 9, 3),
+	PIN_FIELD_BASE(199, 199, 13, 0x00f0, 0x10, 24, 3),
+	PIN_FIELD_BASE(200, 200, 13, 0x0100, 0x10, 0, 3),
+	PIN_FIELD_BASE(201, 201, 13, 0x0100, 0x10, 9, 3),
+	PIN_FIELD_BASE(202, 202, 13, 0x00f0, 0x10, 12, 3),
+	PIN_FIELD_BASE(203, 203, 13, 0x00f0, 0x10, 27, 3),
+	PIN_FIELD_BASE(214, 214, 13, 0x0100, 0x10, 3, 3),
+	PIN_FIELD_BASE(215, 215, 13, 0x0100, 0x10, 6, 3),
+};
+
+static const unsigned int mt8196_pull_type[] = {
+	MTK_PULL_PU_PD_TYPE,/*0*/		MTK_PULL_PU_PD_TYPE,/*1*/
+	MTK_PULL_PU_PD_TYPE,/*2*/		MTK_PULL_PU_PD_TYPE,/*3*/
+	MTK_PULL_PU_PD_TYPE,/*4*/		MTK_PULL_PU_PD_TYPE,/*5*/
+	MTK_PULL_PU_PD_TYPE,/*6*/		MTK_PULL_PU_PD_TYPE,/*7*/
+	MTK_PULL_PU_PD_TYPE,/*8*/		MTK_PULL_PU_PD_TYPE,/*9*/
+	MTK_PULL_PU_PD_TYPE,/*10*/		MTK_PULL_PU_PD_TYPE,/*11*/
+	MTK_PULL_PU_PD_TYPE,/*12*/		MTK_PULL_PU_PD_TYPE,/*13*/
+	MTK_PULL_PU_PD_TYPE,/*14*/		MTK_PULL_PU_PD_TYPE,/*15*/
+	MTK_PULL_PU_PD_TYPE,/*16*/		MTK_PULL_PU_PD_TYPE,/*17*/
+	MTK_PULL_PU_PD_TYPE,/*18*/		MTK_PULL_PU_PD_TYPE,/*19*/
+	MTK_PULL_PU_PD_TYPE,/*20*/		MTK_PULL_PU_PD_TYPE,/*21*/
+	MTK_PULL_PU_PD_TYPE,/*22*/		MTK_PULL_PU_PD_TYPE,/*23*/
+	MTK_PULL_PU_PD_TYPE,/*24*/		MTK_PULL_PU_PD_TYPE,/*25*/
+	MTK_PULL_PU_PD_TYPE,/*26*/		MTK_PULL_PU_PD_TYPE,/*27*/
+	MTK_PULL_PU_PD_TYPE,/*28*/		MTK_PULL_PU_PD_TYPE,/*29*/
+	MTK_PULL_PU_PD_TYPE,/*30*/		MTK_PULL_PU_PD_TYPE,/*31*/
+	MTK_PULL_PU_PD_TYPE,/*32*/		MTK_PULL_PU_PD_TYPE,/*33*/
+	MTK_PULL_PU_PD_TYPE,/*34*/		MTK_PULL_PU_PD_TYPE,/*35*/
+	MTK_PULL_PU_PD_TYPE,/*36*/		MTK_PULL_PU_PD_TYPE,/*37*/
+	MTK_PULL_PU_PD_TYPE,/*38*/		MTK_PULL_PU_PD_TYPE,/*39*/
+	MTK_PULL_PU_PD_TYPE,/*40*/		MTK_PULL_PU_PD_TYPE,/*41*/
+	MTK_PULL_PU_PD_TYPE,/*42*/		MTK_PULL_PU_PD_TYPE,/*43*/
+	MTK_PULL_PU_PD_TYPE,/*44*/		MTK_PULL_PU_PD_TYPE,/*45*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*46*/		MTK_PULL_PU_PD_RSEL_TYPE,/*47*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*48*/		MTK_PULL_PU_PD_RSEL_TYPE,/*49*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*50*/		MTK_PULL_PU_PD_RSEL_TYPE,/*51*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*52*/		MTK_PULL_PU_PD_RSEL_TYPE,/*53*/
+	MTK_PULL_PU_PD_TYPE,/*54*/		MTK_PULL_PU_PD_TYPE,/*55*/
+	MTK_PULL_PU_PD_TYPE,/*56*/		MTK_PULL_PU_PD_TYPE,/*57*/
+	MTK_PULL_PU_PD_TYPE,/*58*/		MTK_PULL_PU_PD_TYPE,/*59*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*60*/		MTK_PULL_PU_PD_TYPE,/*61*/
+	MTK_PULL_PU_PD_TYPE,/*62*/		MTK_PULL_PU_PD_TYPE,/*63*/
+	MTK_PULL_PU_PD_TYPE,/*64*/		MTK_PULL_PU_PD_TYPE,/*65*/
+	MTK_PULL_PU_PD_TYPE,/*66*/		MTK_PULL_PU_PD_TYPE,/*67*/
+	MTK_PULL_PU_PD_TYPE,/*68*/		MTK_PULL_PU_PD_TYPE,/*69*/
+	MTK_PULL_PU_PD_TYPE,/*70*/		MTK_PULL_PU_PD_TYPE,/*71*/
+	MTK_PULL_PU_PD_TYPE,/*72*/		MTK_PULL_PU_PD_TYPE,/*73*/
+	MTK_PULL_PU_PD_TYPE,/*74*/		MTK_PULL_PU_PD_TYPE,/*75*/
+	MTK_PULL_PU_PD_TYPE,/*76*/		MTK_PULL_PU_PD_TYPE,/*77*/
+	MTK_PULL_PU_PD_TYPE,/*78*/		MTK_PULL_PU_PD_TYPE,/*79*/
+	MTK_PULL_PU_PD_TYPE,/*80*/		MTK_PULL_PU_PD_TYPE,/*81*/
+	MTK_PULL_PU_PD_TYPE,/*82*/		MTK_PULL_PU_PD_TYPE,/*83*/
+	MTK_PULL_PU_PD_TYPE,/*84*/		MTK_PULL_PU_PD_TYPE,/*85*/
+	MTK_PULL_PU_PD_TYPE,/*86*/		MTK_PULL_PU_PD_TYPE,/*87*/
+	MTK_PULL_PU_PD_TYPE,/*88*/		MTK_PULL_PU_PD_TYPE,/*89*/
+	MTK_PULL_PU_PD_TYPE,/*90*/		MTK_PULL_PU_PD_TYPE,/*91*/
+	MTK_PULL_PU_PD_TYPE,/*92*/		MTK_PULL_PU_PD_TYPE,/*93*/
+	MTK_PULL_PU_PD_TYPE,/*94*/		MTK_PULL_PU_PD_TYPE,/*95*/
+	MTK_PULL_PU_PD_TYPE,/*96*/		MTK_PULL_PU_PD_TYPE,/*97*/
+	MTK_PULL_PU_PD_TYPE,/*98*/		MTK_PULL_PU_PD_RSEL_TYPE,/*99*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*100*/	MTK_PULL_PU_PD_RSEL_TYPE,/*101*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*102*/	MTK_PULL_PU_PD_TYPE,/*103*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*104*/	MTK_PULL_PU_PD_RSEL_TYPE,/*105*/
+	MTK_PULL_PU_PD_TYPE,/*106*/		MTK_PULL_PU_PD_TYPE,/*107*/
+	MTK_PULL_PU_PD_TYPE,/*108*/		MTK_PULL_PU_PD_TYPE,/*109*/
+	MTK_PULL_PU_PD_TYPE,/*110*/		MTK_PULL_PU_PD_TYPE,/*111*/
+	MTK_PULL_PU_PD_TYPE,/*112*/		MTK_PULL_PU_PD_TYPE,/*113*/
+	MTK_PULL_PU_PD_TYPE,/*114*/		MTK_PULL_PU_PD_TYPE,/*115*/
+	MTK_PULL_PU_PD_TYPE,/*116*/		MTK_PULL_PU_PD_TYPE,/*117*/
+	MTK_PULL_PU_PD_TYPE,/*118*/		MTK_PULL_PU_PD_TYPE,/*119*/
+	MTK_PULL_PU_PD_TYPE,/*120*/		MTK_PULL_PU_PD_TYPE,/*121*/
+	MTK_PULL_PU_PD_TYPE,/*122*/		MTK_PULL_PU_PD_RSEL_TYPE,/*123*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*124*/	MTK_PULL_PUPD_R1R0_TYPE,/*125*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*126*/		MTK_PULL_PUPD_R1R0_TYPE,/*127*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*128*/		MTK_PULL_PUPD_R1R0_TYPE,/*129*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*130*/		MTK_PULL_PUPD_R1R0_TYPE,/*131*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*132*/		MTK_PULL_PUPD_R1R0_TYPE,/*133*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*134*/		MTK_PULL_PUPD_R1R0_TYPE,/*135*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*136*/		MTK_PULL_PUPD_R1R0_TYPE,/*137*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*138*/		MTK_PULL_PUPD_R1R0_TYPE,/*139*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*140*/		MTK_PULL_PUPD_R1R0_TYPE,/*141*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*142*/		MTK_PULL_PUPD_R1R0_TYPE,/*143*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*144*/		MTK_PULL_PUPD_R1R0_TYPE,/*145*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*146*/		MTK_PULL_PUPD_R1R0_TYPE,/*147*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*148*/		MTK_PULL_PUPD_R1R0_TYPE,/*149*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*150*/		MTK_PULL_PUPD_R1R0_TYPE,/*151*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*152*/		MTK_PULL_PUPD_R1R0_TYPE,/*153*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*154*/		MTK_PULL_PUPD_R1R0_TYPE,/*155*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*156*/		MTK_PULL_PU_PD_TYPE,/*157*/
+	MTK_PULL_PU_PD_TYPE,/*158*/		MTK_PULL_PU_PD_TYPE,/*159*/
+	MTK_PULL_PU_PD_TYPE,/*160*/		MTK_PULL_PU_PD_TYPE,/*161*/
+	MTK_PULL_PU_PD_TYPE,/*162*/		MTK_PULL_PU_PD_TYPE,/*163*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*164*/	MTK_PULL_PU_PD_RSEL_TYPE,/*165*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*166*/	MTK_PULL_PU_PD_RSEL_TYPE,/*167*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*168*/	MTK_PULL_PU_PD_TYPE,/*169*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*170*/	MTK_PULL_PU_PD_TYPE,/*171*/
+	MTK_PULL_PU_PD_TYPE,/*172*/		MTK_PULL_PU_PD_TYPE,/*173*/
+	MTK_PULL_PU_PD_TYPE,/*174*/		MTK_PULL_PU_PD_TYPE,/*175*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*176*/	MTK_PULL_PU_PD_RSEL_TYPE,/*177*/
+	MTK_PULL_PU_PD_TYPE,/*178*/		MTK_PULL_PU_PD_TYPE,/*179*/
+	MTK_PULL_PU_PD_TYPE,/*180*/		MTK_PULL_PU_PD_TYPE,/*181*/
+	MTK_PULL_PU_PD_TYPE,/*182*/		MTK_PULL_PU_PD_TYPE,/*183*/
+	MTK_PULL_PU_PD_TYPE,/*184*/		MTK_PULL_PU_PD_TYPE,/*185*/
+	MTK_PULL_PU_PD_TYPE,/*186*/		MTK_PULL_PU_PD_TYPE,/*187*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*188*/	MTK_PULL_PU_PD_RSEL_TYPE,/*189*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*190*/	MTK_PULL_PU_PD_RSEL_TYPE,/*191*/
+	MTK_PULL_PU_PD_TYPE,/*192*/		MTK_PULL_PU_PD_TYPE,/*193*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*194*/	MTK_PULL_PU_PD_RSEL_TYPE,/*195*/
+	MTK_PULL_PU_PD_TYPE,/*196*/		MTK_PULL_PU_PD_TYPE,/*197*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*198*/	MTK_PULL_PU_PD_RSEL_TYPE,/*199*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*200*/	MTK_PULL_PU_PD_RSEL_TYPE,/*201*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*202*/	MTK_PULL_PU_PD_RSEL_TYPE,/*203*/
+	MTK_PULL_PU_PD_TYPE,/*204*/		MTK_PULL_PU_PD_TYPE,/*205*/
+	MTK_PULL_PU_PD_TYPE,/*206*/		MTK_PULL_PU_PD_TYPE,/*207*/
+	MTK_PULL_PU_PD_TYPE,/*208*/		MTK_PULL_PU_PD_TYPE,/*209*/
+	MTK_PULL_PU_PD_TYPE,/*210*/		MTK_PULL_PU_PD_TYPE,/*211*/
+	MTK_PULL_PU_PD_TYPE,/*212*/		MTK_PULL_PU_PD_TYPE,/*213*/
+	MTK_PULL_PU_PD_RSEL_TYPE,/*214*/	MTK_PULL_PU_PD_RSEL_TYPE,/*215*/
+	MTK_PULL_PU_PD_TYPE,/*216*/		MTK_PULL_PUPD_R1R0_TYPE,/*217*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*218*/		MTK_PULL_PUPD_R1R0_TYPE,/*219*/
+	MTK_PULL_PU_PD_TYPE,/*220*/		MTK_PULL_PU_PD_TYPE,/*221*/
+	MTK_PULL_PU_PD_TYPE,/*222*/		MTK_PULL_PU_PD_TYPE,/*223*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*224*/		MTK_PULL_PUPD_R1R0_TYPE,/*225*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*226*/		MTK_PULL_PUPD_R1R0_TYPE,/*227*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*228*/		MTK_PULL_PUPD_R1R0_TYPE,/*229*/
+	MTK_PULL_PU_PD_TYPE,/*230*/		MTK_PULL_PU_PD_TYPE,/*231*/
+	MTK_PULL_PU_PD_TYPE,/*232*/		MTK_PULL_PU_PD_TYPE,/*233*/
+	MTK_PULL_PU_PD_TYPE,/*234*/		MTK_PULL_PU_PD_TYPE,/*235*/
+	MTK_PULL_PU_PD_TYPE,/*236*/		MTK_PULL_PU_PD_TYPE,/*237*/
+	MTK_PULL_PU_PD_TYPE,/*238*/		MTK_PULL_PU_PD_TYPE,/*239*/
+	MTK_PULL_PU_PD_TYPE,/*240*/		MTK_PULL_PU_PD_TYPE,/*241*/
+	MTK_PULL_PU_PD_TYPE,/*242*/		MTK_PULL_PU_PD_TYPE,/*243*/
+	MTK_PULL_PU_PD_TYPE,/*244*/		MTK_PULL_PU_PD_TYPE,/*245*/
+	MTK_PULL_PU_PD_TYPE,/*246*/		MTK_PULL_PU_PD_TYPE,/*247*/
+	MTK_PULL_PU_PD_TYPE,/*248*/		MTK_PULL_PU_PD_TYPE,/*249*/
+	MTK_PULL_PU_PD_TYPE,/*250*/		MTK_PULL_PU_PD_TYPE,/*251*/
+	MTK_PULL_PU_PD_TYPE,/*252*/		MTK_PULL_PU_PD_TYPE,/*253*/
+	MTK_PULL_PU_PD_TYPE,/*254*/		MTK_PULL_PU_PD_TYPE,/*255*/
+	MTK_PULL_PU_PD_TYPE,/*256*/		MTK_PULL_PU_PD_TYPE,/*257*/
+	MTK_PULL_PU_PD_TYPE,/*258*/		MTK_PULL_PUPD_R1R0_TYPE,/*259*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*260*/		MTK_PULL_PUPD_R1R0_TYPE,/*261*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*262*/		MTK_PULL_PUPD_R1R0_TYPE,/*263*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*264*/		MTK_PULL_PUPD_R1R0_TYPE,/*265*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*266*/		MTK_PULL_PUPD_R1R0_TYPE,/*267*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*268*/		MTK_PULL_PUPD_R1R0_TYPE,/*269*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*270*/
+};
+
+static const struct mtk_pin_reg_calc mt8196_reg_cals[PINCTRL_PIN_REG_MAX] = {
+	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8196_pin_mode_range),
+	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8196_pin_dir_range),
+	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt8196_pin_di_range),
+	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt8196_pin_do_range),
+	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt8196_pin_smt_range),
+	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt8196_pin_ies_range),
+	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt8196_pin_pupd_range),
+	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8196_pin_r0_range),
+	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8196_pin_r1_range),
+	[PINCTRL_PIN_REG_PU] = MTK_RANGE(mt8196_pin_pu_range),
+	[PINCTRL_PIN_REG_PD] = MTK_RANGE(mt8196_pin_pd_range),
+	[PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt8196_pin_drv_range),
+	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8196_pin_drv_adv_range),
+	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt8196_pin_rsel_range),
+};
+
+static const char * const mt8196_pinctrl_register_base_names[] = {
+	"iocfg0", "iocfg_rt", "iocfg_rm1", "iocfg_rm2",
+	"iocfg_rb", "iocfg_bm1", "iocfg_bm2", "iocfg_bm3",
+	"iocfg_lt", "iocfg_lm1", "iocfg_lm2", "iocfg_lb1",
+	"iocfg_lb2", "iocfg_tm1", "iocfg_tm2", "iocfg_tm3",
+};
+
+static const struct mtk_eint_hw mt8196_eint_hw = {
+	.port_mask = 0xf,
+	.ports     = 3,
+	.ap_num    = 293,
+	.db_cnt    = 32,
+	.db_time   = debounce_time_mt6765,
+};
+
+static const struct mtk_pin_soc mt8196_data = {
+	.reg_cal = mt8196_reg_cals,
+	.pins = mtk_pins_mt8196,
+	.npins = ARRAY_SIZE(mtk_pins_mt8196),
+	.ngrps = ARRAY_SIZE(mtk_pins_mt8196),
+	.eint_hw = &mt8196_eint_hw,
+	.nfuncs = 8,
+	.gpio_m = 0,
+	.base_names = mt8196_pinctrl_register_base_names,
+	.nbase_names = ARRAY_SIZE(mt8196_pinctrl_register_base_names),
+	.pull_type = mt8196_pull_type,
+	.bias_set_combo = mtk_pinconf_bias_set_combo,
+	.bias_get_combo = mtk_pinconf_bias_get_combo,
+	.drive_set = mtk_pinconf_drive_set_rev1,
+	.drive_get = mtk_pinconf_drive_get_rev1,
+	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
+	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,
+};
+
+static const struct of_device_id mt8196_pinctrl_of_match[] = {
+	{ .compatible = "mediatek,mt8196-pinctrl", .data = &mt8196_data },
+	{ }
+};
+
+static struct platform_driver mt8196_pinctrl_driver = {
+	.driver = {
+		.name = "mt8196-pinctrl",
+		.of_match_table = mt8196_pinctrl_of_match,
+		.pm = pm_sleep_ptr(&mtk_eint_pm_ops),
+	},
+	.probe = mtk_paris_pinctrl_probe,
+};
+
+static int __init mt8196_pinctrl_init(void)
+{
+	return platform_driver_register(&mt8196_pinctrl_driver);
+}
+arch_initcall(mt8196_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT8196 Pinctrl Driver");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
new file mode 100644
index 000000000000..d342d091672c
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
@@ -0,0 +1,2789 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Mediatek Inc.
+ * Author: Guodong Liu <Guodong.Liu@mediatek.com>
+ */
+
+#ifndef __PINCTRL_MTK_MT8196_H
+#define __PINCTRL_MTK_MT8196_H
+
+#include "pinctrl-paris.h"
+
+static const struct mtk_pin_desc mtk_pins_mt8196[] = {
+	MTK_PIN(
+		0, "GPIO0",
+		MTK_EINT_FUNCTION(0, 0),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO0"),
+		MTK_FUNCTION(1, "DMIC1_CLK"),
+		MTK_FUNCTION(3, "SPI3_A_MO"),
+		MTK_FUNCTION(4, "FMI2S_B_LRCK"),
+		MTK_FUNCTION(5, "SCP_DMIC1_CLK"),
+		MTK_FUNCTION(6, "TP_GPIO14_AO")
+	),
+	MTK_PIN(
+		1, "GPIO1",
+		MTK_EINT_FUNCTION(0, 1),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO1"),
+		MTK_FUNCTION(1, "DMIC1_DAT"),
+		MTK_FUNCTION(2, "SRCLKENAI1"),
+		MTK_FUNCTION(3, "SPI3_A_MI"),
+		MTK_FUNCTION(4, "FMI2S_B_DI"),
+		MTK_FUNCTION(5, "SCP_DMIC1_DAT"),
+		MTK_FUNCTION(6, "TP_GPIO15_AO")
+	),
+	MTK_PIN(
+		2, "GPIO2",
+		MTK_EINT_FUNCTION(0, 2),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO2"),
+		MTK_FUNCTION(1, "PWM_VLP"),
+		MTK_FUNCTION(2, "DSI_HSYNC"),
+		MTK_FUNCTION(5, "RG_TSFDC_LDO_EN"),
+		MTK_FUNCTION(6, "TP_GPIO8_AO")
+	),
+	MTK_PIN(
+		3, "GPIO3",
+		MTK_EINT_FUNCTION(0, 3),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO3"),
+		MTK_FUNCTION(1, "MD_INT0"),
+		MTK_FUNCTION(2, "DSI1_HSYNC"),
+		MTK_FUNCTION(5, "DA_TSFDC_LDO_MODE"),
+		MTK_FUNCTION(6, "TP_GPIO9_AO")
+	),
+	MTK_PIN(
+		4, "GPIO4",
+		MTK_EINT_FUNCTION(0, 4),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO4"),
+		MTK_FUNCTION(1, "DISP_PWM1"),
+		MTK_FUNCTION(2, "MD32_0_GPIO0")
+	),
+	MTK_PIN(
+		5, "GPIO5",
+		MTK_EINT_FUNCTION(0, 5),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO5"),
+		MTK_FUNCTION(1, "LCM1_RST"),
+		MTK_FUNCTION(2, "SPI7_A_CLK")
+	),
+	MTK_PIN(
+		6, "GPIO6",
+		MTK_EINT_FUNCTION(0, 6),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO6"),
+		MTK_FUNCTION(1, "DSI1_TE"),
+		MTK_FUNCTION(2, "SPI7_A_CSB")
+	),
+	MTK_PIN(
+		7, "GPIO7",
+		MTK_EINT_FUNCTION(0, 7),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO7"),
+		MTK_FUNCTION(2, "SPI7_A_MO"),
+		MTK_FUNCTION(3, "GPS_PPS0")
+	),
+	MTK_PIN(
+		8, "GPIO8",
+		MTK_EINT_FUNCTION(0, 8),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO8"),
+		MTK_FUNCTION(2, "SPI7_A_MI"),
+		MTK_FUNCTION(3, "EDP_TX_HPD")
+	),
+	MTK_PIN(
+		9, "GPIO9",
+		MTK_EINT_FUNCTION(0, 9),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO9"),
+		MTK_FUNCTION(3, "I2SIN1_LRCK"),
+		MTK_FUNCTION(7, "RG_TSFDC_LDO_REFSEL0")
+	),
+	MTK_PIN(
+		10, "GPIO10",
+		MTK_EINT_FUNCTION(0, 10),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO10"),
+		MTK_FUNCTION(3, "I2SOUT1_DO"),
+		MTK_FUNCTION(7, "RG_TSFDC_LDO_REFSEL1")
+	),
+	MTK_PIN(
+		11, "GPIO11",
+		MTK_EINT_FUNCTION(0, 11),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO11"),
+		MTK_FUNCTION(4, "FMI2S_B_BCK"),
+		MTK_FUNCTION(7, "DBG_MON_A30")
+	),
+	MTK_PIN(
+		12, "GPIO12",
+		MTK_EINT_FUNCTION(0, 12),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO12"),
+		MTK_FUNCTION(3, "I2SIN1_DI_B")
+	),
+	MTK_PIN(
+		13, "GPIO13",
+		MTK_EINT_FUNCTION(0, 13),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO13"),
+		MTK_FUNCTION(1, "EDP_TX_HPD"),
+		MTK_FUNCTION(2, "GPS_PPS1")
+	),
+	MTK_PIN(
+		14, "GPIO14",
+		MTK_EINT_FUNCTION(0, 14),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO14"),
+		MTK_FUNCTION(1, "SRCLKENA2"),
+		MTK_FUNCTION(2, "DSI2_TE"),
+		MTK_FUNCTION(3, "SPMI_P_TRIG_FLAG"),
+		MTK_FUNCTION(5, "MD_INT3"),
+		MTK_FUNCTION(6, "TP_GPIO8_AO")
+	),
+	MTK_PIN(
+		15, "GPIO15",
+		MTK_EINT_FUNCTION(0, 15),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO15"),
+		MTK_FUNCTION(1, "SRCLKENAI0"),
+		MTK_FUNCTION(2, "SPMI_M_TRIG_FLAG"),
+		MTK_FUNCTION(3, "UCTS0"),
+		MTK_FUNCTION(4, "MD_INT4"),
+		MTK_FUNCTION(5, "I2SOUT2_DO"),
+		MTK_FUNCTION(6, "TP_GPIO9_AO")
+	),
+	MTK_PIN(
+		16, "GPIO16",
+		MTK_EINT_FUNCTION(0, 16),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO16"),
+		MTK_FUNCTION(1, "SRCLKENAI1"),
+		MTK_FUNCTION(2, "DP_TX_HPD"),
+		MTK_FUNCTION(3, "URTS0"),
+		MTK_FUNCTION(4, "GPS_L5_ELNA_EN"),
+		MTK_FUNCTION(5, "KPROW2"),
+		MTK_FUNCTION(6, "TP_GPIO10_AO")
+	),
+	MTK_PIN(
+		17, "GPIO17",
+		MTK_EINT_FUNCTION(0, 17),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO17"),
+		MTK_FUNCTION(1, "MD_INT0"),
+		MTK_FUNCTION(2, "DP_OC_EN"),
+		MTK_FUNCTION(3, "UCTS1"),
+		MTK_FUNCTION(4, "MD_NTN_URXD1"),
+		MTK_FUNCTION(5, "KPCOL2"),
+		MTK_FUNCTION(6, "TP_GPIO11_AO")
+	),
+	MTK_PIN(
+		18, "GPIO18",
+		MTK_EINT_FUNCTION(0, 18),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO18"),
+		MTK_FUNCTION(1, "DMIC1_CLK"),
+		MTK_FUNCTION(2, "DP_RAUX_SBU1"),
+		MTK_FUNCTION(3, "URTS1"),
+		MTK_FUNCTION(4, "MD_NTN_UTXD1"),
+		MTK_FUNCTION(5, "I2SIN2_DI"),
+		MTK_FUNCTION(6, "TP_UTXD_GNSS_VLP")
+	),
+	MTK_PIN(
+		19, "GPIO19",
+		MTK_EINT_FUNCTION(0, 19),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO19"),
+		MTK_FUNCTION(1, "DMIC1_DAT"),
+		MTK_FUNCTION(2, "DP_RAUX_SBU2"),
+		MTK_FUNCTION(3, "CONN_TCXOENA_REQ"),
+		MTK_FUNCTION(4, "CLKM3_A"),
+		MTK_FUNCTION(5, "I2SIN2_BCK"),
+		MTK_FUNCTION(6, "TP_URXD_GNSS_VLP")
+	),
+	MTK_PIN(
+		20, "GPIO20",
+		MTK_EINT_FUNCTION(0, 20),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO20"),
+		MTK_FUNCTION(1, "IDDIG"),
+		MTK_FUNCTION(2, "LCM2_RST"),
+		MTK_FUNCTION(3, "GPS_PPS1"),
+		MTK_FUNCTION(4, "CLKM2_A")
+	),
+	MTK_PIN(
+		21, "GPIO21",
+		MTK_EINT_FUNCTION(0, 21),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO21"),
+		MTK_FUNCTION(1, "BPI_BUS11"),
+		MTK_FUNCTION(2, "PCIE_PERSTN_1P"),
+		MTK_FUNCTION(3, "DSI1_TE"),
+		MTK_FUNCTION(4, "DMIC_CLK"),
+		MTK_FUNCTION(5, "SCP_DMIC_CLK")
+	),
+	MTK_PIN(
+		22, "GPIO22",
+		MTK_EINT_FUNCTION(0, 22),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO22"),
+		MTK_FUNCTION(1, "BPI_BUS12"),
+		MTK_FUNCTION(2, "PCIE_CLKREQN_1P"),
+		MTK_FUNCTION(3, "DSI2_TE"),
+		MTK_FUNCTION(4, "DMIC_DAT"),
+		MTK_FUNCTION(5, "SCP_DMIC_DAT")
+	),
+	MTK_PIN(
+		23, "GPIO23",
+		MTK_EINT_FUNCTION(0, 23),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO23"),
+		MTK_FUNCTION(1, "BPI_BUS13"),
+		MTK_FUNCTION(2, "PCIE_WAKEN_1P"),
+		MTK_FUNCTION(3, "DSI3_TE"),
+		MTK_FUNCTION(4, "DMIC1_CLK"),
+		MTK_FUNCTION(5, "SCP_DMIC1_CLK")
+	),
+	MTK_PIN(
+		24, "GPIO24",
+		MTK_EINT_FUNCTION(0, 24),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO24"),
+		MTK_FUNCTION(1, "BPI_BUS14"),
+		MTK_FUNCTION(2, "LCM1_RST"),
+		MTK_FUNCTION(3, "AGPS_SYNC"),
+		MTK_FUNCTION(4, "DMIC1_DAT"),
+		MTK_FUNCTION(5, "SCP_DMIC1_DAT"),
+		MTK_FUNCTION(6, "DISP_PWM1")
+	),
+	MTK_PIN(
+		25, "GPIO25",
+		MTK_EINT_FUNCTION(0, 25),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO25"),
+		MTK_FUNCTION(1, "BPI_BUS15"),
+		MTK_FUNCTION(2, "LCM2_RST"),
+		MTK_FUNCTION(3, "SRCLKENAI1"),
+		MTK_FUNCTION(4, "DMIC2_CLK"),
+		MTK_FUNCTION(6, "DISP_PWM2")
+	),
+	MTK_PIN(
+		26, "GPIO26",
+		MTK_EINT_FUNCTION(0, 26),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO26"),
+		MTK_FUNCTION(1, "BPI_BUS16"),
+		MTK_FUNCTION(2, "LCM3_RST"),
+		MTK_FUNCTION(4, "DMIC2_DAT"),
+		MTK_FUNCTION(6, "DISP_PWM3")
+	),
+	MTK_PIN(
+		27, "GPIO27",
+		MTK_EINT_FUNCTION(0, 27),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO27"),
+		MTK_FUNCTION(1, "BPI_BUS17"),
+		MTK_FUNCTION(2, "UTXD4"),
+		MTK_FUNCTION(6, "DISP_PWM4"),
+		MTK_FUNCTION(7, "DBG_MON_A20")
+	),
+	MTK_PIN(
+		28, "GPIO28",
+		MTK_EINT_FUNCTION(0, 28),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO28"),
+		MTK_FUNCTION(1, "BPI_BUS18"),
+		MTK_FUNCTION(2, "URXD4"),
+		MTK_FUNCTION(3, "SPI2_A_MI"),
+		MTK_FUNCTION(4, "CLKM0_A"),
+		MTK_FUNCTION(7, "DBG_MON_A21")
+	),
+	MTK_PIN(
+		29, "GPIO29",
+		MTK_EINT_FUNCTION(0, 29),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO29"),
+		MTK_FUNCTION(1, "BPI_BUS19"),
+		MTK_FUNCTION(2, "MD_NTN_UTXD1"),
+		MTK_FUNCTION(3, "SPI2_A_MO"),
+		MTK_FUNCTION(4, "CLKM1_A"),
+		MTK_FUNCTION(6, "UCTS4"),
+		MTK_FUNCTION(7, "DBG_MON_A17")
+	),
+	MTK_PIN(
+		30, "GPIO30",
+		MTK_EINT_FUNCTION(0, 30),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO30"),
+		MTK_FUNCTION(1, "BPI_BUS20"),
+		MTK_FUNCTION(2, "MD_NTN_URXD1"),
+		MTK_FUNCTION(3, "SPI2_A_CLK"),
+		MTK_FUNCTION(4, "CLKM2_A"),
+		MTK_FUNCTION(5, "DSI3_HSYNC"),
+		MTK_FUNCTION(6, "URTS4"),
+		MTK_FUNCTION(7, "DBG_MON_A18")
+	),
+	MTK_PIN(
+		31, "GPIO31",
+		MTK_EINT_FUNCTION(0, 31),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO31"),
+		MTK_FUNCTION(1, "BPI_BUS21"),
+		MTK_FUNCTION(3, "SPI2_A_CSB"),
+		MTK_FUNCTION(4, "CLKM3_A"),
+		MTK_FUNCTION(6, "EDP_TX_HPD"),
+		MTK_FUNCTION(7, "DBG_MON_A19")
+	),
+	MTK_PIN(
+		32, "GPIO32",
+		MTK_EINT_FUNCTION(0, 32),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO32"),
+		MTK_FUNCTION(1, "LCM4_RST"),
+		MTK_FUNCTION(2, "DP_TX_HPD"),
+		MTK_FUNCTION(3, "SSPM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(4, "ADSP_JTAG0_TCK"),
+		MTK_FUNCTION(5, "SCP_JTAG0_TCK_VLP"),
+		MTK_FUNCTION(6, "SPU0_TCK"),
+		MTK_FUNCTION(7, "IO_JTAG_TCK")
+	),
+	MTK_PIN(
+		33, "GPIO33",
+		MTK_EINT_FUNCTION(0, 33),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO33"),
+		MTK_FUNCTION(1, "DSI4_TE"),
+		MTK_FUNCTION(2, "DP_OC_EN"),
+		MTK_FUNCTION(3, "SSPM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(4, "ADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(5, "SCP_JTAG0_TRSTN_VLP"),
+		MTK_FUNCTION(6, "SPU0_NTRST"),
+		MTK_FUNCTION(7, "IO_JTAG_TRSTN")
+	),
+	MTK_PIN(
+		34, "GPIO34",
+		MTK_EINT_FUNCTION(0, 34),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO34"),
+		MTK_FUNCTION(1, "UCTS5"),
+		MTK_FUNCTION(2, "DP_RAUX_SBU1"),
+		MTK_FUNCTION(3, "SSPM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(4, "ADSP_JTAG0_TDI"),
+		MTK_FUNCTION(5, "SCP_JTAG0_TDI_VLP"),
+		MTK_FUNCTION(6, "SPU0_TDI"),
+		MTK_FUNCTION(7, "IO_JTAG_TDI")
+	),
+	MTK_PIN(
+		35, "GPIO35",
+		MTK_EINT_FUNCTION(0, 35),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO35"),
+		MTK_FUNCTION(1, "URTS5"),
+		MTK_FUNCTION(2, "DP_RAUX_SBU2"),
+		MTK_FUNCTION(3, "SSPM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(4, "ADSP_JTAG0_TDO"),
+		MTK_FUNCTION(5, "SCP_JTAG0_TDO_VLP"),
+		MTK_FUNCTION(6, "SPU0_TDO"),
+		MTK_FUNCTION(7, "IO_JTAG_TDO")
+	),
+	MTK_PIN(
+		36, "GPIO36",
+		MTK_EINT_FUNCTION(0, 36),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO36"),
+		MTK_FUNCTION(1, "UTXD5"),
+		MTK_FUNCTION(3, "SSPM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(4, "ADSP_JTAG0_TMS"),
+		MTK_FUNCTION(5, "SCP_JTAG0_TMS_VLP"),
+		MTK_FUNCTION(6, "SPU0_TMS"),
+		MTK_FUNCTION(7, "IO_JTAG_TMS")
+	),
+	MTK_PIN(
+		37, "GPIO37",
+		MTK_EINT_FUNCTION(0, 37),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO37"),
+		MTK_FUNCTION(1, "URXD5"),
+		MTK_FUNCTION(3, "MD_INT3"),
+		MTK_FUNCTION(4, "CLKM0_B"),
+		MTK_FUNCTION(5, "TP_GPIO5_AO"),
+		MTK_FUNCTION(6, "SPU0_UTX"),
+		MTK_FUNCTION(7, "DAP_MD32_SWCK")
+	),
+	MTK_PIN(
+		38, "GPIO38",
+		MTK_EINT_FUNCTION(0, 38),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO38"),
+		MTK_FUNCTION(2, "SPMI_P_TRIG_FLAG"),
+		MTK_FUNCTION(3, "MD_INT4"),
+		MTK_FUNCTION(4, "CLKM1_B"),
+		MTK_FUNCTION(5, "TP_GPIO6_AO"),
+		MTK_FUNCTION(6, "SPU0_URX"),
+		MTK_FUNCTION(7, "DAP_MD32_SWD")
+	),
+	MTK_PIN(
+		39, "GPIO39",
+		MTK_EINT_FUNCTION(0, 39),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO39"),
+		MTK_FUNCTION(1, "I2S_MCK0"),
+		MTK_FUNCTION(3, "GPS_PPS0"),
+		MTK_FUNCTION(4, "CONN_TCXOENA_REQ"),
+		MTK_FUNCTION(7, "DBG_MON_B12")
+	),
+	MTK_PIN(
+		40, "GPIO40",
+		MTK_EINT_FUNCTION(0, 40),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO40"),
+		MTK_FUNCTION(1, "I2SIN6_0_BCK"),
+		MTK_FUNCTION(3, "SPI4_B_CLK"),
+		MTK_FUNCTION(4, "UCTS2"),
+		MTK_FUNCTION(5, "CCU1_UTXD"),
+		MTK_FUNCTION(7, "DBG_MON_B13")
+	),
+	MTK_PIN(
+		41, "GPIO41",
+		MTK_EINT_FUNCTION(0, 41),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO41"),
+		MTK_FUNCTION(1, "I2SIN6_0_LRCK"),
+		MTK_FUNCTION(3, "SPI4_B_CSB"),
+		MTK_FUNCTION(4, "URTS2"),
+		MTK_FUNCTION(5, "CCU1_URXD"),
+		MTK_FUNCTION(7, "DBG_MON_B14")
+	),
+	MTK_PIN(
+		42, "GPIO42",
+		MTK_EINT_FUNCTION(0, 42),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO42"),
+		MTK_FUNCTION(1, "I2SIN6_0_DI"),
+		MTK_FUNCTION(3, "SPI4_B_MI"),
+		MTK_FUNCTION(4, "URXD2"),
+		MTK_FUNCTION(5, "CCU1_URTS"),
+		MTK_FUNCTION(6, "MD32_0_RXD"),
+		MTK_FUNCTION(7, "DBG_MON_B15")
+	),
+	MTK_PIN(
+		43, "GPIO43",
+		MTK_EINT_FUNCTION(0, 43),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO43"),
+		MTK_FUNCTION(1, "I2SOUT6_0_DO"),
+		MTK_FUNCTION(3, "SPI4_B_MO"),
+		MTK_FUNCTION(4, "UTXD2"),
+		MTK_FUNCTION(5, "CCU1_UCTS"),
+		MTK_FUNCTION(6, "MD32_0_TXD"),
+		MTK_FUNCTION(7, "DBG_MON_B16")
+	),
+	MTK_PIN(
+		44, "GPIO44",
+		MTK_EINT_FUNCTION(0, 44),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO44"),
+		MTK_FUNCTION(1, "MD_INT1_C2K_UIM0_HOT_PLUG"),
+		MTK_FUNCTION(3, "SPI3_A_CLK"),
+		MTK_FUNCTION(6, "TP_GPIO10_AO")
+	),
+	MTK_PIN(
+		45, "GPIO45",
+		MTK_EINT_FUNCTION(0, 45),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO45"),
+		MTK_FUNCTION(1, "MD_INT2_C2K_UIM1_HOT_PLUG"),
+		MTK_FUNCTION(2, "DSI2_HSYNC"),
+		MTK_FUNCTION(3, "SPI3_A_CSB"),
+		MTK_FUNCTION(4, "PWM_VLP"),
+		MTK_FUNCTION(6, "TP_GPIO11_AO")
+	),
+	MTK_PIN(
+		46, "GPIO46",
+		MTK_EINT_FUNCTION(0, 46),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO46"),
+		MTK_FUNCTION(1, "SCP_SCL4"),
+		MTK_FUNCTION(2, "PWM_VLP"),
+		MTK_FUNCTION(4, "SCP_ILDO_DTEST1_VLP"),
+		MTK_FUNCTION(5, "UFS_MPHY_SCL"),
+		MTK_FUNCTION(6, "TP_GPIO0_AO")
+	),
+	MTK_PIN(
+		47, "GPIO47",
+		MTK_EINT_FUNCTION(0, 47),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO47"),
+		MTK_FUNCTION(1, "SCP_SDA4"),
+		MTK_FUNCTION(4, "SCP_ILDO_DTEST2_VLP"),
+		MTK_FUNCTION(5, "UFS_MPHY_SDA"),
+		MTK_FUNCTION(6, "TP_GPIO1_AO")
+	),
+	MTK_PIN(
+		48, "GPIO48",
+		MTK_EINT_FUNCTION(0, 48),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO48"),
+		MTK_FUNCTION(1, "SCP_SCL5"),
+		MTK_FUNCTION(2, "PWM_VLP"),
+		MTK_FUNCTION(3, "CCU0_UTXD"),
+		MTK_FUNCTION(4, "SCP_ILDO_DTEST3_VLP"),
+		MTK_FUNCTION(6, "TP_GPIO2_AO")
+	),
+	MTK_PIN(
+		49, "GPIO49",
+		MTK_EINT_FUNCTION(0, 49),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO49"),
+		MTK_FUNCTION(1, "SCP_SDA5"),
+		MTK_FUNCTION(3, "CCU0_URXD"),
+		MTK_FUNCTION(4, "SCP_ILDO_DTEST4_VLP"),
+		MTK_FUNCTION(6, "TP_GPIO3_AO")
+	),
+	MTK_PIN(
+		50, "GPIO50",
+		MTK_EINT_FUNCTION(0, 50),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO50"),
+		MTK_FUNCTION(1, "SCP_SCL6"),
+		MTK_FUNCTION(2, "PWM_VLP"),
+		MTK_FUNCTION(3, "CCU0_URTS"),
+		MTK_FUNCTION(4, "DSI_HSYNC"),
+		MTK_FUNCTION(6, "TP_GPIO4_AO")
+	),
+	MTK_PIN(
+		51, "GPIO51",
+		MTK_EINT_FUNCTION(0, 51),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO51"),
+		MTK_FUNCTION(1, "SCP_SDA6"),
+		MTK_FUNCTION(3, "CCU0_UCTS"),
+		MTK_FUNCTION(4, "DSI1_HSYNC"),
+		MTK_FUNCTION(6, "TP_GPIO5_AO")
+	),
+	MTK_PIN(
+		52, "GPIO52",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO52"),
+		MTK_FUNCTION(1, "SCP_SCL1"),
+		MTK_FUNCTION(3, "TDM_DATA2")
+	),
+	MTK_PIN(
+		53, "GPIO53",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO53"),
+		MTK_FUNCTION(1, "SCP_SDA1"),
+		MTK_FUNCTION(3, "TDM_DATA3")
+	),
+	MTK_PIN(
+		54, "GPIO54",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO54"),
+		MTK_FUNCTION(1, "AUD_CLK_MOSI"),
+		MTK_FUNCTION(3, "TDM_MCK")
+	),
+	MTK_PIN(
+		55, "GPIO55",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO55"),
+		MTK_FUNCTION(1, "AUD_CLK_MISO"),
+		MTK_FUNCTION(2, "I2SOUT2_BCK"),
+		MTK_FUNCTION(3, "TDM_BCK")
+	),
+	MTK_PIN(
+		56, "GPIO56",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO56"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI0"),
+		MTK_FUNCTION(2, "I2SOUT2_LRCK"),
+		MTK_FUNCTION(3, "TDM_LRCK")
+	),
+	MTK_PIN(
+		57, "GPIO57",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO57"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI1"),
+		MTK_FUNCTION(2, "I2SOUT2_DO"),
+		MTK_FUNCTION(3, "TDM_DATA0")
+	),
+	MTK_PIN(
+		58, "GPIO58",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO58"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO0"),
+		MTK_FUNCTION(3, "TDM_DATA1")
+	),
+	MTK_PIN(
+		59, "GPIO59",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO59"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO1"),
+		MTK_FUNCTION(3, "I2SIN1_BCK")
+	),
+	MTK_PIN(
+		60, "GPIO60",
+		MTK_EINT_FUNCTION(0, 60),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO60"),
+		MTK_FUNCTION(1, "KPCOL0"),
+		MTK_FUNCTION(6, "TP_GPIO13_AO")
+	),
+	MTK_PIN(
+		61, "GPIO61",
+		MTK_EINT_FUNCTION(0, 61),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO61"),
+		MTK_FUNCTION(1, "MCU_M_PMIC_POC_I")
+	),
+	MTK_PIN(
+		62, "GPIO62",
+		MTK_EINT_FUNCTION(0, 62),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO62"),
+		MTK_FUNCTION(1, "MCU_B_PMIC_POC_I")
+	),
+	MTK_PIN(
+		63, "GPIO63",
+		MTK_EINT_FUNCTION(0, 63),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO63"),
+		MTK_FUNCTION(1, "MFG_PMIC_POC_I")
+	),
+	MTK_PIN(
+		64, "GPIO64",
+		MTK_EINT_FUNCTION(0, 64),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO64"),
+		MTK_FUNCTION(1, "PRE_UVLO")
+	),
+	MTK_PIN(
+		65, "GPIO65",
+		MTK_EINT_FUNCTION(0, 65),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO65"),
+		MTK_FUNCTION(1, "DPM2PMIC"),
+		MTK_FUNCTION(2, "SRCLKENA1")
+	),
+	MTK_PIN(
+		66, "GPIO66",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO66"),
+		MTK_FUNCTION(1, "WATCHDOG")
+	),
+	MTK_PIN(
+		67, "GPIO67",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO67"),
+		MTK_FUNCTION(1, "SRCLKENA0")
+	),
+	MTK_PIN(
+		68, "GPIO68",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO68"),
+		MTK_FUNCTION(1, "SCP_VREQ_VAO")
+	),
+	MTK_PIN(
+		69, "GPIO69",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO69"),
+		MTK_FUNCTION(1, "RTC32K_CK")
+	),
+	MTK_PIN(
+		70, "GPIO70",
+		MTK_EINT_FUNCTION(0, 70),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO70"),
+		MTK_FUNCTION(1, "CMFLASH0")
+	),
+	MTK_PIN(
+		71, "GPIO71",
+		MTK_EINT_FUNCTION(0, 71),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO71")
+	),
+	MTK_PIN(
+		72, "GPIO72",
+		MTK_EINT_FUNCTION(0, 72),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO72")
+	),
+	MTK_PIN(
+		73, "GPIO73",
+		MTK_EINT_FUNCTION(0, 73),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO73")
+	),
+	MTK_PIN(
+		74, "GPIO74",
+		MTK_EINT_FUNCTION(0, 74),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO74"),
+		MTK_FUNCTION(1, "DCXO_FPM_LPM")
+	),
+	MTK_PIN(
+		75, "GPIO75",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO75"),
+		MTK_FUNCTION(1, "SPMI_M_SCL")
+	),
+	MTK_PIN(
+		76, "GPIO76",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO76"),
+		MTK_FUNCTION(1, "SPMI_M_SDA")
+	),
+	MTK_PIN(
+		77, "GPIO77",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO77"),
+		MTK_FUNCTION(1, "SPMI_P_SCL")
+	),
+	MTK_PIN(
+		78, "GPIO78",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO78"),
+		MTK_FUNCTION(1, "SPMI_P_SDA")
+	),
+	MTK_PIN(
+		79, "GPIO79",
+		MTK_EINT_FUNCTION(0, 79),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO79"),
+		MTK_FUNCTION(1, "CMMCLK0"),
+		MTK_FUNCTION(2, "MD_INT4")
+	),
+	MTK_PIN(
+		80, "GPIO80",
+		MTK_EINT_FUNCTION(0, 80),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO80"),
+		MTK_FUNCTION(1, "CMMCLK1")
+	),
+	MTK_PIN(
+		81, "GPIO81",
+		MTK_EINT_FUNCTION(0, 81),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO81"),
+		MTK_FUNCTION(1, "SCP_SPI0_CK"),
+		MTK_FUNCTION(2, "SPI6_B_CLK"),
+		MTK_FUNCTION(3, "PWM_VLP"),
+		MTK_FUNCTION(4, "I2SOUT5_BCK"),
+		MTK_FUNCTION(6, "TP_GPIO0_AO")
+	),
+	MTK_PIN(
+		82, "GPIO82",
+		MTK_EINT_FUNCTION(0, 82),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO82"),
+		MTK_FUNCTION(1, "SCP_SPI0_CS"),
+		MTK_FUNCTION(2, "SPI6_B_CSB"),
+		MTK_FUNCTION(4, "I2SOUT5_LRCK"),
+		MTK_FUNCTION(6, "TP_GPIO1_AO")
+	),
+	MTK_PIN(
+		83, "GPIO83",
+		MTK_EINT_FUNCTION(0, 83),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO83"),
+		MTK_FUNCTION(1, "SCP_SPI0_MO"),
+		MTK_FUNCTION(2, "SPI6_B_MO"),
+		MTK_FUNCTION(4, "I2SOUT5_DATA0"),
+		MTK_FUNCTION(6, "TP_GPIO2_AO")
+	),
+	MTK_PIN(
+		84, "GPIO84",
+		MTK_EINT_FUNCTION(0, 84),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO84"),
+		MTK_FUNCTION(1, "SCP_SPI0_MI"),
+		MTK_FUNCTION(2, "SPI6_B_MI"),
+		MTK_FUNCTION(4, "I2SOUT5_DATA1"),
+		MTK_FUNCTION(6, "TP_GPIO3_AO")
+	),
+	MTK_PIN(
+		85, "GPIO85",
+		MTK_EINT_FUNCTION(0, 85),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO85"),
+		MTK_FUNCTION(1, "SCP_SPI1_CK"),
+		MTK_FUNCTION(2, "SPI7_B_CLK"),
+		MTK_FUNCTION(4, "I2SIN5_DATA0"),
+		MTK_FUNCTION(5, "PWM_VLP"),
+		MTK_FUNCTION(6, "TP_GPIO4_AO")
+	),
+	MTK_PIN(
+		86, "GPIO86",
+		MTK_EINT_FUNCTION(0, 86),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO86"),
+		MTK_FUNCTION(1, "SCP_SPI1_CS"),
+		MTK_FUNCTION(2, "SPI7_B_CSB"),
+		MTK_FUNCTION(4, "I2SIN5_DATA1"),
+		MTK_FUNCTION(6, "TP_GPIO5_AO")
+	),
+	MTK_PIN(
+		87, "GPIO87",
+		MTK_EINT_FUNCTION(0, 87),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO87"),
+		MTK_FUNCTION(1, "SCP_SPI1_MO"),
+		MTK_FUNCTION(2, "SPI7_B_MO"),
+		MTK_FUNCTION(4, "I2SIN5_BCK"),
+		MTK_FUNCTION(6, "TP_GPIO6_AO")
+	),
+	MTK_PIN(
+		88, "GPIO88",
+		MTK_EINT_FUNCTION(0, 88),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO88"),
+		MTK_FUNCTION(1, "SCP_SPI1_MI"),
+		MTK_FUNCTION(2, "SPI7_B_MI"),
+		MTK_FUNCTION(4, "I2SIN5_LRCK"),
+		MTK_FUNCTION(6, "TP_GPIO7_AO")
+	),
+	MTK_PIN(
+		89, "GPIO89",
+		MTK_EINT_FUNCTION(0, 89),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO89"),
+		MTK_FUNCTION(1, "DSI_TE"),
+		MTK_FUNCTION(2, "DSI1_TE"),
+		MTK_FUNCTION(7, "DBG_MON_B30")
+	),
+	MTK_PIN(
+		90, "GPIO90",
+		MTK_EINT_FUNCTION(0, 90),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO90"),
+		MTK_FUNCTION(1, "LCM_RST"),
+		MTK_FUNCTION(2, "LCM1_RST"),
+		MTK_FUNCTION(7, "DBG_MON_B31")
+	),
+	MTK_PIN(
+		91, "GPIO91",
+		MTK_EINT_FUNCTION(0, 91),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO91"),
+		MTK_FUNCTION(1, "CMFLASH2"),
+		MTK_FUNCTION(2, "SF_D0"),
+		MTK_FUNCTION(3, "SRCLKENAI1"),
+		MTK_FUNCTION(5, "KPCOL2"),
+		MTK_FUNCTION(6, "TP_GPIO11_AO")
+	),
+	MTK_PIN(
+		92, "GPIO92",
+		MTK_EINT_FUNCTION(0, 92),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO92"),
+		MTK_FUNCTION(1, "CMFLASH3"),
+		MTK_FUNCTION(2, "SF_D1"),
+		MTK_FUNCTION(4, "DISP_PWM1"),
+		MTK_FUNCTION(6, "TP_GPIO12_AO")
+	),
+	MTK_PIN(
+		93, "GPIO93",
+		MTK_EINT_FUNCTION(0, 93),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO93"),
+		MTK_FUNCTION(1, "CMFLASH1"),
+		MTK_FUNCTION(2, "SF_D2"),
+		MTK_FUNCTION(3, "SRCLKENAI0"),
+		MTK_FUNCTION(5, "KPROW2"),
+		MTK_FUNCTION(6, "TP_GPIO13_AO")
+	),
+	MTK_PIN(
+		94, "GPIO94",
+		MTK_EINT_FUNCTION(0, 94),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO94"),
+		MTK_FUNCTION(1, "I2S_MCK1"),
+		MTK_FUNCTION(2, "SF_D3"),
+		MTK_FUNCTION(4, "MD32_0_GPIO0"),
+		MTK_FUNCTION(5, "CLKM0_A"),
+		MTK_FUNCTION(6, "TP_GPIO14_AO"),
+		MTK_FUNCTION(7, "DBG_MON_B18")
+	),
+	MTK_PIN(
+		95, "GPIO95",
+		MTK_EINT_FUNCTION(0, 95),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO95"),
+		MTK_FUNCTION(1, "I2SIN1_BCK"),
+		MTK_FUNCTION(2, "I2SIN4_BCK"),
+		MTK_FUNCTION(3, "SPI6_A_CLK"),
+		MTK_FUNCTION(4, "MD32_1_GPIO0"),
+		MTK_FUNCTION(5, "CLKM1_A"),
+		MTK_FUNCTION(6, "TP_GPIO15_AO"),
+		MTK_FUNCTION(7, "DBG_MON_B19")
+	),
+	MTK_PIN(
+		96, "GPIO96",
+		MTK_EINT_FUNCTION(0, 96),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO96"),
+		MTK_FUNCTION(1, "I2SIN1_LRCK"),
+		MTK_FUNCTION(2, "I2SIN4_LRCK"),
+		MTK_FUNCTION(3, "SPI6_A_CSB"),
+		MTK_FUNCTION(4, "MD32_2_GPIO0"),
+		MTK_FUNCTION(5, "CLKM2_A"),
+		MTK_FUNCTION(7, "DBG_MON_B20")
+	),
+	MTK_PIN(
+		97, "GPIO97",
+		MTK_EINT_FUNCTION(0, 97),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO97"),
+		MTK_FUNCTION(1, "I2SIN1_DI_A"),
+		MTK_FUNCTION(2, "I2SIN4_DATA0"),
+		MTK_FUNCTION(3, "SPI6_A_MO"),
+		MTK_FUNCTION(4, "MD32_3_GPIO0"),
+		MTK_FUNCTION(5, "CLKM3_A"),
+		MTK_FUNCTION(7, "DBG_MON_B21")
+	),
+	MTK_PIN(
+		98, "GPIO98",
+		MTK_EINT_FUNCTION(0, 98),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO98"),
+		MTK_FUNCTION(1, "I2SOUT1_DO"),
+		MTK_FUNCTION(2, "I2SOUT4_DATA0"),
+		MTK_FUNCTION(3, "SPI6_A_MI"),
+		MTK_FUNCTION(7, "DBG_MON_B22")
+	),
+	MTK_PIN(
+		99, "GPIO99",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO99"),
+		MTK_FUNCTION(1, "SCL0"),
+		MTK_FUNCTION(2, "LCM2_RST"),
+		MTK_FUNCTION(3, "AUD_DAC_26M_CLK"),
+		MTK_FUNCTION(4, "SPU0_SCL"),
+		MTK_FUNCTION(7, "DBG_MON_B24")
+	),
+	MTK_PIN(
+		100, "GPIO100",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO100"),
+		MTK_FUNCTION(1, "SDA0"),
+		MTK_FUNCTION(2, "DSI2_TE"),
+		MTK_FUNCTION(4, "SPU0_SDA"),
+		MTK_FUNCTION(7, "DBG_MON_B25")
+	),
+	MTK_PIN(
+		101, "GPIO101",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO101"),
+		MTK_FUNCTION(1, "SCL10"),
+		MTK_FUNCTION(2, "SF_CS"),
+		MTK_FUNCTION(3, "SCP_DMIC1_CLK"),
+		MTK_FUNCTION(4, "I2SIN5_DATA2"),
+		MTK_FUNCTION(5, "SCP_SCL_OIS"),
+		MTK_FUNCTION(6, "TP_GPIO10_AO"),
+		MTK_FUNCTION(7, "DBG_MON_B28")
+	),
+	MTK_PIN(
+		102, "GPIO102",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO102"),
+		MTK_FUNCTION(1, "SDA10"),
+		MTK_FUNCTION(2, "SF_CK"),
+		MTK_FUNCTION(3, "SCP_DMIC1_DAT"),
+		MTK_FUNCTION(4, "I2SIN5_DATA3"),
+		MTK_FUNCTION(5, "SCP_SDA_OIS"),
+		MTK_FUNCTION(6, "TP_GPIO11_AO"),
+		MTK_FUNCTION(7, "DBG_MON_B29")
+	),
+	MTK_PIN(
+		103, "GPIO103",
+		MTK_EINT_FUNCTION(0, 103),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO103"),
+		MTK_FUNCTION(1, "DISP_PWM"),
+		MTK_FUNCTION(2, "DSI1_TE"),
+		MTK_FUNCTION(5, "I2S_MCK0"),
+		MTK_FUNCTION(7, "DBG_MON_B23")
+	),
+	MTK_PIN(
+		104, "GPIO104",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO104"),
+		MTK_FUNCTION(1, "SCL6"),
+		MTK_FUNCTION(2, "SPU1_SCL"),
+		MTK_FUNCTION(3, "AUD_DAC_26M_CLK"),
+		MTK_FUNCTION(4, "USB_DRVVBUS_2P"),
+		MTK_FUNCTION(5, "I2S_MCK1"),
+		MTK_FUNCTION(6, "IDDIG_2P"),
+		MTK_FUNCTION(7, "DBG_MON_B26")
+	),
+	MTK_PIN(
+		105, "GPIO105",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO105"),
+		MTK_FUNCTION(1, "SDA6"),
+		MTK_FUNCTION(2, "SPU1_SDA"),
+		MTK_FUNCTION(3, "DISP_PWM2"),
+		MTK_FUNCTION(4, "VBUSVALID_2P"),
+		MTK_FUNCTION(5, "I2S_MCK2"),
+		MTK_FUNCTION(6, "VBUSVALID_3P"),
+		MTK_FUNCTION(7, "DBG_MON_B27")
+	),
+	MTK_PIN(
+		106, "GPIO106",
+		MTK_EINT_FUNCTION(0, 106),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO106"),
+		MTK_FUNCTION(1, "SCP_SPI3_CK"),
+		MTK_FUNCTION(2, "SPI3_B_CLK"),
+		MTK_FUNCTION(3, "MD_UTXD0"),
+		MTK_FUNCTION(4, "TP_UTXD1_VLP"),
+		MTK_FUNCTION(5, "CONN_BG_GPS_MCU_UART0_TXD"),
+		MTK_FUNCTION(6, "TP_GPIO6_AO"),
+		MTK_FUNCTION(7, "DBG_MON_B0")
+	),
+	MTK_PIN(
+		107, "GPIO107",
+		MTK_EINT_FUNCTION(0, 107),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO107"),
+		MTK_FUNCTION(1, "SCP_SPI3_CS"),
+		MTK_FUNCTION(2, "SPI3_B_CSB"),
+		MTK_FUNCTION(3, "MD_URXD0"),
+		MTK_FUNCTION(4, "TP_URXD1_VLP"),
+		MTK_FUNCTION(5, "CONN_BG_GPS_MCU_UART0_RXD"),
+		MTK_FUNCTION(6, "TP_GPIO7_AO"),
+		MTK_FUNCTION(7, "DBG_MON_B1")
+	),
+	MTK_PIN(
+		108, "GPIO108",
+		MTK_EINT_FUNCTION(0, 108),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO108"),
+		MTK_FUNCTION(1, "SCP_SPI3_MO"),
+		MTK_FUNCTION(2, "SPI3_B_MO"),
+		MTK_FUNCTION(3, "MD_UTXD1"),
+		MTK_FUNCTION(4, "MD32PCM_UTXD_AO_VLP"),
+		MTK_FUNCTION(5, "CONN_BG_GPS_MCU_UART1_TXD"),
+		MTK_FUNCTION(6, "TP_GPIO8_AO"),
+		MTK_FUNCTION(7, "DBG_MON_B2")
+	),
+	MTK_PIN(
+		109, "GPIO109",
+		MTK_EINT_FUNCTION(0, 109),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO109"),
+		MTK_FUNCTION(1, "SCP_SPI3_MI"),
+		MTK_FUNCTION(2, "SPI3_B_MI"),
+		MTK_FUNCTION(3, "MD_URXD1"),
+		MTK_FUNCTION(4, "MD32PCM_URXD_AO_VLP"),
+		MTK_FUNCTION(5, "CONN_BG_GPS_MCU_UART1_RXD"),
+		MTK_FUNCTION(6, "TP_GPIO9_AO"),
+		MTK_FUNCTION(7, "DBG_MON_B3")
+	),
+	MTK_PIN(
+		110, "GPIO110",
+		MTK_EINT_FUNCTION(0, 110),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO110"),
+		MTK_FUNCTION(1, "SPI1_CLK"),
+		MTK_FUNCTION(2, "PWM_0"),
+		MTK_FUNCTION(3, "MD_UCTS0"),
+		MTK_FUNCTION(4, "TP_UCTS1_VLP"),
+		MTK_FUNCTION(6, "SPU0_GPIO_O"),
+		MTK_FUNCTION(7, "DBG_MON_B4")
+	),
+	MTK_PIN(
+		111, "GPIO111",
+		MTK_EINT_FUNCTION(0, 111),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO111"),
+		MTK_FUNCTION(1, "SPI1_CSB"),
+		MTK_FUNCTION(2, "PWM_1"),
+		MTK_FUNCTION(3, "MD_URTS0"),
+		MTK_FUNCTION(4, "TP_URTS1_VLP"),
+		MTK_FUNCTION(6, "SPU0_GPIO_I"),
+		MTK_FUNCTION(7, "DBG_MON_B5")
+	),
+	MTK_PIN(
+		112, "GPIO112",
+		MTK_EINT_FUNCTION(0, 112),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO112"),
+		MTK_FUNCTION(1, "SPI1_MO"),
+		MTK_FUNCTION(2, "PWM_2"),
+		MTK_FUNCTION(3, "MD_UCTS1"),
+		MTK_FUNCTION(6, "SPU1_GPIO_O"),
+		MTK_FUNCTION(7, "DBG_MON_B6")
+	),
+	MTK_PIN(
+		113, "GPIO113",
+		MTK_EINT_FUNCTION(0, 113),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO113"),
+		MTK_FUNCTION(1, "SPI1_MI"),
+		MTK_FUNCTION(2, "PWM_3"),
+		MTK_FUNCTION(3, "MD_URTS1"),
+		MTK_FUNCTION(6, "SPU1_GPIO_I"),
+		MTK_FUNCTION(7, "DBG_MON_B7")
+	),
+	MTK_PIN(
+		114, "GPIO114",
+		MTK_EINT_FUNCTION(0, 114),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO114"),
+		MTK_FUNCTION(1, "SPI0_SPU_CLK"),
+		MTK_FUNCTION(2, "SPI4_A_CLK"),
+		MTK_FUNCTION(5, "CONN_BG_GPS_MCU_DBG_UART_TX"),
+		MTK_FUNCTION(7, "DBG_MON_B8")
+	),
+	MTK_PIN(
+		115, "GPIO115",
+		MTK_EINT_FUNCTION(0, 115),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO115"),
+		MTK_FUNCTION(1, "SPI0_SPU_CSB"),
+		MTK_FUNCTION(2, "SPI4_A_CSB"),
+		MTK_FUNCTION(7, "DBG_MON_B9")
+	),
+	MTK_PIN(
+		116, "GPIO116",
+		MTK_EINT_FUNCTION(0, 116),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO116"),
+		MTK_FUNCTION(1, "SPI0_SPU_MO"),
+		MTK_FUNCTION(2, "SPI4_A_MO"),
+		MTK_FUNCTION(3, "LCM1_RST"),
+		MTK_FUNCTION(7, "DBG_MON_B10")
+	),
+	MTK_PIN(
+		117, "GPIO117",
+		MTK_EINT_FUNCTION(0, 117),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO117"),
+		MTK_FUNCTION(1, "SPI0_SPU_MI"),
+		MTK_FUNCTION(2, "SPI4_A_MI"),
+		MTK_FUNCTION(3, "DSI1_TE"),
+		MTK_FUNCTION(7, "DBG_MON_B11")
+	),
+	MTK_PIN(
+		118, "GPIO118",
+		MTK_EINT_FUNCTION(0, 118),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO118"),
+		MTK_FUNCTION(1, "SPI5_CLK"),
+		MTK_FUNCTION(2, "USB_DRVVBUS"),
+		MTK_FUNCTION(3, "DP_TX_HPD"),
+		MTK_FUNCTION(4, "AD_ILDO_DTEST0")
+	),
+	MTK_PIN(
+		119, "GPIO119",
+		MTK_EINT_FUNCTION(0, 119),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO119"),
+		MTK_FUNCTION(1, "SPI5_CSB"),
+		MTK_FUNCTION(2, "VBUSVALID"),
+		MTK_FUNCTION(3, "DP_OC_EN"),
+		MTK_FUNCTION(4, "AD_ILDO_DTEST1")
+	),
+	MTK_PIN(
+		120, "GPIO120",
+		MTK_EINT_FUNCTION(0, 120),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO120"),
+		MTK_FUNCTION(1, "SPI5_MO"),
+		MTK_FUNCTION(2, "LCM2_RST"),
+		MTK_FUNCTION(3, "DP_RAUX_SBU1"),
+		MTK_FUNCTION(4, "AD_ILDO_DTEST2"),
+		MTK_FUNCTION(6, "IDDIG_3P")
+	),
+	MTK_PIN(
+		121, "GPIO121",
+		MTK_EINT_FUNCTION(0, 121),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO121"),
+		MTK_FUNCTION(1, "SPI5_MI"),
+		MTK_FUNCTION(2, "DSI2_TE"),
+		MTK_FUNCTION(3, "DP_RAUX_SBU2"),
+		MTK_FUNCTION(4, "AD_ILDO_DTEST3"),
+		MTK_FUNCTION(6, "USB_DRVVBUS_3P"),
+		MTK_FUNCTION(7, "DBG_MON_B17")
+	),
+	MTK_PIN(
+		122, "GPIO122",
+		MTK_EINT_FUNCTION(0, 122),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO122"),
+		MTK_FUNCTION(1, "AP_GOOD"),
+		MTK_FUNCTION(2, "CONN_TCXOENA_REQ")
+	),
+	MTK_PIN(
+		123, "GPIO123",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO123"),
+		MTK_FUNCTION(1, "SCL3"),
+		MTK_FUNCTION(5, "I2SIN2_LRCK"),
+		MTK_FUNCTION(6, "TP_UTXD_MD_VCORE")
+	),
+	MTK_PIN(
+		124, "GPIO124",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO124"),
+		MTK_FUNCTION(1, "SDA3"),
+		MTK_FUNCTION(6, "TP_URXD_MD_VCORE")
+	),
+	MTK_PIN(
+		125, "GPIO125",
+		MTK_EINT_FUNCTION(0, 125),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO125"),
+		MTK_FUNCTION(1, "MSDC1_CLK"),
+		MTK_FUNCTION(2, "MD1_SIM2_SCLK"),
+		MTK_FUNCTION(3, "HFRP_JTAG0_TCK"),
+		MTK_FUNCTION(4, "UDI_TCK"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L1_JCK"),
+		MTK_FUNCTION(6, "SCP_JTAG_LITTLE_TCK_VLP"),
+		MTK_FUNCTION(7, "JTCK2_SEL1")
+	),
+	MTK_PIN(
+		126, "GPIO126",
+		MTK_EINT_FUNCTION(0, 126),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO126"),
+		MTK_FUNCTION(1, "MSDC1_CMD"),
+		MTK_FUNCTION(3, "HFRP_JTAG0_TMS"),
+		MTK_FUNCTION(4, "UDI_TMS"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L1_JMS"),
+		MTK_FUNCTION(6, "SCP_JTAG_LITTLE_TMS_VLP"),
+		MTK_FUNCTION(7, "JTMS2_SEL1")
+	),
+	MTK_PIN(
+		127, "GPIO127",
+		MTK_EINT_FUNCTION(0, 127),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO127"),
+		MTK_FUNCTION(1, "MSDC1_DAT0"),
+		MTK_FUNCTION(2, "MD1_SIM2_SRST"),
+		MTK_FUNCTION(3, "HFRP_JTAG0_TDI"),
+		MTK_FUNCTION(4, "UDI_TDI_0"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L1_JDI"),
+		MTK_FUNCTION(6, "SCP_JTAG_LITTLE_TDI_VLP"),
+		MTK_FUNCTION(7, "JTDI2_SEL1")
+	),
+	MTK_PIN(
+		128, "GPIO128",
+		MTK_EINT_FUNCTION(0, 128),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO128"),
+		MTK_FUNCTION(1, "MSDC1_DAT1"),
+		MTK_FUNCTION(2, "MD1_SIM2_SIO"),
+		MTK_FUNCTION(3, "HFRP_JTAG0_TDO"),
+		MTK_FUNCTION(4, "UDI_TDO_0"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L1_JDO"),
+		MTK_FUNCTION(6, "SCP_JTAG_LITTLE_TDO_VLP"),
+		MTK_FUNCTION(7, "JTDO2_SEL1")
+	),
+	MTK_PIN(
+		129, "GPIO129",
+		MTK_EINT_FUNCTION(0, 129),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO129"),
+		MTK_FUNCTION(1, "MSDC1_DAT2"),
+		MTK_FUNCTION(2, "DSI2_HSYNC"),
+		MTK_FUNCTION(3, "HFRP_JTAG0_TRSTN"),
+		MTK_FUNCTION(4, "UDI_NTRST"),
+		MTK_FUNCTION(6, "SCP_JTAG_LITTLE_TRSTN_VLP"),
+		MTK_FUNCTION(7, "JTRSTN2_SEL1")
+	),
+	MTK_PIN(
+		130, "GPIO130",
+		MTK_EINT_FUNCTION(0, 130),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO130"),
+		MTK_FUNCTION(1, "MSDC1_DAT3"),
+		MTK_FUNCTION(2, "DSI3_HSYNC"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L1_JINTP")
+	),
+	MTK_PIN(
+		131, "GPIO131",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO131"),
+		MTK_FUNCTION(1, "MD1_SIM2_SCLK"),
+		MTK_FUNCTION(2, "MD1_SIM1_SCLK"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TDI"),
+		MTK_FUNCTION(4, "CLKM0_A"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L5_JDI"),
+		MTK_FUNCTION(6, "TSFDC_SCK"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TDI_VCORE")
+	),
+	MTK_PIN(
+		132, "GPIO132",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO132"),
+		MTK_FUNCTION(1, "MD1_SIM2_SRST"),
+		MTK_FUNCTION(2, "MD1_SIM1_SRST"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TMS"),
+		MTK_FUNCTION(4, "CLKM1_B"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L5_JMS"),
+		MTK_FUNCTION(6, "TSFDC_SDI"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TMS_VCORE")
+	),
+	MTK_PIN(
+		133, "GPIO133",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO133"),
+		MTK_FUNCTION(1, "MD1_SIM2_SIO"),
+		MTK_FUNCTION(2, "MD1_SIM1_SIO"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TDO"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L5_JDO"),
+		MTK_FUNCTION(6, "TSFDC_SCF"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TDO_VCORE")
+	),
+	MTK_PIN(
+		134, "GPIO134",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO134"),
+		MTK_FUNCTION(1, "MD1_SIM1_SCLK"),
+		MTK_FUNCTION(2, "MD1_SIM2_SCLK"),
+		MTK_FUNCTION(6, "TSFDC_26M")
+	),
+	MTK_PIN(
+		135, "GPIO135",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO135"),
+		MTK_FUNCTION(1, "MD1_SIM1_SRST"),
+		MTK_FUNCTION(2, "MD1_SIM2_SRST"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TCK"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L5_JCK"),
+		MTK_FUNCTION(6, "TSFDC_SDO"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TCK_VCORE")
+	),
+	MTK_PIN(
+		136, "GPIO136",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO136"),
+		MTK_FUNCTION(1, "MD1_SIM1_SIO"),
+		MTK_FUNCTION(2, "MD1_SIM2_SIO"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TRSTN"),
+		MTK_FUNCTION(5, "CONN_BGF_DSP_L5_JINTP"),
+		MTK_FUNCTION(6, "TSFDC_FOUT"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TRSTN_VCORE")
+	),
+	MTK_PIN(
+		137, "GPIO137",
+		MTK_EINT_FUNCTION(0, 137),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO137"),
+		MTK_FUNCTION(1, "MIPI0_D_SCLK"),
+		MTK_FUNCTION(2, "BPI_BUS16"),
+		MTK_FUNCTION(4, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(6, "SPM_JTAG_TRSTN_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A0")
+	),
+	MTK_PIN(
+		138, "GPIO138",
+		MTK_EINT_FUNCTION(0, 138),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO138"),
+		MTK_FUNCTION(1, "MIPI0_D_SDATA"),
+		MTK_FUNCTION(2, "BPI_BUS17"),
+		MTK_FUNCTION(4, "PCM0_LRCK"),
+		MTK_FUNCTION(6, "SPM_JTAG_TCK_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A1")
+	),
+	MTK_PIN(
+		139, "GPIO139",
+		MTK_EINT_FUNCTION(0, 139),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO139"),
+		MTK_FUNCTION(1, "MIPI1_D_SCLK"),
+		MTK_FUNCTION(2, "BPI_BUS18"),
+		MTK_FUNCTION(4, "MD_GPS_BLANK"),
+		MTK_FUNCTION(6, "SPM_JTAG_TMS_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A2")
+	),
+	MTK_PIN(
+		140, "GPIO140",
+		MTK_EINT_FUNCTION(0, 140),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO140"),
+		MTK_FUNCTION(1, "MIPI1_D_SDATA"),
+		MTK_FUNCTION(2, "BPI_BUS19"),
+		MTK_FUNCTION(4, "MD_URXD1_CONN"),
+		MTK_FUNCTION(6, "SPM_JTAG_TDO_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A3")
+	),
+	MTK_PIN(
+		141, "GPIO141",
+		MTK_EINT_FUNCTION(0, 141),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO141"),
+		MTK_FUNCTION(1, "MIPI2_D_SCLK"),
+		MTK_FUNCTION(2, "BPI_BUS20"),
+		MTK_FUNCTION(4, "MD_UTXD1_CONN"),
+		MTK_FUNCTION(6, "SPM_JTAG_TDI_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A4")
+	),
+	MTK_PIN(
+		142, "GPIO142",
+		MTK_EINT_FUNCTION(0, 142),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO142"),
+		MTK_FUNCTION(1, "MIPI2_D_SDATA"),
+		MTK_FUNCTION(2, "BPI_BUS21"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TRSTN_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A5")
+	),
+	MTK_PIN(
+		143, "GPIO143",
+		MTK_EINT_FUNCTION(0, 143),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO143"),
+		MTK_FUNCTION(1, "MIPI3_D_SCLK"),
+		MTK_FUNCTION(2, "BPI_BUS22"),
+		MTK_FUNCTION(4, "TP_UTXD_GNSS_VLP"),
+		MTK_FUNCTION(5, "MD_UTXD1_CONN"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TCK_VCORE")
+	),
+	MTK_PIN(
+		144, "GPIO144",
+		MTK_EINT_FUNCTION(0, 144),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO144"),
+		MTK_FUNCTION(1, "MIPI3_D_SDATA"),
+		MTK_FUNCTION(2, "BPI_BUS23"),
+		MTK_FUNCTION(4, "TP_URXD_GNSS_VLP"),
+		MTK_FUNCTION(5, "MD_URXD1_CONN"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TMS_VCORE")
+	),
+	MTK_PIN(
+		145, "GPIO145",
+		MTK_EINT_FUNCTION(0, 145),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO145"),
+		MTK_FUNCTION(1, "BPI_BUS0"),
+		MTK_FUNCTION(4, "PCIE_WAKEN_1P"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TDO_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A10")
+	),
+	MTK_PIN(
+		146, "GPIO146",
+		MTK_EINT_FUNCTION(0, 146),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO146"),
+		MTK_FUNCTION(1, "BPI_BUS1"),
+		MTK_FUNCTION(4, "PCIE_PERSTN_1P"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TDI_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A11")
+	),
+	MTK_PIN(
+		147, "GPIO147",
+		MTK_EINT_FUNCTION(0, 147),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO147"),
+		MTK_FUNCTION(1, "BPI_BUS2"),
+		MTK_FUNCTION(2, "AUD_DAC_26M_CLK"),
+		MTK_FUNCTION(4, "PCIE_CLKREQN_1P"),
+		MTK_FUNCTION(6, "SCP_JTAG_LITTLE_TRSTN_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A12")
+	),
+	MTK_PIN(
+		148, "GPIO148",
+		MTK_EINT_FUNCTION(0, 148),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO148"),
+		MTK_FUNCTION(1, "BPI_BUS3"),
+		MTK_FUNCTION(2, "AUD_DAC_26M_CLK"),
+		MTK_FUNCTION(4, "TP_UTXD_MD_VLP"),
+		MTK_FUNCTION(5, "TP_GPIO0_AO"),
+		MTK_FUNCTION(6, "SCP_JTAG_LITTLE_TCK_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A13")
+	),
+	MTK_PIN(
+		149, "GPIO149",
+		MTK_EINT_FUNCTION(0, 149),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO149"),
+		MTK_FUNCTION(1, "BPI_BUS4"),
+		MTK_FUNCTION(2, "EXT_FRAME_SYNC"),
+		MTK_FUNCTION(4, "TP_URXD_MD_VLP"),
+		MTK_FUNCTION(5, "TP_GPIO1_AO"),
+		MTK_FUNCTION(6, "SCP_JTAG_LITTLE_TMS_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A14")
+	),
+	MTK_PIN(
+		150, "GPIO150",
+		MTK_EINT_FUNCTION(0, 150),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO150"),
+		MTK_FUNCTION(1, "BPI_BUS5"),
+		MTK_FUNCTION(2, "GPS_PPS0"),
+		MTK_FUNCTION(5, "TP_GPIO2_AO"),
+		MTK_FUNCTION(6, "SCP_JTAG_LITTLE_TDO_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A15")
+	),
+	MTK_PIN(
+		151, "GPIO151",
+		MTK_EINT_FUNCTION(0, 151),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO151"),
+		MTK_FUNCTION(1, "BPI_BUS6"),
+		MTK_FUNCTION(2, "GPS_PPS1"),
+		MTK_FUNCTION(5, "TP_GPIO3_AO"),
+		MTK_FUNCTION(6, "SCP_JTAG_LITTLE_TDI_VCORE")
+	),
+	MTK_PIN(
+		152, "GPIO152",
+		MTK_EINT_FUNCTION(0, 152),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO152"),
+		MTK_FUNCTION(1, "BPI_BUS7"),
+		MTK_FUNCTION(2, "EDP_TX_HPD"),
+		MTK_FUNCTION(5, "AGPS_SYNC"),
+		MTK_FUNCTION(6, "SSPM_UTXD_AO_VCORE")
+	),
+	MTK_PIN(
+		153, "GPIO153",
+		MTK_EINT_FUNCTION(0, 153),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO153"),
+		MTK_FUNCTION(1, "MD_UCNT_A_TGL"),
+		MTK_FUNCTION(6, "TP_URTS1_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A8")
+	),
+	MTK_PIN(
+		154, "GPIO154",
+		MTK_EINT_FUNCTION(0, 154),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO154"),
+		MTK_FUNCTION(1, "DIGRF_IRQ"),
+		MTK_FUNCTION(6, "TP_UCTS1_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A9")
+	),
+	MTK_PIN(
+		155, "GPIO155",
+		MTK_EINT_FUNCTION(0, 155),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO155"),
+		MTK_FUNCTION(1, "MIPI_M_SCLK"),
+		MTK_FUNCTION(4, "UCTS2"),
+		MTK_FUNCTION(6, "TP_UTXD_CONSYS_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A6")
+	),
+	MTK_PIN(
+		156, "GPIO156",
+		MTK_EINT_FUNCTION(0, 156),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO156"),
+		MTK_FUNCTION(1, "MIPI_M_SDATA"),
+		MTK_FUNCTION(4, "URTS2"),
+		MTK_FUNCTION(6, "TP_URXD_CONSYS_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A7")
+	),
+	MTK_PIN(
+		157, "GPIO157",
+		MTK_EINT_FUNCTION(0, 157),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO157"),
+		MTK_FUNCTION(1, "BPI_BUS8"),
+		MTK_FUNCTION(4, "UTXD2"),
+		MTK_FUNCTION(5, "CLKM0_A"),
+		MTK_FUNCTION(6, "SSPM_URXD_AO_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A16")
+	),
+	MTK_PIN(
+		158, "GPIO158",
+		MTK_EINT_FUNCTION(0, 158),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO158"),
+		MTK_FUNCTION(1, "BPI_BUS9"),
+		MTK_FUNCTION(4, "URXD2"),
+		MTK_FUNCTION(5, "CLKM1_A"),
+		MTK_FUNCTION(6, "TP_UTXD1_VCORE")
+	),
+	MTK_PIN(
+		159, "GPIO159",
+		MTK_EINT_FUNCTION(0, 159),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO159"),
+		MTK_FUNCTION(1, "BPI_BUS10"),
+		MTK_FUNCTION(2, "MD_INT0"),
+		MTK_FUNCTION(3, "SRCLKENAI1"),
+		MTK_FUNCTION(5, "CLKM2_A"),
+		MTK_FUNCTION(6, "TP_URXD1_VCORE")
+	),
+	MTK_PIN(
+		160, "GPIO160",
+		MTK_EINT_FUNCTION(0, 160),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO160"),
+		MTK_FUNCTION(1, "UTXD0"),
+		MTK_FUNCTION(2, "MD_UTXD1"),
+		MTK_FUNCTION(5, "MBISTREADEN_TRIGGER"),
+		MTK_FUNCTION(6, "CONN_BG_GPS_MCU_DBG_UART_TX")
+	),
+	MTK_PIN(
+		161, "GPIO161",
+		MTK_EINT_FUNCTION(0, 161),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO161"),
+		MTK_FUNCTION(1, "URXD0"),
+		MTK_FUNCTION(2, "MD_URXD1"),
+		MTK_FUNCTION(5, "MBISTWRITEEN_TRIGGER")
+	),
+	MTK_PIN(
+		162, "GPIO162",
+		MTK_EINT_FUNCTION(0, 162),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO162"),
+		MTK_FUNCTION(1, "UTXD1"),
+		MTK_FUNCTION(2, "MD_UTXD0"),
+		MTK_FUNCTION(3, "TP_UTXD1_VLP"),
+		MTK_FUNCTION(4, "ADSP_UTXD0"),
+		MTK_FUNCTION(5, "SSPM_UTXD_AO_VLP"),
+		MTK_FUNCTION(6, "HFRP_UTXD1")
+	),
+	MTK_PIN(
+		163, "GPIO163",
+		MTK_EINT_FUNCTION(0, 163),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO163"),
+		MTK_FUNCTION(1, "URXD1"),
+		MTK_FUNCTION(2, "MD_URXD0"),
+		MTK_FUNCTION(3, "TP_URXD1_VLP"),
+		MTK_FUNCTION(4, "ADSP_URXD0"),
+		MTK_FUNCTION(5, "SSPM_URXD_AO_VLP"),
+		MTK_FUNCTION(6, "HFRP_URXD1")
+	),
+	MTK_PIN(
+		164, "GPIO164",
+		MTK_EINT_FUNCTION(0, 164),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO164"),
+		MTK_FUNCTION(1, "SCP_SCL0"),
+		MTK_FUNCTION(6, "TP_GPIO0_AO"),
+		MTK_FUNCTION(7, "DBG_MON_A22")
+	),
+	MTK_PIN(
+		165, "GPIO165",
+		MTK_EINT_FUNCTION(0, 165),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO165"),
+		MTK_FUNCTION(1, "SCP_SDA0"),
+		MTK_FUNCTION(6, "TP_GPIO1_AO"),
+		MTK_FUNCTION(7, "DBG_MON_A23")
+	),
+	MTK_PIN(
+		166, "GPIO166",
+		MTK_EINT_FUNCTION(0, 166),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO166"),
+		MTK_FUNCTION(1, "SCP_SCL2"),
+		MTK_FUNCTION(6, "TP_GPIO2_AO"),
+		MTK_FUNCTION(7, "DBG_MON_A24")
+	),
+	MTK_PIN(
+		167, "GPIO167",
+		MTK_EINT_FUNCTION(0, 167),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO167"),
+		MTK_FUNCTION(1, "SCP_SDA2"),
+		MTK_FUNCTION(6, "TP_GPIO3_AO"),
+		MTK_FUNCTION(7, "DBG_MON_A25")
+	),
+	MTK_PIN(
+		168, "GPIO168",
+		MTK_EINT_FUNCTION(0, 168),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO168"),
+		MTK_FUNCTION(1, "SCP_SPI2_CK"),
+		MTK_FUNCTION(2, "SPI2_B_CLK"),
+		MTK_FUNCTION(3, "PWM_VLP"),
+		MTK_FUNCTION(4, "SCP_SCL2"),
+		MTK_FUNCTION(7, "DBG_MON_A26")
+	),
+	MTK_PIN(
+		169, "GPIO169",
+		MTK_EINT_FUNCTION(0, 169),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO169"),
+		MTK_FUNCTION(1, "SCP_SPI2_CS"),
+		MTK_FUNCTION(2, "SPI2_B_CSB"),
+		MTK_FUNCTION(7, "DBG_MON_A27")
+	),
+	MTK_PIN(
+		170, "GPIO170",
+		MTK_EINT_FUNCTION(0, 170),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO170"),
+		MTK_FUNCTION(1, "SCP_SPI2_MO"),
+		MTK_FUNCTION(2, "SPI2_B_MO"),
+		MTK_FUNCTION(4, "SCP_SDA2"),
+		MTK_FUNCTION(7, "DBG_MON_A28")
+	),
+	MTK_PIN(
+		171, "GPIO171",
+		MTK_EINT_FUNCTION(0, 171),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO171"),
+		MTK_FUNCTION(1, "SCP_SPI2_MI"),
+		MTK_FUNCTION(2, "SPI2_B_MI"),
+		MTK_FUNCTION(7, "DBG_MON_A29")
+	),
+	MTK_PIN(
+		172, "GPIO172",
+		MTK_EINT_FUNCTION(0, 172),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO172"),
+		MTK_FUNCTION(1, "CONN_TCXOENA_REQ")
+	),
+	MTK_PIN(
+		173, "GPIO173",
+		MTK_EINT_FUNCTION(0, 173),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO173"),
+		MTK_FUNCTION(1, "CMFLASH3"),
+		MTK_FUNCTION(2, "PWM_3"),
+		MTK_FUNCTION(3, "MD_GPS_L5_BLANK"),
+		MTK_FUNCTION(4, "CLKM1_A"),
+		MTK_FUNCTION(7, "DBG_MON_A31")
+	),
+	MTK_PIN(
+		174, "GPIO174",
+		MTK_EINT_FUNCTION(0, 174),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO174"),
+		MTK_FUNCTION(1, "CMFLASH0"),
+		MTK_FUNCTION(2, "PWM_0"),
+		MTK_FUNCTION(3, "VBUSVALID_1P"),
+		MTK_FUNCTION(4, "MD32_2_RXD"),
+		MTK_FUNCTION(5, "DISP_PWM3")
+	),
+	MTK_PIN(
+		175, "GPIO175",
+		MTK_EINT_FUNCTION(0, 175),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO175"),
+		MTK_FUNCTION(1, "CMFLASH1"),
+		MTK_FUNCTION(2, "PWM_1"),
+		MTK_FUNCTION(3, "EDP_TX_HPD"),
+		MTK_FUNCTION(4, "MD32_2_TXD"),
+		MTK_FUNCTION(5, "DISP_PWM4")
+	),
+	MTK_PIN(
+		176, "GPIO176",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO176"),
+		MTK_FUNCTION(1, "SCL5"),
+		MTK_FUNCTION(2, "LCM3_RST"),
+		MTK_FUNCTION(4, "MD_URXD1_CONN"),
+		MTK_FUNCTION(6, "TP_UTXD_GNSS_VCORE")
+	),
+	MTK_PIN(
+		177, "GPIO177",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO177"),
+		MTK_FUNCTION(1, "SDA5"),
+		MTK_FUNCTION(2, "DSI3_TE"),
+		MTK_FUNCTION(4, "MD_UTXD1_CONN"),
+		MTK_FUNCTION(6, "TP_URXD_GNSS_VCORE")
+	),
+	MTK_PIN(
+		178, "GPIO178",
+		MTK_EINT_FUNCTION(0, 178),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO178"),
+		MTK_FUNCTION(1, "DMIC_CLK"),
+		MTK_FUNCTION(2, "SCP_DMIC_CLK"),
+		MTK_FUNCTION(3, "SRCLKENAI0"),
+		MTK_FUNCTION(4, "CLKM2_B"),
+		MTK_FUNCTION(5, "TP_GPIO7_AO"),
+		MTK_FUNCTION(6, "SPU1_UTX"),
+		MTK_FUNCTION(7, "DAP_SONIC_SWCK")
+	),
+	MTK_PIN(
+		179, "GPIO179",
+		MTK_EINT_FUNCTION(0, 179),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO179"),
+		MTK_FUNCTION(1, "DMIC_DAT"),
+		MTK_FUNCTION(2, "SCP_DMIC_DAT"),
+		MTK_FUNCTION(3, "SRCLKENAI1"),
+		MTK_FUNCTION(4, "CLKM3_B"),
+		MTK_FUNCTION(5, "TP_GPIO8_AO"),
+		MTK_FUNCTION(6, "SPU1_URX"),
+		MTK_FUNCTION(7, "DAP_SONIC_SWD")
+	),
+	MTK_PIN(
+		180, "GPIO180",
+		MTK_EINT_FUNCTION(0, 180),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO180"),
+		MTK_FUNCTION(1, "IDDIG_1P"),
+		MTK_FUNCTION(2, "CMVREF0"),
+		MTK_FUNCTION(3, "GPS_PPS1"),
+		MTK_FUNCTION(4, "GPS_L5_ELNA_EN"),
+		MTK_FUNCTION(5, "DISP_PWM1")
+	),
+	MTK_PIN(
+		181, "GPIO181",
+		MTK_EINT_FUNCTION(0, 181),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO181"),
+		MTK_FUNCTION(1, "USB_DRVVBUS_1P"),
+		MTK_FUNCTION(2, "CMVREF1"),
+		MTK_FUNCTION(3, "MFG_EB_JTAG_TRSTN"),
+		MTK_FUNCTION(4, "ADSP_JTAG1_TRSTN"),
+		MTK_FUNCTION(5, "HFRP_JTAG1_TRSTN"),
+		MTK_FUNCTION(6, "SPU1_NTRST"),
+		MTK_FUNCTION(7, "CONN_BG_GPS_MCU_TRST_B")
+	),
+	MTK_PIN(
+		182, "GPIO182",
+		MTK_EINT_FUNCTION(0, 182),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO182"),
+		MTK_FUNCTION(1, "SCL11"),
+		MTK_FUNCTION(2, "CMVREF2"),
+		MTK_FUNCTION(3, "MFG_EB_JTAG_TCK"),
+		MTK_FUNCTION(4, "ADSP_JTAG1_TCK"),
+		MTK_FUNCTION(5, "HFRP_JTAG1_TCK"),
+		MTK_FUNCTION(6, "SPU1_TCK"),
+		MTK_FUNCTION(7, "CONN_BG_GPS_MCU_TCK")
+	),
+	MTK_PIN(
+		183, "GPIO183",
+		MTK_EINT_FUNCTION(0, 183),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO183"),
+		MTK_FUNCTION(1, "SDA11"),
+		MTK_FUNCTION(2, "CMVREF3"),
+		MTK_FUNCTION(3, "MFG_EB_JTAG_TMS"),
+		MTK_FUNCTION(4, "ADSP_JTAG1_TMS"),
+		MTK_FUNCTION(5, "HFRP_JTAG1_TMS"),
+		MTK_FUNCTION(6, "SPU1_TMS"),
+		MTK_FUNCTION(7, "CONN_BG_GPS_MCU_TMS")
+	),
+	MTK_PIN(
+		184, "GPIO184",
+		MTK_EINT_FUNCTION(0, 184),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO184"),
+		MTK_FUNCTION(1, "SCL12"),
+		MTK_FUNCTION(2, "CMVREF4"),
+		MTK_FUNCTION(3, "MFG_EB_JTAG_TDO"),
+		MTK_FUNCTION(4, "ADSP_JTAG1_TDO"),
+		MTK_FUNCTION(5, "HFRP_JTAG1_TDO"),
+		MTK_FUNCTION(6, "SPU1_TDO"),
+		MTK_FUNCTION(7, "CONN_BG_GPS_MCU_TDO")
+	),
+	MTK_PIN(
+		185, "GPIO185",
+		MTK_EINT_FUNCTION(0, 185),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO185"),
+		MTK_FUNCTION(1, "SDA12"),
+		MTK_FUNCTION(2, "CMVREF5"),
+		MTK_FUNCTION(3, "MFG_EB_JTAG_TDI"),
+		MTK_FUNCTION(4, "ADSP_JTAG1_TDI"),
+		MTK_FUNCTION(5, "HFRP_JTAG1_TDI"),
+		MTK_FUNCTION(6, "SPU1_TDI"),
+		MTK_FUNCTION(7, "CONN_BG_GPS_MCU_TDI")
+	),
+	MTK_PIN(
+		186, "GPIO186",
+		MTK_EINT_FUNCTION(0, 186),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO186"),
+		MTK_FUNCTION(1, "MD_GPS_L1_BLANK"),
+		MTK_FUNCTION(2, "PMSR_SMAP"),
+		MTK_FUNCTION(3, "TP_GPIO2_AO")
+	),
+	MTK_PIN(
+		187, "GPIO187",
+		MTK_EINT_FUNCTION(0, 187),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO187"),
+		MTK_FUNCTION(1, "MD_GPS_L5_BLANK"),
+		MTK_FUNCTION(3, "TP_GPIO4_AO")
+	),
+	MTK_PIN(
+		188, "GPIO188",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO188"),
+		MTK_FUNCTION(1, "SCL2"),
+		MTK_FUNCTION(2, "SCP_SCL8")
+	),
+	MTK_PIN(
+		189, "GPIO189",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO189"),
+		MTK_FUNCTION(1, "SDA2"),
+		MTK_FUNCTION(2, "SCP_SDA8")
+	),
+	MTK_PIN(
+		190, "GPIO190",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO190"),
+		MTK_FUNCTION(1, "SCL4"),
+		MTK_FUNCTION(2, "SCP_SCL9"),
+		MTK_FUNCTION(6, "UDI_TDI_6")
+	),
+	MTK_PIN(
+		191, "GPIO191",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO191"),
+		MTK_FUNCTION(1, "SDA4"),
+		MTK_FUNCTION(2, "SCP_SDA9"),
+		MTK_FUNCTION(6, "UDI_TDI_7")
+	),
+	MTK_PIN(
+		192, "GPIO192",
+		MTK_EINT_FUNCTION(0, 192),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO192"),
+		MTK_FUNCTION(1, "CMMCLK2"),
+		MTK_FUNCTION(4, "MD32_3_RXD")
+	),
+	MTK_PIN(
+		193, "GPIO193",
+		MTK_EINT_FUNCTION(0, 193),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO193"),
+		MTK_FUNCTION(3, "CLKM0_B"),
+		MTK_FUNCTION(4, "MD32_3_TXD"),
+		MTK_FUNCTION(6, "UDI_TDO_7")
+	),
+	MTK_PIN(
+		194, "GPIO194",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO194"),
+		MTK_FUNCTION(1, "SCL7"),
+		MTK_FUNCTION(2, "MD32_3_GPIO0"),
+		MTK_FUNCTION(3, "CLKM2_B"),
+		MTK_FUNCTION(6, "UDI_TDI_2")
+	),
+	MTK_PIN(
+		195, "GPIO195",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO195"),
+		MTK_FUNCTION(1, "SDA7"),
+		MTK_FUNCTION(3, "CLKM3_B"),
+		MTK_FUNCTION(6, "UDI_TDI_3")
+	),
+	MTK_PIN(
+		196, "GPIO196",
+		MTK_EINT_FUNCTION(0, 196),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO196"),
+		MTK_FUNCTION(1, "CMMCLK3")
+	),
+	MTK_PIN(
+		197, "GPIO197",
+		MTK_EINT_FUNCTION(0, 197),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO197"),
+		MTK_FUNCTION(3, "CLKM1_B"),
+		MTK_FUNCTION(6, "UDI_TDI_1")
+	),
+	MTK_PIN(
+		198, "GPIO198",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO198"),
+		MTK_FUNCTION(1, "SCL8"),
+		MTK_FUNCTION(6, "UDI_TDI_4")
+	),
+	MTK_PIN(
+		199, "GPIO199",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO199"),
+		MTK_FUNCTION(1, "SDA8"),
+		MTK_FUNCTION(6, "UDI_TDI_5")
+	),
+	MTK_PIN(
+		200, "GPIO200",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO200"),
+		MTK_FUNCTION(1, "SCL1")
+	),
+	MTK_PIN(
+		201, "GPIO201",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO201"),
+		MTK_FUNCTION(1, "SDA1"),
+		MTK_FUNCTION(7, "TSFDC_BG_COMP")
+	),
+	MTK_PIN(
+		202, "GPIO202",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO202"),
+		MTK_FUNCTION(1, "SCL9"),
+		MTK_FUNCTION(2, "SCP_SCL7"),
+		MTK_FUNCTION(6, "TP_GPIO15_AO")
+	),
+	MTK_PIN(
+		203, "GPIO203",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO203"),
+		MTK_FUNCTION(1, "SDA9"),
+		MTK_FUNCTION(2, "SCP_SDA7"),
+		MTK_FUNCTION(6, "TP_GPIO9_AO")
+	),
+	MTK_PIN(
+		204, "GPIO204",
+		MTK_EINT_FUNCTION(0, 204),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO204"),
+		MTK_FUNCTION(1, "SCL13"),
+		MTK_FUNCTION(2, "CMVREF6"),
+		MTK_FUNCTION(3, "GPS_L1_ELNA_EN"),
+		MTK_FUNCTION(5, "CLKM2_B"),
+		MTK_FUNCTION(6, "TP_GPIO12_AO")
+	),
+	MTK_PIN(
+		205, "GPIO205",
+		MTK_EINT_FUNCTION(0, 205),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO205"),
+		MTK_FUNCTION(1, "SDA13"),
+		MTK_FUNCTION(2, "CMVREF7"),
+		MTK_FUNCTION(3, "GPS_L5_ELNA_EN"),
+		MTK_FUNCTION(5, "CLKM3_B"),
+		MTK_FUNCTION(6, "TP_GPIO13_AO")
+	),
+	MTK_PIN(
+		206, "GPIO206",
+		MTK_EINT_FUNCTION(0, 206),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO206"),
+		MTK_FUNCTION(2, "MD32_2_GPIO0"),
+		MTK_FUNCTION(5, "VBUSVALID"),
+		MTK_FUNCTION(6, "UDI_TDO_3")
+	),
+	MTK_PIN(
+		207, "GPIO207",
+		MTK_EINT_FUNCTION(0, 207),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO207"),
+		MTK_FUNCTION(1, "PCIE_WAKEN_2P"),
+		MTK_FUNCTION(2, "PMSR_SMAP_MAX"),
+		MTK_FUNCTION(4, "FMI2S_A_BCK"),
+		MTK_FUNCTION(6, "UDI_TDO_4")
+	),
+	MTK_PIN(
+		208, "GPIO208",
+		MTK_EINT_FUNCTION(0, 208),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO208"),
+		MTK_FUNCTION(1, "PCIE_CLKREQN_2P"),
+		MTK_FUNCTION(2, "PMSR_SMAP_MAX_W"),
+		MTK_FUNCTION(4, "FMI2S_A_LRCK"),
+		MTK_FUNCTION(5, "CLKM0_B"),
+		MTK_FUNCTION(6, "UDI_TDO_5")
+	),
+	MTK_PIN(
+		209, "GPIO209",
+		MTK_EINT_FUNCTION(0, 209),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO209"),
+		MTK_FUNCTION(1, "PCIE_PERSTN_2P"),
+		MTK_FUNCTION(2, "PMSR_SMAP"),
+		MTK_FUNCTION(4, "FMI2S_A_DI"),
+		MTK_FUNCTION(5, "CLKM1_B"),
+		MTK_FUNCTION(6, "UDI_TDO_6")
+	),
+	MTK_PIN(
+		210, "GPIO210",
+		MTK_EINT_FUNCTION(0, 210),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO210"),
+		MTK_FUNCTION(1, "CMMCLK4")
+	),
+	MTK_PIN(
+		211, "GPIO211",
+		MTK_EINT_FUNCTION(0, 211),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO211"),
+		MTK_FUNCTION(1, "CMMCLK5"),
+		MTK_FUNCTION(2, "CONN_TCXOENA_REQ")
+	),
+	MTK_PIN(
+		212, "GPIO212",
+		MTK_EINT_FUNCTION(0, 212),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO212"),
+		MTK_FUNCTION(1, "CMMCLK6"),
+		MTK_FUNCTION(2, "TP_GPIO10_AO"),
+		MTK_FUNCTION(5, "IDDIG"),
+		MTK_FUNCTION(6, "UDI_TDO_1")
+	),
+	MTK_PIN(
+		213, "GPIO213",
+		MTK_EINT_FUNCTION(0, 213),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO213"),
+		MTK_FUNCTION(1, "CMMCLK7"),
+		MTK_FUNCTION(2, "TP_GPIO11_AO"),
+		MTK_FUNCTION(5, "USB_DRVVBUS"),
+		MTK_FUNCTION(6, "UDI_TDO_2")
+	),
+	MTK_PIN(
+		214, "GPIO214",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO214"),
+		MTK_FUNCTION(1, "SCP_SCL3"),
+		MTK_FUNCTION(2, "SDA14_E1_SCL14_E2"),
+		MTK_FUNCTION(6, "GBE1_MDC"),
+		MTK_FUNCTION(7, "GBE0_MDC")
+	),
+	MTK_PIN(
+		215, "GPIO215",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO215"),
+		MTK_FUNCTION(1, "SCP_SDA3"),
+		MTK_FUNCTION(2, "SCL14_E1_SDA14_E2"),
+		MTK_FUNCTION(6, "GBE1_MDIO"),
+		MTK_FUNCTION(7, "GBE0_MDIO")
+	),
+	MTK_PIN(
+		216, "GPIO216",
+		MTK_EINT_FUNCTION(0, 216),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO216"),
+		MTK_FUNCTION(1, "GPS_PPS0")
+	),
+	MTK_PIN(
+		217, "GPIO217",
+		MTK_EINT_FUNCTION(0, 217),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO217"),
+		MTK_FUNCTION(1, "KPROW0"),
+		MTK_FUNCTION(6, "TP_GPIO12_AO")
+	),
+	MTK_PIN(
+		218, "GPIO218",
+		MTK_EINT_FUNCTION(0, 218),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO218"),
+		MTK_FUNCTION(1, "KPROW1"),
+		MTK_FUNCTION(2, "SPI0_WP"),
+		MTK_FUNCTION(3, "MBISTREADEN_TRIGGER"),
+		MTK_FUNCTION(5, "GPS_L5_ELNA_EN"),
+		MTK_FUNCTION(6, "TP_GPIO14_AO")
+	),
+	MTK_PIN(
+		219, "GPIO219",
+		MTK_EINT_FUNCTION(0, 219),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO219"),
+		MTK_FUNCTION(1, "KPCOL1"),
+		MTK_FUNCTION(2, "SPI0_HOLD"),
+		MTK_FUNCTION(3, "MBISTWRITEEN_TRIGGER"),
+		MTK_FUNCTION(4, "SPMI_M_TRIG_FLAG"),
+		MTK_FUNCTION(5, "GPS_L1_ELNA_EN"),
+		MTK_FUNCTION(6, "SPM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(7, "JTRSTN_SEL1")
+	),
+	MTK_PIN(
+		220, "GPIO220",
+		MTK_EINT_FUNCTION(0, 220),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO220"),
+		MTK_FUNCTION(1, "SPI0_CLK"),
+		MTK_FUNCTION(6, "SPM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(7, "JTCK_SEL1")
+	),
+	MTK_PIN(
+		221, "GPIO221",
+		MTK_EINT_FUNCTION(0, 221),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO221"),
+		MTK_FUNCTION(1, "SPI0_CSB"),
+		MTK_FUNCTION(6, "SPM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(7, "JTMS_SEL1")
+	),
+	MTK_PIN(
+		222, "GPIO222",
+		MTK_EINT_FUNCTION(0, 222),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO222"),
+		MTK_FUNCTION(1, "SPI0_MO"),
+		MTK_FUNCTION(2, "SCP_SCL7"),
+		MTK_FUNCTION(6, "SPM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(7, "JTDO_SEL1")
+	),
+	MTK_PIN(
+		223, "GPIO223",
+		MTK_EINT_FUNCTION(0, 223),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO223"),
+		MTK_FUNCTION(1, "SPI0_MI"),
+		MTK_FUNCTION(2, "SCP_SDA7"),
+		MTK_FUNCTION(6, "SPM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(7, "JTDI_SEL1")
+	),
+	MTK_PIN(
+		224, "GPIO224",
+		MTK_EINT_FUNCTION(0, 224),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO224"),
+		MTK_FUNCTION(1, "MSDC2_CLK"),
+		MTK_FUNCTION(2, "DMIC2_CLK"),
+		MTK_FUNCTION(3, "GBE0_AUX_PPS0"),
+		MTK_FUNCTION(4, "GBE0_TXER"),
+		MTK_FUNCTION(5, "GBE1_TXER"),
+		MTK_FUNCTION(6, "GBE1_AUX_PPS0"),
+		MTK_FUNCTION(7, "MD32_1_TXD")
+	),
+	MTK_PIN(
+		225, "GPIO225",
+		MTK_EINT_FUNCTION(0, 225),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO225"),
+		MTK_FUNCTION(1, "MSDC2_CMD"),
+		MTK_FUNCTION(2, "DMIC2_DAT"),
+		MTK_FUNCTION(3, "GBE0_AUX_PPS1"),
+		MTK_FUNCTION(4, "GBE0_RXER"),
+		MTK_FUNCTION(5, "GBE1_RXER"),
+		MTK_FUNCTION(6, "GBE1_AUX_PPS1"),
+		MTK_FUNCTION(7, "MD32_1_RXD")
+	),
+	MTK_PIN(
+		226, "GPIO226",
+		MTK_EINT_FUNCTION(0, 226),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO226"),
+		MTK_FUNCTION(1, "MSDC2_DAT0"),
+		MTK_FUNCTION(2, "I2SIN3_BCK"),
+		MTK_FUNCTION(3, "GBE0_AUX_PPS2"),
+		MTK_FUNCTION(4, "GBE0_COL"),
+		MTK_FUNCTION(5, "GBE1_COL"),
+		MTK_FUNCTION(6, "GBE1_AUX_PPS2"),
+		MTK_FUNCTION(7, "GBE1_MDC")
+	),
+	MTK_PIN(
+		227, "GPIO227",
+		MTK_EINT_FUNCTION(0, 227),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO227"),
+		MTK_FUNCTION(1, "MSDC2_DAT1"),
+		MTK_FUNCTION(2, "I2SIN3_LRCK"),
+		MTK_FUNCTION(3, "GBE0_AUX_PPS3"),
+		MTK_FUNCTION(4, "GBE0_INTR"),
+		MTK_FUNCTION(5, "GBE1_INTR"),
+		MTK_FUNCTION(6, "GBE1_AUX_PPS3"),
+		MTK_FUNCTION(7, "GBE1_MDIO")
+	),
+	MTK_PIN(
+		228, "GPIO228",
+		MTK_EINT_FUNCTION(0, 228),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO228"),
+		MTK_FUNCTION(1, "MSDC2_DAT2"),
+		MTK_FUNCTION(2, "I2SIN3_DI"),
+		MTK_FUNCTION(3, "GBE0_MDC"),
+		MTK_FUNCTION(4, "GBE1_MDC"),
+		MTK_FUNCTION(5, "CONN_BG_GPS_MCU_AICE_TCKC")
+	),
+	MTK_PIN(
+		229, "GPIO229",
+		MTK_EINT_FUNCTION(0, 229),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO229"),
+		MTK_FUNCTION(1, "MSDC2_DAT3"),
+		MTK_FUNCTION(2, "I2SOUT3_DO"),
+		MTK_FUNCTION(3, "GBE0_MDIO"),
+		MTK_FUNCTION(4, "GBE1_MDIO"),
+		MTK_FUNCTION(5, "CONN_BG_GPS_MCU_AICE_TMSC"),
+		MTK_FUNCTION(7, "AVB_CLK2")
+	),
+	MTK_PIN(
+		230, "GPIO230",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO230"),
+		MTK_FUNCTION(1, "CONN_TOP_CLK")
+	),
+	MTK_PIN(
+		231, "GPIO231",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO231"),
+		MTK_FUNCTION(1, "CONN_TOP_DATA")
+	),
+	MTK_PIN(
+		232, "GPIO232",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO232"),
+		MTK_FUNCTION(1, "CONN_HRST_B")
+	),
+	MTK_PIN(
+		233, "GPIO233",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO233"),
+		MTK_FUNCTION(1, "I2SIN0_BCK")
+	),
+	MTK_PIN(
+		234, "GPIO234",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO234"),
+		MTK_FUNCTION(1, "I2SIN0_LRCK")
+	),
+	MTK_PIN(
+		235, "GPIO235",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO235"),
+		MTK_FUNCTION(1, "I2SIN0_DI")
+	),
+	MTK_PIN(
+		236, "GPIO236",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO236"),
+		MTK_FUNCTION(1, "I2SOUT0_DO")
+	),
+	MTK_PIN(
+		237, "GPIO237",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO237"),
+		MTK_FUNCTION(1, "CONN_UARTHUB_UART_TX"),
+		MTK_FUNCTION(3, "UTXD3")
+	),
+	MTK_PIN(
+		238, "GPIO238",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO238"),
+		MTK_FUNCTION(1, "CONN_UARTHUB_UART_RX"),
+		MTK_FUNCTION(3, "URXD3")
+	),
+	MTK_PIN(
+		239, "GPIO239",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO239"),
+		MTK_FUNCTION(1, "TP_UTXD_CONSYS_VLP"),
+		MTK_FUNCTION(2, "TP_URXD_CONSYS_VLP")
+	),
+	MTK_PIN(
+		240, "GPIO240",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO240"),
+		MTK_FUNCTION(1, "TP_URXD_CONSYS_VLP"),
+		MTK_FUNCTION(2, "TP_UTXD_CONSYS_VLP")
+	),
+	MTK_PIN(
+		241, "GPIO241",
+		MTK_EINT_FUNCTION(0, 241),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO241"),
+		MTK_FUNCTION(1, "PCIE_PERSTN")
+	),
+	MTK_PIN(
+		242, "GPIO242",
+		MTK_EINT_FUNCTION(0, 242),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO242"),
+		MTK_FUNCTION(1, "PCIE_WAKEN")
+	),
+	MTK_PIN(
+		243, "GPIO243",
+		MTK_EINT_FUNCTION(0, 243),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO243"),
+		MTK_FUNCTION(1, "PCIE_CLKREQN")
+	),
+	MTK_PIN(
+		244, "GPIO244",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO244"),
+		MTK_FUNCTION(1, "CONN_RST")
+	),
+	MTK_PIN(
+		245, "GPIO245",
+		MTK_EINT_FUNCTION(0, 245),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO245")
+	),
+	MTK_PIN(
+		246, "GPIO246",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO246"),
+		MTK_FUNCTION(1, "CONN_PTA_TXD0")
+	),
+	MTK_PIN(
+		247, "GPIO247",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO247"),
+		MTK_FUNCTION(1, "CONN_PTA_RXD0")
+	),
+	MTK_PIN(
+		248, "GPIO248",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO248"),
+		MTK_FUNCTION(3, "UCTS3")
+	),
+	MTK_PIN(
+		249, "GPIO249",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO249"),
+		MTK_FUNCTION(3, "URTS3")
+	),
+	MTK_PIN(
+		250, "GPIO250",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO250")
+	),
+	MTK_PIN(
+		251, "GPIO251",
+		MTK_EINT_FUNCTION(0, 251),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO251"),
+		MTK_FUNCTION(1, "IDDIG_1P")
+	),
+	MTK_PIN(
+		252, "GPIO252",
+		MTK_EINT_FUNCTION(0, 252),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO252"),
+		MTK_FUNCTION(1, "USB_DRVVBUS_1P")
+	),
+	MTK_PIN(
+		253, "GPIO253",
+		MTK_EINT_FUNCTION(0, 253),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO253"),
+		MTK_FUNCTION(1, "VBUSVALID_1P")
+	),
+	MTK_PIN(
+		254, "GPIO254",
+		MTK_EINT_FUNCTION(0, 254),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO254"),
+		MTK_FUNCTION(1, "IDDIG_2P")
+	),
+	MTK_PIN(
+		255, "GPIO255",
+		MTK_EINT_FUNCTION(0, 255),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO255"),
+		MTK_FUNCTION(1, "USB_DRVVBUS_2P")
+	),
+	MTK_PIN(
+		256, "GPIO256",
+		MTK_EINT_FUNCTION(0, 256),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO256"),
+		MTK_FUNCTION(1, "VBUSVALID_2P")
+	),
+	MTK_PIN(
+		257, "GPIO257",
+		MTK_EINT_FUNCTION(0, 257),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO257"),
+		MTK_FUNCTION(1, "VBUSVALID_3P")
+	),
+	MTK_PIN(
+		258, "GPIO258",
+		MTK_EINT_FUNCTION(0, 258),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO258"),
+		MTK_FUNCTION(7, "AVB_CLK1")
+	),
+	MTK_PIN(
+		259, "GPIO259",
+		MTK_EINT_FUNCTION(0, 259),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO259"),
+		MTK_FUNCTION(1, "GBE0_TXD0"),
+		MTK_FUNCTION(2, "GBE1_TXD0")
+	),
+	MTK_PIN(
+		260, "GPIO260",
+		MTK_EINT_FUNCTION(0, 260),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO260"),
+		MTK_FUNCTION(1, "GBE0_TXD1"),
+		MTK_FUNCTION(2, "GBE1_TXD1")
+	),
+	MTK_PIN(
+		261, "GPIO261",
+		MTK_EINT_FUNCTION(0, 261),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO261"),
+		MTK_FUNCTION(1, "GBE0_TXC"),
+		MTK_FUNCTION(2, "GBE1_TXC")
+	),
+	MTK_PIN(
+		262, "GPIO262",
+		MTK_EINT_FUNCTION(0, 262),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO262"),
+		MTK_FUNCTION(1, "GBE0_TXEN"),
+		MTK_FUNCTION(2, "GBE1_TXEN")
+	),
+	MTK_PIN(
+		263, "GPIO263",
+		MTK_EINT_FUNCTION(0, 263),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO263"),
+		MTK_FUNCTION(1, "GBE0_RXD0"),
+		MTK_FUNCTION(2, "GBE1_RXD0"),
+		MTK_FUNCTION(3, "GBE0_AUX_PPS0")
+	),
+	MTK_PIN(
+		264, "GPIO264",
+		MTK_EINT_FUNCTION(0, 264),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO264"),
+		MTK_FUNCTION(1, "GBE0_RXD1"),
+		MTK_FUNCTION(2, "GBE1_RXD1"),
+		MTK_FUNCTION(3, "GBE0_AUX_PPS1")
+	),
+	MTK_PIN(
+		265, "GPIO265",
+		MTK_EINT_FUNCTION(0, 265),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO265"),
+		MTK_FUNCTION(1, "GBE0_RXC"),
+		MTK_FUNCTION(2, "GBE1_RXC"),
+		MTK_FUNCTION(3, "GBE0_AUX_PPS2")
+	),
+	MTK_PIN(
+		266, "GPIO266",
+		MTK_EINT_FUNCTION(0, 266),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO266"),
+		MTK_FUNCTION(1, "GBE0_RXDV"),
+		MTK_FUNCTION(2, "GBE1_RXDV"),
+		MTK_FUNCTION(3, "GBE0_AUX_PPS3")
+	),
+	MTK_PIN(
+		267, "GPIO267",
+		MTK_EINT_FUNCTION(0, 267),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO267"),
+		MTK_FUNCTION(1, "GBE0_TXD2"),
+		MTK_FUNCTION(2, "GBE1_TXD2"),
+		MTK_FUNCTION(3, "GBE0_RXER"),
+		MTK_FUNCTION(4, "GBE1_RXER")
+	),
+	MTK_PIN(
+		268, "GPIO268",
+		MTK_EINT_FUNCTION(0, 268),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO268"),
+		MTK_FUNCTION(1, "GBE0_TXD3"),
+		MTK_FUNCTION(2, "GBE1_TXD3")
+	),
+	MTK_PIN(
+		269, "GPIO269",
+		MTK_EINT_FUNCTION(0, 269),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO269"),
+		MTK_FUNCTION(1, "GBE0_RXD2"),
+		MTK_FUNCTION(2, "GBE1_RXD2"),
+		MTK_FUNCTION(3, "GBE0_MDC")
+	),
+	MTK_PIN(
+		270, "GPIO270",
+		MTK_EINT_FUNCTION(0, 270),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO270"),
+		MTK_FUNCTION(1, "GBE0_RXD3"),
+		MTK_FUNCTION(2, "GBE1_RXD3"),
+		MTK_FUNCTION(3, "GBE0_MDIO")
+	),
+	MTK_PIN(
+		271, "veint271",
+		MTK_EINT_FUNCTION(0, 271),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		272, "veint272",
+		MTK_EINT_FUNCTION(0, 272),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		273, "veint273",
+		MTK_EINT_FUNCTION(0, 273),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		274, "veint274",
+		MTK_EINT_FUNCTION(0, 274),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		275, "veint275",
+		MTK_EINT_FUNCTION(0, 275),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		276, "veint276",
+		MTK_EINT_FUNCTION(0, 276),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		277, "veint277",
+		MTK_EINT_FUNCTION(0, 277),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		278, "veint278",
+		MTK_EINT_FUNCTION(0, 278),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		279, "veint279",
+		MTK_EINT_FUNCTION(0, 279),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		280, "veint280",
+		MTK_EINT_FUNCTION(0, 280),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		281, "veint281",
+		MTK_EINT_FUNCTION(0, 281),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		282, "veint282",
+		MTK_EINT_FUNCTION(0, 282),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		283, "veint283",
+		MTK_EINT_FUNCTION(0, 283),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		284, "veint284",
+		MTK_EINT_FUNCTION(0, 284),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		285, "veint285",
+		MTK_EINT_FUNCTION(0, 285),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		286, "veint286",
+		MTK_EINT_FUNCTION(0, 286),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		287, "veint287",
+		MTK_EINT_FUNCTION(0, 287),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		288, "veint288",
+		MTK_EINT_FUNCTION(0, 288),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		289, "veint289",
+		MTK_EINT_FUNCTION(0, 289),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		290, "veint290",
+		MTK_EINT_FUNCTION(0, 290),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		291, "veint291",
+		MTK_EINT_FUNCTION(0, 291),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		292, "veint292",
+		MTK_EINT_FUNCTION(0, 292),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	)
+};
+
+#endif /* __PINCTRL_MTK_MT8196_H */
-- 
2.34.1


