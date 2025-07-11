Return-Path: <linux-gpio+bounces-23148-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E35B01897
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 11:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A32465A6E1C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 09:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8929427F009;
	Fri, 11 Jul 2025 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lY4BICic"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CBE27EFEE;
	Fri, 11 Jul 2025 09:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752227142; cv=none; b=h/hChjXbAfadnn6jzLk7h7RWJozMXNsm/vUXZ7Upm1FRWGTdTlB3t+LcDwLqL5OzZ1nrcr3IOrRgFBGBfkL+GiW2AUgCDoANJxQqv6Tr4jYJwW0x7xBZQ5w+y/Jl+9YAIrovfmkfTJYd/slgRhzOqIDSe/Ne0hSOk2fT0IP0aAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752227142; c=relaxed/simple;
	bh=1mjeKUIKnaP8EtztJCt6FNtwbZbuGQ7RlmRLg71JJ3k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sgi98ngtDe2f1Adp3+KIibvCHCYMmf0yYieKyFaF2GeUzB0Sy/aB74+xL/PhHgEUYeulqHeUlkr2pIO7FR/CRT373QwiydMAk1pELc9jBWa7xhXYX/4udmlFnr4lClXE47MC7mOFg77/buEphA3fkI4tjYw8TveT0KBYvAt+lzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lY4BICic; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c69f0c5c5e3b11f0b1510d84776b8c0b-20250711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WK+Qulk4hPAQAZ/S2iSpeBiuz93T4gzFQkZThX3WXyE=;
	b=lY4BICicC37pTTMBzXE6EJJi+BhhhaW4fVhFoW8pZTnvM3G4N1cVDwEFocOSFW0Sg6E4Eu7kGpkf/JqFl1hzpgs8GvTs7gaXqymu9hBNQ88SukeXzdspT6mCslw4nzbksjxCGqdWl9gJzqf9LH+KTccin5dixvV/MXyRXHkD46k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:327ad16a-48c9-4d32-acd8-c509d597253f,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:9baed2bc-a91d-4696-b3f4-d8815e4c200b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,OSH
X-CID-BAS: 2,OSH,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c69f0c5c5e3b11f0b1510d84776b8c0b-20250711
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1017575596; Fri, 11 Jul 2025 17:45:27 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 11 Jul 2025 17:45:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 11 Jul 2025 17:45:23 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>
CC: Lei Xue <lei.xue@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>, Axe
 Yang <Axe.Yang@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH v2 3/3] pinctrl: mediatek: Add pinctrl driver on mt8189
Date: Fri, 11 Jul 2025 17:44:59 +0800
Message-ID: <20250711094513.17073-4-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add pinctrl driver support for MediaTek Soc mt8189.

Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8189.c     | 1700 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h | 2452 +++++++++++++++++
 4 files changed, 4165 insertions(+)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8189.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 2d15af6be276..5b191e12a8aa 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -259,6 +259,18 @@ config PINCTRL_MT8188
 	  In MTK platform, we support virtual gpio and use it to
 	  map specific eint which doesn't have real gpio pin.
 
+config PINCTRL_MT8189
+        bool "MediaTek MT8189 pin control"
+        depends on OF
+        depends on ARM64 || COMPILE_TEST
+        default ARM64 && ARCH_MEDIATEK
+        select PINCTRL_MTK_PARIS
+        help
+          Say yes here to support pin controller and gpio driver
+          on MediaTek MT8189 SoC.
+          In MTK platform, we support virtual gpio and use it to
+          map specific eint which doesn't have real gpio pin.
+
 config PINCTRL_MT8192
 	bool "MediaTek MT8192 pin control"
 	depends on OF
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index 7518980fba59..5d4646939ba3 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_PINCTRL_MT8173)		+= pinctrl-mt8173.o
 obj-$(CONFIG_PINCTRL_MT8183)		+= pinctrl-mt8183.o
 obj-$(CONFIG_PINCTRL_MT8186)		+= pinctrl-mt8186.o
 obj-$(CONFIG_PINCTRL_MT8188)		+= pinctrl-mt8188.o
+obj-$(CONFIG_PINCTRL_MT8189)            += pinctrl-mt8189.o
 obj-$(CONFIG_PINCTRL_MT8192)		+= pinctrl-mt8192.o
 obj-$(CONFIG_PINCTRL_MT8195)		+= pinctrl-mt8195.o
 obj-$(CONFIG_PINCTRL_MT8196)		+= pinctrl-mt8196.o
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8189.c b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
new file mode 100644
index 000000000000..7028aff55ae5
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
@@ -0,0 +1,1700 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 MediaTek Inc.
+ * Author: Lei Xue <lei.xue@mediatek.com>
+ *         Cathy Xu <ot_cathy.xu@mediatek.com>
+ */
+
+#include "pinctrl-mtk-mt8189.h"
+#include "pinctrl-paris.h"
+
+#define PIN_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits)  \
+	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits, \
+		       32, 0)
+
+#define PINS_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits) \
+	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits, \
+		       32, 1)
+
+static const struct mtk_pin_field_calc mt8189_pin_mode_range[] = {
+	PIN_FIELD(0, 182, 0x0300, 0x10, 0, 4),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_dir_range[] = {
+	PIN_FIELD(0, 182, 0x0000, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_di_range[] = {
+	PIN_FIELD(0, 182, 0x0200, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_do_range[] = {
+	PIN_FIELD(0, 182, 0x0100, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_smt_range[] = {
+	PIN_FIELD_BASE(0, 0, 7, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(1, 1, 8, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(2, 2, 8, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(3, 3, 8, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(4, 4, 8, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(5, 5, 8, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(6, 6, 7, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(7, 7, 7, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(8, 8, 7, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(9, 9, 7, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(10, 10, 7, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(11, 11, 7, 0x00e0, 0x10, 11, 1),
+	PIN_FIELD_BASE(12, 12, 2, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(13, 13, 2, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(14, 14, 3, 0x00f0, 0x10, 0, 1),
+	PIN_FIELD_BASE(15, 15, 3, 0x00f0, 0x10, 1, 1),
+	PIN_FIELD_BASE(16, 16, 2, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(17, 17, 2, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(18, 18, 7, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(19, 19, 7, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(20, 20, 7, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(21, 21, 7, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(22, 22, 9, 0x00f0, 0x10, 0, 1),
+	PIN_FIELD_BASE(23, 23, 9, 0x00f0, 0x10, 1, 1),
+	PIN_FIELD_BASE(24, 24, 9, 0x00f0, 0x10, 2, 1),
+	PIN_FIELD_BASE(25, 25, 4, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(26, 26, 4, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(27, 27, 2, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(28, 28, 2, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(29, 29, 4, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(30, 30, 2, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(31, 31, 3, 0x00f0, 0x10, 19, 1),
+	PIN_FIELD_BASE(32, 32, 1, 0x00c0, 0x10, 30, 1),
+	PIN_FIELD_BASE(33, 33, 3, 0x00f0, 0x10, 21, 1),
+	PIN_FIELD_BASE(34, 34, 3, 0x00f0, 0x10, 20, 1),
+	PIN_FIELD_BASE(35, 35, 3, 0x00f0, 0x10, 23, 1),
+	PIN_FIELD_BASE(36, 36, 3, 0x00f0, 0x10, 22, 1),
+	PIN_FIELD_BASE(37, 37, 3, 0x00f0, 0x10, 25, 1),
+	PIN_FIELD_BASE(38, 38, 3, 0x00f0, 0x10, 24, 1),
+	PIN_FIELD_BASE(39, 39, 3, 0x00f0, 0x10, 5, 1),
+	PIN_FIELD_BASE(40, 40, 3, 0x00f0, 0x10, 2, 1),
+	PIN_FIELD_BASE(41, 41, 3, 0x00f0, 0x10, 3, 1),
+	PIN_FIELD_BASE(42, 42, 3, 0x00f0, 0x10, 4, 1),
+	PIN_FIELD_BASE(43, 43, 3, 0x00f0, 0x10, 6, 1),
+	PIN_FIELD_BASE(44, 44, 7, 0x00e0, 0x10, 20, 1),
+	PIN_FIELD_BASE(45, 45, 7, 0x00e0, 0x10, 21, 1),
+	PIN_FIELD_BASE(46, 46, 7, 0x00e0, 0x10, 22, 1),
+	PIN_FIELD_BASE(47, 47, 7, 0x00e0, 0x10, 23, 1),
+	PIN_FIELD_BASE(48, 48, 4, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(49, 49, 4, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(50, 50, 4, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(51, 51, 8, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(52, 52, 8, 0x00c0, 0x10, 10, 1),
+	PIN_FIELD_BASE(53, 53, 8, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(54, 54, 8, 0x00c0, 0x10, 11, 1),
+	PIN_FIELD_BASE(55, 55, 4, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(56, 56, 4, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(57, 57, 2, 0x00e0, 0x10, 13, 1),
+	PIN_FIELD_BASE(58, 58, 2, 0x00e0, 0x10, 17, 1),
+	PIN_FIELD_BASE(59, 59, 2, 0x00e0, 0x10, 14, 1),
+	PIN_FIELD_BASE(60, 60, 2, 0x00e0, 0x10, 18, 1),
+	PIN_FIELD_BASE(61, 61, 2, 0x00e0, 0x10, 15, 1),
+	PIN_FIELD_BASE(62, 62, 2, 0x00e0, 0x10, 19, 1),
+	PIN_FIELD_BASE(63, 63, 2, 0x00e0, 0x10, 16, 1),
+	PIN_FIELD_BASE(64, 64, 2, 0x00e0, 0x10, 20, 1),
+	PIN_FIELD_BASE(65, 65, 9, 0x00f0, 0x10, 10, 1),
+	PIN_FIELD_BASE(66, 66, 9, 0x00f0, 0x10, 12, 1),
+	PIN_FIELD_BASE(67, 67, 9, 0x00f0, 0x10, 11, 1),
+	PIN_FIELD_BASE(68, 68, 9, 0x00f0, 0x10, 13, 1),
+	PIN_FIELD_BASE(69, 69, 2, 0x00e0, 0x10, 22, 1),
+	PIN_FIELD_BASE(70, 70, 2, 0x00e0, 0x10, 21, 1),
+	PIN_FIELD_BASE(71, 71, 2, 0x00e0, 0x10, 24, 1),
+	PIN_FIELD_BASE(72, 72, 2, 0x00e0, 0x10, 23, 1),
+	PIN_FIELD_BASE(73, 73, 2, 0x00e0, 0x10, 26, 1),
+	PIN_FIELD_BASE(74, 74, 2, 0x00e0, 0x10, 25, 1),
+	PIN_FIELD_BASE(75, 75, 3, 0x00f0, 0x10, 13, 1),
+	PIN_FIELD_BASE(76, 76, 2, 0x00e0, 0x10, 27, 1),
+	PIN_FIELD_BASE(77, 77, 8, 0x00c0, 0x10, 13, 1),
+	PIN_FIELD_BASE(78, 78, 8, 0x00c0, 0x10, 12, 1),
+	PIN_FIELD_BASE(79, 79, 8, 0x00c0, 0x10, 15, 1),
+	PIN_FIELD_BASE(80, 80, 8, 0x00c0, 0x10, 14, 1),
+	PIN_FIELD_BASE(81, 81, 2, 0x00e0, 0x10, 29, 1),
+	PIN_FIELD_BASE(82, 82, 2, 0x00e0, 0x10, 28, 1),
+	PIN_FIELD_BASE(83, 83, 2, 0x00e0, 0x10, 30, 1),
+	PIN_FIELD_BASE(84, 84, 7, 0x00e0, 0x10, 24, 1),
+	PIN_FIELD_BASE(85, 85, 7, 0x00e0, 0x10, 25, 1),
+	PIN_FIELD_BASE(86, 86, 7, 0x00e0, 0x10, 26, 1),
+	PIN_FIELD_BASE(87, 87, 7, 0x00e0, 0x10, 27, 1),
+	PIN_FIELD_BASE(88, 88, 5, 0x0120, 0x10, 20, 1),
+	PIN_FIELD_BASE(89, 89, 5, 0x0120, 0x10, 19, 1),
+	PIN_FIELD_BASE(90, 90, 5, 0x0120, 0x10, 22, 1),
+	PIN_FIELD_BASE(91, 91, 5, 0x0120, 0x10, 21, 1),
+	PIN_FIELD_BASE(92, 92, 5, 0x0120, 0x10, 16, 1),
+	PIN_FIELD_BASE(93, 93, 5, 0x0120, 0x10, 17, 1),
+	PIN_FIELD_BASE(94, 94, 5, 0x0120, 0x10, 23, 1),
+	PIN_FIELD_BASE(95, 95, 5, 0x0120, 0x10, 15, 1),
+	PIN_FIELD_BASE(96, 96, 5, 0x0120, 0x10, 18, 1),
+	PIN_FIELD_BASE(97, 97, 5, 0x0120, 0x10, 0, 1),
+	PIN_FIELD_BASE(98, 98, 5, 0x0120, 0x10, 5, 1),
+	PIN_FIELD_BASE(99, 99, 5, 0x0120, 0x10, 3, 1),
+	PIN_FIELD_BASE(100, 100, 5, 0x0120, 0x10, 4, 1),
+	PIN_FIELD_BASE(101, 101, 5, 0x0120, 0x10, 1, 1),
+	PIN_FIELD_BASE(102, 102, 5, 0x0120, 0x10, 2, 1),
+	PIN_FIELD_BASE(103, 103, 7, 0x00e0, 0x10, 15, 1),
+	PIN_FIELD_BASE(104, 104, 7, 0x00e0, 0x10, 12, 1),
+	PIN_FIELD_BASE(105, 105, 7, 0x00e0, 0x10, 14, 1),
+	PIN_FIELD_BASE(106, 106, 7, 0x00e0, 0x10, 13, 1),
+	PIN_FIELD_BASE(107, 107, 7, 0x00e0, 0x10, 19, 1),
+	PIN_FIELD_BASE(108, 108, 7, 0x00e0, 0x10, 16, 1),
+	PIN_FIELD_BASE(109, 109, 7, 0x00e0, 0x10, 18, 1),
+	PIN_FIELD_BASE(110, 110, 7, 0x00e0, 0x10, 17, 1),
+	PIN_FIELD_BASE(111, 111, 7, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(112, 112, 8, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(113, 113, 8, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(114, 114, 8, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(115, 115, 2, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(116, 116, 2, 0x00e0, 0x10, 12, 1),
+	PIN_FIELD_BASE(117, 117, 2, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(118, 118, 2, 0x00e0, 0x10, 11, 1),
+	PIN_FIELD_BASE(119, 119, 1, 0x00c0, 0x10, 26, 1),
+	PIN_FIELD_BASE(120, 120, 1, 0x00c0, 0x10, 25, 1),
+	PIN_FIELD_BASE(121, 121, 1, 0x00c0, 0x10, 24, 1),
+	PIN_FIELD_BASE(122, 122, 1, 0x00c0, 0x10, 23, 1),
+	PIN_FIELD_BASE(123, 123, 1, 0x00c0, 0x10, 19, 1),
+	PIN_FIELD_BASE(124, 124, 1, 0x00c0, 0x10, 18, 1),
+	PIN_FIELD_BASE(125, 125, 1, 0x00c0, 0x10, 17, 1),
+	PIN_FIELD_BASE(126, 126, 1, 0x00c0, 0x10, 16, 1),
+	PIN_FIELD_BASE(127, 127, 1, 0x00c0, 0x10, 22, 1),
+	PIN_FIELD_BASE(128, 128, 1, 0x00c0, 0x10, 15, 1),
+	PIN_FIELD_BASE(129, 129, 1, 0x00c0, 0x10, 20, 1),
+	PIN_FIELD_BASE(130, 130, 1, 0x00c0, 0x10, 27, 1),
+	PIN_FIELD_BASE(131, 131, 1, 0x00c0, 0x10, 13, 1),
+	PIN_FIELD_BASE(132, 132, 1, 0x00c0, 0x10, 14, 1),
+	PIN_FIELD_BASE(133, 133, 1, 0x00c0, 0x10, 28, 1),
+	PIN_FIELD_BASE(134, 134, 1, 0x00c0, 0x10, 21, 1),
+	PIN_FIELD_BASE(135, 135, 1, 0x00c0, 0x10, 11, 1),
+	PIN_FIELD_BASE(136, 136, 1, 0x00c0, 0x10, 12, 1),
+	PIN_FIELD_BASE(137, 137, 2, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(138, 138, 2, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(139, 139, 1, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(140, 140, 1, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(141, 141, 1, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(142, 142, 1, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(143, 143, 1, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(144, 144, 1, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(145, 145, 1, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(146, 146, 1, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(147, 147, 1, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(148, 148, 1, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(149, 149, 1, 0x00c0, 0x10, 10, 1),
+	PIN_FIELD_BASE(150, 150, 3, 0x00f0, 0x10, 14, 1),
+	PIN_FIELD_BASE(151, 151, 1, 0x00c0, 0x10, 29, 1),
+	PIN_FIELD_BASE(152, 152, 3, 0x00f0, 0x10, 15, 1),
+	PIN_FIELD_BASE(153, 153, 3, 0x00f0, 0x10, 16, 1),
+	PIN_FIELD_BASE(154, 154, 3, 0x00f0, 0x10, 17, 1),
+	PIN_FIELD_BASE(155, 155, 3, 0x00f0, 0x10, 18, 1),
+	PIN_FIELD_BASE(156, 156, 5, 0x0120, 0x10, 12, 1),
+	PIN_FIELD_BASE(157, 157, 5, 0x0120, 0x10, 11, 1),
+	PIN_FIELD_BASE(158, 158, 5, 0x0120, 0x10, 10, 1),
+	PIN_FIELD_BASE(159, 159, 6, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(160, 160, 5, 0x0120, 0x10, 14, 1),
+	PIN_FIELD_BASE(161, 161, 5, 0x0120, 0x10, 7, 1),
+	PIN_FIELD_BASE(162, 162, 5, 0x0120, 0x10, 6, 1),
+	PIN_FIELD_BASE(163, 163, 6, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(164, 164, 5, 0x0120, 0x10, 9, 1),
+	PIN_FIELD_BASE(165, 165, 5, 0x0120, 0x10, 8, 1),
+	PIN_FIELD_BASE(166, 166, 6, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(167, 167, 5, 0x0120, 0x10, 13, 1),
+	PIN_FIELD_BASE(168, 168, 3, 0x00f0, 0x10, 8, 1),
+	PIN_FIELD_BASE(169, 169, 3, 0x00f0, 0x10, 7, 1),
+	PIN_FIELD_BASE(170, 170, 3, 0x00f0, 0x10, 9, 1),
+	PIN_FIELD_BASE(171, 171, 3, 0x00f0, 0x10, 10, 1),
+	PIN_FIELD_BASE(172, 172, 3, 0x00f0, 0x10, 11, 1),
+	PIN_FIELD_BASE(173, 173, 3, 0x00f0, 0x10, 12, 1),
+	PIN_FIELD_BASE(174, 174, 9, 0x00f0, 0x10, 5, 1),
+	PIN_FIELD_BASE(175, 175, 9, 0x00f0, 0x10, 4, 1),
+	PIN_FIELD_BASE(176, 176, 9, 0x00f0, 0x10, 6, 1),
+	PIN_FIELD_BASE(177, 177, 9, 0x00f0, 0x10, 7, 1),
+	PIN_FIELD_BASE(178, 178, 9, 0x00f0, 0x10, 8, 1),
+	PIN_FIELD_BASE(179, 179, 9, 0x00f0, 0x10, 9, 1),
+	PIN_FIELD_BASE(180, 180, 5, 0x0120, 0x10, 24, 1),
+	PIN_FIELD_BASE(181, 181, 5, 0x0120, 0x10, 25, 1),
+	PIN_FIELD_BASE(182, 182, 9, 0x00f0, 0x10, 3, 1),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_ies_range[] = {
+	PIN_FIELD_BASE(0, 0, 7, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(1, 1, 8, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(2, 2, 8, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(3, 3, 8, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(4, 4, 8, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(5, 5, 8, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(6, 6, 7, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(7, 7, 7, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(8, 8, 7, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(9, 9, 7, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(10, 10, 7, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(11, 11, 7, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(12, 12, 2, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(13, 13, 2, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(14, 14, 3, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(15, 15, 3, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(16, 16, 2, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(17, 17, 2, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(18, 18, 7, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(19, 19, 7, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(20, 20, 7, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(21, 21, 7, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(22, 22, 9, 0x0040, 0x10, 0, 1),
+	PIN_FIELD_BASE(23, 23, 9, 0x0040, 0x10, 1, 1),
+	PIN_FIELD_BASE(24, 24, 9, 0x0040, 0x10, 2, 1),
+	PIN_FIELD_BASE(25, 25, 4, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(26, 26, 4, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(27, 27, 2, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(28, 28, 2, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(29, 29, 4, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(30, 30, 2, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(31, 31, 3, 0x0050, 0x10, 19, 1),
+	PIN_FIELD_BASE(32, 32, 1, 0x0050, 0x10, 30, 1),
+	PIN_FIELD_BASE(33, 33, 3, 0x0050, 0x10, 21, 1),
+	PIN_FIELD_BASE(34, 34, 3, 0x0050, 0x10, 20, 1),
+	PIN_FIELD_BASE(35, 35, 3, 0x0050, 0x10, 23, 1),
+	PIN_FIELD_BASE(36, 36, 3, 0x0050, 0x10, 22, 1),
+	PIN_FIELD_BASE(37, 37, 3, 0x0050, 0x10, 25, 1),
+	PIN_FIELD_BASE(38, 38, 3, 0x0050, 0x10, 24, 1),
+	PIN_FIELD_BASE(39, 39, 3, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(40, 40, 3, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(41, 41, 3, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(42, 42, 3, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(43, 43, 3, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(44, 44, 7, 0x0050, 0x10, 20, 1),
+	PIN_FIELD_BASE(45, 45, 7, 0x0050, 0x10, 21, 1),
+	PIN_FIELD_BASE(46, 46, 7, 0x0050, 0x10, 22, 1),
+	PIN_FIELD_BASE(47, 47, 7, 0x0050, 0x10, 23, 1),
+	PIN_FIELD_BASE(48, 48, 4, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(49, 49, 4, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(50, 50, 4, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(51, 51, 8, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(52, 52, 8, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(53, 53, 8, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(54, 54, 8, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(55, 55, 4, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(56, 56, 4, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(57, 57, 2, 0x0070, 0x10, 13, 1),
+	PIN_FIELD_BASE(58, 58, 2, 0x0070, 0x10, 17, 1),
+	PIN_FIELD_BASE(59, 59, 2, 0x0070, 0x10, 14, 1),
+	PIN_FIELD_BASE(60, 60, 2, 0x0070, 0x10, 18, 1),
+	PIN_FIELD_BASE(61, 61, 2, 0x0070, 0x10, 15, 1),
+	PIN_FIELD_BASE(62, 62, 2, 0x0070, 0x10, 19, 1),
+	PIN_FIELD_BASE(63, 63, 2, 0x0070, 0x10, 16, 1),
+	PIN_FIELD_BASE(64, 64, 2, 0x0070, 0x10, 20, 1),
+	PIN_FIELD_BASE(65, 65, 9, 0x0040, 0x10, 10, 1),
+	PIN_FIELD_BASE(66, 66, 9, 0x0040, 0x10, 12, 1),
+	PIN_FIELD_BASE(67, 67, 9, 0x0040, 0x10, 11, 1),
+	PIN_FIELD_BASE(68, 68, 9, 0x0040, 0x10, 13, 1),
+	PIN_FIELD_BASE(69, 69, 2, 0x0070, 0x10, 22, 1),
+	PIN_FIELD_BASE(70, 70, 2, 0x0070, 0x10, 21, 1),
+	PIN_FIELD_BASE(71, 71, 2, 0x0070, 0x10, 24, 1),
+	PIN_FIELD_BASE(72, 72, 2, 0x0070, 0x10, 23, 1),
+	PIN_FIELD_BASE(73, 73, 2, 0x0070, 0x10, 26, 1),
+	PIN_FIELD_BASE(74, 74, 2, 0x0070, 0x10, 25, 1),
+	PIN_FIELD_BASE(75, 75, 3, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(76, 76, 2, 0x0070, 0x10, 27, 1),
+	PIN_FIELD_BASE(77, 77, 8, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(78, 78, 8, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(79, 79, 8, 0x0050, 0x10, 15, 1),
+	PIN_FIELD_BASE(80, 80, 8, 0x0050, 0x10, 14, 1),
+	PIN_FIELD_BASE(81, 81, 2, 0x0070, 0x10, 29, 1),
+	PIN_FIELD_BASE(82, 82, 2, 0x0070, 0x10, 28, 1),
+	PIN_FIELD_BASE(83, 83, 2, 0x0070, 0x10, 30, 1),
+	PIN_FIELD_BASE(84, 84, 7, 0x0050, 0x10, 24, 1),
+	PIN_FIELD_BASE(85, 85, 7, 0x0050, 0x10, 25, 1),
+	PIN_FIELD_BASE(86, 86, 7, 0x0050, 0x10, 26, 1),
+	PIN_FIELD_BASE(87, 87, 7, 0x0050, 0x10, 27, 1),
+	PIN_FIELD_BASE(88, 88, 5, 0x0060, 0x10, 20, 1),
+	PIN_FIELD_BASE(89, 89, 5, 0x0060, 0x10, 19, 1),
+	PIN_FIELD_BASE(90, 90, 5, 0x0060, 0x10, 22, 1),
+	PIN_FIELD_BASE(91, 91, 5, 0x0060, 0x10, 21, 1),
+	PIN_FIELD_BASE(92, 92, 5, 0x0060, 0x10, 16, 1),
+	PIN_FIELD_BASE(93, 93, 5, 0x0060, 0x10, 17, 1),
+	PIN_FIELD_BASE(94, 94, 5, 0x0060, 0x10, 23, 1),
+	PIN_FIELD_BASE(95, 95, 5, 0x0060, 0x10, 15, 1),
+	PIN_FIELD_BASE(96, 96, 5, 0x0060, 0x10, 18, 1),
+	PIN_FIELD_BASE(97, 97, 5, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(98, 98, 5, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(99, 99, 5, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(100, 100, 5, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(101, 101, 5, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(102, 102, 5, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(103, 103, 7, 0x0050, 0x10, 15, 1),
+	PIN_FIELD_BASE(104, 104, 7, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(105, 105, 7, 0x0050, 0x10, 14, 1),
+	PIN_FIELD_BASE(106, 106, 7, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(107, 107, 7, 0x0050, 0x10, 19, 1),
+	PIN_FIELD_BASE(108, 108, 7, 0x0050, 0x10, 16, 1),
+	PIN_FIELD_BASE(109, 109, 7, 0x0050, 0x10, 18, 1),
+	PIN_FIELD_BASE(110, 110, 7, 0x0050, 0x10, 17, 1),
+	PIN_FIELD_BASE(111, 111, 7, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(112, 112, 8, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(113, 113, 8, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(114, 114, 8, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(115, 115, 2, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(116, 116, 2, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(117, 117, 2, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(118, 118, 2, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(119, 119, 1, 0x0050, 0x10, 26, 1),
+	PIN_FIELD_BASE(120, 120, 1, 0x0050, 0x10, 25, 1),
+	PIN_FIELD_BASE(121, 121, 1, 0x0050, 0x10, 24, 1),
+	PIN_FIELD_BASE(122, 122, 1, 0x0050, 0x10, 23, 1),
+	PIN_FIELD_BASE(123, 123, 1, 0x0050, 0x10, 19, 1),
+	PIN_FIELD_BASE(124, 124, 1, 0x0050, 0x10, 18, 1),
+	PIN_FIELD_BASE(125, 125, 1, 0x0050, 0x10, 17, 1),
+	PIN_FIELD_BASE(126, 126, 1, 0x0050, 0x10, 16, 1),
+	PIN_FIELD_BASE(127, 127, 1, 0x0050, 0x10, 22, 1),
+	PIN_FIELD_BASE(128, 128, 1, 0x0050, 0x10, 15, 1),
+	PIN_FIELD_BASE(129, 129, 1, 0x0050, 0x10, 20, 1),
+	PIN_FIELD_BASE(130, 130, 1, 0x0050, 0x10, 27, 1),
+	PIN_FIELD_BASE(131, 131, 1, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(132, 132, 1, 0x0050, 0x10, 14, 1),
+	PIN_FIELD_BASE(133, 133, 1, 0x0050, 0x10, 28, 1),
+	PIN_FIELD_BASE(134, 134, 1, 0x0050, 0x10, 21, 1),
+	PIN_FIELD_BASE(135, 135, 1, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(136, 136, 1, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(137, 137, 2, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(138, 138, 2, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(139, 139, 1, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(140, 140, 1, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(141, 141, 1, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(142, 142, 1, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(143, 143, 1, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(144, 144, 1, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(145, 145, 1, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(146, 146, 1, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(147, 147, 1, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(148, 148, 1, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(149, 149, 1, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(150, 150, 3, 0x0050, 0x10, 14, 1),
+	PIN_FIELD_BASE(151, 151, 1, 0x0050, 0x10, 29, 1),
+	PIN_FIELD_BASE(152, 152, 3, 0x0050, 0x10, 15, 1),
+	PIN_FIELD_BASE(153, 153, 3, 0x0050, 0x10, 16, 1),
+	PIN_FIELD_BASE(154, 154, 3, 0x0050, 0x10, 17, 1),
+	PIN_FIELD_BASE(155, 155, 3, 0x0050, 0x10, 18, 1),
+	PIN_FIELD_BASE(156, 156, 5, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(157, 157, 5, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(158, 158, 5, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(159, 159, 6, 0x0020, 0x10, 2, 1),
+	PIN_FIELD_BASE(160, 160, 5, 0x0060, 0x10, 14, 1),
+	PIN_FIELD_BASE(161, 161, 5, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(162, 162, 5, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(163, 163, 6, 0x0020, 0x10, 1, 1),
+	PIN_FIELD_BASE(164, 164, 5, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(165, 165, 5, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(166, 166, 6, 0x0020, 0x10, 0, 1),
+	PIN_FIELD_BASE(167, 167, 5, 0x0060, 0x10, 13, 1),
+	PIN_FIELD_BASE(168, 168, 3, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(169, 169, 3, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(170, 170, 3, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(171, 171, 3, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(172, 172, 3, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(173, 173, 3, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(174, 174, 9, 0x0040, 0x10, 5, 1),
+	PIN_FIELD_BASE(175, 175, 9, 0x0040, 0x10, 4, 1),
+	PIN_FIELD_BASE(176, 176, 9, 0x0040, 0x10, 6, 1),
+	PIN_FIELD_BASE(177, 177, 9, 0x0040, 0x10, 7, 1),
+	PIN_FIELD_BASE(178, 178, 9, 0x0040, 0x10, 8, 1),
+	PIN_FIELD_BASE(179, 179, 9, 0x0040, 0x10, 9, 1),
+	PIN_FIELD_BASE(180, 180, 5, 0x0060, 0x10, 24, 1),
+	PIN_FIELD_BASE(181, 181, 5, 0x0060, 0x10, 25, 1),
+	PIN_FIELD_BASE(182, 182, 9, 0x0040, 0x10, 3, 1),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_tdsel_range[] = {
+	PIN_FIELD_BASE(0, 0, 7, 0x00f0, 0x10, 0, 4),
+	PIN_FIELD_BASE(1, 1, 8, 0x00d0, 0x10, 0, 4),
+	PIN_FIELD_BASE(2, 2, 8, 0x00d0, 0x10, 4, 4),
+	PIN_FIELD_BASE(3, 3, 8, 0x00d0, 0x10, 8, 4),
+	PIN_FIELD_BASE(4, 4, 8, 0x00d0, 0x10, 12, 4),
+	PIN_FIELD_BASE(5, 5, 8, 0x00d0, 0x10, 16, 4),
+	PIN_FIELD_BASE(6, 6, 7, 0x00f0, 0x10, 4, 4),
+	PIN_FIELD_BASE(7, 7, 7, 0x00f0, 0x10, 8, 4),
+	PIN_FIELD_BASE(8, 8, 7, 0x00f0, 0x10, 12, 4),
+	PIN_FIELD_BASE(9, 9, 7, 0x00f0, 0x10, 16, 4),
+	PIN_FIELD_BASE(10, 10, 7, 0x00f0, 0x10, 20, 4),
+	PIN_FIELD_BASE(11, 11, 7, 0x00f0, 0x10, 24, 4),
+	PIN_FIELD_BASE(12, 12, 2, 0x00f0, 0x10, 12, 4),
+	PIN_FIELD_BASE(13, 13, 2, 0x00f0, 0x10, 16, 4),
+	PIN_FIELD_BASE(14, 14, 3, 0x0110, 0x10, 0, 4),
+	PIN_FIELD_BASE(15, 15, 3, 0x0110, 0x10, 4, 4),
+	PIN_FIELD_BASE(16, 16, 2, 0x00f0, 0x10, 20, 4),
+	PIN_FIELD_BASE(17, 17, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(18, 18, 7, 0x0100, 0x10, 28, 4),
+	PIN_FIELD_BASE(19, 19, 7, 0x0110, 0x10, 0, 4),
+	PIN_FIELD_BASE(20, 20, 7, 0x0110, 0x10, 0, 4),
+	PIN_FIELD_BASE(21, 21, 7, 0x0110, 0x10, 0, 4),
+	PIN_FIELD_BASE(22, 22, 9, 0x0110, 0x10, 0, 4),
+	PIN_FIELD_BASE(23, 23, 9, 0x0110, 0x10, 4, 4),
+	PIN_FIELD_BASE(24, 24, 9, 0x0110, 0x10, 8, 4),
+	PIN_FIELD_BASE(25, 25, 4, 0x00d0, 0x10, 12, 4),
+	PIN_FIELD_BASE(26, 26, 4, 0x00d0, 0x10, 8, 4),
+	PIN_FIELD_BASE(27, 27, 2, 0x00f0, 0x10, 4, 4),
+	PIN_FIELD_BASE(28, 28, 2, 0x00f0, 0x10, 8, 4),
+	PIN_FIELD_BASE(29, 29, 4, 0x00d0, 0x10, 8, 4),
+	PIN_FIELD_BASE(30, 30, 2, 0x00f0, 0x10, 0, 4),
+	PIN_FIELD_BASE(31, 31, 3, 0x0120, 0x10, 8, 4),
+	PIN_FIELD_BASE(32, 32, 1, 0x00f0, 0x10, 16, 4),
+	PIN_FIELD_BASE(33, 33, 3, 0x0120, 0x10, 16, 4),
+	PIN_FIELD_BASE(34, 34, 3, 0x0120, 0x10, 4, 4),
+	PIN_FIELD_BASE(35, 35, 3, 0x0120, 0x10, 0, 4),
+	PIN_FIELD_BASE(36, 36, 3, 0x0120, 0x10, 8, 4),
+	PIN_FIELD_BASE(37, 37, 3, 0x0120, 0x10, 4, 4),
+	PIN_FIELD_BASE(38, 38, 3, 0x0120, 0x10, 4, 4),
+	PIN_FIELD_BASE(39, 39, 3, 0x0120, 0x10, 8, 4),
+	PIN_FIELD_BASE(40, 40, 3, 0x0120, 0x10, 8, 4),
+	PIN_FIELD_BASE(41, 41, 3, 0x0120, 0x10, 8, 4),
+	PIN_FIELD_BASE(42, 42, 3, 0x0120, 0x10, 8, 4),
+	PIN_FIELD_BASE(43, 43, 3, 0x0120, 0x10, 8, 4),
+	PIN_FIELD_BASE(44, 44, 7, 0x0110, 0x10, 0, 4),
+	PIN_FIELD_BASE(45, 45, 7, 0x0110, 0x10, 0, 4),
+	PIN_FIELD_BASE(46, 46, 7, 0x0110, 0x10, 0, 4),
+	PIN_FIELD_BASE(47, 47, 7, 0x0110, 0x10, 0, 4),
+	PIN_FIELD_BASE(48, 48, 4, 0x00d0, 0x10, 8, 4),
+	PIN_FIELD_BASE(49, 49, 4, 0x00d0, 0x10, 4, 4),
+	PIN_FIELD_BASE(50, 50, 4, 0x00d0, 0x10, 0, 4),
+	PIN_FIELD_BASE(51, 51, 8, 0x00d0, 0x10, 20, 4),
+	PIN_FIELD_BASE(52, 52, 8, 0x00d0, 0x10, 20, 4),
+	PIN_FIELD_BASE(53, 53, 8, 0x00d0, 0x10, 20, 4),
+	PIN_FIELD_BASE(54, 54, 8, 0x00d0, 0x10, 20, 4),
+	PIN_FIELD_BASE(55, 55, 4, 0x00d0, 0x10, 12, 4),
+	PIN_FIELD_BASE(56, 56, 4, 0x00d0, 0x10, 12, 4),
+	PIN_FIELD_BASE(57, 57, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(58, 58, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(59, 59, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(60, 60, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(61, 61, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(62, 62, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(63, 63, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(64, 64, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(65, 65, 9, 0x0120, 0x10, 4, 4),
+	PIN_FIELD_BASE(66, 66, 9, 0x0120, 0x10, 4, 4),
+	PIN_FIELD_BASE(67, 67, 9, 0x0120, 0x10, 4, 4),
+	PIN_FIELD_BASE(68, 68, 9, 0x0120, 0x10, 4, 4),
+	PIN_FIELD_BASE(69, 69, 2, 0x0100, 0x10, 4, 4),
+	PIN_FIELD_BASE(70, 70, 2, 0x0100, 0x10, 0, 4),
+	PIN_FIELD_BASE(71, 71, 2, 0x0100, 0x10, 12, 4),
+	PIN_FIELD_BASE(72, 72, 2, 0x0100, 0x10, 8, 4),
+	PIN_FIELD_BASE(73, 73, 2, 0x0100, 0x10, 20, 4),
+	PIN_FIELD_BASE(74, 74, 2, 0x0100, 0x10, 16, 4),
+	PIN_FIELD_BASE(75, 75, 3, 0x0120, 0x10, 12, 4),
+	PIN_FIELD_BASE(76, 76, 2, 0x0100, 0x10, 24, 4),
+	PIN_FIELD_BASE(77, 77, 8, 0x00d0, 0x10, 28, 4),
+	PIN_FIELD_BASE(78, 78, 8, 0x00d0, 0x10, 24, 4),
+	PIN_FIELD_BASE(79, 79, 8, 0x00e0, 0x10, 4, 4),
+	PIN_FIELD_BASE(80, 80, 8, 0x00e0, 0x10, 0, 4),
+	PIN_FIELD_BASE(81, 81, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(82, 82, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(83, 83, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(84, 84, 7, 0x0110, 0x10, 0, 4),
+	PIN_FIELD_BASE(85, 85, 7, 0x0110, 0x10, 0, 4),
+	PIN_FIELD_BASE(86, 86, 7, 0x0110, 0x10, 0, 4),
+	PIN_FIELD_BASE(87, 87, 7, 0x0110, 0x10, 0, 4),
+	PIN_FIELD_BASE(88, 88, 5, 0x0140, 0x10, 4, 4),
+	PIN_FIELD_BASE(89, 89, 5, 0x0140, 0x10, 4, 4),
+	PIN_FIELD_BASE(90, 90, 5, 0x0140, 0x10, 4, 4),
+	PIN_FIELD_BASE(91, 91, 5, 0x0140, 0x10, 4, 4),
+	PIN_FIELD_BASE(92, 92, 5, 0x0140, 0x10, 8, 4),
+	PIN_FIELD_BASE(93, 93, 5, 0x0140, 0x10, 8, 4),
+	PIN_FIELD_BASE(94, 94, 5, 0x0140, 0x10, 8, 4),
+	PIN_FIELD_BASE(95, 95, 5, 0x0140, 0x10, 8, 4),
+	PIN_FIELD_BASE(96, 96, 5, 0x0140, 0x10, 12, 4),
+	PIN_FIELD_BASE(97, 97, 5, 0x0140, 0x10, 8, 4),
+	PIN_FIELD_BASE(98, 98, 5, 0x0140, 0x10, 8, 4),
+	PIN_FIELD_BASE(99, 99, 5, 0x0140, 0x10, 8, 4),
+	PIN_FIELD_BASE(100, 100, 5, 0x0140, 0x10, 8, 4),
+	PIN_FIELD_BASE(101, 101, 5, 0x0140, 0x10, 8, 4),
+	PIN_FIELD_BASE(102, 102, 5, 0x0140, 0x10, 8, 4),
+	PIN_FIELD_BASE(103, 103, 7, 0x0100, 0x10, 8, 4),
+	PIN_FIELD_BASE(104, 104, 7, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(105, 105, 7, 0x0100, 0x10, 4, 4),
+	PIN_FIELD_BASE(106, 106, 7, 0x0100, 0x10, 0, 4),
+	PIN_FIELD_BASE(107, 107, 7, 0x0100, 0x10, 24, 4),
+	PIN_FIELD_BASE(108, 108, 7, 0x0100, 0x10, 12, 4),
+	PIN_FIELD_BASE(109, 109, 7, 0x0100, 0x10, 20, 4),
+	PIN_FIELD_BASE(110, 110, 7, 0x0100, 0x10, 16, 4),
+	PIN_FIELD_BASE(111, 111, 7, 0x0110, 0x10, 0, 4),
+	PIN_FIELD_BASE(112, 112, 8, 0x00d0, 0x10, 20, 4),
+	PIN_FIELD_BASE(113, 113, 8, 0x00d0, 0x10, 20, 4),
+	PIN_FIELD_BASE(114, 114, 8, 0x00d0, 0x10, 20, 4),
+	PIN_FIELD_BASE(115, 115, 2, 0x00f0, 0x10, 24, 4),
+	PIN_FIELD_BASE(116, 116, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(117, 117, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(118, 118, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(119, 119, 1, 0x00e0, 0x10, 24, 4),
+	PIN_FIELD_BASE(120, 120, 1, 0x00e0, 0x10, 20, 4),
+	PIN_FIELD_BASE(121, 121, 1, 0x00e0, 0x10, 16, 4),
+	PIN_FIELD_BASE(122, 122, 1, 0x00e0, 0x10, 12, 4),
+	PIN_FIELD_BASE(123, 123, 1, 0x00d0, 0x10, 28, 4),
+	PIN_FIELD_BASE(124, 124, 1, 0x00d0, 0x10, 24, 4),
+	PIN_FIELD_BASE(125, 125, 1, 0x00d0, 0x10, 20, 4),
+	PIN_FIELD_BASE(126, 126, 1, 0x00d0, 0x10, 16, 4),
+	PIN_FIELD_BASE(127, 127, 1, 0x00e0, 0x10, 8, 4),
+	PIN_FIELD_BASE(128, 128, 1, 0x00d0, 0x10, 12, 4),
+	PIN_FIELD_BASE(129, 129, 1, 0x00e0, 0x10, 0, 4),
+	PIN_FIELD_BASE(130, 130, 1, 0x00e0, 0x10, 28, 4),
+	PIN_FIELD_BASE(131, 131, 1, 0x00d0, 0x10, 4, 4),
+	PIN_FIELD_BASE(132, 132, 1, 0x00d0, 0x10, 8, 4),
+	PIN_FIELD_BASE(133, 133, 1, 0x00f0, 0x10, 0, 4),
+	PIN_FIELD_BASE(134, 134, 1, 0x00e0, 0x10, 4, 4),
+	PIN_FIELD_BASE(135, 135, 1, 0x00d0, 0x10, 0, 4),
+	PIN_FIELD_BASE(136, 136, 1, 0x00f0, 0x10, 4, 4),
+	PIN_FIELD_BASE(137, 137, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(138, 138, 2, 0x00f0, 0x10, 28, 4),
+	PIN_FIELD_BASE(139, 139, 1, 0x00f0, 0x10, 12, 4),
+	PIN_FIELD_BASE(140, 140, 1, 0x00f0, 0x10, 12, 4),
+	PIN_FIELD_BASE(141, 141, 1, 0x00f0, 0x10, 12, 4),
+	PIN_FIELD_BASE(142, 142, 1, 0x00f0, 0x10, 12, 4),
+	PIN_FIELD_BASE(143, 143, 1, 0x00f0, 0x10, 12, 4),
+	PIN_FIELD_BASE(144, 144, 1, 0x00f0, 0x10, 12, 4),
+	PIN_FIELD_BASE(145, 145, 1, 0x00f0, 0x10, 8, 4),
+	PIN_FIELD_BASE(146, 146, 1, 0x00f0, 0x10, 8, 4),
+	PIN_FIELD_BASE(147, 147, 1, 0x00f0, 0x10, 8, 4),
+	PIN_FIELD_BASE(148, 148, 1, 0x00f0, 0x10, 8, 4),
+	PIN_FIELD_BASE(149, 149, 1, 0x00f0, 0x10, 8, 4),
+	PIN_FIELD_BASE(150, 150, 3, 0x0120, 0x10, 8, 4),
+	PIN_FIELD_BASE(151, 151, 1, 0x00f0, 0x10, 16, 4),
+	PIN_FIELD_BASE(152, 152, 3, 0x0120, 0x10, 8, 4),
+	PIN_FIELD_BASE(153, 153, 3, 0x0120, 0x10, 8, 4),
+	PIN_FIELD_BASE(154, 154, 3, 0x0120, 0x10, 8, 4),
+	PIN_FIELD_BASE(155, 155, 3, 0x0120, 0x10, 8, 4),
+	PIN_FIELD_BASE(156, 156, 5, 0x0130, 0x10, 24, 4),
+	PIN_FIELD_BASE(157, 157, 5, 0x0130, 0x10, 20, 4),
+	PIN_FIELD_BASE(158, 158, 5, 0x0130, 0x10, 16, 4),
+	PIN_FIELD_BASE(159, 159, 6, 0x00a0, 0x10, 8, 4),
+	PIN_FIELD_BASE(160, 160, 5, 0x0140, 0x10, 0, 4),
+	PIN_FIELD_BASE(161, 161, 5, 0x0130, 0x10, 4, 4),
+	PIN_FIELD_BASE(162, 162, 5, 0x0130, 0x10, 0, 4),
+	PIN_FIELD_BASE(163, 163, 6, 0x00a0, 0x10, 4, 4),
+	PIN_FIELD_BASE(164, 164, 5, 0x0130, 0x10, 12, 4),
+	PIN_FIELD_BASE(165, 165, 5, 0x0130, 0x10, 8, 4),
+	PIN_FIELD_BASE(166, 166, 6, 0x00a0, 0x10, 0, 4),
+	PIN_FIELD_BASE(167, 167, 5, 0x0130, 0x10, 28, 4),
+	PIN_FIELD_BASE(168, 168, 3, 0x0110, 0x10, 12, 4),
+	PIN_FIELD_BASE(169, 169, 3, 0x0110, 0x10, 8, 4),
+	PIN_FIELD_BASE(170, 170, 3, 0x0110, 0x10, 16, 4),
+	PIN_FIELD_BASE(171, 171, 3, 0x0110, 0x10, 20, 4),
+	PIN_FIELD_BASE(172, 172, 3, 0x0110, 0x10, 24, 4),
+	PIN_FIELD_BASE(173, 173, 3, 0x0110, 0x10, 28, 4),
+	PIN_FIELD_BASE(174, 174, 9, 0x0110, 0x10, 16, 4),
+	PIN_FIELD_BASE(175, 175, 9, 0x0110, 0x10, 12, 4),
+	PIN_FIELD_BASE(176, 176, 9, 0x0110, 0x10, 20, 4),
+	PIN_FIELD_BASE(177, 177, 9, 0x0110, 0x10, 24, 4),
+	PIN_FIELD_BASE(178, 178, 9, 0x0110, 0x10, 28, 4),
+	PIN_FIELD_BASE(179, 179, 9, 0x0120, 0x10, 0, 4),
+	PIN_FIELD_BASE(180, 180, 5, 0x0140, 0x10, 16, 4),
+	PIN_FIELD_BASE(181, 181, 5, 0x0140, 0x10, 20, 4),
+	PIN_FIELD_BASE(182, 182, 9, 0x0120, 0x10, 8, 4),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_rdsel_range[] = {
+	PIN_FIELD_BASE(0, 0, 7, 0x00d0, 0x10, 0, 2),
+	PIN_FIELD_BASE(1, 1, 8, 0x00a0, 0x10, 0, 2),
+	PIN_FIELD_BASE(2, 2, 8, 0x00a0, 0x10, 2, 2),
+	PIN_FIELD_BASE(3, 3, 8, 0x00a0, 0x10, 4, 2),
+	PIN_FIELD_BASE(4, 4, 8, 0x00a0, 0x10, 6, 2),
+	PIN_FIELD_BASE(5, 5, 8, 0x00a0, 0x10, 8, 2),
+	PIN_FIELD_BASE(6, 6, 7, 0x00d0, 0x10, 2, 2),
+	PIN_FIELD_BASE(7, 7, 7, 0x00d0, 0x10, 4, 2),
+	PIN_FIELD_BASE(8, 8, 7, 0x00d0, 0x10, 6, 2),
+	PIN_FIELD_BASE(9, 9, 7, 0x00d0, 0x10, 8, 2),
+	PIN_FIELD_BASE(10, 10, 7, 0x00d0, 0x10, 10, 2),
+	PIN_FIELD_BASE(11, 11, 7, 0x00d0, 0x10, 12, 2),
+	PIN_FIELD_BASE(12, 12, 2, 0x00c0, 0x10, 6, 2),
+	PIN_FIELD_BASE(13, 13, 2, 0x00c0, 0x10, 8, 2),
+	PIN_FIELD_BASE(14, 14, 3, 0x00d0, 0x10, 0, 2),
+	PIN_FIELD_BASE(15, 15, 3, 0x00d0, 0x10, 2, 2),
+	PIN_FIELD_BASE(16, 16, 2, 0x00c0, 0x10, 10, 2),
+	PIN_FIELD_BASE(17, 17, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(18, 18, 7, 0x00d0, 0x10, 30, 2),
+	PIN_FIELD_BASE(19, 19, 7, 0x00d0, 0x10, 30, 2),
+	PIN_FIELD_BASE(20, 20, 7, 0x00d0, 0x10, 30, 2),
+	PIN_FIELD_BASE(21, 21, 7, 0x00d0, 0x10, 30, 2),
+	PIN_FIELD_BASE(22, 22, 9, 0x00c0, 0x10, 0, 2),
+	PIN_FIELD_BASE(23, 23, 9, 0x00c0, 0x10, 2, 2),
+	PIN_FIELD_BASE(24, 24, 9, 0x00c0, 0x10, 4, 2),
+	PIN_FIELD_BASE(25, 25, 4, 0x00a0, 0x10, 6, 2),
+	PIN_FIELD_BASE(26, 26, 4, 0x00a0, 0x10, 4, 2),
+	PIN_FIELD_BASE(27, 27, 2, 0x00c0, 0x10, 2, 2),
+	PIN_FIELD_BASE(28, 28, 2, 0x00c0, 0x10, 4, 2),
+	PIN_FIELD_BASE(29, 29, 4, 0x00a0, 0x10, 4, 2),
+	PIN_FIELD_BASE(30, 30, 2, 0x00c0, 0x10, 0, 2),
+	PIN_FIELD_BASE(31, 31, 3, 0x00e0, 0x10, 16, 2),
+	PIN_FIELD_BASE(32, 32, 1, 0x00b0, 0x10, 8, 2),
+	PIN_FIELD_BASE(33, 33, 3, 0x00e0, 0x10, 20, 2),
+	PIN_FIELD_BASE(34, 34, 3, 0x00e0, 0x10, 14, 2),
+	PIN_FIELD_BASE(35, 35, 3, 0x00e0, 0x10, 12, 2),
+	PIN_FIELD_BASE(36, 36, 3, 0x00e0, 0x10, 16, 2),
+	PIN_FIELD_BASE(37, 37, 3, 0x00e0, 0x10, 14, 2),
+	PIN_FIELD_BASE(38, 38, 3, 0x00e0, 0x10, 14, 2),
+	PIN_FIELD_BASE(39, 39, 3, 0x00e0, 0x10, 16, 2),
+	PIN_FIELD_BASE(40, 40, 3, 0x00e0, 0x10, 16, 2),
+	PIN_FIELD_BASE(41, 41, 3, 0x00e0, 0x10, 16, 2),
+	PIN_FIELD_BASE(42, 42, 3, 0x00e0, 0x10, 16, 2),
+	PIN_FIELD_BASE(43, 43, 3, 0x00e0, 0x10, 16, 2),
+	PIN_FIELD_BASE(44, 44, 7, 0x00d0, 0x10, 30, 2),
+	PIN_FIELD_BASE(45, 45, 7, 0x00d0, 0x10, 30, 2),
+	PIN_FIELD_BASE(46, 46, 7, 0x00d0, 0x10, 30, 2),
+	PIN_FIELD_BASE(47, 47, 7, 0x00d0, 0x10, 30, 2),
+	PIN_FIELD_BASE(48, 48, 4, 0x00a0, 0x10, 4, 2),
+	PIN_FIELD_BASE(49, 49, 4, 0x00a0, 0x10, 2, 2),
+	PIN_FIELD_BASE(50, 50, 4, 0x00a0, 0x10, 0, 2),
+	PIN_FIELD_BASE(51, 51, 8, 0x00a0, 0x10, 10, 2),
+	PIN_FIELD_BASE(52, 52, 8, 0x00a0, 0x10, 10, 2),
+	PIN_FIELD_BASE(53, 53, 8, 0x00a0, 0x10, 10, 2),
+	PIN_FIELD_BASE(54, 54, 8, 0x00a0, 0x10, 10, 2),
+	PIN_FIELD_BASE(55, 55, 4, 0x00a0, 0x10, 6, 2),
+	PIN_FIELD_BASE(56, 56, 4, 0x00a0, 0x10, 6, 2),
+	PIN_FIELD_BASE(57, 57, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(58, 58, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(59, 59, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(60, 60, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(61, 61, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(62, 62, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(63, 63, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(64, 64, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(65, 65, 9, 0x00d0, 0x10, 12, 2),
+	PIN_FIELD_BASE(66, 66, 9, 0x00d0, 0x10, 12, 2),
+	PIN_FIELD_BASE(67, 67, 9, 0x00d0, 0x10, 12, 2),
+	PIN_FIELD_BASE(68, 68, 9, 0x00d0, 0x10, 12, 2),
+	PIN_FIELD_BASE(69, 69, 2, 0x00c0, 0x10, 16, 2),
+	PIN_FIELD_BASE(70, 70, 2, 0x00c0, 0x10, 14, 2),
+	PIN_FIELD_BASE(71, 71, 2, 0x00c0, 0x10, 20, 2),
+	PIN_FIELD_BASE(72, 72, 2, 0x00c0, 0x10, 18, 2),
+	PIN_FIELD_BASE(73, 73, 2, 0x00c0, 0x10, 24, 2),
+	PIN_FIELD_BASE(74, 74, 2, 0x00c0, 0x10, 22, 2),
+	PIN_FIELD_BASE(75, 75, 3, 0x00e0, 0x10, 18, 2),
+	PIN_FIELD_BASE(76, 76, 2, 0x00c0, 0x10, 26, 2),
+	PIN_FIELD_BASE(77, 77, 8, 0x00a0, 0x10, 14, 2),
+	PIN_FIELD_BASE(78, 78, 8, 0x00a0, 0x10, 12, 2),
+	PIN_FIELD_BASE(79, 79, 8, 0x00a0, 0x10, 18, 2),
+	PIN_FIELD_BASE(80, 80, 8, 0x00a0, 0x10, 16, 2),
+	PIN_FIELD_BASE(81, 81, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(82, 82, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(83, 83, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(84, 84, 7, 0x00d0, 0x10, 30, 2),
+	PIN_FIELD_BASE(85, 85, 7, 0x00d0, 0x10, 30, 2),
+	PIN_FIELD_BASE(86, 86, 7, 0x00d0, 0x10, 30, 2),
+	PIN_FIELD_BASE(87, 87, 7, 0x00d0, 0x10, 30, 2),
+	PIN_FIELD_BASE(88, 88, 5, 0x00f0, 0x10, 24, 2),
+	PIN_FIELD_BASE(89, 89, 5, 0x00f0, 0x10, 24, 2),
+	PIN_FIELD_BASE(90, 90, 5, 0x00f0, 0x10, 24, 2),
+	PIN_FIELD_BASE(91, 91, 5, 0x00f0, 0x10, 24, 2),
+	PIN_FIELD_BASE(92, 92, 5, 0x00f0, 0x10, 26, 2),
+	PIN_FIELD_BASE(93, 93, 5, 0x00f0, 0x10, 26, 2),
+	PIN_FIELD_BASE(94, 94, 5, 0x00f0, 0x10, 26, 2),
+	PIN_FIELD_BASE(95, 95, 5, 0x00f0, 0x10, 26, 2),
+	PIN_FIELD_BASE(96, 96, 5, 0x00f0, 0x10, 28, 2),
+	PIN_FIELD_BASE(97, 97, 5, 0x00f0, 0x10, 26, 2),
+	PIN_FIELD_BASE(98, 98, 5, 0x00f0, 0x10, 26, 2),
+	PIN_FIELD_BASE(99, 99, 5, 0x00f0, 0x10, 26, 2),
+	PIN_FIELD_BASE(100, 100, 5, 0x00f0, 0x10, 26, 2),
+	PIN_FIELD_BASE(101, 101, 5, 0x00f0, 0x10, 26, 2),
+	PIN_FIELD_BASE(102, 102, 5, 0x00f0, 0x10, 26, 2),
+	PIN_FIELD_BASE(103, 103, 7, 0x00d0, 0x10, 20, 2),
+	PIN_FIELD_BASE(104, 104, 7, 0x00d0, 0x10, 14, 2),
+	PIN_FIELD_BASE(105, 105, 7, 0x00d0, 0x10, 18, 2),
+	PIN_FIELD_BASE(106, 106, 7, 0x00d0, 0x10, 16, 2),
+	PIN_FIELD_BASE(107, 107, 7, 0x00d0, 0x10, 28, 2),
+	PIN_FIELD_BASE(108, 108, 7, 0x00d0, 0x10, 22, 2),
+	PIN_FIELD_BASE(109, 109, 7, 0x00d0, 0x10, 26, 2),
+	PIN_FIELD_BASE(110, 110, 7, 0x00d0, 0x10, 24, 2),
+	PIN_FIELD_BASE(111, 111, 7, 0x00d0, 0x10, 30, 2),
+	PIN_FIELD_BASE(112, 112, 8, 0x00a0, 0x10, 10, 2),
+	PIN_FIELD_BASE(113, 113, 8, 0x00a0, 0x10, 10, 2),
+	PIN_FIELD_BASE(114, 114, 8, 0x00a0, 0x10, 10, 2),
+	PIN_FIELD_BASE(115, 115, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(116, 116, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(117, 117, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(118, 118, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(119, 119, 1, 0x00a0, 0x10, 28, 2),
+	PIN_FIELD_BASE(120, 120, 1, 0x00a0, 0x10, 26, 2),
+	PIN_FIELD_BASE(121, 121, 1, 0x00a0, 0x10, 24, 2),
+	PIN_FIELD_BASE(122, 122, 1, 0x00a0, 0x10, 22, 2),
+	PIN_FIELD_BASE(123, 123, 1, 0x00a0, 0x10, 14, 2),
+	PIN_FIELD_BASE(124, 124, 1, 0x00a0, 0x10, 12, 2),
+	PIN_FIELD_BASE(125, 125, 1, 0x00a0, 0x10, 10, 2),
+	PIN_FIELD_BASE(126, 126, 1, 0x00a0, 0x10, 8, 2),
+	PIN_FIELD_BASE(127, 127, 1, 0x00a0, 0x10, 20, 2),
+	PIN_FIELD_BASE(128, 128, 1, 0x00a0, 0x10, 6, 2),
+	PIN_FIELD_BASE(129, 129, 1, 0x00a0, 0x10, 16, 2),
+	PIN_FIELD_BASE(130, 130, 1, 0x00a0, 0x10, 30, 2),
+	PIN_FIELD_BASE(131, 131, 1, 0x00a0, 0x10, 2, 2),
+	PIN_FIELD_BASE(132, 132, 1, 0x00a0, 0x10, 4, 2),
+	PIN_FIELD_BASE(133, 133, 1, 0x00b0, 0x10, 0, 2),
+	PIN_FIELD_BASE(134, 134, 1, 0x00a0, 0x10, 18, 2),
+	PIN_FIELD_BASE(135, 135, 1, 0x00a0, 0x10, 0, 2),
+	PIN_FIELD_BASE(136, 136, 1, 0x00b0, 0x10, 2, 2),
+	PIN_FIELD_BASE(137, 137, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(138, 138, 2, 0x00c0, 0x10, 12, 2),
+	PIN_FIELD_BASE(139, 139, 1, 0x00b0, 0x10, 6, 2),
+	PIN_FIELD_BASE(140, 140, 1, 0x00b0, 0x10, 6, 2),
+	PIN_FIELD_BASE(141, 141, 1, 0x00b0, 0x10, 6, 2),
+	PIN_FIELD_BASE(142, 142, 1, 0x00b0, 0x10, 6, 2),
+	PIN_FIELD_BASE(143, 143, 1, 0x00b0, 0x10, 6, 2),
+	PIN_FIELD_BASE(144, 144, 1, 0x00b0, 0x10, 6, 2),
+	PIN_FIELD_BASE(145, 145, 1, 0x00b0, 0x10, 4, 2),
+	PIN_FIELD_BASE(146, 146, 1, 0x00b0, 0x10, 4, 2),
+	PIN_FIELD_BASE(147, 147, 1, 0x00b0, 0x10, 4, 2),
+	PIN_FIELD_BASE(148, 148, 1, 0x00b0, 0x10, 4, 2),
+	PIN_FIELD_BASE(149, 149, 1, 0x00b0, 0x10, 4, 2),
+	PIN_FIELD_BASE(150, 150, 3, 0x00e0, 0x10, 16, 2),
+	PIN_FIELD_BASE(151, 151, 1, 0x00b0, 0x10, 8, 2),
+	PIN_FIELD_BASE(152, 152, 3, 0x00e0, 0x10, 16, 2),
+	PIN_FIELD_BASE(153, 153, 3, 0x00e0, 0x10, 16, 2),
+	PIN_FIELD_BASE(154, 154, 3, 0x00e0, 0x10, 16, 2),
+	PIN_FIELD_BASE(155, 155, 3, 0x00e0, 0x10, 16, 2),
+	PIN_FIELD_BASE(156, 156, 5, 0x00f0, 0x10, 6, 6),
+	PIN_FIELD_BASE(157, 157, 5, 0x00f0, 0x10, 0, 6),
+	PIN_FIELD_BASE(158, 158, 5, 0x00e0, 0x10, 24, 6),
+	PIN_FIELD_BASE(159, 159, 6, 0x0080, 0x10, 12, 6),
+	PIN_FIELD_BASE(160, 160, 5, 0x00f0, 0x10, 18, 6),
+	PIN_FIELD_BASE(161, 161, 5, 0x00e0, 0x10, 6, 6),
+	PIN_FIELD_BASE(162, 162, 5, 0x00e0, 0x10, 0, 6),
+	PIN_FIELD_BASE(163, 163, 6, 0x0080, 0x10, 6, 6),
+	PIN_FIELD_BASE(164, 164, 5, 0x00e0, 0x10, 18, 6),
+	PIN_FIELD_BASE(165, 165, 5, 0x00e0, 0x10, 12, 6),
+	PIN_FIELD_BASE(166, 166, 6, 0x0080, 0x10, 0, 6),
+	PIN_FIELD_BASE(167, 167, 5, 0x00f0, 0x10, 12, 6),
+	PIN_FIELD_BASE(168, 168, 3, 0x00d0, 0x10, 10, 6),
+	PIN_FIELD_BASE(169, 169, 3, 0x00d0, 0x10, 4, 6),
+	PIN_FIELD_BASE(170, 170, 3, 0x00d0, 0x10, 16, 6),
+	PIN_FIELD_BASE(171, 171, 3, 0x00d0, 0x10, 22, 6),
+	PIN_FIELD_BASE(172, 172, 3, 0x00e0, 0x10, 0, 6),
+	PIN_FIELD_BASE(173, 173, 3, 0x00e0, 0x10, 6, 6),
+	PIN_FIELD_BASE(174, 174, 9, 0x00c0, 0x10, 12, 6),
+	PIN_FIELD_BASE(175, 175, 9, 0x00c0, 0x10, 6, 6),
+	PIN_FIELD_BASE(176, 176, 9, 0x00c0, 0x10, 18, 6),
+	PIN_FIELD_BASE(177, 177, 9, 0x00c0, 0x10, 24, 6),
+	PIN_FIELD_BASE(178, 178, 9, 0x00d0, 0x10, 0, 6),
+	PIN_FIELD_BASE(179, 179, 9, 0x00d0, 0x10, 6, 6),
+	PIN_FIELD_BASE(180, 180, 5, 0x00f0, 0x10, 30, 2),
+	PIN_FIELD_BASE(181, 181, 5, 0x0100, 0x10, 0, 2),
+	PIN_FIELD_BASE(182, 182, 9, 0x00d0, 0x10, 14, 2),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_pupd_range[] = {
+	PIN_FIELD_BASE(44, 44, 7, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(45, 45, 7, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(46, 46, 7, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(47, 47, 7, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(156, 156, 5, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(157, 157, 5, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(158, 158, 5, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(159, 159, 6, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(160, 160, 5, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(161, 161, 5, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(162, 162, 5, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(163, 163, 6, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(164, 164, 5, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(165, 165, 5, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(166, 166, 6, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(167, 167, 5, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(168, 168, 3, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(169, 169, 3, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(170, 170, 3, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(171, 171, 3, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(172, 172, 3, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(173, 173, 3, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(174, 174, 9, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(175, 175, 9, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(176, 176, 9, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(177, 177, 9, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(178, 178, 9, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(179, 179, 9, 0x0080, 0x10, 5, 1),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_r0_range[] = {
+	PIN_FIELD_BASE(44, 44, 7, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(45, 45, 7, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(46, 46, 7, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(47, 47, 7, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(156, 156, 5, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(157, 157, 5, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(158, 158, 5, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(159, 159, 6, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(160, 160, 5, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(161, 161, 5, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(162, 162, 5, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(163, 163, 6, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(164, 164, 5, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(165, 165, 5, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(166, 166, 6, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(167, 167, 5, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(168, 168, 3, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(169, 169, 3, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(170, 170, 3, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(171, 171, 3, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(172, 172, 3, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(173, 173, 3, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(174, 174, 9, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(175, 175, 9, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(176, 176, 9, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(177, 177, 9, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(178, 178, 9, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(179, 179, 9, 0x00a0, 0x10, 5, 1),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_r1_range[] = {
+	PIN_FIELD_BASE(44, 44, 7, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(45, 45, 7, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(46, 46, 7, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(47, 47, 7, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(156, 156, 5, 0x00d0, 0x10, 6, 1),
+	PIN_FIELD_BASE(157, 157, 5, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(158, 158, 5, 0x00d0, 0x10, 4, 1),
+	PIN_FIELD_BASE(159, 159, 6, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(160, 160, 5, 0x00d0, 0x10, 8, 1),
+	PIN_FIELD_BASE(161, 161, 5, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(162, 162, 5, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(163, 163, 6, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(164, 164, 5, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(165, 165, 5, 0x00d0, 0x10, 2, 1),
+	PIN_FIELD_BASE(166, 166, 6, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(167, 167, 5, 0x00d0, 0x10, 7, 1),
+	PIN_FIELD_BASE(168, 168, 3, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(169, 169, 3, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(170, 170, 3, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(171, 171, 3, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(172, 172, 3, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(173, 173, 3, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(174, 174, 9, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(175, 175, 9, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(176, 176, 9, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(177, 177, 9, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(178, 178, 9, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(179, 179, 9, 0x00b0, 0x10, 5, 1),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_pu_range[] = {
+	PIN_FIELD_BASE(0, 0, 7, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(1, 1, 8, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(2, 2, 8, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(3, 3, 8, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(4, 4, 8, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(5, 5, 8, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(6, 6, 7, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(7, 7, 7, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(8, 8, 7, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(9, 9, 7, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(10, 10, 7, 0x00a0, 0x10, 10, 1),
+	PIN_FIELD_BASE(11, 11, 7, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(12, 12, 2, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(13, 13, 2, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(14, 14, 3, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(15, 15, 3, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(16, 16, 2, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(17, 17, 2, 0x00b0, 0x10, 8, 1),
+	PIN_FIELD_BASE(18, 18, 7, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(19, 19, 7, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(20, 20, 7, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(21, 21, 7, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(22, 22, 9, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(23, 23, 9, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(24, 24, 9, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(25, 25, 4, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(26, 26, 4, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(27, 27, 2, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(28, 28, 2, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(29, 29, 4, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(30, 30, 2, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(31, 31, 3, 0x00a0, 0x10, 13, 1),
+	PIN_FIELD_BASE(32, 32, 1, 0x0090, 0x10, 30, 1),
+	PIN_FIELD_BASE(33, 33, 3, 0x00a0, 0x10, 15, 1),
+	PIN_FIELD_BASE(34, 34, 3, 0x00a0, 0x10, 14, 1),
+	PIN_FIELD_BASE(35, 35, 3, 0x00a0, 0x10, 17, 1),
+	PIN_FIELD_BASE(36, 36, 3, 0x00a0, 0x10, 16, 1),
+	PIN_FIELD_BASE(37, 37, 3, 0x00a0, 0x10, 19, 1),
+	PIN_FIELD_BASE(38, 38, 3, 0x00a0, 0x10, 18, 1),
+	PIN_FIELD_BASE(39, 39, 3, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(40, 40, 3, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(41, 41, 3, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(42, 42, 3, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(43, 43, 3, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(48, 48, 4, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(49, 49, 4, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(50, 50, 4, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(51, 51, 8, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(52, 52, 8, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(53, 53, 8, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(54, 54, 8, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(55, 55, 4, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(56, 56, 4, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(57, 57, 2, 0x00b0, 0x10, 13, 1),
+	PIN_FIELD_BASE(58, 58, 2, 0x00b0, 0x10, 17, 1),
+	PIN_FIELD_BASE(59, 59, 2, 0x00b0, 0x10, 14, 1),
+	PIN_FIELD_BASE(60, 60, 2, 0x00b0, 0x10, 18, 1),
+	PIN_FIELD_BASE(61, 61, 2, 0x00b0, 0x10, 15, 1),
+	PIN_FIELD_BASE(62, 62, 2, 0x00b0, 0x10, 19, 1),
+	PIN_FIELD_BASE(63, 63, 2, 0x00b0, 0x10, 16, 1),
+	PIN_FIELD_BASE(64, 64, 2, 0x00b0, 0x10, 20, 1),
+	PIN_FIELD_BASE(65, 65, 9, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(66, 66, 9, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(67, 67, 9, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(68, 68, 9, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(69, 69, 2, 0x00b0, 0x10, 22, 1),
+	PIN_FIELD_BASE(70, 70, 2, 0x00b0, 0x10, 21, 1),
+	PIN_FIELD_BASE(71, 71, 2, 0x00b0, 0x10, 24, 1),
+	PIN_FIELD_BASE(72, 72, 2, 0x00b0, 0x10, 23, 1),
+	PIN_FIELD_BASE(73, 73, 2, 0x00b0, 0x10, 26, 1),
+	PIN_FIELD_BASE(74, 74, 2, 0x00b0, 0x10, 25, 1),
+	PIN_FIELD_BASE(75, 75, 3, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(76, 76, 2, 0x00b0, 0x10, 27, 1),
+	PIN_FIELD_BASE(77, 77, 8, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(78, 78, 8, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(79, 79, 8, 0x0090, 0x10, 15, 1),
+	PIN_FIELD_BASE(80, 80, 8, 0x0090, 0x10, 14, 1),
+	PIN_FIELD_BASE(81, 81, 2, 0x00b0, 0x10, 29, 1),
+	PIN_FIELD_BASE(82, 82, 2, 0x00b0, 0x10, 28, 1),
+	PIN_FIELD_BASE(83, 83, 2, 0x00b0, 0x10, 30, 1),
+	PIN_FIELD_BASE(84, 84, 7, 0x00a0, 0x10, 22, 1),
+	PIN_FIELD_BASE(85, 85, 7, 0x00a0, 0x10, 23, 1),
+	PIN_FIELD_BASE(86, 86, 7, 0x00a0, 0x10, 24, 1),
+	PIN_FIELD_BASE(87, 87, 7, 0x00a0, 0x10, 25, 1),
+	PIN_FIELD_BASE(88, 88, 5, 0x00b0, 0x10, 11, 1),
+	PIN_FIELD_BASE(89, 89, 5, 0x00b0, 0x10, 10, 1),
+	PIN_FIELD_BASE(90, 90, 5, 0x00b0, 0x10, 13, 1),
+	PIN_FIELD_BASE(91, 91, 5, 0x00b0, 0x10, 12, 1),
+	PIN_FIELD_BASE(92, 92, 5, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(93, 93, 5, 0x00b0, 0x10, 8, 1),
+	PIN_FIELD_BASE(94, 94, 5, 0x00b0, 0x10, 14, 1),
+	PIN_FIELD_BASE(95, 95, 5, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(96, 96, 5, 0x00b0, 0x10, 9, 1),
+	PIN_FIELD_BASE(97, 97, 5, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(98, 98, 5, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(99, 99, 5, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(100, 100, 5, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(101, 101, 5, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(102, 102, 5, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(103, 103, 7, 0x00a0, 0x10, 15, 1),
+	PIN_FIELD_BASE(104, 104, 7, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(105, 105, 7, 0x00a0, 0x10, 14, 1),
+	PIN_FIELD_BASE(106, 106, 7, 0x00a0, 0x10, 13, 1),
+	PIN_FIELD_BASE(107, 107, 7, 0x00a0, 0x10, 19, 1),
+	PIN_FIELD_BASE(108, 108, 7, 0x00a0, 0x10, 16, 1),
+	PIN_FIELD_BASE(109, 109, 7, 0x00a0, 0x10, 18, 1),
+	PIN_FIELD_BASE(110, 110, 7, 0x00a0, 0x10, 17, 1),
+	PIN_FIELD_BASE(111, 111, 7, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(112, 112, 8, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(113, 113, 8, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(114, 114, 8, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(115, 115, 2, 0x00b0, 0x10, 9, 1),
+	PIN_FIELD_BASE(116, 116, 2, 0x00b0, 0x10, 12, 1),
+	PIN_FIELD_BASE(117, 117, 2, 0x00b0, 0x10, 10, 1),
+	PIN_FIELD_BASE(118, 118, 2, 0x00b0, 0x10, 11, 1),
+	PIN_FIELD_BASE(119, 119, 1, 0x0090, 0x10, 26, 1),
+	PIN_FIELD_BASE(120, 120, 1, 0x0090, 0x10, 25, 1),
+	PIN_FIELD_BASE(121, 121, 1, 0x0090, 0x10, 24, 1),
+	PIN_FIELD_BASE(122, 122, 1, 0x0090, 0x10, 23, 1),
+	PIN_FIELD_BASE(123, 123, 1, 0x0090, 0x10, 19, 1),
+	PIN_FIELD_BASE(124, 124, 1, 0x0090, 0x10, 18, 1),
+	PIN_FIELD_BASE(125, 125, 1, 0x0090, 0x10, 17, 1),
+	PIN_FIELD_BASE(126, 126, 1, 0x0090, 0x10, 16, 1),
+	PIN_FIELD_BASE(127, 127, 1, 0x0090, 0x10, 22, 1),
+	PIN_FIELD_BASE(128, 128, 1, 0x0090, 0x10, 15, 1),
+	PIN_FIELD_BASE(129, 129, 1, 0x0090, 0x10, 20, 1),
+	PIN_FIELD_BASE(130, 130, 1, 0x0090, 0x10, 27, 1),
+	PIN_FIELD_BASE(131, 131, 1, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(132, 132, 1, 0x0090, 0x10, 14, 1),
+	PIN_FIELD_BASE(133, 133, 1, 0x0090, 0x10, 28, 1),
+	PIN_FIELD_BASE(134, 134, 1, 0x0090, 0x10, 21, 1),
+	PIN_FIELD_BASE(135, 135, 1, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(136, 136, 1, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(137, 137, 2, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(138, 138, 2, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(139, 139, 1, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(140, 140, 1, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(141, 141, 1, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(142, 142, 1, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(143, 143, 1, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(144, 144, 1, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(145, 145, 1, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(146, 146, 1, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(147, 147, 1, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(148, 148, 1, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(149, 149, 1, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(150, 150, 3, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(151, 151, 1, 0x0090, 0x10, 29, 1),
+	PIN_FIELD_BASE(152, 152, 3, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(153, 153, 3, 0x00a0, 0x10, 10, 1),
+	PIN_FIELD_BASE(154, 154, 3, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(155, 155, 3, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(180, 180, 5, 0x00b0, 0x10, 15, 1),
+	PIN_FIELD_BASE(181, 181, 5, 0x00b0, 0x10, 16, 1),
+	PIN_FIELD_BASE(182, 182, 9, 0x0090, 0x10, 3, 1),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_pd_range[] = {
+	PIN_FIELD_BASE(0, 0, 7, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(1, 1, 8, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(2, 2, 8, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(3, 3, 8, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(4, 4, 8, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(5, 5, 8, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(6, 6, 7, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(7, 7, 7, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(8, 8, 7, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(9, 9, 7, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(10, 10, 7, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(11, 11, 7, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(12, 12, 2, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(13, 13, 2, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(14, 14, 3, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(15, 15, 3, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(16, 16, 2, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(17, 17, 2, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(18, 18, 7, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(19, 19, 7, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(20, 20, 7, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(21, 21, 7, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(22, 22, 9, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(23, 23, 9, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(24, 24, 9, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(25, 25, 4, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(26, 26, 4, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(27, 27, 2, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(28, 28, 2, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(29, 29, 4, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(30, 30, 2, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(31, 31, 3, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(32, 32, 1, 0x0080, 0x10, 30, 1),
+	PIN_FIELD_BASE(33, 33, 3, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(34, 34, 3, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(35, 35, 3, 0x0080, 0x10, 17, 1),
+	PIN_FIELD_BASE(36, 36, 3, 0x0080, 0x10, 16, 1),
+	PIN_FIELD_BASE(37, 37, 3, 0x0080, 0x10, 19, 1),
+	PIN_FIELD_BASE(38, 38, 3, 0x0080, 0x10, 18, 1),
+	PIN_FIELD_BASE(39, 39, 3, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(40, 40, 3, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(41, 41, 3, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(42, 42, 3, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(43, 43, 3, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(48, 48, 4, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(49, 49, 4, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(50, 50, 4, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(51, 51, 8, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(52, 52, 8, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(53, 53, 8, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(54, 54, 8, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(55, 55, 4, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(56, 56, 4, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(57, 57, 2, 0x00a0, 0x10, 13, 1),
+	PIN_FIELD_BASE(58, 58, 2, 0x00a0, 0x10, 17, 1),
+	PIN_FIELD_BASE(59, 59, 2, 0x00a0, 0x10, 14, 1),
+	PIN_FIELD_BASE(60, 60, 2, 0x00a0, 0x10, 18, 1),
+	PIN_FIELD_BASE(61, 61, 2, 0x00a0, 0x10, 15, 1),
+	PIN_FIELD_BASE(62, 62, 2, 0x00a0, 0x10, 19, 1),
+	PIN_FIELD_BASE(63, 63, 2, 0x00a0, 0x10, 16, 1),
+	PIN_FIELD_BASE(64, 64, 2, 0x00a0, 0x10, 20, 1),
+	PIN_FIELD_BASE(65, 65, 9, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(66, 66, 9, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(67, 67, 9, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(68, 68, 9, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(69, 69, 2, 0x00a0, 0x10, 22, 1),
+	PIN_FIELD_BASE(70, 70, 2, 0x00a0, 0x10, 21, 1),
+	PIN_FIELD_BASE(71, 71, 2, 0x00a0, 0x10, 24, 1),
+	PIN_FIELD_BASE(72, 72, 2, 0x00a0, 0x10, 23, 1),
+	PIN_FIELD_BASE(73, 73, 2, 0x00a0, 0x10, 26, 1),
+	PIN_FIELD_BASE(74, 74, 2, 0x00a0, 0x10, 25, 1),
+	PIN_FIELD_BASE(75, 75, 3, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(76, 76, 2, 0x00a0, 0x10, 27, 1),
+	PIN_FIELD_BASE(77, 77, 8, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(78, 78, 8, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(79, 79, 8, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(80, 80, 8, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(81, 81, 2, 0x00a0, 0x10, 29, 1),
+	PIN_FIELD_BASE(82, 82, 2, 0x00a0, 0x10, 28, 1),
+	PIN_FIELD_BASE(83, 83, 2, 0x00a0, 0x10, 30, 1),
+	PIN_FIELD_BASE(84, 84, 7, 0x0080, 0x10, 22, 1),
+	PIN_FIELD_BASE(85, 85, 7, 0x0080, 0x10, 23, 1),
+	PIN_FIELD_BASE(86, 86, 7, 0x0080, 0x10, 24, 1),
+	PIN_FIELD_BASE(87, 87, 7, 0x0080, 0x10, 25, 1),
+	PIN_FIELD_BASE(88, 88, 5, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(89, 89, 5, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(90, 90, 5, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(91, 91, 5, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(92, 92, 5, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(93, 93, 5, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(94, 94, 5, 0x0090, 0x10, 14, 1),
+	PIN_FIELD_BASE(95, 95, 5, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(96, 96, 5, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(97, 97, 5, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(98, 98, 5, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(99, 99, 5, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(100, 100, 5, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(101, 101, 5, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(102, 102, 5, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(103, 103, 7, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(104, 104, 7, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(105, 105, 7, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(106, 106, 7, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(107, 107, 7, 0x0080, 0x10, 19, 1),
+	PIN_FIELD_BASE(108, 108, 7, 0x0080, 0x10, 16, 1),
+	PIN_FIELD_BASE(109, 109, 7, 0x0080, 0x10, 18, 1),
+	PIN_FIELD_BASE(110, 110, 7, 0x0080, 0x10, 17, 1),
+	PIN_FIELD_BASE(111, 111, 7, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(112, 112, 8, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(113, 113, 8, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(114, 114, 8, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(115, 115, 2, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(116, 116, 2, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(117, 117, 2, 0x00a0, 0x10, 10, 1),
+	PIN_FIELD_BASE(118, 118, 2, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(119, 119, 1, 0x0080, 0x10, 26, 1),
+	PIN_FIELD_BASE(120, 120, 1, 0x0080, 0x10, 25, 1),
+	PIN_FIELD_BASE(121, 121, 1, 0x0080, 0x10, 24, 1),
+	PIN_FIELD_BASE(122, 122, 1, 0x0080, 0x10, 23, 1),
+	PIN_FIELD_BASE(123, 123, 1, 0x0080, 0x10, 19, 1),
+	PIN_FIELD_BASE(124, 124, 1, 0x0080, 0x10, 18, 1),
+	PIN_FIELD_BASE(125, 125, 1, 0x0080, 0x10, 17, 1),
+	PIN_FIELD_BASE(126, 126, 1, 0x0080, 0x10, 16, 1),
+	PIN_FIELD_BASE(127, 127, 1, 0x0080, 0x10, 22, 1),
+	PIN_FIELD_BASE(128, 128, 1, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(129, 129, 1, 0x0080, 0x10, 20, 1),
+	PIN_FIELD_BASE(130, 130, 1, 0x0080, 0x10, 27, 1),
+	PIN_FIELD_BASE(131, 131, 1, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(132, 132, 1, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(133, 133, 1, 0x0080, 0x10, 28, 1),
+	PIN_FIELD_BASE(134, 134, 1, 0x0080, 0x10, 21, 1),
+	PIN_FIELD_BASE(135, 135, 1, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(136, 136, 1, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(137, 137, 2, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(138, 138, 2, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(139, 139, 1, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(140, 140, 1, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(141, 141, 1, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(142, 142, 1, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(143, 143, 1, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(144, 144, 1, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(145, 145, 1, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(146, 146, 1, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(147, 147, 1, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(148, 148, 1, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(149, 149, 1, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(150, 150, 3, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(151, 151, 1, 0x0080, 0x10, 29, 1),
+	PIN_FIELD_BASE(152, 152, 3, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(153, 153, 3, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(154, 154, 3, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(155, 155, 3, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(180, 180, 5, 0x0090, 0x10, 15, 1),
+	PIN_FIELD_BASE(181, 181, 5, 0x0090, 0x10, 16, 1),
+	PIN_FIELD_BASE(182, 182, 9, 0x0070, 0x10, 3, 1),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_drv_range[] = {
+	PIN_FIELD_BASE(0, 0, 7, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(1, 1, 8, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(2, 2, 8, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(3, 3, 8, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(4, 4, 8, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(5, 5, 8, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(6, 6, 7, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(7, 7, 7, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(8, 8, 7, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(9, 9, 7, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(10, 10, 7, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(11, 11, 7, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(12, 12, 2, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(13, 13, 2, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(14, 14, 3, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(15, 15, 3, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(16, 16, 2, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(17, 17, 2, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(18, 18, 7, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(19, 19, 7, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(20, 20, 7, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(21, 21, 7, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(22, 22, 9, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(23, 23, 9, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(24, 24, 9, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(25, 25, 4, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(26, 26, 4, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(27, 27, 2, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(28, 28, 2, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(29, 29, 4, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(30, 30, 2, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(31, 31, 3, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(32, 32, 1, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(33, 33, 3, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(34, 34, 3, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(35, 35, 3, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(36, 36, 3, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(37, 37, 3, 0x0020, 0x10, 15, 3),
+	PIN_FIELD_BASE(38, 38, 3, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(39, 39, 3, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(40, 40, 3, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(41, 41, 3, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(42, 42, 3, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(43, 43, 3, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(44, 44, 7, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(45, 45, 7, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(46, 46, 7, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(47, 47, 7, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(48, 48, 4, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(49, 49, 4, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(50, 50, 4, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(51, 51, 8, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(52, 52, 8, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(53, 53, 8, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(54, 54, 8, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(55, 55, 4, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(56, 56, 4, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(57, 57, 2, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(58, 58, 2, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(59, 59, 2, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(60, 60, 2, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(61, 61, 2, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(62, 62, 2, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(63, 63, 2, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(64, 64, 2, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(65, 65, 9, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(66, 66, 9, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(67, 67, 9, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(68, 68, 9, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(69, 69, 2, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(70, 70, 2, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(71, 71, 2, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(72, 72, 2, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(73, 73, 2, 0x0020, 0x10, 18, 3),
+	PIN_FIELD_BASE(74, 74, 2, 0x0020, 0x10, 15, 3),
+	PIN_FIELD_BASE(75, 75, 3, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(76, 76, 2, 0x0020, 0x10, 21, 3),
+	PIN_FIELD_BASE(77, 77, 8, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(78, 78, 8, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(79, 79, 8, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(80, 80, 8, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(81, 81, 2, 0x0020, 0x10, 27, 3),
+	PIN_FIELD_BASE(82, 82, 2, 0x0020, 0x10, 24, 3),
+	PIN_FIELD_BASE(83, 83, 2, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(84, 84, 7, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(85, 85, 7, 0x0020, 0x10, 15, 3),
+	PIN_FIELD_BASE(86, 86, 7, 0x0020, 0x10, 18, 3),
+	PIN_FIELD_BASE(87, 87, 7, 0x0020, 0x10, 21, 3),
+	PIN_FIELD_BASE(88, 88, 5, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(89, 89, 5, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(90, 90, 5, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(91, 91, 5, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(92, 92, 5, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(93, 93, 5, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(94, 94, 5, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(95, 95, 5, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(96, 96, 5, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(97, 97, 5, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(98, 98, 5, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(99, 99, 5, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(100, 100, 5, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(101, 101, 5, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(102, 102, 5, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(103, 103, 7, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(104, 104, 7, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(105, 105, 7, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(106, 106, 7, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(107, 107, 7, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(108, 108, 7, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(109, 109, 7, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(110, 110, 7, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(111, 111, 7, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(112, 112, 8, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(113, 113, 8, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(114, 114, 8, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(115, 115, 2, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(116, 116, 2, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(117, 117, 2, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(118, 118, 2, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(119, 119, 1, 0x0020, 0x10, 18, 3),
+	PIN_FIELD_BASE(120, 120, 1, 0x0020, 0x10, 15, 3),
+	PIN_FIELD_BASE(121, 121, 1, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(122, 122, 1, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(123, 123, 1, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(124, 124, 1, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(125, 125, 1, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(126, 126, 1, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(127, 127, 1, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(128, 128, 1, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(129, 129, 1, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(130, 130, 1, 0x0020, 0x10, 21, 3),
+	PIN_FIELD_BASE(131, 131, 1, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(132, 132, 1, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(133, 133, 1, 0x0020, 0x10, 24, 3),
+	PIN_FIELD_BASE(134, 134, 1, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(135, 135, 1, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(136, 136, 1, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(137, 137, 2, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(138, 138, 2, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(139, 139, 1, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(140, 140, 1, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(141, 141, 1, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(142, 142, 1, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(143, 143, 1, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(144, 144, 1, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(145, 145, 1, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(146, 146, 1, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(147, 147, 1, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(148, 148, 1, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(149, 149, 1, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(150, 150, 3, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(151, 151, 1, 0x0020, 0x10, 27, 3),
+	PIN_FIELD_BASE(152, 152, 3, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(153, 153, 3, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(154, 154, 3, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(155, 155, 3, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(156, 156, 5, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(157, 157, 5, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(158, 158, 5, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(159, 159, 6, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(160, 160, 5, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(161, 161, 5, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(162, 162, 5, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(163, 163, 6, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(164, 164, 5, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(165, 165, 5, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(166, 166, 6, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(167, 167, 5, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(168, 168, 3, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(169, 169, 3, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(170, 170, 3, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(171, 171, 3, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(172, 172, 3, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(173, 173, 3, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(174, 174, 9, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(175, 175, 9, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(176, 176, 9, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(177, 177, 9, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(178, 178, 9, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(179, 179, 9, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(180, 180, 5, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(181, 181, 5, 0x0020, 0x10, 15, 3),
+	PIN_FIELD_BASE(182, 182, 9, 0x0000, 0x10, 9, 3),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_drv_adv_range[] = {
+	PIN_FIELD_BASE(51, 51, 8, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(52, 52, 8, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(53, 53, 8, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(54, 54, 8, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(55, 55, 4, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(56, 56, 4, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(57, 57, 2, 0x0040, 0x10, 0, 3),
+	PIN_FIELD_BASE(58, 58, 2, 0x0040, 0x10, 12, 3),
+	PIN_FIELD_BASE(59, 59, 2, 0x0040, 0x10, 3, 3),
+	PIN_FIELD_BASE(60, 60, 2, 0x0040, 0x10, 15, 3),
+	PIN_FIELD_BASE(61, 61, 2, 0x0040, 0x10, 6, 3),
+	PIN_FIELD_BASE(62, 62, 2, 0x0040, 0x10, 18, 3),
+	PIN_FIELD_BASE(63, 63, 2, 0x0040, 0x10, 9, 3),
+	PIN_FIELD_BASE(64, 64, 2, 0x0040, 0x10, 21, 3),
+	PIN_FIELD_BASE(65, 65, 9, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(66, 66, 9, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(67, 67, 9, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(68, 68, 9, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(180, 180, 5, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(181, 181, 5, 0x0030, 0x10, 3, 3),
+};
+
+static const struct mtk_pin_field_calc mt8189_pin_rsel_range[] = {
+	PIN_FIELD_BASE(51, 51, 8, 0x00b0, 0x10, 0, 3),
+	PIN_FIELD_BASE(52, 52, 8, 0x00b0, 0x10, 6, 3),
+	PIN_FIELD_BASE(53, 53, 8, 0x00b0, 0x10, 3, 3),
+	PIN_FIELD_BASE(54, 54, 8, 0x00b0, 0x10, 9, 3),
+	PIN_FIELD_BASE(55, 55, 4, 0x00b0, 0x10, 0, 3),
+	PIN_FIELD_BASE(56, 56, 4, 0x00b0, 0x10, 3, 3),
+	PIN_FIELD_BASE(57, 57, 2, 0x00d0, 0x10, 0, 3),
+	PIN_FIELD_BASE(58, 58, 2, 0x00d0, 0x10, 12, 3),
+	PIN_FIELD_BASE(59, 59, 2, 0x00d0, 0x10, 3, 3),
+	PIN_FIELD_BASE(60, 60, 2, 0x00d0, 0x10, 15, 3),
+	PIN_FIELD_BASE(61, 61, 2, 0x00d0, 0x10, 6, 3),
+	PIN_FIELD_BASE(62, 62, 2, 0x00d0, 0x10, 18, 3),
+	PIN_FIELD_BASE(63, 63, 2, 0x00d0, 0x10, 9, 3),
+	PIN_FIELD_BASE(64, 64, 2, 0x00d0, 0x10, 21, 3),
+	PIN_FIELD_BASE(65, 65, 9, 0x00e0, 0x10, 0, 3),
+	PIN_FIELD_BASE(66, 66, 9, 0x00e0, 0x10, 6, 3),
+	PIN_FIELD_BASE(67, 67, 9, 0x00e0, 0x10, 3, 3),
+	PIN_FIELD_BASE(68, 68, 9, 0x00e0, 0x10, 9, 3),
+	PIN_FIELD_BASE(180, 180, 5, 0x0110, 0x10, 0, 3),
+	PIN_FIELD_BASE(181, 181, 5, 0x0110, 0x10, 3, 3),
+};
+
+static const struct mtk_pin_rsel mt8189_pin_rsel_val_range[] = {
+	PIN_RSEL(51, 68, 0x0, 75000, 75000),
+	PIN_RSEL(51, 68, 0x1, 10000, 5000),
+	PIN_RSEL(51, 68, 0x2, 5000, 75000),
+	PIN_RSEL(51, 68, 0x3, 4000, 5000),
+	PIN_RSEL(51, 68, 0x4, 3000, 75000),
+	PIN_RSEL(51, 68, 0x5, 2000, 5000),
+	PIN_RSEL(51, 68, 0x6, 1500, 75000),
+	PIN_RSEL(51, 68, 0x7, 1000, 5000),
+	PIN_RSEL(180, 181, 0x0, 75000, 75000),
+	PIN_RSEL(180, 181, 0x1, 10000, 5000),
+	PIN_RSEL(180, 181, 0x2, 5000, 75000),
+	PIN_RSEL(180, 181, 0x3, 4000, 5000),
+	PIN_RSEL(180, 181, 0x4, 3000, 75000),
+	PIN_RSEL(180, 181, 0x5, 2000, 5000),
+	PIN_RSEL(180, 181, 0x6, 1500, 75000),
+	PIN_RSEL(180, 181, 0x7, 1000, 5000),
+};
+
+static const unsigned int mt8189_pull_type[] = {
+	MTK_PULL_PU_PD_TYPE, /*0*/
+	MTK_PULL_PU_PD_TYPE, /*1*/
+	MTK_PULL_PU_PD_TYPE, /*2*/
+	MTK_PULL_PU_PD_TYPE, /*3*/
+	MTK_PULL_PU_PD_TYPE, /*4*/
+	MTK_PULL_PU_PD_TYPE, /*5*/
+	MTK_PULL_PU_PD_TYPE, /*6*/
+	MTK_PULL_PU_PD_TYPE, /*7*/
+	MTK_PULL_PU_PD_TYPE, /*8*/
+	MTK_PULL_PU_PD_TYPE, /*9*/
+	MTK_PULL_PU_PD_TYPE, /*10*/
+	MTK_PULL_PU_PD_TYPE, /*11*/
+	MTK_PULL_PU_PD_TYPE, /*12*/
+	MTK_PULL_PU_PD_TYPE, /*13*/
+	MTK_PULL_PU_PD_TYPE, /*14*/
+	MTK_PULL_PU_PD_TYPE, /*15*/
+	MTK_PULL_PU_PD_TYPE, /*16*/
+	MTK_PULL_PU_PD_TYPE, /*17*/
+	MTK_PULL_PU_PD_TYPE, /*18*/
+	MTK_PULL_PU_PD_TYPE, /*19*/
+	MTK_PULL_PU_PD_TYPE, /*20*/
+	MTK_PULL_PU_PD_TYPE, /*21*/
+	MTK_PULL_PU_PD_TYPE, /*22*/
+	MTK_PULL_PU_PD_TYPE, /*23*/
+	MTK_PULL_PU_PD_TYPE, /*24*/
+	MTK_PULL_PU_PD_TYPE, /*25*/
+	MTK_PULL_PU_PD_TYPE, /*26*/
+	MTK_PULL_PU_PD_TYPE, /*27*/
+	MTK_PULL_PU_PD_TYPE, /*28*/
+	MTK_PULL_PU_PD_TYPE, /*29*/
+	MTK_PULL_PU_PD_TYPE, /*30*/
+	MTK_PULL_PU_PD_TYPE, /*31*/
+	MTK_PULL_PU_PD_TYPE, /*32*/
+	MTK_PULL_PU_PD_TYPE, /*33*/
+	MTK_PULL_PU_PD_TYPE, /*34*/
+	MTK_PULL_PU_PD_TYPE, /*35*/
+	MTK_PULL_PU_PD_TYPE, /*36*/
+	MTK_PULL_PU_PD_TYPE, /*37*/
+	MTK_PULL_PU_PD_TYPE, /*38*/
+	MTK_PULL_PU_PD_TYPE, /*39*/
+	MTK_PULL_PU_PD_TYPE, /*40*/
+	MTK_PULL_PU_PD_TYPE, /*41*/
+	MTK_PULL_PU_PD_TYPE, /*42*/
+	MTK_PULL_PU_PD_TYPE, /*43*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*44*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*45*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*46*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*47*/
+	MTK_PULL_PU_PD_TYPE, /*48*/
+	MTK_PULL_PU_PD_TYPE, /*49*/
+	MTK_PULL_PU_PD_TYPE, /*50*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*51*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*52*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*53*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*54*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*55*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*56*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*57*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*58*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*59*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*60*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*61*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*62*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*63*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*64*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*65*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*66*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*67*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*68*/
+	MTK_PULL_PU_PD_TYPE, /*69*/
+	MTK_PULL_PU_PD_TYPE, /*70*/
+	MTK_PULL_PU_PD_TYPE, /*71*/
+	MTK_PULL_PU_PD_TYPE, /*72*/
+	MTK_PULL_PU_PD_TYPE, /*73*/
+	MTK_PULL_PU_PD_TYPE, /*74*/
+	MTK_PULL_PU_PD_TYPE, /*75*/
+	MTK_PULL_PU_PD_TYPE, /*76*/
+	MTK_PULL_PU_PD_TYPE, /*77*/
+	MTK_PULL_PU_PD_TYPE, /*78*/
+	MTK_PULL_PU_PD_TYPE, /*79*/
+	MTK_PULL_PU_PD_TYPE, /*80*/
+	MTK_PULL_PU_PD_TYPE, /*81*/
+	MTK_PULL_PU_PD_TYPE, /*82*/
+	MTK_PULL_PU_PD_TYPE, /*83*/
+	MTK_PULL_PU_PD_TYPE, /*84*/
+	MTK_PULL_PU_PD_TYPE, /*85*/
+	MTK_PULL_PU_PD_TYPE, /*86*/
+	MTK_PULL_PU_PD_TYPE, /*87*/
+	MTK_PULL_PU_PD_TYPE, /*88*/
+	MTK_PULL_PU_PD_TYPE, /*89*/
+	MTK_PULL_PU_PD_TYPE, /*90*/
+	MTK_PULL_PU_PD_TYPE, /*91*/
+	MTK_PULL_PU_PD_TYPE, /*92*/
+	MTK_PULL_PU_PD_TYPE, /*93*/
+	MTK_PULL_PU_PD_TYPE, /*94*/
+	MTK_PULL_PU_PD_TYPE, /*95*/
+	MTK_PULL_PU_PD_TYPE, /*96*/
+	MTK_PULL_PU_PD_TYPE, /*97*/
+	MTK_PULL_PU_PD_TYPE, /*98*/
+	MTK_PULL_PU_PD_TYPE, /*99*/
+	MTK_PULL_PU_PD_TYPE, /*100*/
+	MTK_PULL_PU_PD_TYPE, /*101*/
+	MTK_PULL_PU_PD_TYPE, /*102*/
+	MTK_PULL_PU_PD_TYPE, /*103*/
+	MTK_PULL_PU_PD_TYPE, /*104*/
+	MTK_PULL_PU_PD_TYPE, /*105*/
+	MTK_PULL_PU_PD_TYPE, /*106*/
+	MTK_PULL_PU_PD_TYPE, /*107*/
+	MTK_PULL_PU_PD_TYPE, /*108*/
+	MTK_PULL_PU_PD_TYPE, /*109*/
+	MTK_PULL_PU_PD_TYPE, /*110*/
+	MTK_PULL_PU_PD_TYPE, /*111*/
+	MTK_PULL_PU_PD_TYPE, /*112*/
+	MTK_PULL_PU_PD_TYPE, /*113*/
+	MTK_PULL_PU_PD_TYPE, /*114*/
+	MTK_PULL_PU_PD_TYPE, /*115*/
+	MTK_PULL_PU_PD_TYPE, /*116*/
+	MTK_PULL_PU_PD_TYPE, /*117*/
+	MTK_PULL_PU_PD_TYPE, /*118*/
+	MTK_PULL_PU_PD_TYPE, /*119*/
+	MTK_PULL_PU_PD_TYPE, /*120*/
+	MTK_PULL_PU_PD_TYPE, /*121*/
+	MTK_PULL_PU_PD_TYPE, /*122*/
+	MTK_PULL_PU_PD_TYPE, /*123*/
+	MTK_PULL_PU_PD_TYPE, /*124*/
+	MTK_PULL_PU_PD_TYPE, /*125*/
+	MTK_PULL_PU_PD_TYPE, /*126*/
+	MTK_PULL_PU_PD_TYPE, /*127*/
+	MTK_PULL_PU_PD_TYPE, /*128*/
+	MTK_PULL_PU_PD_TYPE, /*129*/
+	MTK_PULL_PU_PD_TYPE, /*130*/
+	MTK_PULL_PU_PD_TYPE, /*131*/
+	MTK_PULL_PU_PD_TYPE, /*132*/
+	MTK_PULL_PU_PD_TYPE, /*133*/
+	MTK_PULL_PU_PD_TYPE, /*134*/
+	MTK_PULL_PU_PD_TYPE, /*135*/
+	MTK_PULL_PU_PD_TYPE, /*136*/
+	MTK_PULL_PU_PD_TYPE, /*137*/
+	MTK_PULL_PU_PD_TYPE, /*138*/
+	MTK_PULL_PU_PD_TYPE, /*139*/
+	MTK_PULL_PU_PD_TYPE, /*140*/
+	MTK_PULL_PU_PD_TYPE, /*141*/
+	MTK_PULL_PU_PD_TYPE, /*142*/
+	MTK_PULL_PU_PD_TYPE, /*143*/
+	MTK_PULL_PU_PD_TYPE, /*144*/
+	MTK_PULL_PU_PD_TYPE, /*145*/
+	MTK_PULL_PU_PD_TYPE, /*146*/
+	MTK_PULL_PU_PD_TYPE, /*147*/
+	MTK_PULL_PU_PD_TYPE, /*148*/
+	MTK_PULL_PU_PD_TYPE, /*149*/
+	MTK_PULL_PU_PD_TYPE, /*150*/
+	MTK_PULL_PU_PD_TYPE, /*151*/
+	MTK_PULL_PU_PD_TYPE, /*152*/
+	MTK_PULL_PU_PD_TYPE, /*153*/
+	MTK_PULL_PU_PD_TYPE, /*154*/
+	MTK_PULL_PU_PD_TYPE, /*155*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*156*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*157*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*158*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*159*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*160*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*161*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*162*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*163*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*164*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*165*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*166*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*167*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*168*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*169*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*170*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*171*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*172*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*173*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*174*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*175*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*176*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*177*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*178*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*179*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*180*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*181*/
+	MTK_PULL_PU_PD_TYPE, /*182*/
+};
+
+static const struct mtk_pin_reg_calc mt8189_reg_cals[PINCTRL_PIN_REG_MAX] = {
+	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8189_pin_mode_range),
+	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8189_pin_dir_range),
+	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt8189_pin_di_range),
+	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt8189_pin_do_range),
+	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt8189_pin_smt_range),
+	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt8189_pin_ies_range),
+	[PINCTRL_PIN_REG_TDSEL] = MTK_RANGE(mt8189_pin_tdsel_range),
+	[PINCTRL_PIN_REG_RDSEL] = MTK_RANGE(mt8189_pin_rdsel_range),
+	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt8189_pin_pupd_range),
+	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8189_pin_r0_range),
+	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8189_pin_r1_range),
+	[PINCTRL_PIN_REG_PU] = MTK_RANGE(mt8189_pin_pu_range),
+	[PINCTRL_PIN_REG_PD] = MTK_RANGE(mt8189_pin_pd_range),
+	[PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt8189_pin_drv_range),
+	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8189_pin_drv_adv_range),
+	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt8189_pin_rsel_range),
+};
+
+static const char * const mt8189_pinctrl_register_base_names[] = {
+	"gpio_base", "iocfg_bm0_base", "iocfg_bm1_base", "iocfg_bm2_base", "iocfg_lm_base",
+	"iocfg_lt0_base", "iocfg_lt1_base", "iocfg_rb0_base", "iocfg_rb1_base",
+	"iocfg_rt_base"
+};
+
+static const struct mtk_eint_hw mt8189_eint_hw = {
+	.port_mask	= 0xf,
+	.ports		= 3,
+	.ap_num		= 210,
+	.db_cnt		= 32,
+	.db_time	= debounce_time_mt6765,
+};
+
+static const struct mtk_pin_soc mt8189_data = {
+	.reg_cal = mt8189_reg_cals,
+	.pins = mtk_pins_mt8189,
+	.npins = ARRAY_SIZE(mtk_pins_mt8189),
+	.ngrps = ARRAY_SIZE(mtk_pins_mt8189),
+	.eint_pin = eint_pins_mt8189,
+	.eint_hw = &mt8189_eint_hw,
+	.nfuncs = 8,
+	.gpio_m = 0,
+	.base_names = mt8189_pinctrl_register_base_names,
+	.nbase_names = ARRAY_SIZE(mt8189_pinctrl_register_base_names),
+	.bias_set_combo = mtk_pinconf_bias_set_combo,
+	.bias_get_combo = mtk_pinconf_bias_get_combo,
+	.pull_type = mt8189_pull_type,
+	.pin_rsel = mt8189_pin_rsel_val_range,
+	.npin_rsel = ARRAY_SIZE(mt8189_pin_rsel_val_range),
+	.drive_set = mtk_pinconf_drive_set_rev1,
+	.drive_get = mtk_pinconf_drive_get_rev1,
+	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,
+	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
+};
+
+static const struct of_device_id mt8189_pinctrl_of_match[] = {
+	{ .compatible = "mediatek,mt8189-pinctrl", .data = &mt8189_data },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver mt8189_pinctrl_driver = {
+	.driver = {
+		.name = "mt8189-pinctrl",
+		.of_match_table = mt8189_pinctrl_of_match,
+		.pm = pm_sleep_ptr(&mtk_paris_pinctrl_pm_ops),
+	},
+	.probe = mtk_paris_pinctrl_probe,
+};
+
+static int __init mt8189_pinctrl_init(void)
+{
+	return platform_driver_register(&mt8189_pinctrl_driver);
+}
+arch_initcall(mt8189_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT8189 Pinctrl Driver");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h
new file mode 100644
index 000000000000..771efb3da73f
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h
@@ -0,0 +1,2452 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 MediaTek Inc.
+ * Author: Lei Xue <lei.xue@mediatek.com>
+ *         Cathy Xu <ot_cathy.xu@mediatek.com>
+ */
+
+#ifndef __PINCTRL_MTK_MT8189_H
+#define __PINCTRL_MTK_MT8189_H
+
+#include "pinctrl-paris.h"
+
+static const struct mtk_pin_desc mtk_pins_mt8189[] = {
+	MTK_PIN(
+		0, "GPIO0",
+		MTK_EINT_FUNCTION(0, 0),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO0"),
+		MTK_FUNCTION(1, "TP_GPIO0_AO"),
+		MTK_FUNCTION(2, "SPIM3_A_CSB"),
+		MTK_FUNCTION(3, "I2SOUT0_MCK"),
+		MTK_FUNCTION(4, "SCP_SPI0_CS"),
+		MTK_FUNCTION(6, "CONN_BPI_BUS6"),
+		MTK_FUNCTION(7, "DBG_MON_A0")
+	),
+
+	MTK_PIN(
+		1, "GPIO1",
+		MTK_EINT_FUNCTION(0, 1),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO1"),
+		MTK_FUNCTION(1, "TP_GPIO1_AO"),
+		MTK_FUNCTION(2, "SPIM3_A_CLK"),
+		MTK_FUNCTION(3, "I2SOUT0_BCK"),
+		MTK_FUNCTION(4, "SCP_SPI0_CK"),
+		MTK_FUNCTION(6, "CONN_BPI_BUS7"),
+		MTK_FUNCTION(7, "DBG_MON_A1")
+	),
+
+	MTK_PIN(
+		2, "GPIO2",
+		MTK_EINT_FUNCTION(0, 2),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO2"),
+		MTK_FUNCTION(1, "TP_GPIO2_AO"),
+		MTK_FUNCTION(2, "SPIM3_A_MO"),
+		MTK_FUNCTION(3, "I2SOUT0_LRCK"),
+		MTK_FUNCTION(4, "SCP_SPI0_MO"),
+		MTK_FUNCTION(6, "CONN_BPI_BUS8"),
+		MTK_FUNCTION(7, "DBG_MON_A2")
+	),
+
+	MTK_PIN(
+		3, "GPIO3",
+		MTK_EINT_FUNCTION(0, 3),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO3"),
+		MTK_FUNCTION(1, "TP_GPIO3_AO"),
+		MTK_FUNCTION(2, "SPIM3_A_MI"),
+		MTK_FUNCTION(3, "I2SOUT0_DO"),
+		MTK_FUNCTION(4, "SCP_SPI0_MI"),
+		MTK_FUNCTION(6, "CONN_BPI_BUS9"),
+		MTK_FUNCTION(7, "DBG_MON_A3")
+	),
+
+	MTK_PIN(
+		4, "GPIO4",
+		MTK_EINT_FUNCTION(0, 4),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO4"),
+		MTK_FUNCTION(1, "TP_GPIO4_AO"),
+		MTK_FUNCTION(2, "SPIM4_A_CSB"),
+		MTK_FUNCTION(3, "I2SIN0_DI"),
+		MTK_FUNCTION(4, "SCP_SPI1_CS"),
+		MTK_FUNCTION(6, "CONN_BPI_BUS10"),
+		MTK_FUNCTION(7, "DBG_MON_A4")
+	),
+
+	MTK_PIN(
+		5, "GPIO5",
+		MTK_EINT_FUNCTION(0, 5),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO5"),
+		MTK_FUNCTION(1, "TP_GPIO5_AO"),
+		MTK_FUNCTION(2, "SPIM4_A_CLK"),
+		MTK_FUNCTION(3, "I2SIN0_BCK"),
+		MTK_FUNCTION(4, "SCP_SPI1_CK"),
+		MTK_FUNCTION(6, "CONN_BPI_BUS11_OLAT0"),
+		MTK_FUNCTION(7, "DBG_MON_A5")
+	),
+
+	MTK_PIN(
+		6, "GPIO6",
+		MTK_EINT_FUNCTION(0, 6),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO6"),
+		MTK_FUNCTION(1, "TP_GPIO6_AO"),
+		MTK_FUNCTION(2, "SPIM4_A_MO"),
+		MTK_FUNCTION(3, "I2SIN0_LRCK"),
+		MTK_FUNCTION(4, "SCP_SPI1_MO"),
+		MTK_FUNCTION(6, "CONN_BPI_BUS12_OLAT1"),
+		MTK_FUNCTION(7, "DBG_MON_A6")
+	),
+
+	MTK_PIN(
+		7, "GPIO7",
+		MTK_EINT_FUNCTION(0, 7),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO7"),
+		MTK_FUNCTION(1, "TP_GPIO7_AO"),
+		MTK_FUNCTION(2, "SPIM4_A_MI"),
+		MTK_FUNCTION(3, "I2SIN0_MCK"),
+		MTK_FUNCTION(4, "SCP_SPI1_MI"),
+		MTK_FUNCTION(6, "CONN_BPI_BUS13_OLAT2"),
+		MTK_FUNCTION(7, "DBG_MON_A7")
+	),
+
+	MTK_PIN(
+		8, "GPIO8",
+		MTK_EINT_FUNCTION(0, 8),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO8"),
+		MTK_FUNCTION(1, "TP_UTXD1_VLP"),
+		MTK_FUNCTION(2, "SPIM5_A_CSB"),
+		MTK_FUNCTION(3, "I2SOUT1_MCK"),
+		MTK_FUNCTION(4, "VADSP_UTXD0"),
+		MTK_FUNCTION(6, "CONN_BPI_BUS14_OLAT3"),
+		MTK_FUNCTION(7, "DBG_MON_A8")
+	),
+
+	MTK_PIN(
+		9, "GPIO9",
+		MTK_EINT_FUNCTION(0, 9),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO9"),
+		MTK_FUNCTION(1, "TP_URXD1_VLP"),
+		MTK_FUNCTION(2, "SPIM5_A_CLK"),
+		MTK_FUNCTION(3, "I2SOUT1_BCK"),
+		MTK_FUNCTION(4, "VADSP_URXD0"),
+		MTK_FUNCTION(6, "CONN_BPI_BUS15_OLAT4"),
+		MTK_FUNCTION(7, "DBG_MON_A9")
+	),
+
+	MTK_PIN(
+		10, "GPIO10",
+		MTK_EINT_FUNCTION(0, 10),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO10"),
+		MTK_FUNCTION(1, "TP_UCTS1_VLP"),
+		MTK_FUNCTION(2, "SPIM5_A_MO"),
+		MTK_FUNCTION(3, "I2SOUT1_LRCK"),
+		MTK_FUNCTION(4, "SRCLKENAI0"),
+		MTK_FUNCTION(6, "CONN_BPI_BUS16_OLAT5"),
+		MTK_FUNCTION(7, "DBG_MON_A10")
+	),
+
+	MTK_PIN(
+		11, "GPIO11",
+		MTK_EINT_FUNCTION(0, 11),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO11"),
+		MTK_FUNCTION(1, "TP_URTS1_VLP"),
+		MTK_FUNCTION(2, "SPIM5_A_MI"),
+		MTK_FUNCTION(3, "I2SOUT1_DO"),
+		MTK_FUNCTION(4, "SRCLKENAI1"),
+		MTK_FUNCTION(5, "PWM_vlp"),
+		MTK_FUNCTION(7, "DBG_MON_A11")
+	),
+
+	MTK_PIN(
+		12, "GPIO12",
+		MTK_EINT_FUNCTION(0, 12),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO12"),
+		MTK_FUNCTION(1, "TP_UTXD1_VCORE"),
+		MTK_FUNCTION(2, "UTXD3"),
+		MTK_FUNCTION(3, "CLKM0"),
+		MTK_FUNCTION(4, "CMFLASH0"),
+		MTK_FUNCTION(6, "ANT_SEL0"),
+		MTK_FUNCTION(7, "DBG_MON_B20")
+	),
+
+	MTK_PIN(
+		13, "GPIO13",
+		MTK_EINT_FUNCTION(0, 13),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO13"),
+		MTK_FUNCTION(1, "TP_URXD1_VCORE"),
+		MTK_FUNCTION(2, "URXD3"),
+		MTK_FUNCTION(3, "CLKM1"),
+		MTK_FUNCTION(4, "CMFLASH1"),
+		MTK_FUNCTION(6, "ANT_SEL1"),
+		MTK_FUNCTION(7, "DBG_MON_B21")
+	),
+
+	MTK_PIN(
+		14, "GPIO14",
+		MTK_EINT_FUNCTION(0, 14),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO14"),
+		MTK_FUNCTION(1, "TP_UCTS1_VCORE"),
+		MTK_FUNCTION(2, "UCTS3"),
+		MTK_FUNCTION(3, "CLKM2"),
+		MTK_FUNCTION(4, "CMFLASH2"),
+		MTK_FUNCTION(6, "ANT_SEL2"),
+		MTK_FUNCTION(7, "DBG_MON_B22")
+	),
+
+	MTK_PIN(
+		15, "GPIO15",
+		MTK_EINT_FUNCTION(0, 15),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO15"),
+		MTK_FUNCTION(1, "TP_URTS1_VCORE"),
+		MTK_FUNCTION(2, "URTS3"),
+		MTK_FUNCTION(3, "CLKM3"),
+		MTK_FUNCTION(4, "CMVREF0"),
+		MTK_FUNCTION(6, "ANT_SEL3"),
+		MTK_FUNCTION(7, "DBG_MON_B23")
+	),
+
+	MTK_PIN(
+		16, "GPIO16",
+		MTK_EINT_FUNCTION(0, 16),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO16"),
+		MTK_FUNCTION(1, "PWM_0"),
+		MTK_FUNCTION(2, "UCTS2"),
+		MTK_FUNCTION(3, "DP_TX_HPD"),
+		MTK_FUNCTION(4, "CMVREF1"),
+		MTK_FUNCTION(5, "MD32_0_GPIO0"),
+		MTK_FUNCTION(6, "ANT_SEL4"),
+		MTK_FUNCTION(7, "DBG_MON_B24")
+	),
+
+	MTK_PIN(
+		17, "GPIO17",
+		MTK_EINT_FUNCTION(0, 17),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO17"),
+		MTK_FUNCTION(1, "PWM_1"),
+		MTK_FUNCTION(2, "URTS2"),
+		MTK_FUNCTION(3, "EDP_TX_HPD"),
+		MTK_FUNCTION(4, "CMVREF2"),
+		MTK_FUNCTION(5, "MD32_1_GPIO0"),
+		MTK_FUNCTION(6, "PMSR_SMAP"),
+		MTK_FUNCTION(7, "DBG_MON_B25")
+	),
+
+	MTK_PIN(
+		18, "GPIO18",
+		MTK_EINT_FUNCTION(0, 18),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO18"),
+		MTK_FUNCTION(1, "CMFLASH0"),
+		MTK_FUNCTION(2, "CMVREF3"),
+		MTK_FUNCTION(3, "UTXD2"),
+		MTK_FUNCTION(4, "DISP_PWM1"),
+		MTK_FUNCTION(5, "I2SIN1_MCK"),
+		MTK_FUNCTION(6, "mbistreaden_trigger"),
+		MTK_FUNCTION(7, "DBG_MON_A12")
+	),
+
+	MTK_PIN(
+		19, "GPIO19",
+		MTK_EINT_FUNCTION(0, 19),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO19"),
+		MTK_FUNCTION(1, "CMFLASH1"),
+		MTK_FUNCTION(2, "CMVREF2"),
+		MTK_FUNCTION(3, "URXD2"),
+		MTK_FUNCTION(4, "USB_DRVVBUS_1P"),
+		MTK_FUNCTION(5, "I2SIN1_BCK"),
+		MTK_FUNCTION(6, "mbistwriteen_trigger"),
+		MTK_FUNCTION(7, "DBG_MON_A13")
+	),
+
+	MTK_PIN(
+		20, "GPIO20",
+		MTK_EINT_FUNCTION(0, 20),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO20"),
+		MTK_FUNCTION(1, "CMFLASH2"),
+		MTK_FUNCTION(2, "CMVREF1"),
+		MTK_FUNCTION(3, "UCTS2"),
+		MTK_FUNCTION(4, "PERSTN"),
+		MTK_FUNCTION(5, "I2SIN1_LRCK"),
+		MTK_FUNCTION(6, "DMIC0_DAT1"),
+		MTK_FUNCTION(7, "DBG_MON_A14")
+	),
+
+	MTK_PIN(
+		21, "GPIO21",
+		MTK_EINT_FUNCTION(0, 21),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO21"),
+		MTK_FUNCTION(1, "CMFLASH3"),
+		MTK_FUNCTION(2, "CMVREF0"),
+		MTK_FUNCTION(3, "URTS2"),
+		MTK_FUNCTION(4, "CLKREQN"),
+		MTK_FUNCTION(5, "I2SIN1_DI"),
+		MTK_FUNCTION(6, "DMIC1_DAT1"),
+		MTK_FUNCTION(7, "DBG_MON_A15")
+	),
+
+	MTK_PIN(
+		22, "GPIO22",
+		MTK_EINT_FUNCTION(0, 22),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO22"),
+		MTK_FUNCTION(1, "CMMCLK0"),
+		MTK_FUNCTION(2, "TP_GPIO4_AO")
+	),
+
+	MTK_PIN(
+		23, "GPIO23",
+		MTK_EINT_FUNCTION(0, 23),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO23"),
+		MTK_FUNCTION(1, "CMMCLK1"),
+		MTK_FUNCTION(2, "TP_GPIO5_AO"),
+		MTK_FUNCTION(3, "SSPM_UTXD_AO_VLP"),
+		MTK_FUNCTION(4, "PWM_vlp"),
+		MTK_FUNCTION(6, "SRCLKENAI0")
+	),
+
+	MTK_PIN(
+		24, "GPIO24",
+		MTK_EINT_FUNCTION(0, 24),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO24"),
+		MTK_FUNCTION(1, "CMMCLK2"),
+		MTK_FUNCTION(2, "TP_GPIO6_AO"),
+		MTK_FUNCTION(3, "SSPM_URXD_AO_VLP"),
+		MTK_FUNCTION(4, "WAKEN"),
+		MTK_FUNCTION(5, "SPMI_P_TRIG_FLAG"),
+		MTK_FUNCTION(6, "SRCLKENAI1")
+	),
+
+	MTK_PIN(
+		25, "GPIO25",
+		MTK_EINT_FUNCTION(0, 25),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO25"),
+		MTK_FUNCTION(1, "LCM_RST"),
+		MTK_FUNCTION(2, "DP_TX_HPD"),
+		MTK_FUNCTION(3, "CMFLASH3"),
+		MTK_FUNCTION(4, "MD32_0_GPIO0"),
+		MTK_FUNCTION(5, "USB_DRVVBUS_2P")
+	),
+
+	MTK_PIN(
+		26, "GPIO26",
+		MTK_EINT_FUNCTION(0, 26),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO26"),
+		MTK_FUNCTION(1, "DSI_TE"),
+		MTK_FUNCTION(2, "EDP_TX_HPD"),
+		MTK_FUNCTION(3, "CMVREF3"),
+		MTK_FUNCTION(4, "MD32_1_GPIO0"),
+		MTK_FUNCTION(5, "USB_DRVVBUS_3P")
+	),
+
+	MTK_PIN(
+		27, "GPIO27",
+		MTK_EINT_FUNCTION(0, 27),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO27"),
+		MTK_FUNCTION(1, "DP_TX_HPD"),
+		MTK_FUNCTION(2, "mbistreaden_trigger"),
+		MTK_FUNCTION(3, "MD32_0_GPIO0"),
+		MTK_FUNCTION(4, "TP_UCTS1_VCORE"),
+		MTK_FUNCTION(5, "CMVREF4"),
+		MTK_FUNCTION(6, "EXTIF0_ACT"),
+		MTK_FUNCTION(7, "ANT_SEL0")
+	),
+
+	MTK_PIN(
+		28, "GPIO28",
+		MTK_EINT_FUNCTION(0, 28),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO28"),
+		MTK_FUNCTION(1, "EDP_TX_HPD"),
+		MTK_FUNCTION(2, "mbistwriteen_trigger"),
+		MTK_FUNCTION(3, "MD32_1_GPIO0"),
+		MTK_FUNCTION(4, "TP_URTS1_VCORE"),
+		MTK_FUNCTION(6, "EXTIF0_PRI"),
+		MTK_FUNCTION(7, "ANT_SEL1")
+	),
+
+	MTK_PIN(
+		29, "GPIO29",
+		MTK_EINT_FUNCTION(0, 29),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO29"),
+		MTK_FUNCTION(1, "DISP_PWM0"),
+		MTK_FUNCTION(2, "MD32_1_TXD"),
+		MTK_FUNCTION(3, "SSPM_UTXD_AO_VCORE"),
+		MTK_FUNCTION(5, "USB_DRVVBUS_4P")
+	),
+
+	MTK_PIN(
+		30, "GPIO30",
+		MTK_EINT_FUNCTION(0, 30),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO30"),
+		MTK_FUNCTION(1, "DISP_PWM1"),
+		MTK_FUNCTION(2, "MD32_1_RXD"),
+		MTK_FUNCTION(3, "SSPM_URXD_AO_VCORE"),
+		MTK_FUNCTION(5, "PMSR_SMAP"),
+		MTK_FUNCTION(6, "EXTIF0_GNT_B"),
+		MTK_FUNCTION(7, "ANT_SEL2")
+	),
+
+	MTK_PIN(
+		31, "GPIO31",
+		MTK_EINT_FUNCTION(0, 31),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO31"),
+		MTK_FUNCTION(1, "UTXD0"),
+		MTK_FUNCTION(2, "MD32_0_TXD")
+	),
+
+	MTK_PIN(
+		32, "GPIO32",
+		MTK_EINT_FUNCTION(0, 32),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO32"),
+		MTK_FUNCTION(1, "URXD0"),
+		MTK_FUNCTION(2, "MD32_0_RXD")
+	),
+
+	MTK_PIN(
+		33, "GPIO33",
+		MTK_EINT_FUNCTION(0, 33),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO33"),
+		MTK_FUNCTION(1, "UTXD1"),
+		MTK_FUNCTION(2, "VADSP_UTXD0"),
+		MTK_FUNCTION(3, "TP_UTXD1_VLP"),
+		MTK_FUNCTION(4, "MD32_1_TXD"),
+		MTK_FUNCTION(5, "CONN_BGF_UART0_TXD"),
+		MTK_FUNCTION(6, "CONN_WIFI_TXD")
+	),
+
+	MTK_PIN(
+		34, "GPIO34",
+		MTK_EINT_FUNCTION(0, 34),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO34"),
+		MTK_FUNCTION(1, "URXD1"),
+		MTK_FUNCTION(2, "VADSP_URXD0"),
+		MTK_FUNCTION(3, "TP_URXD1_VLP"),
+		MTK_FUNCTION(4, "MD32_1_RXD"),
+		MTK_FUNCTION(5, "CONN_BGF_UART0_RXD")
+	),
+
+	MTK_PIN(
+		35, "GPIO35",
+		MTK_EINT_FUNCTION(0, 35),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO35"),
+		MTK_FUNCTION(1, "UTXD2"),
+		MTK_FUNCTION(2, "UCTS1"),
+		MTK_FUNCTION(3, "TP_UCTS1_VLP"),
+		MTK_FUNCTION(4, "SSPM_UTXD_AO_VLP"),
+		MTK_FUNCTION(5, "VADSP_UTXD0"),
+		MTK_FUNCTION(6, "CONN_BT_TXD")
+	),
+
+	MTK_PIN(
+		36, "GPIO36",
+		MTK_EINT_FUNCTION(0, 36),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO36"),
+		MTK_FUNCTION(1, "URXD2"),
+		MTK_FUNCTION(2, "URTS1"),
+		MTK_FUNCTION(3, "TP_URTS1_VLP"),
+		MTK_FUNCTION(4, "SSPM_URXD_AO_VLP"),
+		MTK_FUNCTION(5, "VADSP_URXD0")
+	),
+
+	MTK_PIN(
+		37, "GPIO37",
+		MTK_EINT_FUNCTION(0, 37),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO37"),
+		MTK_FUNCTION(1, "UTXD3"),
+		MTK_FUNCTION(2, "UCTS0"),
+		MTK_FUNCTION(3, "TP_UTXD1_VCORE"),
+		MTK_FUNCTION(4, "SSPM_UTXD_AO_VCORE"),
+		MTK_FUNCTION(6, "MD32_0_TXD"),
+		MTK_FUNCTION(7, "CONN_BGF_UART0_TXD")
+	),
+
+	MTK_PIN(
+		38, "GPIO38",
+		MTK_EINT_FUNCTION(0, 38),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO38"),
+		MTK_FUNCTION(1, "URXD3"),
+		MTK_FUNCTION(2, "URTS0"),
+		MTK_FUNCTION(3, "TP_URXD1_VCORE"),
+		MTK_FUNCTION(4, "SSPM_URXD_AO_VCORE"),
+		MTK_FUNCTION(6, "MD32_0_RXD"),
+		MTK_FUNCTION(7, "CONN_BGF_UART0_RXD")
+	),
+
+	MTK_PIN(
+		39, "GPIO39",
+		MTK_EINT_FUNCTION(0, 39),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO39"),
+		MTK_FUNCTION(1, "JTMS_SEL1")
+	),
+
+	MTK_PIN(
+		40, "GPIO40",
+		MTK_EINT_FUNCTION(0, 40),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO40"),
+		MTK_FUNCTION(1, "JTCK_SEL1")
+	),
+
+	MTK_PIN(
+		41, "GPIO41",
+		MTK_EINT_FUNCTION(0, 41),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO41"),
+		MTK_FUNCTION(1, "JTDI_SEL1")
+	),
+
+	MTK_PIN(
+		42, "GPIO42",
+		MTK_EINT_FUNCTION(0, 42),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO42"),
+		MTK_FUNCTION(1, "JTDO_SEL1")
+	),
+
+	MTK_PIN(
+		43, "GPIO43",
+		MTK_EINT_FUNCTION(0, 43),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO43"),
+		MTK_FUNCTION(1, "JTRSTn_SEL1")
+	),
+
+	MTK_PIN(
+		44, "GPIO44",
+		MTK_EINT_FUNCTION(0, 44),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO44"),
+		MTK_FUNCTION(1, "KPCOL0")
+	),
+
+	MTK_PIN(
+		45, "GPIO45",
+		MTK_EINT_FUNCTION(0, 45),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO45"),
+		MTK_FUNCTION(1, "KPCOL1"),
+		MTK_FUNCTION(2, "TP_GPIO0_AO"),
+		MTK_FUNCTION(3, "SRCLKENAI1"),
+		MTK_FUNCTION(7, "DBG_MON_A31")
+	),
+
+	MTK_PIN(
+		46, "GPIO46",
+		MTK_EINT_FUNCTION(0, 46),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO46"),
+		MTK_FUNCTION(1, "KPROW0"),
+		MTK_FUNCTION(2, "TP_GPIO1_AO")
+	),
+
+	MTK_PIN(
+		47, "GPIO47",
+		MTK_EINT_FUNCTION(0, 47),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO47"),
+		MTK_FUNCTION(1, "KPROW1"),
+		MTK_FUNCTION(2, "TP_GPIO2_AO"),
+		MTK_FUNCTION(3, "SRCLKENAI0"),
+		MTK_FUNCTION(7, "DBG_MON_A32")
+	),
+
+	MTK_PIN(
+		48, "GPIO48",
+		MTK_EINT_FUNCTION(0, 48),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO48"),
+		MTK_FUNCTION(1, "WAKEN"),
+		MTK_FUNCTION(2, "TP_GPIO3_AO"),
+		MTK_FUNCTION(3, "SPMI_P_TRIG_FLAG")
+	),
+
+	MTK_PIN(
+		49, "GPIO49",
+		MTK_EINT_FUNCTION(0, 49),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO49"),
+		MTK_FUNCTION(1, "PERSTN"),
+		MTK_FUNCTION(2, "MD32_0_GPIO0"),
+		MTK_FUNCTION(3, "UFS_MPHY_SCL"),
+		MTK_FUNCTION(7, "ANT_SEL3")
+	),
+
+	MTK_PIN(
+		50, "GPIO50",
+		MTK_EINT_FUNCTION(0, 50),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO50"),
+		MTK_FUNCTION(1, "CLKREQN"),
+		MTK_FUNCTION(2, "MD32_1_GPIO0"),
+		MTK_FUNCTION(3, "UFS_MPHY_SDA"),
+		MTK_FUNCTION(7, "ANT_SEL4")
+	),
+
+	MTK_PIN(
+		51, "GPIO51",
+		MTK_EINT_FUNCTION(0, 51),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO51"),
+		MTK_FUNCTION(1, "SCP_SCL0"),
+		MTK_FUNCTION(2, "SCL0")
+	),
+
+	MTK_PIN(
+		52, "GPIO52",
+		MTK_EINT_FUNCTION(0, 52),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO52"),
+		MTK_FUNCTION(1, "SCP_SDA0"),
+		MTK_FUNCTION(2, "SDA0")
+	),
+
+	MTK_PIN(
+		53, "GPIO53",
+		MTK_EINT_FUNCTION(0, 53),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO53"),
+		MTK_FUNCTION(1, "SCP_SCL1"),
+		MTK_FUNCTION(2, "SCL1")
+	),
+
+	MTK_PIN(
+		54, "GPIO54",
+		MTK_EINT_FUNCTION(0, 54),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO54"),
+		MTK_FUNCTION(1, "SCP_SDA1"),
+		MTK_FUNCTION(2, "SDA1")
+	),
+
+	MTK_PIN(
+		55, "GPIO55",
+		MTK_EINT_FUNCTION(0, 55),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO55"),
+		MTK_FUNCTION(1, "SCL2"),
+		MTK_FUNCTION(2, "UFS_MPHY_SCL"),
+		MTK_FUNCTION(3, "SSUSB_U2SIF_SCL")
+	),
+
+	MTK_PIN(
+		56, "GPIO56",
+		MTK_EINT_FUNCTION(0, 56),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO56"),
+		MTK_FUNCTION(1, "SDA2"),
+		MTK_FUNCTION(2, "UFS_MPHY_SDA"),
+		MTK_FUNCTION(3, "SSUSB_U2SIF_SDA")
+	),
+
+	MTK_PIN(
+		57, "GPIO57",
+		MTK_EINT_FUNCTION(0, 57),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO57"),
+		MTK_FUNCTION(1, "SCL3"),
+		MTK_FUNCTION(2, "PCIE_PHY_I2C_SCL"),
+		MTK_FUNCTION(3, "SSUSB_U2SIF_SCL_1P")
+	),
+
+	MTK_PIN(
+		58, "GPIO58",
+		MTK_EINT_FUNCTION(0, 58),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO58"),
+		MTK_FUNCTION(1, "SDA3"),
+		MTK_FUNCTION(2, "PCIE_PHY_I2C_SDA"),
+		MTK_FUNCTION(3, "SSUSB_U2SIF_SDA_1P")
+	),
+
+	MTK_PIN(
+		59, "GPIO59",
+		MTK_EINT_FUNCTION(0, 59),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO59"),
+		MTK_FUNCTION(1, "SCL4"),
+		MTK_FUNCTION(2, "SSUSB_U3PHY_I2C_SCL")
+	),
+
+	MTK_PIN(
+		60, "GPIO60",
+		MTK_EINT_FUNCTION(0, 60),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO60"),
+		MTK_FUNCTION(1, "SDA4"),
+		MTK_FUNCTION(2, "SSUSB_U3PHY_I2C_SDA")
+	),
+
+	MTK_PIN(
+		61, "GPIO61",
+		MTK_EINT_FUNCTION(0, 61),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO61"),
+		MTK_FUNCTION(1, "SCL5"),
+		MTK_FUNCTION(2, "SSPXTP_U3PHY_I2C_SCL")
+	),
+
+	MTK_PIN(
+		62, "GPIO62",
+		MTK_EINT_FUNCTION(0, 62),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO62"),
+		MTK_FUNCTION(1, "SDA5"),
+		MTK_FUNCTION(2, "SSPXTP_U3PHY_I2C_SDA")
+	),
+
+	MTK_PIN(
+		63, "GPIO63",
+		MTK_EINT_FUNCTION(0, 63),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO63"),
+		MTK_FUNCTION(1, "SCL6")
+	),
+
+	MTK_PIN(
+		64, "GPIO64",
+		MTK_EINT_FUNCTION(0, 64),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO64"),
+		MTK_FUNCTION(1, "SDA6")
+	),
+
+	MTK_PIN(
+		65, "GPIO65",
+		MTK_EINT_FUNCTION(0, 65),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO65"),
+		MTK_FUNCTION(1, "SCL7")
+	),
+
+	MTK_PIN(
+		66, "GPIO66",
+		MTK_EINT_FUNCTION(0, 66),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO66"),
+		MTK_FUNCTION(1, "SDA7")
+	),
+
+	MTK_PIN(
+		67, "GPIO67",
+		MTK_EINT_FUNCTION(0, 67),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO67"),
+		MTK_FUNCTION(1, "SCL8")
+	),
+
+	MTK_PIN(
+		68, "GPIO68",
+		MTK_EINT_FUNCTION(0, 68),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO68"),
+		MTK_FUNCTION(1, "SDA8")
+	),
+
+	MTK_PIN(
+		69, "GPIO69",
+		MTK_EINT_FUNCTION(0, 69),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO69"),
+		MTK_FUNCTION(1, "SPIM0_CSB"),
+		MTK_FUNCTION(2, "SCP_SPI0_CS"),
+		MTK_FUNCTION(3, "SPM_JTAG_TMS_VCORE"),
+		MTK_FUNCTION(4, "VADSP_JTAG0_TMS"),
+		MTK_FUNCTION(5, "SPM_JTAG_TMS"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TMS_VLP")
+	),
+
+	MTK_PIN(
+		70, "GPIO70",
+		MTK_EINT_FUNCTION(0, 70),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO70"),
+		MTK_FUNCTION(1, "SPIM0_CLK"),
+		MTK_FUNCTION(2, "SCP_SPI0_CK"),
+		MTK_FUNCTION(3, "SPM_JTAG_TCK_VCORE"),
+		MTK_FUNCTION(4, "VADSP_JTAG0_TCK"),
+		MTK_FUNCTION(5, "SPM_JTAG_TCK"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TCK_VLP")
+	),
+
+	MTK_PIN(
+		71, "GPIO71",
+		MTK_EINT_FUNCTION(0, 71),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO71"),
+		MTK_FUNCTION(1, "SPIM0_MO"),
+		MTK_FUNCTION(2, "SCP_SPI0_MO"),
+		MTK_FUNCTION(3, "SPM_JTAG_TDI_VCORE"),
+		MTK_FUNCTION(4, "VADSP_JTAG0_TDI"),
+		MTK_FUNCTION(5, "SPM_JTAG_TDI"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TDI_VLP")
+	),
+
+	MTK_PIN(
+		72, "GPIO72",
+		MTK_EINT_FUNCTION(0, 72),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO72"),
+		MTK_FUNCTION(1, "SPIM0_MI"),
+		MTK_FUNCTION(2, "SCP_SPI0_MI"),
+		MTK_FUNCTION(3, "SPM_JTAG_TDO_VCORE"),
+		MTK_FUNCTION(4, "VADSP_JTAG0_TDO"),
+		MTK_FUNCTION(5, "SPM_JTAG_TDO"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TDO_VLP")
+	),
+
+	MTK_PIN(
+		73, "GPIO73",
+		MTK_EINT_FUNCTION(0, 73),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO73"),
+		MTK_FUNCTION(1, "SPIM1_CSB"),
+		MTK_FUNCTION(2, "SCP_SPI1_CS"),
+		MTK_FUNCTION(3, "SPM_JTAG_TRSTN_VCORE"),
+		MTK_FUNCTION(4, "VADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(5, "SPM_JTAG_TRSTN"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TRSTN_VLP")
+	),
+
+	MTK_PIN(
+		74, "GPIO74",
+		MTK_EINT_FUNCTION(0, 74),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO74"),
+		MTK_FUNCTION(1, "SPIM1_CLK"),
+		MTK_FUNCTION(2, "SCP_SPI1_CK")
+	),
+
+	MTK_PIN(
+		75, "GPIO75",
+		MTK_EINT_FUNCTION(0, 75),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO75"),
+		MTK_FUNCTION(1, "SPIM1_MO"),
+		MTK_FUNCTION(2, "SCP_SPI1_MO")
+	),
+
+	MTK_PIN(
+		76, "GPIO76",
+		MTK_EINT_FUNCTION(0, 76),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO76"),
+		MTK_FUNCTION(1, "SPIM1_MI"),
+		MTK_FUNCTION(2, "SCP_SPI1_MI")
+	),
+
+	MTK_PIN(
+		77, "GPIO77",
+		MTK_EINT_FUNCTION(0, 77),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO77"),
+		MTK_FUNCTION(1, "SPIM2_CSB"),
+		MTK_FUNCTION(2, "PCM0_SYNC"),
+		MTK_FUNCTION(3, "SSUSB_U2SIF_SCL"),
+		MTK_FUNCTION(7, "DBG_MON_A27")
+	),
+
+	MTK_PIN(
+		78, "GPIO78",
+		MTK_EINT_FUNCTION(0, 78),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO78"),
+		MTK_FUNCTION(1, "SPIM2_CLK"),
+		MTK_FUNCTION(2, "PCM0_CLK"),
+		MTK_FUNCTION(3, "SSUSB_U2SIF_SDA"),
+		MTK_FUNCTION(7, "DBG_MON_A28")
+	),
+
+	MTK_PIN(
+		79, "GPIO79",
+		MTK_EINT_FUNCTION(0, 79),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO79"),
+		MTK_FUNCTION(1, "SPIM2_MO"),
+		MTK_FUNCTION(2, "PCM0_DO"),
+		MTK_FUNCTION(3, "SSUSB_U2SIF_SCL_1P"),
+		MTK_FUNCTION(7, "DBG_MON_A29")
+	),
+
+	MTK_PIN(
+		80, "GPIO80",
+		MTK_EINT_FUNCTION(0, 80),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO80"),
+		MTK_FUNCTION(1, "SPIM2_MI"),
+		MTK_FUNCTION(2, "PCM0_DI"),
+		MTK_FUNCTION(3, "SSUSB_U2SIF_SDA_1P"),
+		MTK_FUNCTION(7, "DBG_MON_A30")
+	),
+
+	MTK_PIN(
+		81, "GPIO81",
+		MTK_EINT_FUNCTION(0, 81),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO81"),
+		MTK_FUNCTION(1, "IDDIG"),
+		MTK_FUNCTION(7, "DBG_MON_B32")
+	),
+
+	MTK_PIN(
+		82, "GPIO82",
+		MTK_EINT_FUNCTION(0, 82),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO82"),
+		MTK_FUNCTION(1, "USB_DRVVBUS")
+	),
+
+	MTK_PIN(
+		83, "GPIO83",
+		MTK_EINT_FUNCTION(0, 83),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO83"),
+		MTK_FUNCTION(1, "VBUSVALID")
+	),
+
+	MTK_PIN(
+		84, "GPIO84",
+		MTK_EINT_FUNCTION(0, 84),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO84"),
+		MTK_FUNCTION(1, "USB_DRVVBUS_1P"),
+		MTK_FUNCTION(7, "DBG_MON_A16")
+	),
+
+	MTK_PIN(
+		85, "GPIO85",
+		MTK_EINT_FUNCTION(0, 85),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO85"),
+		MTK_FUNCTION(1, "USB_DRVVBUS_2P"),
+		MTK_FUNCTION(7, "DBG_MON_A17")
+	),
+
+	MTK_PIN(
+		86, "GPIO86",
+		MTK_EINT_FUNCTION(0, 86),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO86"),
+		MTK_FUNCTION(1, "USB_DRVVBUS_3P"),
+		MTK_FUNCTION(7, "DBG_MON_A18")
+	),
+
+	MTK_PIN(
+		87, "GPIO87",
+		MTK_EINT_FUNCTION(0, 87),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO87"),
+		MTK_FUNCTION(1, "USB_DRVVBUS_4P"),
+		MTK_FUNCTION(6, "CMVREF4"),
+		MTK_FUNCTION(7, "DBG_MON_A19")
+	),
+
+	MTK_PIN(
+		88, "GPIO88",
+		MTK_EINT_FUNCTION(0, 88),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO88"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_CSN")
+	),
+
+	MTK_PIN(
+		89, "GPIO89",
+		MTK_EINT_FUNCTION(0, 89),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO89"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_CK")
+	),
+
+	MTK_PIN(
+		90, "GPIO90",
+		MTK_EINT_FUNCTION(0, 90),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO90"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_MO")
+	),
+
+	MTK_PIN(
+		91, "GPIO91",
+		MTK_EINT_FUNCTION(0, 91),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO91"),
+		MTK_FUNCTION(1, "PWRAP_SPI0_MI")
+	),
+
+	MTK_PIN(
+		92, "GPIO92",
+		MTK_EINT_FUNCTION(0, 92),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO92"),
+		MTK_FUNCTION(1, "SRCLKENA0")
+	),
+
+	MTK_PIN(
+		93, "GPIO93",
+		MTK_EINT_FUNCTION(0, 93),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO93"),
+		MTK_FUNCTION(1, "SRCLKENA1")
+	),
+
+	MTK_PIN(
+		94, "GPIO94",
+		MTK_EINT_FUNCTION(0, 94),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO94"),
+		MTK_FUNCTION(1, "SCP_VREQ_VAO")
+	),
+
+	MTK_PIN(
+		95, "GPIO95",
+		MTK_EINT_FUNCTION(0, 95),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO95"),
+		MTK_FUNCTION(1, "RTC32K_CK")
+	),
+
+	MTK_PIN(
+		96, "GPIO96",
+		MTK_EINT_FUNCTION(0, 96),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO96"),
+		MTK_FUNCTION(1, "WATCHDOG")
+	),
+
+	MTK_PIN(
+		97, "GPIO97",
+		MTK_EINT_FUNCTION(0, 97),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO97"),
+		MTK_FUNCTION(1, "AUD_CLK_MOSI")
+	),
+
+	MTK_PIN(
+		98, "GPIO98",
+		MTK_EINT_FUNCTION(0, 98),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO98"),
+		MTK_FUNCTION(1, "AUD_SYNC_MOSI")
+	),
+
+	MTK_PIN(
+		99, "GPIO99",
+		MTK_EINT_FUNCTION(0, 99),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO99"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI0")
+	),
+
+	MTK_PIN(
+		100, "GPIO100",
+		MTK_EINT_FUNCTION(0, 100),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO100"),
+		MTK_FUNCTION(1, "AUD_DAT_MOSI1")
+	),
+
+	MTK_PIN(
+		101, "GPIO101",
+		MTK_EINT_FUNCTION(0, 101),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO101"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO0")
+	),
+
+	MTK_PIN(
+		102, "GPIO102",
+		MTK_EINT_FUNCTION(0, 102),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO102"),
+		MTK_FUNCTION(1, "AUD_DAT_MISO1")
+	),
+
+	MTK_PIN(
+		103, "GPIO103",
+		MTK_EINT_FUNCTION(0, 103),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO103"),
+		MTK_FUNCTION(1, "I2SIN0_MCK"),
+		MTK_FUNCTION(2, "SPIM3_B_CSB"),
+		MTK_FUNCTION(3, "APU_JTAG_TMS"),
+		MTK_FUNCTION(4, "SCP_JTAG0_TMS_VCORE"),
+		MTK_FUNCTION(5, "CONN_WF_MCU_TMS"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TMS_VCORE"),
+		MTK_FUNCTION(7, "IPU_JTAG_TMS")
+	),
+
+	MTK_PIN(
+		104, "GPIO104",
+		MTK_EINT_FUNCTION(0, 104),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO104"),
+		MTK_FUNCTION(1, "I2SIN0_BCK"),
+		MTK_FUNCTION(2, "SPIM3_B_CLK"),
+		MTK_FUNCTION(3, "APU_JTAG_TCK"),
+		MTK_FUNCTION(4, "SCP_JTAG0_TCK_VCORE"),
+		MTK_FUNCTION(5, "CONN_WF_MCU_TCK"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TCK_VCORE"),
+		MTK_FUNCTION(7, "IPU_JTAG_TCK")
+	),
+
+	MTK_PIN(
+		105, "GPIO105",
+		MTK_EINT_FUNCTION(0, 105),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO105"),
+		MTK_FUNCTION(1, "I2SIN0_LRCK"),
+		MTK_FUNCTION(2, "SPIM3_B_MO"),
+		MTK_FUNCTION(3, "APU_JTAG_TDI"),
+		MTK_FUNCTION(4, "SCP_JTAG0_TDI_VCORE"),
+		MTK_FUNCTION(5, "CONN_WF_MCU_TDI"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TDI_VCORE"),
+		MTK_FUNCTION(7, "IPU_JTAG_TDI")
+	),
+
+	MTK_PIN(
+		106, "GPIO106",
+		MTK_EINT_FUNCTION(0, 106),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO106"),
+		MTK_FUNCTION(1, "I2SIN0_DI"),
+		MTK_FUNCTION(2, "SPIM3_B_MI"),
+		MTK_FUNCTION(3, "APU_JTAG_TDO"),
+		MTK_FUNCTION(4, "SCP_JTAG0_TDO_VCORE"),
+		MTK_FUNCTION(5, "CONN_WF_MCU_TDO"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TDO_VCORE"),
+		MTK_FUNCTION(7, "IPU_JTAG_TDO")
+	),
+
+	MTK_PIN(
+		107, "GPIO107",
+		MTK_EINT_FUNCTION(0, 107),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO107"),
+		MTK_FUNCTION(1, "I2SOUT0_MCK"),
+		MTK_FUNCTION(2, "SPIM4_B_CSB"),
+		MTK_FUNCTION(3, "APU_JTAG_TRST"),
+		MTK_FUNCTION(4, "SCP_JTAG0_TRSTN_VCORE"),
+		MTK_FUNCTION(5, "CONN_WF_MCU_TRST_B"),
+		MTK_FUNCTION(6, "SSPM_JTAG_TRSTN_VCORE"),
+		MTK_FUNCTION(7, "IPU_JTAG_TRST")
+	),
+
+	MTK_PIN(
+		108, "GPIO108",
+		MTK_EINT_FUNCTION(0, 108),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO108"),
+		MTK_FUNCTION(1, "I2SOUT0_BCK"),
+		MTK_FUNCTION(2, "SPIM4_B_CLK"),
+		MTK_FUNCTION(3, "EXTIF0_ACT"),
+		MTK_FUNCTION(4, "SPM_JTAG_TMS_VCORE"),
+		MTK_FUNCTION(6, "CLKM2"),
+		MTK_FUNCTION(7, "DBG_MON_A20")
+	),
+
+	MTK_PIN(
+		109, "GPIO109",
+		MTK_EINT_FUNCTION(0, 109),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO109"),
+		MTK_FUNCTION(1, "I2SOUT0_LRCK"),
+		MTK_FUNCTION(2, "SPIM4_B_MO"),
+		MTK_FUNCTION(3, "EXTIF0_PRI"),
+		MTK_FUNCTION(4, "SPM_JTAG_TCK_VCORE"),
+		MTK_FUNCTION(6, "CLKM3"),
+		MTK_FUNCTION(7, "DBG_MON_A21")
+	),
+
+	MTK_PIN(
+		110, "GPIO110",
+		MTK_EINT_FUNCTION(0, 110),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO110"),
+		MTK_FUNCTION(1, "I2SOUT0_DO"),
+		MTK_FUNCTION(2, "SPIM4_B_MI"),
+		MTK_FUNCTION(3, "EXTIF0_GNT_B"),
+		MTK_FUNCTION(4, "SPM_JTAG_TDI_VCORE"),
+		MTK_FUNCTION(7, "DBG_MON_A22")
+	),
+
+	MTK_PIN(
+		111, "GPIO111",
+		MTK_EINT_FUNCTION(0, 111),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO111"),
+		MTK_FUNCTION(1, "DMIC0_CLK"),
+		MTK_FUNCTION(2, "I2SIN1_MCK"),
+		MTK_FUNCTION(3, "I2SOUT1_MCK"),
+		MTK_FUNCTION(4, "SPM_JTAG_TDO_VCORE"),
+		MTK_FUNCTION(6, "CONN_MIPI0_SDATA"),
+		MTK_FUNCTION(7, "DBG_MON_A23")
+	),
+
+	MTK_PIN(
+		112, "GPIO112",
+		MTK_EINT_FUNCTION(0, 112),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO112"),
+		MTK_FUNCTION(1, "DMIC0_DAT0"),
+		MTK_FUNCTION(2, "I2SIN1_BCK"),
+		MTK_FUNCTION(3, "I2SOUT1_BCK"),
+		MTK_FUNCTION(4, "SPM_JTAG_TRSTN_VCORE"),
+		MTK_FUNCTION(6, "CONN_MIPI0_SCLK"),
+		MTK_FUNCTION(7, "DBG_MON_A24")
+	),
+
+	MTK_PIN(
+		113, "GPIO113",
+		MTK_EINT_FUNCTION(0, 113),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO113"),
+		MTK_FUNCTION(1, "DMIC1_CLK"),
+		MTK_FUNCTION(2, "I2SIN1_LRCK"),
+		MTK_FUNCTION(3, "I2SOUT1_LRCK"),
+		MTK_FUNCTION(4, "PMSR_SMAP"),
+		MTK_FUNCTION(6, "CONN_MIPI1_SDATA"),
+		MTK_FUNCTION(7, "DBG_MON_A25")
+	),
+
+	MTK_PIN(
+		114, "GPIO114",
+		MTK_EINT_FUNCTION(0, 114),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO114"),
+		MTK_FUNCTION(1, "DMIC1_DAT0"),
+		MTK_FUNCTION(2, "I2SIN1_DI"),
+		MTK_FUNCTION(3, "I2SOUT1_DO"),
+		MTK_FUNCTION(6, "CONN_MIPI1_SCLK"),
+		MTK_FUNCTION(7, "DBG_MON_A26")
+	),
+
+	MTK_PIN(
+		115, "GPIO115",
+		MTK_EINT_FUNCTION(0, 115),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO115"),
+		MTK_FUNCTION(1, "PCM0_CLK"),
+		MTK_FUNCTION(2, "USB_DRVVBUS_1P"),
+		MTK_FUNCTION(3, "PCIE_PHY_I2C_SCL"),
+		MTK_FUNCTION(4, "SSUSB_U3PHY_I2C_SCL"),
+		MTK_FUNCTION(6, "CMFLASH0"),
+		MTK_FUNCTION(7, "EXTIF0_ACT")
+	),
+
+	MTK_PIN(
+		116, "GPIO116",
+		MTK_EINT_FUNCTION(0, 116),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO116"),
+		MTK_FUNCTION(1, "PCM0_SYNC"),
+		MTK_FUNCTION(2, "USB_DRVVBUS_2P"),
+		MTK_FUNCTION(3, "PCIE_PHY_I2C_SDA"),
+		MTK_FUNCTION(4, "SSUSB_U3PHY_I2C_SDA"),
+		MTK_FUNCTION(6, "CMFLASH1"),
+		MTK_FUNCTION(7, "EXTIF0_PRI")
+	),
+
+	MTK_PIN(
+		117, "GPIO117",
+		MTK_EINT_FUNCTION(0, 117),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO117"),
+		MTK_FUNCTION(1, "PCM0_DI"),
+		MTK_FUNCTION(2, "USB_DRVVBUS_3P"),
+		MTK_FUNCTION(3, "DP_TX_HPD"),
+		MTK_FUNCTION(4, "SSPXTP_U3PHY_I2C_SCL"),
+		MTK_FUNCTION(6, "CMVREF0"),
+		MTK_FUNCTION(7, "EXTIF0_GNT_B")
+	),
+
+	MTK_PIN(
+		118, "GPIO118",
+		MTK_EINT_FUNCTION(0, 118),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO118"),
+		MTK_FUNCTION(1, "PCM0_DO"),
+		MTK_FUNCTION(2, "USB_DRVVBUS_4P"),
+		MTK_FUNCTION(3, "EDP_TX_HPD"),
+		MTK_FUNCTION(4, "SSPXTP_U3PHY_I2C_SDA"),
+		MTK_FUNCTION(6, "CMVREF1")
+	),
+
+	MTK_PIN(
+		119, "GPIO119",
+		MTK_EINT_FUNCTION(0, 119),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO119"),
+		MTK_FUNCTION(1, "GBE_TXD3"),
+		MTK_FUNCTION(2, "DMIC0_CLK"),
+		MTK_FUNCTION(3, "LVTS_FOUT"),
+		MTK_FUNCTION(4, "CONN_BGF_MCU_TMS"),
+		MTK_FUNCTION(5, "UDI_TMS"),
+		MTK_FUNCTION(6, "ANT_SEL5"),
+		MTK_FUNCTION(7, "DBG_MON_B0")
+	),
+
+	MTK_PIN(
+		120, "GPIO120",
+		MTK_EINT_FUNCTION(0, 120),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO120"),
+		MTK_FUNCTION(1, "GBE_TXD2"),
+		MTK_FUNCTION(2, "DMIC0_DAT0"),
+		MTK_FUNCTION(3, "LVTS_SDO"),
+		MTK_FUNCTION(4, "CONN_BGF_MCU_TCK"),
+		MTK_FUNCTION(5, "UDI_TCK"),
+		MTK_FUNCTION(6, "ANT_SEL6"),
+		MTK_FUNCTION(7, "DBG_MON_B1")
+	),
+
+	MTK_PIN(
+		121, "GPIO121",
+		MTK_EINT_FUNCTION(0, 121),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO121"),
+		MTK_FUNCTION(1, "GBE_TXD1"),
+		MTK_FUNCTION(2, "DMIC0_DAT1"),
+		MTK_FUNCTION(3, "LVTS_26M"),
+		MTK_FUNCTION(4, "CONN_BGF_MCU_TDI"),
+		MTK_FUNCTION(5, "UDI_TDI"),
+		MTK_FUNCTION(6, "ANT_SEL7"),
+		MTK_FUNCTION(7, "DBG_MON_B2")
+	),
+
+	MTK_PIN(
+		122, "GPIO122",
+		MTK_EINT_FUNCTION(0, 122),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO122"),
+		MTK_FUNCTION(1, "GBE_TXD0"),
+		MTK_FUNCTION(2, "DMIC1_CLK"),
+		MTK_FUNCTION(3, "LVTS_SCF"),
+		MTK_FUNCTION(4, "CONN_BGF_MCU_TDO"),
+		MTK_FUNCTION(5, "UDI_TDO"),
+		MTK_FUNCTION(6, "ANT_SEL8"),
+		MTK_FUNCTION(7, "DBG_MON_B3")
+	),
+
+	MTK_PIN(
+		123, "GPIO123",
+		MTK_EINT_FUNCTION(0, 123),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO123"),
+		MTK_FUNCTION(1, "GBE_RXD3"),
+		MTK_FUNCTION(2, "DMIC1_DAT0"),
+		MTK_FUNCTION(3, "LVTS_SCK"),
+		MTK_FUNCTION(4, "CONN_BGF_MCU_TRST_B"),
+		MTK_FUNCTION(5, "UDI_NTRST"),
+		MTK_FUNCTION(6, "ANT_SEL9"),
+		MTK_FUNCTION(7, "DBG_MON_B4")
+	),
+
+	MTK_PIN(
+		124, "GPIO124",
+		MTK_EINT_FUNCTION(0, 124),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO124"),
+		MTK_FUNCTION(1, "GBE_RXD2"),
+		MTK_FUNCTION(2, "DMIC1_DAT1"),
+		MTK_FUNCTION(3, "LVTS_SDI"),
+		MTK_FUNCTION(4, "CONN_WF_MCU_TMS"),
+		MTK_FUNCTION(5, "SCP_JTAG0_TMS_VCORE"),
+		MTK_FUNCTION(6, "ANT_SEL10"),
+		MTK_FUNCTION(7, "DBG_MON_B5")
+	),
+
+	MTK_PIN(
+		125, "GPIO125",
+		MTK_EINT_FUNCTION(0, 125),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO125"),
+		MTK_FUNCTION(1, "GBE_RXD1"),
+		MTK_FUNCTION(2, "CLKM2"),
+		MTK_FUNCTION(4, "CONN_WF_MCU_TCK"),
+		MTK_FUNCTION(5, "SCP_JTAG0_TCK_VCORE"),
+		MTK_FUNCTION(6, "ANT_SEL11"),
+		MTK_FUNCTION(7, "DBG_MON_B6")
+	),
+
+	MTK_PIN(
+		126, "GPIO126",
+		MTK_EINT_FUNCTION(0, 126),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO126"),
+		MTK_FUNCTION(1, "GBE_RXD0"),
+		MTK_FUNCTION(2, "CLKM3"),
+		MTK_FUNCTION(4, "CONN_WF_MCU_TDI"),
+		MTK_FUNCTION(5, "SCP_JTAG0_TDI_VCORE"),
+		MTK_FUNCTION(6, "ANT_SEL12"),
+		MTK_FUNCTION(7, "DBG_MON_B7")
+	),
+
+	MTK_PIN(
+		127, "GPIO127",
+		MTK_EINT_FUNCTION(0, 127),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO127"),
+		MTK_FUNCTION(1, "GBE_TXC"),
+		MTK_FUNCTION(2, "I2SIN1_MCK"),
+		MTK_FUNCTION(4, "CONN_WF_MCU_TDO"),
+		MTK_FUNCTION(5, "SCP_JTAG0_TDO_VCORE"),
+		MTK_FUNCTION(6, "ANT_SEL13"),
+		MTK_FUNCTION(7, "DBG_MON_B8")
+	),
+
+	MTK_PIN(
+		128, "GPIO128",
+		MTK_EINT_FUNCTION(0, 128),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO128"),
+		MTK_FUNCTION(1, "GBE_RXC"),
+		MTK_FUNCTION(2, "I2SIN1_BCK"),
+		MTK_FUNCTION(4, "CONN_WF_MCU_TRST_B"),
+		MTK_FUNCTION(5, "SCP_JTAG0_TRSTN_VCORE"),
+		MTK_FUNCTION(6, "ANT_SEL14"),
+		MTK_FUNCTION(7, "DBG_MON_B9")
+	),
+
+	MTK_PIN(
+		129, "GPIO129",
+		MTK_EINT_FUNCTION(0, 129),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO129"),
+		MTK_FUNCTION(1, "GBE_RXDV"),
+		MTK_FUNCTION(2, "I2SIN1_LRCK"),
+		MTK_FUNCTION(4, "CONN_BGF_MCU_AICE_TMSC"),
+		MTK_FUNCTION(5, "IPU_JTAG_TMS"),
+		MTK_FUNCTION(6, "ANT_SEL15"),
+		MTK_FUNCTION(7, "DBG_MON_B10")
+	),
+
+	MTK_PIN(
+		130, "GPIO130",
+		MTK_EINT_FUNCTION(0, 130),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO130"),
+		MTK_FUNCTION(1, "GBE_TXEN"),
+		MTK_FUNCTION(2, "I2SIN1_DI"),
+		MTK_FUNCTION(4, "CONN_BGF_MCU_AICE_TCKC"),
+		MTK_FUNCTION(5, "IPU_JTAG_TCK"),
+		MTK_FUNCTION(6, "ANT_SEL16"),
+		MTK_FUNCTION(7, "DBG_MON_B11")
+	),
+
+	MTK_PIN(
+		131, "GPIO131",
+		MTK_EINT_FUNCTION(0, 131),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO131"),
+		MTK_FUNCTION(1, "GBE_MDC"),
+		MTK_FUNCTION(2, "CLKM0"),
+		MTK_FUNCTION(3, "mbistreaden_trigger"),
+		MTK_FUNCTION(4, "CONN_BGF_UART0_TXD"),
+		MTK_FUNCTION(5, "IPU_JTAG_TDI"),
+		MTK_FUNCTION(6, "ANT_SEL17"),
+		MTK_FUNCTION(7, "DBG_MON_B12")
+	),
+
+	MTK_PIN(
+		132, "GPIO132",
+		MTK_EINT_FUNCTION(0, 132),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO132"),
+		MTK_FUNCTION(1, "GBE_MDIO"),
+		MTK_FUNCTION(2, "CLKM1"),
+		MTK_FUNCTION(3, "mbistwriteen_trigger"),
+		MTK_FUNCTION(4, "CONN_BGF_UART0_RXD"),
+		MTK_FUNCTION(5, "IPU_JTAG_TDO"),
+		MTK_FUNCTION(6, "ANT_SEL18"),
+		MTK_FUNCTION(7, "DBG_MON_B13")
+	),
+
+	MTK_PIN(
+		133, "GPIO133",
+		MTK_EINT_FUNCTION(0, 133),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO133"),
+		MTK_FUNCTION(1, "GBE_TXER"),
+		MTK_FUNCTION(2, "GBE_AUX_PPS2"),
+		MTK_FUNCTION(4, "CONN_BT_TXD"),
+		MTK_FUNCTION(5, "IPU_JTAG_TRST"),
+		MTK_FUNCTION(6, "ANT_SEL19"),
+		MTK_FUNCTION(7, "DBG_MON_B14")
+	),
+
+	MTK_PIN(
+		134, "GPIO134",
+		MTK_EINT_FUNCTION(0, 134),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO134"),
+		MTK_FUNCTION(1, "GBE_RXER"),
+		MTK_FUNCTION(2, "GBE_AUX_PPS3"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TMS"),
+		MTK_FUNCTION(4, "CONN_WF_MCU_AICE_TMSC"),
+		MTK_FUNCTION(5, "APU_JTAG_TMS"),
+		MTK_FUNCTION(6, "ANT_SEL20"),
+		MTK_FUNCTION(7, "DBG_MON_B15")
+	),
+
+	MTK_PIN(
+		135, "GPIO135",
+		MTK_EINT_FUNCTION(0, 135),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO135"),
+		MTK_FUNCTION(1, "GBE_COL"),
+		MTK_FUNCTION(2, "I2SOUT1_MCK"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TCK"),
+		MTK_FUNCTION(4, "CONN_WF_MCU_AICE_TCKC"),
+		MTK_FUNCTION(5, "APU_JTAG_TCK"),
+		MTK_FUNCTION(6, "ANT_SEL21"),
+		MTK_FUNCTION(7, "DBG_MON_B16")
+	),
+
+	MTK_PIN(
+		136, "GPIO136",
+		MTK_EINT_FUNCTION(0, 136),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO136"),
+		MTK_FUNCTION(1, "GBE_INTR"),
+		MTK_FUNCTION(2, "I2SOUT1_BCK"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TDI"),
+		MTK_FUNCTION(4, "CONN_WIFI_TXD"),
+		MTK_FUNCTION(5, "APU_JTAG_TDI"),
+		MTK_FUNCTION(6, "PWM_0"),
+		MTK_FUNCTION(7, "DBG_MON_B17")
+	),
+
+	MTK_PIN(
+		137, "GPIO137",
+		MTK_EINT_FUNCTION(0, 137),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO137"),
+		MTK_FUNCTION(1, "GBE_AUX_PPS0"),
+		MTK_FUNCTION(2, "I2SOUT1_LRCK"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TDO"),
+		MTK_FUNCTION(4, "DP_TX_HPD"),
+		MTK_FUNCTION(5, "APU_JTAG_TDO"),
+		MTK_FUNCTION(6, "PWM_1"),
+		MTK_FUNCTION(7, "DBG_MON_B18")
+	),
+
+	MTK_PIN(
+		138, "GPIO138",
+		MTK_EINT_FUNCTION(0, 138),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO138"),
+		MTK_FUNCTION(1, "GBE_AUX_PPS1"),
+		MTK_FUNCTION(2, "I2SOUT1_DO"),
+		MTK_FUNCTION(3, "MCUPM_JTAG_TRSTN"),
+		MTK_FUNCTION(4, "EDP_TX_HPD"),
+		MTK_FUNCTION(5, "APU_JTAG_TRST"),
+		MTK_FUNCTION(6, "PWM_2"),
+		MTK_FUNCTION(7, "DBG_MON_B19")
+	),
+
+	MTK_PIN(
+		139, "GPIO139",
+		MTK_EINT_FUNCTION(0, 139),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO139"),
+		MTK_FUNCTION(1, "CONN_TOP_CLK")
+	),
+
+	MTK_PIN(
+		140, "GPIO140",
+		MTK_EINT_FUNCTION(0, 140),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO140"),
+		MTK_FUNCTION(1, "CONN_TOP_DATA")
+	),
+
+	MTK_PIN(
+		141, "GPIO141",
+		MTK_EINT_FUNCTION(0, 141),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO141"),
+		MTK_FUNCTION(1, "CONN_BT_CLK")
+	),
+
+	MTK_PIN(
+		142, "GPIO142",
+		MTK_EINT_FUNCTION(0, 142),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO142"),
+		MTK_FUNCTION(1, "CONN_BT_DATA")
+	),
+
+	MTK_PIN(
+		143, "GPIO143",
+		MTK_EINT_FUNCTION(0, 143),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO143"),
+		MTK_FUNCTION(1, "CONN_HRST_B")
+	),
+
+	MTK_PIN(
+		144, "GPIO144",
+		MTK_EINT_FUNCTION(0, 144),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO144"),
+		MTK_FUNCTION(1, "CONN_WB_PTA")
+	),
+
+	MTK_PIN(
+		145, "GPIO145",
+		MTK_EINT_FUNCTION(0, 145),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO145"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL0")
+	),
+
+	MTK_PIN(
+		146, "GPIO146",
+		MTK_EINT_FUNCTION(0, 146),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO146"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL1")
+	),
+
+	MTK_PIN(
+		147, "GPIO147",
+		MTK_EINT_FUNCTION(0, 147),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO147"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL2")
+	),
+
+	MTK_PIN(
+		148, "GPIO148",
+		MTK_EINT_FUNCTION(0, 148),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO148"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL3")
+	),
+
+	MTK_PIN(
+		149, "GPIO149",
+		MTK_EINT_FUNCTION(0, 149),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO149"),
+		MTK_FUNCTION(1, "CONN_WF_CTRL4")
+	),
+
+	MTK_PIN(
+		150, "GPIO150",
+		MTK_EINT_FUNCTION(0, 150),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO150"),
+		MTK_FUNCTION(1, "SPINOR_CK"),
+		MTK_FUNCTION(2, "DMIC0_CLK"),
+		MTK_FUNCTION(3, "DP_TX_HPD"),
+		MTK_FUNCTION(4, "PWM_0"),
+		MTK_FUNCTION(5, "CONN_BPI_BUS17_ANT0"),
+		MTK_FUNCTION(6, "LVTS_FOUT"),
+		MTK_FUNCTION(7, "DBG_MON_B26")
+	),
+
+	MTK_PIN(
+		151, "GPIO151",
+		MTK_EINT_FUNCTION(0, 151),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO151"),
+		MTK_FUNCTION(1, "SPINOR_CS"),
+		MTK_FUNCTION(2, "DMIC0_DAT0"),
+		MTK_FUNCTION(3, "EDP_TX_HPD"),
+		MTK_FUNCTION(4, "PWM_1"),
+		MTK_FUNCTION(5, "CONN_BPI_BUS18_ANT1"),
+		MTK_FUNCTION(6, "LVTS_SDO"),
+		MTK_FUNCTION(7, "DBG_MON_B27")
+	),
+
+	MTK_PIN(
+		152, "GPIO152",
+		MTK_EINT_FUNCTION(0, 152),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO152"),
+		MTK_FUNCTION(1, "SPINOR_IO0"),
+		MTK_FUNCTION(2, "DMIC0_DAT1"),
+		MTK_FUNCTION(3, "UTXD2"),
+		MTK_FUNCTION(4, "USB_DRVVBUS_1P"),
+		MTK_FUNCTION(5, "CONN_BPI_BUS19_ANT2"),
+		MTK_FUNCTION(6, "LVTS_26M"),
+		MTK_FUNCTION(7, "DBG_MON_B28")
+	),
+
+	MTK_PIN(
+		153, "GPIO153",
+		MTK_EINT_FUNCTION(0, 153),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO153"),
+		MTK_FUNCTION(1, "SPINOR_IO1"),
+		MTK_FUNCTION(2, "DMIC1_CLK"),
+		MTK_FUNCTION(3, "UCTS2"),
+		MTK_FUNCTION(4, "USB_DRVVBUS_2P"),
+		MTK_FUNCTION(5, "CONN_BPI_BUS20_ANT3"),
+		MTK_FUNCTION(6, "LVTS_SCF"),
+		MTK_FUNCTION(7, "DBG_MON_B29")
+	),
+
+	MTK_PIN(
+		154, "GPIO154",
+		MTK_EINT_FUNCTION(0, 154),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO154"),
+		MTK_FUNCTION(1, "SPINOR_IO2"),
+		MTK_FUNCTION(2, "DMIC1_DAT0"),
+		MTK_FUNCTION(3, "URTS2"),
+		MTK_FUNCTION(4, "USB_DRVVBUS_3P"),
+		MTK_FUNCTION(5, "CONN_BPI_BUS21_ANT4"),
+		MTK_FUNCTION(6, "LVTS_SCK"),
+		MTK_FUNCTION(7, "DBG_MON_B30")
+	),
+
+	MTK_PIN(
+		155, "GPIO155",
+		MTK_EINT_FUNCTION(0, 155),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO155"),
+		MTK_FUNCTION(1, "SPINOR_IO3"),
+		MTK_FUNCTION(2, "DMIC1_DAT1"),
+		MTK_FUNCTION(3, "URXD2"),
+		MTK_FUNCTION(4, "USB_DRVVBUS_4P"),
+		MTK_FUNCTION(5, "DISP_PWM1"),
+		MTK_FUNCTION(6, "LVTS_SDI"),
+		MTK_FUNCTION(7, "DBG_MON_B31")
+	),
+
+	MTK_PIN(
+		156, "GPIO156",
+		MTK_EINT_FUNCTION(0, 156),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO156"),
+		MTK_FUNCTION(1, "MSDC0_DAT7")
+	),
+
+	MTK_PIN(
+		157, "GPIO157",
+		MTK_EINT_FUNCTION(0, 157),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO157"),
+		MTK_FUNCTION(1, "MSDC0_DAT6")
+	),
+
+	MTK_PIN(
+		158, "GPIO158",
+		MTK_EINT_FUNCTION(0, 158),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO158"),
+		MTK_FUNCTION(1, "MSDC0_DAT5")
+	),
+
+	MTK_PIN(
+		159, "GPIO159",
+		MTK_EINT_FUNCTION(0, 159),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO159"),
+		MTK_FUNCTION(1, "MSDC0_DAT4")
+	),
+
+	MTK_PIN(
+		160, "GPIO160",
+		MTK_EINT_FUNCTION(0, 160),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO160"),
+		MTK_FUNCTION(1, "MSDC0_RSTB")
+	),
+
+	MTK_PIN(
+		161, "GPIO161",
+		MTK_EINT_FUNCTION(0, 161),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO161"),
+		MTK_FUNCTION(1, "MSDC0_CMD")
+	),
+
+	MTK_PIN(
+		162, "GPIO162",
+		MTK_EINT_FUNCTION(0, 162),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO162"),
+		MTK_FUNCTION(1, "MSDC0_CLK")
+	),
+
+	MTK_PIN(
+		163, "GPIO163",
+		MTK_EINT_FUNCTION(0, 163),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO163"),
+		MTK_FUNCTION(1, "MSDC0_DAT3")
+	),
+
+	MTK_PIN(
+		164, "GPIO164",
+		MTK_EINT_FUNCTION(0, 164),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO164"),
+		MTK_FUNCTION(1, "MSDC0_DAT2")
+	),
+
+	MTK_PIN(
+		165, "GPIO165",
+		MTK_EINT_FUNCTION(0, 165),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO165"),
+		MTK_FUNCTION(1, "MSDC0_DAT1")
+	),
+
+	MTK_PIN(
+		166, "GPIO166",
+		MTK_EINT_FUNCTION(0, 166),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO166"),
+		MTK_FUNCTION(1, "MSDC0_DAT0")
+	),
+
+	MTK_PIN(
+		167, "GPIO167",
+		MTK_EINT_FUNCTION(0, 167),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO167"),
+		MTK_FUNCTION(1, "MSDC0_DSL")
+	),
+
+	MTK_PIN(
+		168, "GPIO168",
+		MTK_EINT_FUNCTION(0, 168),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO168"),
+		MTK_FUNCTION(1, "MSDC1_CMD"),
+		MTK_FUNCTION(2, "CONN_WF_MCU_AICE_TMSC"),
+		MTK_FUNCTION(3, "UCTS1"),
+		MTK_FUNCTION(4, "UDI_TMS"),
+		MTK_FUNCTION(5, "SSPM_JTAG_TMS_VCORE"),
+		MTK_FUNCTION(6, "MCUPM_JTAG_TMS"),
+		MTK_FUNCTION(7, "CONN_BGF_MCU_TMS")
+	),
+
+	MTK_PIN(
+		169, "GPIO169",
+		MTK_EINT_FUNCTION(0, 169),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO169"),
+		MTK_FUNCTION(1, "MSDC1_CLK"),
+		MTK_FUNCTION(2, "CONN_WF_MCU_AICE_TCKC"),
+		MTK_FUNCTION(3, "URTS1"),
+		MTK_FUNCTION(4, "UDI_TCK"),
+		MTK_FUNCTION(5, "SSPM_JTAG_TCK_VCORE"),
+		MTK_FUNCTION(6, "MCUPM_JTAG_TCK"),
+		MTK_FUNCTION(7, "CONN_BGF_MCU_TCK")
+	),
+
+	MTK_PIN(
+		170, "GPIO170",
+		MTK_EINT_FUNCTION(0, 170),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO170"),
+		MTK_FUNCTION(1, "MSDC1_DAT0"),
+		MTK_FUNCTION(2, "SPIM5_B_CSB"),
+		MTK_FUNCTION(3, "UCTS2"),
+		MTK_FUNCTION(4, "UDI_TDI"),
+		MTK_FUNCTION(5, "SSPM_JTAG_TDI_VCORE"),
+		MTK_FUNCTION(6, "MCUPM_JTAG_TDI"),
+		MTK_FUNCTION(7, "CONN_BGF_MCU_TDI")
+	),
+
+	MTK_PIN(
+		171, "GPIO171",
+		MTK_EINT_FUNCTION(0, 171),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO171"),
+		MTK_FUNCTION(1, "MSDC1_DAT1"),
+		MTK_FUNCTION(2, "SPIM5_B_CLK"),
+		MTK_FUNCTION(3, "URTS2"),
+		MTK_FUNCTION(4, "UDI_TDO"),
+		MTK_FUNCTION(5, "SSPM_JTAG_TDO_VCORE"),
+		MTK_FUNCTION(6, "MCUPM_JTAG_TDO"),
+		MTK_FUNCTION(7, "CONN_BGF_MCU_TDO")
+	),
+
+	MTK_PIN(
+		172, "GPIO172",
+		MTK_EINT_FUNCTION(0, 172),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO172"),
+		MTK_FUNCTION(1, "MSDC1_DAT2"),
+		MTK_FUNCTION(2, "SPIM5_B_MO"),
+		MTK_FUNCTION(3, "UCTS3"),
+		MTK_FUNCTION(4, "UDI_NTRST"),
+		MTK_FUNCTION(5, "SSPM_JTAG_TRSTN_VCORE"),
+		MTK_FUNCTION(6, "MCUPM_JTAG_TRSTN"),
+		MTK_FUNCTION(7, "CONN_BGF_MCU_TRST_B")
+	),
+
+	MTK_PIN(
+		173, "GPIO173",
+		MTK_EINT_FUNCTION(0, 173),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO173"),
+		MTK_FUNCTION(1, "MSDC1_DAT3"),
+		MTK_FUNCTION(2, "SPIM5_B_MI"),
+		MTK_FUNCTION(3, "URTS3"),
+		MTK_FUNCTION(4, "CLKM0"),
+		MTK_FUNCTION(5, "PWM_2")
+	),
+
+	MTK_PIN(
+		174, "GPIO174",
+		MTK_EINT_FUNCTION(0, 174),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO174"),
+		MTK_FUNCTION(1, "MSDC2_CMD"),
+		MTK_FUNCTION(2, "CONN_BGF_MCU_AICE_TMSC"),
+		MTK_FUNCTION(3, "UTXD1"),
+		MTK_FUNCTION(4, "VADSP_JTAG0_TMS"),
+		MTK_FUNCTION(5, "SSPM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(6, "SPM_JTAG_TMS"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TMS_VLP")
+	),
+
+	MTK_PIN(
+		175, "GPIO175",
+		MTK_EINT_FUNCTION(0, 175),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO175"),
+		MTK_FUNCTION(1, "MSDC2_CLK"),
+		MTK_FUNCTION(2, "CONN_BGF_MCU_AICE_TCKC"),
+		MTK_FUNCTION(3, "URXD1"),
+		MTK_FUNCTION(4, "VADSP_JTAG0_TCK"),
+		MTK_FUNCTION(5, "SSPM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(6, "SPM_JTAG_TCK"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TCK_VLP")
+	),
+
+	MTK_PIN(
+		176, "GPIO176",
+		MTK_EINT_FUNCTION(0, 176),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO176"),
+		MTK_FUNCTION(1, "MSDC2_DAT0"),
+		MTK_FUNCTION(2, "SRCLKENAI0"),
+		MTK_FUNCTION(3, "UTXD2"),
+		MTK_FUNCTION(4, "VADSP_JTAG0_TDI"),
+		MTK_FUNCTION(5, "SSPM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(6, "SPM_JTAG_TDI"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TDI_VLP")
+	),
+
+	MTK_PIN(
+		177, "GPIO177",
+		MTK_EINT_FUNCTION(0, 177),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO177"),
+		MTK_FUNCTION(1, "MSDC2_DAT1"),
+		MTK_FUNCTION(2, "SRCLKENAI1"),
+		MTK_FUNCTION(3, "URXD2"),
+		MTK_FUNCTION(4, "VADSP_JTAG0_TDO"),
+		MTK_FUNCTION(5, "SSPM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(6, "SPM_JTAG_TDO"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TDO_VLP")
+	),
+
+	MTK_PIN(
+		178, "GPIO178",
+		MTK_EINT_FUNCTION(0, 178),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO178"),
+		MTK_FUNCTION(1, "MSDC2_DAT2"),
+		MTK_FUNCTION(3, "UTXD3"),
+		MTK_FUNCTION(4, "VADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(5, "SSPM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(6, "SPM_JTAG_TRSTN"),
+		MTK_FUNCTION(7, "SCP_JTAG0_TRSTN_VLP")
+	),
+
+	MTK_PIN(
+		179, "GPIO179",
+		MTK_EINT_FUNCTION(0, 179),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO179"),
+		MTK_FUNCTION(1, "MSDC2_DAT3"),
+		MTK_FUNCTION(3, "URXD3"),
+		MTK_FUNCTION(4, "CLKM1"),
+		MTK_FUNCTION(5, "PWM_vlp"),
+		MTK_FUNCTION(7, "TP_GPIO7_AO")
+	),
+
+	MTK_PIN(
+		180, "GPIO180",
+		MTK_EINT_FUNCTION(0, 180),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO180"),
+		MTK_FUNCTION(1, "SPMI_P_SCL")
+	),
+
+	MTK_PIN(
+		181, "GPIO181",
+		MTK_EINT_FUNCTION(0, 181),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO181"),
+		MTK_FUNCTION(1, "SPMI_P_SDA")
+	),
+
+	MTK_PIN(
+		182, "GPIO182",
+		MTK_EINT_FUNCTION(0, NO_EINT_SUPPORT),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "GPIO182"),
+		MTK_FUNCTION(1, "DDR_PAD_RRESETB")
+	),
+
+	MTK_PIN(
+		183, "GPIO183",
+		MTK_EINT_FUNCTION(0, 182),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		184, "GPIO184",
+		MTK_EINT_FUNCTION(0, 183),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		185, "GPIO185",
+		MTK_EINT_FUNCTION(0, 184),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		186, "GPIO186",
+		MTK_EINT_FUNCTION(0, 185),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		187, "GPIO187",
+		MTK_EINT_FUNCTION(0, 186),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		188, "GPIO188",
+		MTK_EINT_FUNCTION(0, 187),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		189, "GPIO189",
+		MTK_EINT_FUNCTION(0, 188),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		190, "GPIO190",
+		MTK_EINT_FUNCTION(0, 189),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		191, "GPIO191",
+		MTK_EINT_FUNCTION(0, 190),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		192, "GPIO192",
+		MTK_EINT_FUNCTION(0, 191),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		193, "GPIO193",
+		MTK_EINT_FUNCTION(0, 192),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		194, "GPIO194",
+		MTK_EINT_FUNCTION(0, 193),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		195, "GPIO195",
+		MTK_EINT_FUNCTION(0, 194),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		196, "GPIO196",
+		MTK_EINT_FUNCTION(0, 195),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		197, "GPIO197",
+		MTK_EINT_FUNCTION(0, 196),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		198, "GPIO198",
+		MTK_EINT_FUNCTION(0, 197),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		199, "GPIO199",
+		MTK_EINT_FUNCTION(0, 198),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		200, "GPIO200",
+		MTK_EINT_FUNCTION(0, 199),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		201, "GPIO201",
+		MTK_EINT_FUNCTION(0, 200),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		202, "GPIO202",
+		MTK_EINT_FUNCTION(0, 201),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		203, "GPIO203",
+		MTK_EINT_FUNCTION(0, 202),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		204, "GPIO204",
+		MTK_EINT_FUNCTION(0, 203),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		205, "GPIO205",
+		MTK_EINT_FUNCTION(0, 204),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		206, "GPIO206",
+		MTK_EINT_FUNCTION(0, 205),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		207, "GPIO207",
+		MTK_EINT_FUNCTION(0, 206),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		208, "GPIO208",
+		MTK_EINT_FUNCTION(0, 207),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		209, "GPIO209",
+		MTK_EINT_FUNCTION(0, 208),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+	MTK_PIN(
+		210, "GPIO210",
+		MTK_EINT_FUNCTION(0, 209),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+
+};
+
+static struct mtk_eint_pin eint_pins_mt8189[] = {
+	MTK_EINT_PIN(0, 0, 0, 1),
+	MTK_EINT_PIN(1, 0, 1, 1),
+	MTK_EINT_PIN(2, 0, 2, 1),
+	MTK_EINT_PIN(3, 0, 3, 1),
+	MTK_EINT_PIN(4, 0, 4, 1),
+	MTK_EINT_PIN(5, 0, 5, 1),
+	MTK_EINT_PIN(6, 0, 6, 1),
+	MTK_EINT_PIN(7, 0, 7, 1),
+	MTK_EINT_PIN(8, 0, 8, 1),
+	MTK_EINT_PIN(9, 0, 9, 1),
+	MTK_EINT_PIN(10, 0, 10, 1),
+	MTK_EINT_PIN(11, 0, 11, 1),
+	MTK_EINT_PIN(12, 1, 0, 1),
+	MTK_EINT_PIN(13, 1, 1, 1),
+	MTK_EINT_PIN(14, 1, 2, 1),
+	MTK_EINT_PIN(15, 1, 3, 1),
+	MTK_EINT_PIN(16, 1, 4, 1),
+	MTK_EINT_PIN(17, 1, 5, 1),
+	MTK_EINT_PIN(18, 0, 12, 1),
+	MTK_EINT_PIN(19, 0, 13, 1),
+	MTK_EINT_PIN(20, 0, 14, 1),
+	MTK_EINT_PIN(21, 0, 15, 1),
+	MTK_EINT_PIN(22, 0, 16, 1),
+	MTK_EINT_PIN(23, 0, 17, 1),
+	MTK_EINT_PIN(24, 0, 18, 1),
+	MTK_EINT_PIN(25, 2, 0, 1),
+	MTK_EINT_PIN(26, 2, 1, 1),
+	MTK_EINT_PIN(27, 1, 6, 1),
+	MTK_EINT_PIN(28, 1, 7, 1),
+	MTK_EINT_PIN(29, 2, 2, 1),
+	MTK_EINT_PIN(30, 1, 8, 1),
+	MTK_EINT_PIN(31, 1, 9, 1),
+	MTK_EINT_PIN(32, 1, 10, 1),
+	MTK_EINT_PIN(33, 1, 11, 1),
+	MTK_EINT_PIN(34, 1, 12, 1),
+	MTK_EINT_PIN(35, 1, 13, 1),
+	MTK_EINT_PIN(36, 1, 14, 1),
+	MTK_EINT_PIN(37, 1, 15, 1),
+	MTK_EINT_PIN(38, 1, 16, 1),
+	MTK_EINT_PIN(39, 1, 17, 1),
+	MTK_EINT_PIN(40, 1, 18, 1),
+	MTK_EINT_PIN(41, 1, 19, 1),
+	MTK_EINT_PIN(42, 1, 20, 1),
+	MTK_EINT_PIN(43, 1, 21, 1),
+	MTK_EINT_PIN(44, 0, 19, 1),
+	MTK_EINT_PIN(45, 0, 20, 1),
+	MTK_EINT_PIN(46, 0, 21, 1),
+	MTK_EINT_PIN(47, 0, 22, 1),
+	MTK_EINT_PIN(48, 2, 3, 1),
+	MTK_EINT_PIN(49, 2, 4, 1),
+	MTK_EINT_PIN(50, 2, 5, 1),
+	MTK_EINT_PIN(51, 0, 23, 1),
+	MTK_EINT_PIN(52, 0, 24, 1),
+	MTK_EINT_PIN(53, 0, 25, 1),
+	MTK_EINT_PIN(54, 0, 26, 1),
+	MTK_EINT_PIN(55, 2, 6, 1),
+	MTK_EINT_PIN(56, 2, 7, 1),
+	MTK_EINT_PIN(57, 1, 22, 1),
+	MTK_EINT_PIN(58, 1, 23, 1),
+	MTK_EINT_PIN(59, 1, 24, 1),
+	MTK_EINT_PIN(60, 1, 25, 1),
+	MTK_EINT_PIN(61, 1, 26, 1),
+	MTK_EINT_PIN(62, 1, 27, 1),
+	MTK_EINT_PIN(63, 1, 28, 1),
+	MTK_EINT_PIN(64, 1, 29, 1),
+	MTK_EINT_PIN(65, 0, 27, 1),
+	MTK_EINT_PIN(66, 0, 28, 1),
+	MTK_EINT_PIN(67, 0, 29, 1),
+	MTK_EINT_PIN(68, 0, 30, 1),
+	MTK_EINT_PIN(69, 1, 30, 1),
+	MTK_EINT_PIN(70, 1, 31, 1),
+	MTK_EINT_PIN(71, 1, 32, 1),
+	MTK_EINT_PIN(72, 1, 33, 1),
+	MTK_EINT_PIN(73, 1, 34, 1),
+	MTK_EINT_PIN(74, 1, 35, 1),
+	MTK_EINT_PIN(75, 1, 36, 1),
+	MTK_EINT_PIN(76, 1, 37, 1),
+	MTK_EINT_PIN(77, 0, 31, 1),
+	MTK_EINT_PIN(78, 0, 32, 1),
+	MTK_EINT_PIN(79, 0, 33, 1),
+	MTK_EINT_PIN(80, 0, 34, 1),
+	MTK_EINT_PIN(81, 1, 38, 1),
+	MTK_EINT_PIN(82, 1, 39, 1),
+	MTK_EINT_PIN(83, 1, 40, 1),
+	MTK_EINT_PIN(84, 0, 35, 1),
+	MTK_EINT_PIN(85, 0, 36, 1),
+	MTK_EINT_PIN(86, 0, 37, 1),
+	MTK_EINT_PIN(87, 0, 38, 1),
+	MTK_EINT_PIN(88, 2, 8, 1),
+	MTK_EINT_PIN(89, 2, 9, 1),
+	MTK_EINT_PIN(90, 2, 10, 1),
+	MTK_EINT_PIN(91, 2, 11, 1),
+	MTK_EINT_PIN(92, 2, 12, 1),
+	MTK_EINT_PIN(93, 2, 13, 1),
+	MTK_EINT_PIN(94, 2, 14, 1),
+	MTK_EINT_PIN(95, 2, 15, 1),
+	MTK_EINT_PIN(96, 2, 16, 1),
+	MTK_EINT_PIN(97, 2, 17, 1),
+	MTK_EINT_PIN(98, 2, 18, 1),
+	MTK_EINT_PIN(99, 2, 19, 1),
+	MTK_EINT_PIN(100, 2, 20, 1),
+	MTK_EINT_PIN(101, 2, 21, 1),
+	MTK_EINT_PIN(102, 2, 22, 1),
+	MTK_EINT_PIN(103, 0, 39, 1),
+	MTK_EINT_PIN(104, 0, 40, 1),
+	MTK_EINT_PIN(105, 0, 41, 1),
+	MTK_EINT_PIN(106, 0, 42, 1),
+	MTK_EINT_PIN(107, 0, 43, 1),
+	MTK_EINT_PIN(108, 0, 44, 1),
+	MTK_EINT_PIN(109, 0, 45, 1),
+	MTK_EINT_PIN(110, 0, 46, 1),
+	MTK_EINT_PIN(111, 0, 47, 1),
+	MTK_EINT_PIN(112, 0, 48, 0),
+	MTK_EINT_PIN(113, 0, 49, 1),
+	MTK_EINT_PIN(114, 0, 50, 0),
+	MTK_EINT_PIN(115, 1, 41, 1),
+	MTK_EINT_PIN(116, 1, 42, 1),
+	MTK_EINT_PIN(117, 1, 43, 1),
+	MTK_EINT_PIN(118, 1, 44, 1),
+	MTK_EINT_PIN(119, 1, 45, 1),
+	MTK_EINT_PIN(120, 1, 46, 1),
+	MTK_EINT_PIN(121, 1, 47, 1),
+	MTK_EINT_PIN(122, 1, 48, 1),
+	MTK_EINT_PIN(123, 1, 49, 1),
+	MTK_EINT_PIN(124, 1, 50, 1),
+	MTK_EINT_PIN(125, 1, 51, 1),
+	MTK_EINT_PIN(126, 1, 52, 1),
+	MTK_EINT_PIN(127, 1, 53, 1),
+	MTK_EINT_PIN(128, 1, 54, 1),
+	MTK_EINT_PIN(129, 1, 55, 1),
+	MTK_EINT_PIN(130, 1, 56, 1),
+	MTK_EINT_PIN(131, 1, 57, 1),
+	MTK_EINT_PIN(132, 1, 58, 1),
+	MTK_EINT_PIN(133, 1, 59, 1),
+	MTK_EINT_PIN(134, 1, 60, 1),
+	MTK_EINT_PIN(135, 1, 61, 1),
+	MTK_EINT_PIN(136, 1, 62, 1),
+	MTK_EINT_PIN(137, 1, 63, 1),
+	MTK_EINT_PIN(138, 1, 64, 1),
+	MTK_EINT_PIN(139, 1, 65, 1),
+	MTK_EINT_PIN(140, 1, 66, 1),
+	MTK_EINT_PIN(141, 1, 67, 1),
+	MTK_EINT_PIN(142, 1, 68, 1),
+	MTK_EINT_PIN(143, 1, 69, 1),
+	MTK_EINT_PIN(144, 1, 70, 1),
+	MTK_EINT_PIN(145, 1, 71, 1),
+	MTK_EINT_PIN(146, 1, 72, 1),
+	MTK_EINT_PIN(147, 1, 73, 1),
+	MTK_EINT_PIN(148, 1, 74, 1),
+	MTK_EINT_PIN(149, 1, 75, 1),
+	MTK_EINT_PIN(150, 1, 76, 1),
+	MTK_EINT_PIN(151, 1, 77, 1),
+	MTK_EINT_PIN(152, 1, 78, 1),
+	MTK_EINT_PIN(153, 1, 79, 1),
+	MTK_EINT_PIN(154, 1, 80, 1),
+	MTK_EINT_PIN(155, 1, 81, 1),
+	MTK_EINT_PIN(156, 2, 23, 1),
+	MTK_EINT_PIN(157, 2, 24, 1),
+	MTK_EINT_PIN(158, 2, 25, 1),
+	MTK_EINT_PIN(159, 4, 0, 1),
+	MTK_EINT_PIN(160, 2, 26, 1),
+	MTK_EINT_PIN(161, 2, 27, 1),
+	MTK_EINT_PIN(162, 2, 28, 1),
+	MTK_EINT_PIN(163, 4, 1, 1),
+	MTK_EINT_PIN(164, 2, 29, 1),
+	MTK_EINT_PIN(165, 2, 30, 1),
+	MTK_EINT_PIN(166, 4, 2, 1),
+	MTK_EINT_PIN(167, 2, 31, 0),
+	MTK_EINT_PIN(168, 1, 82, 1),
+	MTK_EINT_PIN(169, 1, 83, 1),
+	MTK_EINT_PIN(170, 1, 84, 1),
+	MTK_EINT_PIN(171, 1, 85, 0),
+	MTK_EINT_PIN(172, 1, 86, 1),
+	MTK_EINT_PIN(173, 1, 87, 0),
+	MTK_EINT_PIN(174, 4, 3, 1),
+	MTK_EINT_PIN(175, 4, 4, 1),
+	MTK_EINT_PIN(176, 4, 5, 1),
+	MTK_EINT_PIN(177, 4, 6, 1),
+	MTK_EINT_PIN(178, 4, 7, 1),
+	MTK_EINT_PIN(179, 4, 8, 1),
+	MTK_EINT_PIN(180, 2, 32, 1),
+	MTK_EINT_PIN(181, 2, 33, 0),
+	MTK_EINT_PIN(182, 3, 0, 1),
+	MTK_EINT_PIN(183, 3, 1, 1),
+	MTK_EINT_PIN(184, 3, 2, 1),
+	MTK_EINT_PIN(185, 3, 3, 1),
+	MTK_EINT_PIN(186, 3, 4, 1),
+	MTK_EINT_PIN(187, 3, 5, 1),
+	MTK_EINT_PIN(188, 3, 6, 1),
+	MTK_EINT_PIN(189, 3, 7, 1),
+	MTK_EINT_PIN(190, 3, 8, 1),
+	MTK_EINT_PIN(191, 3, 9, 1),
+	MTK_EINT_PIN(192, 3, 10, 1),
+	MTK_EINT_PIN(193, 3, 11, 1),
+	MTK_EINT_PIN(194, 3, 12, 1),
+	MTK_EINT_PIN(195, 3, 13, 1),
+	MTK_EINT_PIN(196, 3, 14, 1),
+	MTK_EINT_PIN(197, 3, 15, 1),
+	MTK_EINT_PIN(198, 3, 16, 1),
+	MTK_EINT_PIN(199, 3, 17, 1),
+	MTK_EINT_PIN(200, 3, 18, 1),
+	MTK_EINT_PIN(201, 3, 19, 1),
+	MTK_EINT_PIN(202, 3, 20, 1),
+	MTK_EINT_PIN(203, 3, 21, 1),
+	MTK_EINT_PIN(204, 3, 22, 1),
+	MTK_EINT_PIN(205, 3, 23, 1),
+	MTK_EINT_PIN(206, 3, 24, 1),
+	MTK_EINT_PIN(207, 3, 25, 1),
+	MTK_EINT_PIN(208, 3, 26, 1),
+	MTK_EINT_PIN(209, 3, 27, 1)
+};
+
+#endif /* __PINCTRL_MTK_MT8189_H */
-- 
2.45.2


