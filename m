Return-Path: <linux-gpio+bounces-13376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AD89DFC7A
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 09:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 747C9B22210
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 08:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A25A1FA16B;
	Mon,  2 Dec 2024 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Y0rArPNr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7921FA150;
	Mon,  2 Dec 2024 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733129681; cv=none; b=HaYOaHNgolIb6HUjsjy8TmQ+jDmaRZaBb+XuVMGZ6EQLz980apPsKWPh3+jaH90Nol8ujVnX5KDcepdBdplDFDgfwL8M0cNBMIsexV0yxN4DztjeFSqSLopTIp662zRXcdbegn7IDmcBUaKvg5BB/VkLOPUBuFUf1Q2YlED6lyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733129681; c=relaxed/simple;
	bh=6BQQ7owG0u6qaPICwo2hl6plP1+SVksV/aP1ovfnbzo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a2ogaR3QdmyGTTdQuzJLcJssSOUebB+z5n8ASnxSk5KWfyert7/JSSDc7qZqJntJcIHVdIQoCE0hQQ58mOdC2OiQ+JfoKxUXINqCVULN7Qy2HHP3k6lTkGpJOx6B1O1nCw6ZP/EV+ev9byJUbsda5xmHSz46mK+bi1BWNw5PqEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Y0rArPNr; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0c521d20b08b11efbd192953cf12861f-20241202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wP9W8YeCHzeUuLB6Za7z5S+FyNjlq87DmQjqUn50w34=;
	b=Y0rArPNrxglZHOJPv0YZvlk4rN1pLpZMmu3jsjt1XlaRQaFh8EAdFl1LiTUbXGuKCkkIcw9CzDxuoT3uuVlq5U9iIxzYYDI4mfAHaz8krqzlQdKYDr1f2rse6Ct21RGUWIChf8P10zR5fCCXBO09vNqnKvfld4+3C92JmOzkvNg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:422f8f23-bfc3-4b12-963d-0638a8ed13b4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:3a6599e0-1fe5-4c4a-bdf3-d07f9790da32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0c521d20b08b11efbd192953cf12861f-20241202
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 603333807; Mon, 02 Dec 2024 16:54:32 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 2 Dec 2024 16:54:31 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 2 Dec 2024 16:54:30 +0800
From: chang hao <ot_chhao.chang@mediatek.com>
To: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<sean.wang@kernel.org>, <linus.walleij@linaro.org>
CC: <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Chhao
 Chang <ot_chhao.chang@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: add eint new design for mt8196
Date: Mon, 2 Dec 2024 16:50:19 +0800
Message-ID: <20241202085024.25375-1-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Chhao Chang <ot_chhao.chang@mediatek.com>

Change 1: change EINT from 1 address to 5 addresses,
Eint number is stored on each base.
Change 2: Compatible with 1 address design

Signed-off-by: Chhao Chang <ot_chhao.chang@mediatek.com>
---
 drivers/pinctrl/mediatek/mtk-eint.c           | 976 ++++++++++++++----
 drivers/pinctrl/mediatek/mtk-eint.h           |  87 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  50 +-
 3 files changed, 877 insertions(+), 236 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 27f0a54e12bf..2d13e36017ae 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -1,21 +1,24 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2014-2018 MediaTek Inc.
-
+// Copyright (c) 2014-2024 MediaTek Inc.
 /*
  * Library for MediaTek External Interrupt Support
  *
  * Author: Maoguang Meng <maoguang.meng@mediatek.com>
- *	   Sean Wang <sean.wang@mediatek.com>
- *
+ * Sean Wang <sean.wang@mediatek.com>
+ * Chhao Chang <ot_chhao.chang@mediatek.com>
  */
 
+#include <linux/atomic.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 
@@ -23,10 +26,14 @@
 
 #define MTK_EINT_EDGE_SENSITIVE           0
 #define MTK_EINT_LEVEL_SENSITIVE          1
-#define MTK_EINT_DBNC_SET_DBNC_BITS	  4
-#define MTK_EINT_DBNC_MAX		  16
-#define MTK_EINT_DBNC_RST_BIT		  (0x1 << 1)
-#define MTK_EINT_DBNC_SET_EN		  (0x1 << 0)
+#define MTK_EINT_DBNC_SET_DBNC_BITS       4
+#define MTK_EINT_DBNC_MAX                 16
+#define MTK_EINT_DBNC_RST_BIT             (0x1 << 1)
+#define MTK_EINT_DBNC_SET_EN              (0x1 << 0)
+
+#define MTK_EINT_NO_OFFSET                0
+
+static struct mtk_eint *global_eintc;
 
 static const struct mtk_eint_regs mtk_generic_eint_regs = {
 	.stat      = 0x000,
@@ -47,6 +54,10 @@ static const struct mtk_eint_regs mtk_generic_eint_regs = {
 	.dbnc_ctrl = 0x500,
 	.dbnc_set  = 0x600,
 	.dbnc_clr  = 0x700,
+	.event     = 0x800,
+	.event_set = 0x840,
+	.event_clr = 0x880,
+	.raw_stat  = 0xa00,
 };
 
 const unsigned int debounce_time_mt2701[] = {
@@ -64,60 +75,122 @@ const unsigned int debounce_time_mt6795[] = {
 };
 EXPORT_SYMBOL_GPL(debounce_time_mt6795);
 
+/*
+ * Return the iomem of specific register offset and decode the coordinate
+ * (instance, index) from global eint number.
+ * If return NULL, then it must be either out-of-range or do-not-support.
+ */
 static void __iomem *mtk_eint_get_offset(struct mtk_eint *eint,
 					 unsigned int eint_num,
-					 unsigned int offset)
+					 unsigned int offset,
+					 unsigned int *instance,
+					 unsigned int *index)
 {
-	unsigned int eint_base = 0;
 	void __iomem *reg;
 
-	if (eint_num >= eint->hw->ap_num)
-		eint_base = eint->hw->ap_num;
+	if (eint_num >= eint->total_pin_number ||
+	    !eint->pins[eint_num].enabled) {
+		WARN_ON(1);
+		return NULL;
+	}
 
-	reg = eint->base + offset + ((eint_num - eint_base) / 32) * 4;
+	*instance = eint->pins[eint_num].instance;
+	*index = eint->pins[eint_num].index;
+	reg = eint->instances[*instance].base + offset + (*index / 32 * 4);
 
 	return reg;
 }
 
+/*
+ * Generate helper function to access property register of a dedicate pin.
+ */
+#define DEFINE_EINT_GET_FUNCTION(_NAME, _OFFSET) \
+static unsigned int mtk_eint_get_##_NAME(struct mtk_eint *eint, \
+				   unsigned int eint_num) \
+{ \
+	unsigned int instance, index; \
+	void __iomem *reg = mtk_eint_get_offset(eint, eint_num, \
+						_OFFSET, \
+						&instance, &index); \
+	unsigned int bit = BIT(index & 0x1f);\
+\
+	if (!reg) { \
+		dev_err(eint->dev, "%s invalid eint_num %d\n", \
+			__func__, eint_num); \
+		return 0;\
+	} \
+\
+	return !!(readl(reg) & bit); \
+}
+
+DEFINE_EINT_GET_FUNCTION(stat, eint->comp->regs->stat);
+DEFINE_EINT_GET_FUNCTION(mask, eint->comp->regs->mask);
+DEFINE_EINT_GET_FUNCTION(sens, eint->comp->regs->sens);
+DEFINE_EINT_GET_FUNCTION(pol, eint->comp->regs->pol);
+DEFINE_EINT_GET_FUNCTION(soft, eint->comp->regs->soft);
+DEFINE_EINT_GET_FUNCTION(raw_stat, eint->comp->regs->raw_stat);
+
 static unsigned int mtk_eint_can_en_debounce(struct mtk_eint *eint,
 					     unsigned int eint_num)
 {
 	unsigned int sens;
-	unsigned int bit = BIT(eint_num % 32);
+	unsigned int instance, index;
 	void __iomem *reg = mtk_eint_get_offset(eint, eint_num,
-						eint->regs->sens);
+						eint->comp->regs->sens,
+						&instance, &index);
+	unsigned int bit = BIT(index & 0x1f);
+
+	if (!reg) {
+		dev_err(eint->dev, "%s invalid eint_num %d\n",
+			__func__, eint_num);
+		return 0;
+	}
 
 	if (readl(reg) & bit)
 		sens = MTK_EINT_LEVEL_SENSITIVE;
 	else
 		sens = MTK_EINT_EDGE_SENSITIVE;
 
-	if (eint_num < eint->hw->db_cnt && sens != MTK_EINT_EDGE_SENSITIVE)
+	if (eint->pins[eint_num].debounce &&
+	    sens != MTK_EINT_EDGE_SENSITIVE)
 		return 1;
 	else
 		return 0;
 }
 
-static int mtk_eint_flip_edge(struct mtk_eint *eint, int hwirq)
+static int mtk_eint_flip_edge(struct mtk_eint *eint, int eint_num)
 {
 	int start_level, curr_level;
 	unsigned int reg_offset;
-	u32 mask = BIT(hwirq & 0x1f);
-	u32 port = (hwirq >> 5) & eint->hw->port_mask;
-	void __iomem *reg = eint->base + (port << 2);
+	unsigned int instance, index, mask, port;
+	void __iomem *reg;
 
-	curr_level = eint->gpio_xlate->get_gpio_state(eint->pctl, hwirq);
+	reg = mtk_eint_get_offset(eint, eint_num, MTK_EINT_NO_OFFSET,
+				  &instance, &index);
+
+	if (!reg) {
+		dev_err(eint->dev, "%s invalid eint_num %d\n",
+			__func__, eint_num);
+		return 0;
+	}
+
+	mask = BIT(index & 0x1f);
+	port = index >> 5;
+	reg = eint->instances[instance].base + port * 4;
+
+	curr_level = eint->gpio_xlate->get_gpio_state(eint->pctl, eint_num);
 
 	do {
 		start_level = curr_level;
 		if (start_level)
-			reg_offset = eint->regs->pol_clr;
+			reg_offset = eint->comp->regs->pol_clr;
 		else
-			reg_offset = eint->regs->pol_set;
+			reg_offset = eint->comp->regs->pol_set;
+
 		writel(mask, reg + reg_offset);
 
 		curr_level = eint->gpio_xlate->get_gpio_state(eint->pctl,
-							      hwirq);
+							      eint_num);
 	} while (start_level != curr_level);
 
 	return start_level;
@@ -126,11 +199,19 @@ static int mtk_eint_flip_edge(struct mtk_eint *eint, int hwirq)
 static void mtk_eint_mask(struct irq_data *d)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
-	u32 mask = BIT(d->hwirq & 0x1f);
+	unsigned int instance, index;
 	void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
-						eint->regs->mask_set);
+						eint->comp->regs->mask_set,
+						&instance, &index);
+	u32 mask = BIT(index & 0x1f);
+
+	if (!reg) {
+		dev_err(eint->dev, "%s invalid eint_num %lu\n",
+			__func__, d->hwirq);
+		return;
+	}
 
-	eint->cur_mask[d->hwirq >> 5] &= ~mask;
+	eint->instances[instance].cur_mask[index >> 5] &= ~mask;
 
 	writel(mask, reg);
 }
@@ -138,43 +219,123 @@ static void mtk_eint_mask(struct irq_data *d)
 static void mtk_eint_unmask(struct irq_data *d)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
-	u32 mask = BIT(d->hwirq & 0x1f);
+	unsigned int instance, index;
 	void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
-						eint->regs->mask_clr);
+						eint->comp->regs->mask_clr,
+						&instance, &index);
+	u32 mask = BIT(index & 0x1f);
+
+	if (!reg) {
+		dev_err(eint->dev, "%s invalid eint_num %lu\n",
+			__func__, d->hwirq);
+		return;
+	}
 
-	eint->cur_mask[d->hwirq >> 5] |= mask;
+	eint->instances[instance].cur_mask[index >> 5] |= mask;
 
 	writel(mask, reg);
 
-	if (eint->dual_edge[d->hwirq])
+	if (eint->pins[d->hwirq].dual_edge)
 		mtk_eint_flip_edge(eint, d->hwirq);
 }
 
-static unsigned int mtk_eint_get_mask(struct mtk_eint *eint,
-				      unsigned int eint_num)
+/*
+ * We need to do extra effort to clear edge-triggered EINT
+ * which located in eint_c due to hw design limitation.
+ */
+void mt6983_eint_ack(struct irq_data *d)
 {
-	unsigned int bit = BIT(eint_num % 32);
-	void __iomem *reg = mtk_eint_get_offset(eint, eint_num,
-						eint->regs->mask);
+	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
+	unsigned int instance, index;
+	void __iomem *sens_reg;
+	void __iomem *ack_reg = mtk_eint_get_offset(eint, d->hwirq,
+						eint->comp->regs->sens,
+						&instance, &index);
+	unsigned int bit = BIT(index & 0x1f);
+
+	if (!ack_reg) {
+		dev_err(eint->dev, "%s invalid eint_num %lu\n",
+			__func__, d->hwirq);
+		return;
+	}
 
-	return !!(readl(reg) & bit);
+	if (instance == 4) {
+		sens_reg = mtk_eint_get_offset(eint, d->hwirq,
+					       eint->comp->regs->sens_clr,
+					       &instance, &index);
+		writel(bit, sens_reg);
+		sens_reg = mtk_eint_get_offset(eint, d->hwirq,
+					       eint->comp->regs->sens_set,
+					       &instance, &index);
+		writel(bit, sens_reg);
+	} else {
+		writel(bit, ack_reg);
+	}
 }
 
 static void mtk_eint_ack(struct irq_data *d)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
-	u32 mask = BIT(d->hwirq & 0x1f);
-	void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
-						eint->regs->ack);
+	unsigned int instance, index;
+	void __iomem *reg;
+	unsigned int bit;
 
-	writel(mask, reg);
+	if (eint->comp->ops.ack) {
+		eint->comp->ops.ack(d);
+	} else {
+		reg = mtk_eint_get_offset(eint, d->hwirq,
+					  eint->comp->regs->ack,
+					  &instance, &index);
+		bit = BIT(index & 0x1f);
+		if (!reg) {
+			dev_err(eint->dev, "%s invalid eint_num %lu\n",
+				__func__, d->hwirq);
+			return;
+		}
+
+		writel(bit, reg);
+	}
+}
+
+static void mtk_eint_soft_set(struct mtk_eint *eint, unsigned int eint_num)
+{
+	unsigned int instance, index;
+	void __iomem *reg = mtk_eint_get_offset(eint, eint_num,
+						eint->comp->regs->soft_set,
+						&instance, &index);
+	unsigned int bit = BIT(index & 0x1f);
+
+	if (!reg) {
+		dev_err(eint->dev, "%s invalid eint_num %d\n",
+			__func__, eint_num);
+		return;
+	}
+
+	writel(bit, reg);
+}
+
+static void mtk_eint_soft_clr(struct mtk_eint *eint, unsigned int eint_num)
+{
+	unsigned int instance, index;
+	void __iomem *reg = mtk_eint_get_offset(eint, eint_num,
+						eint->comp->regs->soft_clr,
+						&instance, &index);
+	unsigned int bit = BIT(index & 0x1f);
+
+	if (!reg) {
+		dev_err(eint->dev, "%s invalid eint_num %d\n",
+			__func__, eint_num);
+		return;
+	}
+
+	writel(bit, reg);
 }
 
 static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
-	bool masked;
-	u32 mask = BIT(d->hwirq & 0x1f);
+	u32 mask;
+	unsigned int instance, index;
 	void __iomem *reg;
 
 	if (((type & IRQ_TYPE_EDGE_BOTH) && (type & IRQ_TYPE_LEVEL_MASK)) ||
@@ -186,36 +347,42 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
 	}
 
 	if ((type & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH)
-		eint->dual_edge[d->hwirq] = 1;
+		eint->pins[d->hwirq].dual_edge = 1;
 	else
-		eint->dual_edge[d->hwirq] = 0;
+		eint->pins[d->hwirq].dual_edge = 0;
 
-	if (!mtk_eint_get_mask(eint, d->hwirq)) {
-		mtk_eint_mask(d);
-		masked = false;
-	} else {
-		masked = true;
-	}
+	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
+		reg = mtk_eint_get_offset(eint, d->hwirq,
+					  eint->comp->regs->pol_clr,
+					  &instance, &index);
+	else
+		reg = mtk_eint_get_offset(eint, d->hwirq,
+					  eint->comp->regs->pol_set,
+					  &instance, &index);
 
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING)) {
-		reg = mtk_eint_get_offset(eint, d->hwirq, eint->regs->pol_clr);
-		writel(mask, reg);
-	} else {
-		reg = mtk_eint_get_offset(eint, d->hwirq, eint->regs->pol_set);
-		writel(mask, reg);
-	}
+	mask = BIT(index & 0x1f);
+	writel(mask, reg);
 
-	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)) {
-		reg = mtk_eint_get_offset(eint, d->hwirq, eint->regs->sens_clr);
-		writel(mask, reg);
-	} else {
-		reg = mtk_eint_get_offset(eint, d->hwirq, eint->regs->sens_set);
-		writel(mask, reg);
+	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
+		reg = mtk_eint_get_offset(eint, d->hwirq,
+					  eint->comp->regs->sens_clr,
+					  &instance, &index);
+	else
+		reg = mtk_eint_get_offset(eint, d->hwirq,
+					  eint->comp->regs->sens_set,
+					  &instance, &index);
+
+	if (!reg) {
+		dev_err(eint->dev, "%s invalid eint_num %lu\n",
+			__func__, d->hwirq);
+		return 0;
 	}
 
-	mtk_eint_ack(d);
-	if (!masked)
-		mtk_eint_unmask(d);
+	mask = BIT(index & 0x1f);
+	writel(mask, reg);
+
+	if (eint->pins[d->hwirq].dual_edge)
+		mtk_eint_flip_edge(eint, d->hwirq);
 
 	return 0;
 }
@@ -223,30 +390,28 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
 static int mtk_eint_irq_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
-	int shift = d->hwirq & 0x1f;
-	int reg = d->hwirq >> 5;
+	unsigned int instance, index, shift, port;
+	void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
+						MTK_EINT_NO_OFFSET,
+						&instance, &index);
+
+	if (!reg) {
+		dev_err(eint->dev, "%s invalid eint_num %lu\n",
+			__func__, d->hwirq);
+		return 0;
+	}
+
+	shift = index & 0x1f;
+	port = index >> 5;
 
 	if (on)
-		eint->wake_mask[reg] |= BIT(shift);
+		eint->instances[instance].wake_mask[port] |= BIT(shift);
 	else
-		eint->wake_mask[reg] &= ~BIT(shift);
+		eint->instances[instance].wake_mask[port] &= ~BIT(shift);
 
 	return 0;
 }
 
-static void mtk_eint_chip_write_mask(const struct mtk_eint *eint,
-				     void __iomem *base, u32 *buf)
-{
-	int port;
-	void __iomem *reg;
-
-	for (port = 0; port < eint->hw->ports; port++) {
-		reg = base + (port << 2);
-		writel_relaxed(~buf[port], reg + eint->regs->mask_set);
-		writel_relaxed(buf[port], reg + eint->regs->mask_clr);
-	}
-}
-
 static int mtk_eint_irq_request_resources(struct irq_data *d)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
@@ -258,23 +423,25 @@ static int mtk_eint_irq_request_resources(struct irq_data *d)
 					   &gpio_n, &gpio_c);
 	if (err < 0) {
 		dev_err(eint->dev, "Can not find pin\n");
-		return err;
+		goto err_out;
 	}
 
 	err = gpiochip_lock_as_irq(gpio_c, gpio_n);
 	if (err < 0) {
 		dev_err(eint->dev, "unable to lock HW IRQ %lu for IRQ\n",
 			irqd_to_hwirq(d));
-		return err;
+		goto err_out;
 	}
 
 	err = eint->gpio_xlate->set_gpio_as_eint(eint->pctl, d->hwirq);
 	if (err < 0) {
 		dev_err(eint->dev, "Can not eint mode\n");
-		return err;
+		goto err_out;
 	}
 
 	return 0;
+err_out:
+	return err;
 }
 
 static void mtk_eint_irq_release_resources(struct irq_data *d)
@@ -290,7 +457,7 @@ static void mtk_eint_irq_release_resources(struct irq_data *d)
 }
 
 static struct irq_chip mtk_eint_irq_chip = {
-	.name = "mt-eint",
+	.name = "mtk-eint",
 	.irq_disable = mtk_eint_mask,
 	.irq_mask = mtk_eint_mask,
 	.irq_unmask = mtk_eint_unmask,
@@ -301,35 +468,53 @@ static struct irq_chip mtk_eint_irq_chip = {
 	.irq_release_resources = mtk_eint_irq_release_resources,
 };
 
+/*
+ * Configure all EINT pins as domain 0, which only belongs to AP.
+ */
 static unsigned int mtk_eint_hw_init(struct mtk_eint *eint)
 {
-	void __iomem *dom_en = eint->base + eint->regs->dom_en;
-	void __iomem *mask_set = eint->base + eint->regs->mask_set;
-	unsigned int i;
-
-	for (i = 0; i < eint->hw->ap_num; i += 32) {
-		writel(0xffffffff, dom_en);
-		writel(0xffffffff, mask_set);
-		dom_en += 4;
-		mask_set += 4;
+	void __iomem *dom, *eevt;
+	unsigned int i, j;
+
+	for (i = 0; i < eint->instance_number; i++) {
+		dom = eint->instances[i].base + eint->comp->regs->dom_en;
+		eevt = eint->instances[i].base + eint->comp->regs->event_clr;
+		for (j = 0; j < eint->instances[i].number; j += 32) {
+			writel(0xffffffff, dom);
+			writel(0xffffffff, eevt);
+			dom += 4;
+			eevt += 4;
+		}
 	}
 
 	return 0;
 }
 
 static inline void
-mtk_eint_debounce_process(struct mtk_eint *eint, int index)
+mtk_eint_debounce_process(struct mtk_eint *eint, int eint_num)
 {
 	unsigned int rst, ctrl_offset;
 	unsigned int bit, dbnc;
+	unsigned int instance, index;
+	void __iomem *reg;
 
-	ctrl_offset = (index / 4) * 4 + eint->regs->dbnc_ctrl;
-	dbnc = readl(eint->base + ctrl_offset);
+	reg = mtk_eint_get_offset(eint, eint_num, MTK_EINT_NO_OFFSET,
+				  &instance, &index);
+
+	if (!reg) {
+		dev_err(eint->dev, "%s invalid eint_num %d\n",
+			__func__, eint_num);
+		return;
+	}
+
+	ctrl_offset = (index / 4) * 4 + eint->comp->regs->dbnc_ctrl;
+	dbnc = readl(eint->instances[instance].base + ctrl_offset);
 	bit = MTK_EINT_DBNC_SET_EN << ((index % 4) * 8);
+
 	if ((bit & dbnc) > 0) {
-		ctrl_offset = (index / 4) * 4 + eint->regs->dbnc_set;
+		ctrl_offset = (index / 4) * 4 + eint->comp->regs->dbnc_set;
 		rst = MTK_EINT_DBNC_RST_BIT << ((index % 4) * 8);
-		writel(rst, eint->base + ctrl_offset);
+		writel(rst, eint->instances[instance].base + ctrl_offset);
 	}
 }
 
@@ -337,65 +522,66 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct mtk_eint *eint = irq_desc_get_handler_data(desc);
-	unsigned int status, eint_num;
-	int offset, mask_offset, index;
-	void __iomem *reg =  mtk_eint_get_offset(eint, 0, eint->regs->stat);
-	int dual_edge, start_level, curr_level;
+	unsigned int status, i, j;
+	int shift, port, eint_num, virq;
+	unsigned int dual_edge, start_level, curr_level;
+	struct mtk_eint_instance eint_instance;
+	void __iomem *addr;
 
 	chained_irq_enter(chip, desc);
-	for (eint_num = 0; eint_num < eint->hw->ap_num; eint_num += 32,
-	     reg += 4) {
-		status = readl(reg);
-		while (status) {
-			offset = __ffs(status);
-			mask_offset = eint_num >> 5;
-			index = eint_num + offset;
-			status &= ~BIT(offset);
-
-			/*
-			 * If we get an interrupt on pin that was only required
-			 * for wake (but no real interrupt requested), mask the
-			 * interrupt (as would mtk_eint_resume do anyway later
-			 * in the resume sequence).
-			 */
-			if (eint->wake_mask[mask_offset] & BIT(offset) &&
-			    !(eint->cur_mask[mask_offset] & BIT(offset))) {
-				writel_relaxed(BIT(offset), reg -
-					eint->regs->stat +
-					eint->regs->mask_set);
-			}
 
-			dual_edge = eint->dual_edge[index];
-			if (dual_edge) {
-				/*
-				 * Clear soft-irq in case we raised it last
-				 * time.
-				 */
-				writel(BIT(offset), reg - eint->regs->stat +
-				       eint->regs->soft_clr);
+	for (i = 0; i < eint->instance_number; i++) {
+		eint_instance = eint->instances[i];
 
-				start_level =
-				eint->gpio_xlate->get_gpio_state(eint->pctl,
-								 index);
-			}
+		/* Iterate all pins by port */
+		for (j = 0; j < eint_instance.number; j += 32) {
+			port = j >> 5;
+			status = readl(eint_instance.base + port * 4 +
+				       eint->comp->regs->stat);
+			while (status) {
+				shift = __ffs(status);
+				status &= ~BIT(shift);
 
-			generic_handle_domain_irq(eint->domain, index);
-
-			if (dual_edge) {
-				curr_level = mtk_eint_flip_edge(eint, index);
+				eint_num = eint->instances[i].pin_list[shift + j];
+				virq = irq_find_mapping(eint->domain, eint_num);
 
 				/*
-				 * If level changed, we might lost one edge
-				 * interrupt, raised it through soft-irq.
+				 * If we get an interrupt on pin that was only required
+				 * for wake (but no real interrupt requested), mask the
+				 * interrupt (as would mtk_eint_resume do anyway later
+				 * in the resume sequence).
 				 */
-				if (start_level != curr_level)
-					writel(BIT(offset), reg -
-					       eint->regs->stat +
-					       eint->regs->soft_set);
+				if (eint->instances[i].wake_mask[port] & BIT(shift) &&
+				    !(eint->instances[i].cur_mask[port] & BIT(shift))) {
+					addr = eint_instance.base + port * 4 +
+						eint->comp->regs->mask_set;
+					writel_relaxed(BIT(shift), addr);
+				}
+
+				dual_edge = eint->pins[eint_num].dual_edge;
+				if (dual_edge)
+					start_level =
+					eint->gpio_xlate->get_gpio_state(eint->pctl,
+									 eint_num);
+
+				generic_handle_irq(virq);
+
+				if (dual_edge) {
+					curr_level = mtk_eint_flip_edge(eint, eint_num);
+
+					/*
+					 * If level changed, we might lost one edge
+					 * interrupt, raised it through soft-irq.
+					 */
+					if (start_level != curr_level)
+						mtk_eint_soft_set(eint, eint_num);
+
+					mtk_eint_soft_clr(eint, eint_num);
+				}
+
+				if (eint->pins[eint_num].debounce)
+					mtk_eint_debounce_process(eint, eint_num);
 			}
-
-			if (index < eint->hw->db_cnt)
-				mtk_eint_debounce_process(eint, index);
 		}
 	}
 	chained_irq_exit(chip, desc);
@@ -403,7 +589,20 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 
 int mtk_eint_do_suspend(struct mtk_eint *eint)
 {
-	mtk_eint_chip_write_mask(eint, eint->base, eint->wake_mask);
+	unsigned int i, j, port;
+
+	for (i = 0; i < eint->instance_number; i++) {
+		struct mtk_eint_instance inst = eint->instances[i];
+
+		for (j = 0; j < inst.number; j += 32) {
+			port = j >> 5;
+			writel_relaxed(~inst.wake_mask[port],
+				       inst.base + port * 4 + eint->comp->regs->mask_set);
+			writel_relaxed(inst.wake_mask[port],
+				       inst.base + port * 4 + eint->comp->regs->mask_clr);
+		}
+	}
+	dsb(sy);
 
 	return 0;
 }
@@ -411,7 +610,20 @@ EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
 
 int mtk_eint_do_resume(struct mtk_eint *eint)
 {
-	mtk_eint_chip_write_mask(eint, eint->base, eint->cur_mask);
+	unsigned int i, j, port;
+
+	for (i = 0; i < eint->instance_number; i++) {
+		struct mtk_eint_instance inst = eint->instances[i];
+
+		for (j = 0; j < inst.number; j += 32) {
+			port = j >> 5;
+			writel_relaxed(~inst.cur_mask[port],
+				       inst.base + port * 4 + eint->comp->regs->mask_set);
+			writel_relaxed(inst.cur_mask[port],
+				       inst.base + port * 4 + eint->comp->regs->mask_clr);
+		}
+	}
+	dsb(sy);
 
 	return 0;
 }
@@ -423,24 +635,42 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
 	int virq, eint_offset;
 	unsigned int set_offset, bit, clr_bit, clr_offset, rst, i, unmask,
 		     dbnc;
+	static const unsigned int debounce_time[] = { 156, 313, 625, 1250,
+		20000, 40000, 80000, 160000, 320000, 640000 };
 	struct irq_data *d;
+	unsigned int instance, index;
+	void __iomem *reg;
 
-	if (!eint->hw->db_time)
-		return -EOPNOTSUPP;
+	/*
+	 * Due to different number of bit field, we only decode
+	 * the coordinate here, instead of get the VA.
+	 */
+	reg = mtk_eint_get_offset(eint, eint_num, MTK_EINT_NO_OFFSET,
+				  &instance, &index);
+
+	if (!reg) {
+		dev_err(eint->dev, "%s invalid eint_num %lu\n",
+			__func__, eint_num);
+		return 0;
+	}
 
 	virq = irq_find_mapping(eint->domain, eint_num);
-	eint_offset = (eint_num % 4) * 8;
+	eint_offset = (index % 4) * 8;
 	d = irq_get_irq_data(virq);
 
-	set_offset = (eint_num / 4) * 4 + eint->regs->dbnc_set;
-	clr_offset = (eint_num / 4) * 4 + eint->regs->dbnc_clr;
+	reg = eint->instances[instance].base;
+	set_offset = (index / 4) * 4 + eint->comp->regs->dbnc_set;
+	clr_offset = (index / 4) * 4 + eint->comp->regs->dbnc_clr;
 
 	if (!mtk_eint_can_en_debounce(eint, eint_num))
 		return -EINVAL;
 
-	dbnc = eint->num_db_time;
-	for (i = 0; i < eint->num_db_time; i++) {
-		if (debounce <= eint->hw->db_time[i]) {
+	/*
+	 * Check eint number to avoid access out-of-range
+	 */
+	dbnc = ARRAY_SIZE(debounce_time) - 1;
+	for (i = 0; i < ARRAY_SIZE(debounce_time); i++) {
+		if (debounce <= debounce_time[i]) {
 			dbnc = i;
 			break;
 		}
@@ -454,18 +684,16 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
 	}
 
 	clr_bit = 0xff << eint_offset;
-	writel(clr_bit, eint->base + clr_offset);
+	writel(clr_bit, reg + clr_offset);
 
-	bit = ((dbnc << MTK_EINT_DBNC_SET_DBNC_BITS) | MTK_EINT_DBNC_SET_EN) <<
-		eint_offset;
+	bit = ((dbnc << MTK_EINT_DBNC_SET_DBNC_BITS)
+		| MTK_EINT_DBNC_SET_EN) << eint_offset;
 	rst = MTK_EINT_DBNC_RST_BIT << eint_offset;
-	writel(rst | bit, eint->base + set_offset);
+	writel(rst | bit, reg + set_offset);
+
+	/* Delay should be (8T @ 32k) from dbc rst to work correctly. */
+	udelay(250);
 
-	/*
-	 * Delay a while (more than 2T) to wait for hw debounce counter reset
-	 * work correctly.
-	 */
-	udelay(1);
 	if (unmask == 1)
 		mtk_eint_unmask(d);
 
@@ -473,6 +701,53 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
 }
 EXPORT_SYMBOL_GPL(mtk_eint_set_debounce);
 
+unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
+				      unsigned int eint_num)
+{
+	unsigned int instance, index, bit;
+	void __iomem *reg;
+
+	reg = mtk_eint_get_offset(eint, eint_num, MTK_EINT_NO_OFFSET,
+				  &instance, &index);
+
+	if (!reg) {
+		dev_err(eint->dev, "%s invalid eint_num %d\n",
+			__func__, eint_num);
+		return 0;
+	}
+
+	reg = eint->instances[instance].base +
+		(index / 4) * 4 + eint->comp->regs->dbnc_ctrl;
+
+	bit = MTK_EINT_DBNC_SET_EN << ((index % 4) * 8);
+
+	return (readl(reg) & bit) ? 1 : 0;
+}
+
+unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
+					 unsigned int eint_num)
+{
+	unsigned int instance, index, mask, offset;
+	void __iomem *reg;
+
+	reg = mtk_eint_get_offset(eint, eint_num, MTK_EINT_NO_OFFSET,
+				  &instance, &index);
+
+	if (!reg) {
+		dev_err(eint->dev, "%s invalid eint_num %d\n",
+			__func__, eint_num);
+		return 0;
+	}
+
+	reg = eint->instances[instance].base +
+		(index / 4) * 4 + eint->comp->regs->dbnc_ctrl;
+
+	offset = MTK_EINT_DBNC_SET_DBNC_BITS + ((index % 4) * 8);
+	mask = 0xf << offset;
+
+	return ((readl(reg) & mask) >> offset);
+}
+
 int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
 {
 	int irq;
@@ -485,44 +760,348 @@ int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
 }
 EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
 
+/*
+ * Dump the properties/states of the specific EINT pin.
+ * @eint_num: the global EINT number.
+ * @buf: the pointer of a string buffer.
+ * @buf_size: the size of the buffer.
+ *
+ * If the return value < 0, it means that the @eint_num is invalid;
+ * Otherwise, return 0;
+ */
+int dump_eint_pin_status(unsigned int eint_num, char *buf, unsigned int buf_size)
+{
+	unsigned int len = 0, enabled, stat, raw_stat, soft, mask, sens, pol,
+		     deb_en, deb_val;
+
+	if (eint_num < 0 || eint_num >= global_eintc->total_pin_number)
+		return -ENODEV;
+
+	enabled = global_eintc->pins[eint_num].enabled;
+	stat = mtk_eint_get_stat(global_eintc, eint_num);
+	raw_stat = mtk_eint_get_raw_stat(global_eintc, eint_num);
+	soft = mtk_eint_get_soft(global_eintc, eint_num);
+	mask = mtk_eint_get_mask(global_eintc, eint_num);
+	sens = mtk_eint_get_sens(global_eintc, eint_num);
+	pol = mtk_eint_get_pol(global_eintc, eint_num);
+
+	len += snprintf(buf + len, buf_size - len,
+			"%s=%u(%s)\n%s=%s_%s\n%s=%u\n%s=%u\n%s=%u\n%s=%u\n",
+			"Pin", eint_num, enabled ? "enabled" : "disabled",
+			"Type", (sens == 1) ? "level" : "edge",
+			(pol == 1) ? "high" : "low",
+			"Pending", stat,
+			"Raw", raw_stat,
+			"Soft", soft,
+			"Mask", mask);
+
+	if (mtk_eint_can_en_debounce(global_eintc, eint_num)) {
+		deb_en	= mtk_eint_get_debounce_en(global_eintc, eint_num);
+		deb_val = mtk_eint_get_debounce_value(global_eintc, eint_num);
+
+		len += snprintf(buf + len, buf_size - len,
+				"Support debounce, %s=%u, %s=%u\n",
+				"enable", deb_en,
+				"setting", deb_val);
+	} else {
+		len += snprintf(buf + len, buf_size - len,
+				"Not support debounce\n");
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dump_eint_pin_status);
+
+static ssize_t eintc_status_show(struct device_driver *driver, char *buf)
+{
+	struct mtk_eint *eint = global_eintc;
+	unsigned int i, j, len = 0,
+		     instance_num = eint->instance_number;
+
+	len += snprintf(buf + len, PAGE_SIZE - len, "=====EINTC Dump=====\n");
+
+	for (i = 0; i < instance_num; i++) {
+		struct mtk_eint_instance inst = eint->instances[i];
+
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"Instance %d name=%s with %u pins\n",
+				i, inst.name, inst.number);
+
+		for (j = 0; j < inst.number; j++)
+			len += snprintf(buf + len, PAGE_SIZE - len,
+					"%d ", inst.pin_list[j]);
+
+		len += snprintf(buf + len, PAGE_SIZE - len, "\n");
+	}
+
+	return strlen(buf);
+}
+
+static DRIVER_ATTR_RO(eintc_status);
+
+static ssize_t eint_pin_status_show(struct device_driver *driver, char *buf)
+{
+	struct mtk_eint *eint = global_eintc;
+	unsigned int len = 0;
+
+	len += snprintf(buf + len, PAGE_SIZE - len,
+			"=====EINT Pin Dump=====\n");
+
+	dump_eint_pin_status(eint->dump_target_eint,
+			     buf + len, PAGE_SIZE - len);
+
+	return strlen(buf);
+}
+
+static ssize_t eint_pin_status_store(struct device_driver *driver,
+				     const char *buf, size_t count)
+{
+	int eint_num, ret;
+
+	ret = kstrtouint(buf, 10, &eint_num);
+
+	if (ret || eint_num >= global_eintc->total_pin_number) {
+		dev_err(global_eintc->dev,
+			"%s invalid input: %s.\n", __func__, buf);
+		goto err_out;
+	}
+
+	global_eintc->dump_target_eint = (unsigned int)eint_num;
+
+err_out:
+	return count;
+}
+
+static DRIVER_ATTR_RW(eint_pin_status);
+
+static const struct mtk_eint_compatible default_compat = {
+	.regs = &mtk_generic_eint_regs,
+};
+
 int mtk_eint_do_init(struct mtk_eint *eint)
 {
-	int i;
+	int i, virq;
+	unsigned int ret, size, inst = 0;
 
-	/* If clients don't assign a specific regs, let's use generic one */
-	if (!eint->regs)
-		eint->regs = &mtk_generic_eint_regs;
+	eint->instance_number = 1;
+	eint->total_pin_number = eint->hw->ap_num;
 
-	eint->wake_mask = devm_kcalloc(eint->dev, eint->hw->ports,
-				       sizeof(*eint->wake_mask), GFP_KERNEL);
-	if (!eint->wake_mask)
-		return -ENOMEM;
+	dev_info(eint->dev, "%s read ap_num: %u\n", __func__, eint->hw->ap_num);
 
-	eint->cur_mask = devm_kcalloc(eint->dev, eint->hw->ports,
-				      sizeof(*eint->cur_mask), GFP_KERNEL);
-	if (!eint->cur_mask)
+	size = eint->instance_number * sizeof(struct mtk_eint_instance);
+	eint->instances = devm_kzalloc(eint->dev, size, GFP_KERNEL);
+	if (!eint->instances)
 		return -ENOMEM;
 
-	eint->dual_edge = devm_kcalloc(eint->dev, eint->hw->ap_num,
-				       sizeof(int), GFP_KERNEL);
-	if (!eint->dual_edge)
+	size = eint->total_pin_number * sizeof(struct mtk_eint_pin);
+	eint->pins = devm_kzalloc(eint->dev, size, GFP_KERNEL);
+	if (!eint->pins)
 		return -ENOMEM;
 
+	for (i = 0; i < eint->total_pin_number; i++) {
+		eint->pins[i].enabled = true;
+		eint->pins[i].instance = inst;
+		eint->pins[i].index = i;
+		eint->pins[i].debounce =  (i < eint->hw->db_cnt) ? 1 : 0;
+
+		eint->instances[inst].pin_list[i] = i;
+		eint->instances[inst].number++;
+	}
+
+	for (i = 0; i < eint->instance_number; i++) {
+		size = (eint->instances[i].number / 32 + 1) * sizeof(unsigned int);
+		eint->instances[i].wake_mask =
+			devm_kzalloc(eint->dev, size, GFP_KERNEL);
+		eint->instances[i].cur_mask =
+			devm_kzalloc(eint->dev, size, GFP_KERNEL);
+
+		if (!eint->instances[i].wake_mask ||
+		    !eint->instances[i].cur_mask)
+			return -ENOMEM;
+	}
+
+	eint->comp = &default_compat;
+
 	eint->domain = irq_domain_add_linear(eint->dev->of_node,
-					     eint->hw->ap_num,
+					     eint->total_pin_number,
 					     &irq_domain_simple_ops, NULL);
 	if (!eint->domain)
 		return -ENOMEM;
 
-	if (eint->hw->db_time) {
-		for (i = 0; i < MTK_EINT_DBNC_MAX; i++)
-			if (eint->hw->db_time[i] == 0)
-				break;
-		eint->num_db_time = i;
+	eint->instances[inst].base = eint->base;
+
+	mtk_eint_hw_init(eint);
+
+	for (i = 0; i < eint->total_pin_number; i++) {
+		virq = irq_create_mapping(eint->domain, i);
+
+		irq_set_chip_and_handler(virq, &mtk_eint_irq_chip,
+					 handle_level_irq);
+		irq_set_chip_data(virq, eint);
+	}
+
+	irq_set_chained_handler_and_data(eint->irq, mtk_eint_irq_handler,
+					 eint);
+
+	ret = driver_create_file(eint->dev->driver,
+				 &driver_attr_eintc_status);
+
+	ret |= driver_create_file(eint->dev->driver,
+				  &driver_attr_eint_pin_status);
+
+	if (ret)
+		dev_err(eint->dev, "%s create sysfs files failed.\n", __func__);
+
+	global_eintc = eint;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_eint_do_init);
+
+int mtk_eint_do_init_v2(struct mtk_eint *eint)
+{
+	int i, matrix_number = 0;
+	struct device_node *node;
+	unsigned int ret, size, offset;
+	unsigned int id, inst, idx, support_deb;
+
+	const phandle *ph;
+
+#if defined(MTK_EINT_DEBUG)
+	struct mtk_eint_pin pin;
+#endif
+
+	ph = of_get_property(eint->dev->of_node, "mediatek,eint", NULL);
+	if (!ph) {
+		dev_err(eint->dev, "Cannot find EINT phandle in PIO node.\n");
+		return -ENODEV;
+	}
+
+	node = of_find_node_by_phandle(be32_to_cpup(ph));
+	if (!node) {
+		dev_err(eint->dev, "Cannot find EINT node by phandle.\n");
+		return -ENODEV;
+	}
+
+	ret = of_property_read_u32(node, "mediatek,total-pin-number",
+				   &eint->total_pin_number);
+	if (ret) {
+		dev_err(eint->dev, "%s Get total pin Fail.\n", __func__);
+		return -EINVAL;
+	}
+
+	dev_info(eint->dev, "%s eint total pins:%u.\n",
+		 __func__, eint->total_pin_number);
+
+	ret = of_property_read_u32(node, "mediatek,instance-num",
+				   &eint->instance_number);
+	if (ret)
+		eint->instance_number = 1;
+
+	size = eint->instance_number * sizeof(struct mtk_eint_instance);
+	eint->instances = devm_kzalloc(eint->dev, size, GFP_KERNEL);
+	if (!eint->instances)
+		return -ENOMEM;
+
+	size = eint->total_pin_number * sizeof(struct mtk_eint_pin);
+	eint->pins = devm_kzalloc(eint->dev, size, GFP_KERNEL);
+	if (!eint->pins)
+		return -ENOMEM;
+
+	for (i = 0; i < eint->instance_number; i++) {
+		ret = of_property_read_string_index(node, "reg-name", i,
+						    &(eint->instances[i].name));
+		if (ret) {
+			dev_info(eint->dev,
+				 "%s cannot read the name of instance %d.\n",
+				 __func__, i);
+		}
+
+		eint->instances[i].base = of_iomap(node, i);
+		if (!eint->instances[i].base)
+			return -ENOMEM;
+	}
+
+	matrix_number = of_property_count_u32_elems(node, "mediatek,pins") / 4;
+	if (matrix_number < 0) {
+		matrix_number = eint->total_pin_number;
+		dev_info(eint->dev, "%s eint in legacy mode, matrix number is %u.\n",
+			 __func__, matrix_number);
+	} else {
+		dev_info(eint->dev, "%s eint in new mode, matrix number is %u.\n",
+			 __func__, matrix_number);
+	}
+
+	for (i = 0; i < matrix_number ; i++) {
+		offset = i * 4;
+
+		ret = of_property_read_u32_index(node, "mediatek,pins",
+						 offset, &id);
+		ret |= of_property_read_u32_index(node, "mediatek,pins",
+						  offset + 1, &inst);
+		ret |= of_property_read_u32_index(node, "mediatek,pins",
+						  offset + 2, &idx);
+		ret |= of_property_read_u32_index(node, "mediatek,pins",
+						  offset + 3, &support_deb);
+
+		/* Legacy chip which no need to give coordinate list */
+		if (ret) {
+			id = i;
+			inst = 0;
+			idx = i;
+			support_deb = (i < MTK_EINT_DBNC_MAX) ? 1 : 0;
+		}
+
+		eint->pins[id].enabled = true;
+		eint->pins[id].instance = inst;
+		eint->pins[id].index = idx;
+		eint->pins[id].debounce = support_deb;
+
+		eint->instances[inst].pin_list[idx] = id;
+		eint->instances[inst].number++;
+
+#if defined(MTK_EINT_DEBUG)
+		pin = eint->pins[id];
+		dev_info(eint->dev,
+			 "EINT%u in (%u-%u, %u), deb = %u. %u",
+			 id,
+			 pin.instance,
+			 eint->instances[inst].number,
+			 pin.index,
+			 pin.debounce,
+			 eint->instances[pin.instance].pin_list[pin.index]);
+#endif
+	}
+
+	for (i = 0; i < eint->instance_number; i++) {
+		size = (eint->instances[i].number / 32 + 1) * sizeof(unsigned int);
+		eint->instances[i].wake_mask =
+			devm_kzalloc(eint->dev, size, GFP_KERNEL);
+		eint->instances[i].cur_mask =
+			devm_kzalloc(eint->dev, size, GFP_KERNEL);
+
+		if (!eint->instances[i].wake_mask ||
+		    !eint->instances[i].cur_mask)
+			return -ENOMEM;
 	}
 
+	eint->comp = &default_compat;
+
+	eint->irq = irq_of_parse_and_map(node, 0);
+	if (!eint->irq) {
+		dev_err(eint->dev,
+			"%s IRQ parse fail.\n", __func__);
+		return -EINVAL;
+	}
+
+	eint->domain = irq_domain_add_linear(eint->dev->of_node,
+					     eint->total_pin_number,
+					     &irq_domain_simple_ops, NULL);
+	if (!eint->domain)
+		return -ENOMEM;
+
 	mtk_eint_hw_init(eint);
-	for (i = 0; i < eint->hw->ap_num; i++) {
+	for (i = 0; i < eint->total_pin_number; i++) {
 		int virq = irq_create_mapping(eint->domain, i);
 
 		irq_set_chip_and_handler(virq, &mtk_eint_irq_chip,
@@ -533,9 +1112,20 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 	irq_set_chained_handler_and_data(eint->irq, mtk_eint_irq_handler,
 					 eint);
 
+	ret = driver_create_file(eint->dev->driver,
+				 &driver_attr_eintc_status);
+
+	ret |= driver_create_file(eint->dev->driver,
+				  &driver_attr_eint_pin_status);
+
+	if (ret)
+		dev_err(eint->dev, "%s create sysfs files failed.\n", __func__);
+
+	global_eintc = eint;
+
 	return 0;
 }
-EXPORT_SYMBOL_GPL(mtk_eint_do_init);
+EXPORT_SYMBOL_GPL(mtk_eint_do_init_v2);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("MediaTek EINT Driver");
diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
index 6139b16cd225..30be50308b44 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.h
+++ b/drivers/pinctrl/mediatek/mtk-eint.h
@@ -1,16 +1,19 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2014-2018 MediaTek Inc.
+ * Copyright (C) 2014-2024 MediaTek Inc.
  *
  * Author: Maoguang Meng <maoguang.meng@mediatek.com>
- *	   Sean Wang <sean.wang@mediatek.com>
- *
+ * Sean Wang <sean.wang@mediatek.com>
+ * Chhao Chang <ot_chhao.chang@mediatek.com>
  */
 #ifndef __MTK_EINT_H
 #define __MTK_EINT_H
 
 #include <linux/irqdomain.h>
 
+#define MAX_PIN 256
+//#define MTK_EINT_DEBUG
+
 struct mtk_eint_regs {
 	unsigned int	stat;
 	unsigned int	ack;
@@ -30,19 +33,37 @@ struct mtk_eint_regs {
 	unsigned int	dbnc_ctrl;
 	unsigned int	dbnc_set;
 	unsigned int	dbnc_clr;
+	unsigned int	event;
+	unsigned int	event_set;
+	unsigned int	event_clr;
+	unsigned int	raw_stat;
 };
 
-struct mtk_eint_hw {
-	u8		port_mask;
-	u8		ports;
-	unsigned int	ap_num;
-	unsigned int	db_cnt;
-	const unsigned int *db_time;
+struct mtk_eint_ops {
+	void (*ack)(struct irq_data *d);
 };
 
-extern const unsigned int debounce_time_mt2701[];
-extern const unsigned int debounce_time_mt6765[];
-extern const unsigned int debounce_time_mt6795[];
+struct mtk_eint_compatible {
+	struct mtk_eint_ops ops;
+	const struct mtk_eint_regs *regs;
+};
+
+struct mtk_eint_pin {
+	bool enabled;
+	u8 instance;
+	u8 index;
+	bool debounce;
+	bool dual_edge;
+};
+
+struct mtk_eint_instance {
+	const char *name;
+	void __iomem *base;
+	unsigned int number;
+	u16 pin_list[MAX_PIN];
+	unsigned int *wake_mask;
+	unsigned int *cur_mask;
+};
 
 struct mtk_eint;
 
@@ -54,33 +75,49 @@ struct mtk_eint_xt {
 	int (*set_gpio_as_eint)(void *data, unsigned long eint_n);
 };
 
+struct mtk_eint_hw {
+	u8              port_mask;
+	u8              ports;
+	unsigned int    ap_num;
+	unsigned int    db_cnt;
+	const unsigned int *db_time;
+};
+
+extern const unsigned int debounce_time_mt2701[];
+extern const unsigned int debounce_time_mt6765[];
+extern const unsigned int debounce_time_mt6795[];
+
 struct mtk_eint {
 	struct device *dev;
 	void __iomem *base;
 	struct irq_domain *domain;
 	int irq;
 
-	int *dual_edge;
-	u32 *wake_mask;
-	u32 *cur_mask;
-
-	/* Used to fit into various EINT device */
+	/* An array to record the coordinate, index by global EINT ID */
+	struct mtk_eint_pin *pins;
+	/* An array to record the global EINT ID, index by coordinate */
+	struct mtk_eint_instance *instances;
+	unsigned int total_pin_number;
+	unsigned int instance_number;
+	unsigned int dump_target_eint;
+	const struct mtk_eint_compatible *comp;
 	const struct mtk_eint_hw *hw;
 	const struct mtk_eint_regs *regs;
-	u16 num_db_time;
 
 	/* Used to fit into various pinctrl device */
 	void *pctl;
 	const struct mtk_eint_xt *gpio_xlate;
 };
 
-#if IS_ENABLED(CONFIG_EINT_MTK)
+#if (IS_ENABLED(CONFIG_EINT_MTK) || IS_ENABLED(CONFIG_DEVICE_MODULES_EINT_MTK))
 int mtk_eint_do_init(struct mtk_eint *eint);
+int mtk_eint_do_init_v2(struct mtk_eint *eint);
 int mtk_eint_do_suspend(struct mtk_eint *eint);
 int mtk_eint_do_resume(struct mtk_eint *eint);
 int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_n,
 			  unsigned int debounce);
 int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n);
+int dump_eint_pin_status(unsigned int eint_num, char *buf, unsigned int buf_size);
 
 #else
 static inline int mtk_eint_do_init(struct mtk_eint *eint)
@@ -88,6 +125,11 @@ static inline int mtk_eint_do_init(struct mtk_eint *eint)
 	return -EOPNOTSUPP;
 }
 
+static inline int mtk_eint_do_init_v2(struct mtk_eint *eint)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int mtk_eint_do_suspend(struct mtk_eint *eint)
 {
 	return -EOPNOTSUPP;
@@ -108,5 +150,10 @@ static inline int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
 {
 	return -EOPNOTSUPP;
 }
+
+static inline int dump_eint_pin_status(unsigned int eint_num)
+{
+	return -EOPNOTSUPP;
+}
 #endif
 #endif /* __MTK_EINT_H */
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 54301fbba524..59d5ca2405f3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -375,33 +375,37 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 	if (!of_property_read_bool(np, "interrupt-controller"))
 		return -ENODEV;
 
-	hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
-	if (!hw->eint)
-		return -ENOMEM;
-
-	hw->eint->base = devm_platform_ioremap_resource_byname(pdev, "eint");
-	if (IS_ERR(hw->eint->base)) {
-		ret = PTR_ERR(hw->eint->base);
-		goto err_free_eint;
-	}
+	if (hw->soc->eint_hw) {
+		hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
+		if (!hw->eint)
+			return -ENOMEM;
+
+		hw->eint->base = devm_platform_ioremap_resource_byname(pdev, "eint");
+		if (IS_ERR(hw->eint->base)) {
+			ret = PTR_ERR(hw->eint->base);
+			goto err_free_eint;
+		}
 
-	hw->eint->irq = irq_of_parse_and_map(np, 0);
-	if (!hw->eint->irq) {
-		ret = -EINVAL;
-		goto err_free_eint;
-	}
+		hw->eint->irq = irq_of_parse_and_map(np, 0);
+		if (!hw->eint->irq) {
+			ret = -EINVAL;
+			goto err_free_eint;
+		}
 
-	if (!hw->soc->eint_hw) {
-		ret = -ENODEV;
-		goto err_free_eint;
-	}
+		hw->eint->dev = &pdev->dev;
+		hw->eint->hw = hw->soc->eint_hw;
+		hw->eint->pctl = hw;
+		hw->eint->gpio_xlate = &mtk_eint_xt;
+
+		return mtk_eint_do_init(hw->eint);
 
-	hw->eint->dev = &pdev->dev;
-	hw->eint->hw = hw->soc->eint_hw;
-	hw->eint->pctl = hw;
-	hw->eint->gpio_xlate = &mtk_eint_xt;
+	} else {
+		hw->eint->dev = &pdev->dev;
+		hw->eint->pctl = hw;
+		hw->eint->gpio_xlate = &mtk_eint_xt;
 
-	return mtk_eint_do_init(hw->eint);
+		return mtk_eint_do_init_v2(hw->eint);
+	}
 
 err_free_eint:
 	devm_kfree(hw->dev, hw->eint);
-- 
2.34.1


