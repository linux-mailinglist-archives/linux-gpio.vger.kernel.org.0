Return-Path: <linux-gpio+bounces-17874-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDD3A6C787
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 04:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63F8F189C00B
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 03:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58764143C5D;
	Sat, 22 Mar 2025 03:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cvgKawGn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6093512F399;
	Sat, 22 Mar 2025 03:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742615611; cv=none; b=adAzFm4o+2wlM4F93PToXTlvXXPhPKYLOlsps0p66r+YFmeW75+HROxBazPLeSyjSBr76OilMRhf9uVt36ztnXQvxBcjvAMZOSUbJS81ft9yTDWRYpOz8yP7gLfhJ6hpymVFSJDzbP71RtjcRwkuHLqcfUdtOxDDTeoPHEgwjAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742615611; c=relaxed/simple;
	bh=LfbU1U+HCDmnJwSfwSQOJrCY5DSVBoPPXIcHvyCIKBE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iC+XGXAsbmpEXP2uwXzn+59qatX8unIJ0f1M7tfNWCEQ/Pu+jS89fGavVXXlM9e9C9D6XIZvb4Ovpk8/Rvd5wYr9VhaAS3J1fIDyiPFycR+aqXlypemox8Clh/drBpnfoUInZ/oTscwnw3ErS1D8f1s5ZuYrFEK1HPs+uFXgl7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cvgKawGn; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 33b9356406d111f0aae1fd9735fae912-20250322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=34Mo3gU8b2x6nhsh+I0FB+kZHOuw/9OfvK9q1/TzjUs=;
	b=cvgKawGn2dfG8mgjZM+9ghUhXZRpCXHY0iQw6z7VA4eem2OBelY7wXn/jojfn1AD13nFqpJVruCH4oDT15+sJrrunQkZhpayMAJnWHbTJf708tboAWkTVowTFRIg9YVLiivVim5STG/YKK68L5K658DNxi0LgExrsDqHErCyPm8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b2100daf-79a4-414a-8fff-fced7faa5423,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:19dcaf8c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 33b9356406d111f0aae1fd9735fae912-20250322
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1339520808; Sat, 22 Mar 2025 11:53:23 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 22 Mar 2025 11:53:22 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 22 Mar 2025 11:53:21 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen
	<hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Hao
 Chang <ot_chhao.chang@mediatek.com>
Subject: [PATCH v5 1/1] pinctrl: mediatek: Add EINT support for multiple addresses
Date: Sat, 22 Mar 2025 11:52:28 +0800
Message-ID: <20250322035307.4811-2-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250322035307.4811-1-ot_chhao.chang@mediatek.com>
References: <20250322035307.4811-1-ot_chhao.chang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

For flexible routing, eint will be divided into 5 bases,
and it will obtain the operation address through the pins array.

Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 drivers/pinctrl/mediatek/mtk-eint.c           | 313 +++++++++++-------
 drivers/pinctrl/mediatek/mtk-eint.h           |  23 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  37 ++-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   1 +
 drivers/pinctrl/mediatek/pinctrl-paris.h      |   7 +
 5 files changed, 254 insertions(+), 127 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 27f0a54e12bf..ced4ee509b5b 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -1,11 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2014-2018 MediaTek Inc.
+// Copyright (c) 2014-2025 MediaTek Inc.
 
 /*
  * Library for MediaTek External Interrupt Support
  *
  * Author: Maoguang Meng <maoguang.meng@mediatek.com>
  *	   Sean Wang <sean.wang@mediatek.com>
+ *	   Hao Chang <ot_chhao.chang@mediatek.com>
+ *	   Qingliang Li <qingliang.li@mediatek.com>
  *
  */
 
@@ -20,6 +22,7 @@
 #include <linux/platform_device.h>
 
 #include "mtk-eint.h"
+#include "pinctrl-mtk-common-v2.h"
 
 #define MTK_EINT_EDGE_SENSITIVE           0
 #define MTK_EINT_LEVEL_SENSITIVE          1
@@ -68,13 +71,11 @@ static void __iomem *mtk_eint_get_offset(struct mtk_eint *eint,
 					 unsigned int eint_num,
 					 unsigned int offset)
 {
-	unsigned int eint_base = 0;
+	unsigned int idx = eint->pins[eint_num].index;
+	unsigned int inst = eint->pins[eint_num].instance;
 	void __iomem *reg;
 
-	if (eint_num >= eint->hw->ap_num)
-		eint_base = eint->hw->ap_num;
-
-	reg = eint->base + offset + ((eint_num - eint_base) / 32) * 4;
+	reg = eint->base[inst] + offset + (idx / 32 * 4);
 
 	return reg;
 }
@@ -83,7 +84,7 @@ static unsigned int mtk_eint_can_en_debounce(struct mtk_eint *eint,
 					     unsigned int eint_num)
 {
 	unsigned int sens;
-	unsigned int bit = BIT(eint_num % 32);
+	unsigned int bit = BIT(eint->pins[eint_num].index % 32);
 	void __iomem *reg = mtk_eint_get_offset(eint, eint_num,
 						eint->regs->sens);
 
@@ -92,7 +93,7 @@ static unsigned int mtk_eint_can_en_debounce(struct mtk_eint *eint,
 	else
 		sens = MTK_EINT_EDGE_SENSITIVE;
 
-	if (eint_num < eint->hw->db_cnt && sens != MTK_EINT_EDGE_SENSITIVE)
+	if (eint->pins[eint_num].debounce && sens != MTK_EINT_EDGE_SENSITIVE)
 		return 1;
 	else
 		return 0;
@@ -102,9 +103,9 @@ static int mtk_eint_flip_edge(struct mtk_eint *eint, int hwirq)
 {
 	int start_level, curr_level;
 	unsigned int reg_offset;
-	u32 mask = BIT(hwirq & 0x1f);
-	u32 port = (hwirq >> 5) & eint->hw->port_mask;
-	void __iomem *reg = eint->base + (port << 2);
+	unsigned int mask = BIT(eint->pins[hwirq].index & 0x1f);
+	unsigned int port = (eint->pins[hwirq].index >> 5) & eint->hw->port_mask;
+	void __iomem *reg = eint->base[eint->pins[hwirq].instance] + (port << 2);
 
 	curr_level = eint->gpio_xlate->get_gpio_state(eint->pctl, hwirq);
 
@@ -126,11 +127,13 @@ static int mtk_eint_flip_edge(struct mtk_eint *eint, int hwirq)
 static void mtk_eint_mask(struct irq_data *d)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
-	u32 mask = BIT(d->hwirq & 0x1f);
+	unsigned int idx = eint->pins[d->hwirq].index;
+	unsigned int inst = eint->pins[d->hwirq].instance;
+	unsigned int mask = BIT(idx & 0x1f);
 	void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
 						eint->regs->mask_set);
 
-	eint->cur_mask[d->hwirq >> 5] &= ~mask;
+	eint->cur_mask[inst][idx >> 5] &= ~mask;
 
 	writel(mask, reg);
 }
@@ -138,22 +141,24 @@ static void mtk_eint_mask(struct irq_data *d)
 static void mtk_eint_unmask(struct irq_data *d)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
-	u32 mask = BIT(d->hwirq & 0x1f);
+	unsigned int idx = eint->pins[d->hwirq].index;
+	unsigned int inst = eint->pins[d->hwirq].instance;
+	unsigned int mask = BIT(idx & 0x1f);
 	void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
 						eint->regs->mask_clr);
 
-	eint->cur_mask[d->hwirq >> 5] |= mask;
+	eint->cur_mask[inst][idx >> 5] |= mask;
 
 	writel(mask, reg);
 
-	if (eint->dual_edge[d->hwirq])
+	if (eint->pins[d->hwirq].dual_edge)
 		mtk_eint_flip_edge(eint, d->hwirq);
 }
 
 static unsigned int mtk_eint_get_mask(struct mtk_eint *eint,
 				      unsigned int eint_num)
 {
-	unsigned int bit = BIT(eint_num % 32);
+	unsigned int bit = BIT(eint->pins[eint_num].index % 32);
 	void __iomem *reg = mtk_eint_get_offset(eint, eint_num,
 						eint->regs->mask);
 
@@ -163,7 +168,7 @@ static unsigned int mtk_eint_get_mask(struct mtk_eint *eint,
 static void mtk_eint_ack(struct irq_data *d)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
-	u32 mask = BIT(d->hwirq & 0x1f);
+	unsigned int mask = BIT(eint->pins[d->hwirq].index & 0x1f);
 	void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
 						eint->regs->ack);
 
@@ -174,7 +179,7 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
 	bool masked;
-	u32 mask = BIT(d->hwirq & 0x1f);
+	unsigned int mask = BIT(eint->pins[d->hwirq].index & 0x1f);
 	void __iomem *reg;
 
 	if (((type & IRQ_TYPE_EDGE_BOTH) && (type & IRQ_TYPE_LEVEL_MASK)) ||
@@ -186,9 +191,9 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
 	}
 
 	if ((type & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH)
-		eint->dual_edge[d->hwirq] = 1;
+		eint->pins[d->hwirq].dual_edge = 1;
 	else
-		eint->dual_edge[d->hwirq] = 0;
+		eint->pins[d->hwirq].dual_edge = 0;
 
 	if (!mtk_eint_get_mask(eint, d->hwirq)) {
 		mtk_eint_mask(d);
@@ -223,27 +228,32 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
 static int mtk_eint_irq_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
-	int shift = d->hwirq & 0x1f;
-	int reg = d->hwirq >> 5;
+	unsigned int idx = eint->pins[d->hwirq].index;
+	unsigned int inst = eint->pins[d->hwirq].instance;
+	unsigned int shift = idx & 0x1f;
+	unsigned int port = idx >> 5;
 
 	if (on)
-		eint->wake_mask[reg] |= BIT(shift);
+		eint->wake_mask[inst][port] |= BIT(shift);
 	else
-		eint->wake_mask[reg] &= ~BIT(shift);
+		eint->wake_mask[inst][port] &= ~BIT(shift);
 
 	return 0;
 }
 
 static void mtk_eint_chip_write_mask(const struct mtk_eint *eint,
-				     void __iomem *base, u32 *buf)
+				     void __iomem *base, unsigned int **buf)
 {
-	int port;
+	int inst, port, port_num;
 	void __iomem *reg;
 
-	for (port = 0; port < eint->hw->ports; port++) {
-		reg = base + (port << 2);
-		writel_relaxed(~buf[port], reg + eint->regs->mask_set);
-		writel_relaxed(buf[port], reg + eint->regs->mask_clr);
+	for (inst = 0; inst < eint->nbase; inst++) {
+		port_num = DIV_ROUND_UP(eint->base_pin_num[inst], 32);
+		for (port = 0; port < port_num; port++) {
+			reg = eint->base[inst] + (port << 2);
+			writel_relaxed(~buf[inst][port], reg + eint->regs->mask_set);
+			writel_relaxed(buf[inst][port], reg + eint->regs->mask_clr);
+		}
 	}
 }
 
@@ -303,15 +313,18 @@ static struct irq_chip mtk_eint_irq_chip = {
 
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
+	void __iomem *dom_reg, *mask_reg;
+	unsigned int i, j;
+
+	for (i = 0; i < eint->nbase; i++) {
+		dom_reg = eint->base[i] + eint->regs->dom_en;
+		mask_reg = eint->base[i] + eint->regs->mask_set;
+		for (j = 0; j < eint->base_pin_num[i]; j += 32) {
+			writel(0xffffffff, dom_reg);
+			writel(0xffffffff, mask_reg);
+			dom_reg += 4;
+			mask_reg += 4;
+		}
 	}
 
 	return 0;
@@ -322,14 +335,16 @@ mtk_eint_debounce_process(struct mtk_eint *eint, int index)
 {
 	unsigned int rst, ctrl_offset;
 	unsigned int bit, dbnc;
+	unsigned int inst = eint->pins[index].instance;
+	unsigned int idx = eint->pins[index].index;
 
-	ctrl_offset = (index / 4) * 4 + eint->regs->dbnc_ctrl;
-	dbnc = readl(eint->base + ctrl_offset);
-	bit = MTK_EINT_DBNC_SET_EN << ((index % 4) * 8);
+	ctrl_offset = (idx / 4) * 4 + eint->regs->dbnc_ctrl;
+	dbnc = readl(eint->base[inst] + ctrl_offset);
+	bit = MTK_EINT_DBNC_SET_EN << ((idx % 4) * 8);
 	if ((bit & dbnc) > 0) {
-		ctrl_offset = (index / 4) * 4 + eint->regs->dbnc_set;
-		rst = MTK_EINT_DBNC_RST_BIT << ((index % 4) * 8);
-		writel(rst, eint->base + ctrl_offset);
+		ctrl_offset = (idx / 4) * 4 + eint->regs->dbnc_set;
+		rst = MTK_EINT_DBNC_RST_BIT << ((idx % 4) * 8);
+		writel(rst, eint->base[inst] + ctrl_offset);
 	}
 }
 
@@ -337,65 +352,68 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct mtk_eint *eint = irq_desc_get_handler_data(desc);
-	unsigned int status, eint_num;
-	int offset, mask_offset, index;
-	void __iomem *reg =  mtk_eint_get_offset(eint, 0, eint->regs->stat);
+	unsigned int i, j, port, status, shift, mask, eint_num;
+	void __iomem *reg;
 	int dual_edge, start_level, curr_level;
 
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
-
-			dual_edge = eint->dual_edge[index];
-			if (dual_edge) {
-				/*
-				 * Clear soft-irq in case we raised it last
-				 * time.
-				 */
-				writel(BIT(offset), reg - eint->regs->stat +
-				       eint->regs->soft_clr);
-
-				start_level =
-				eint->gpio_xlate->get_gpio_state(eint->pctl,
-								 index);
-			}
-
-			generic_handle_domain_irq(eint->domain, index);
-
-			if (dual_edge) {
-				curr_level = mtk_eint_flip_edge(eint, index);
+	for (i = 0; i < eint->nbase; i++) {
+		for (j = 0; j < eint->base_pin_num[i]; j += 32) {
+			port = j >> 5;
+			status = readl(eint->base[i] + port * 4 + eint->regs->stat);
+			while (status) {
+				shift = __ffs(status);
+				status &= ~BIT(shift);
+				mask = BIT(shift);
+				eint_num = eint->pin_list[i][shift + j];
 
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
+				if (eint->wake_mask[i][port] & mask &&
+				    !(eint->cur_mask[i][port] & mask)) {
+					reg = mtk_eint_get_offset(eint, eint_num,
+								  eint->regs->mask_set);
+					writel_relaxed(mask, reg);
+				}
+
+				dual_edge = eint->pins[eint_num].dual_edge;
+				if (dual_edge) {
+					/*
+					 * Clear soft-irq in case we raised it last
+					 * time.
+					 */
+					reg = mtk_eint_get_offset(eint, eint_num,
+								  eint->regs->soft_clr);
+					writel(mask, reg);
+
+					start_level =
+					eint->gpio_xlate->get_gpio_state(eint->pctl,
+									 eint_num);
+				}
+
+				generic_handle_domain_irq(eint->domain, eint_num);
+
+				if (dual_edge) {
+					curr_level = mtk_eint_flip_edge(eint, eint_num);
+
+					/*
+					 * If level changed, we might lost one edge
+					 * interrupt, raised it through soft-irq.
+					 */
+					if (start_level != curr_level) {
+						reg = mtk_eint_get_offset(eint, eint_num,
+									  eint->regs->soft_set);
+						writel(mask, reg);
+					}
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
@@ -423,6 +441,8 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
 	int virq, eint_offset;
 	unsigned int set_offset, bit, clr_bit, clr_offset, rst, i, unmask,
 		     dbnc;
+	unsigned int inst = eint->pins[eint_num].instance;
+	unsigned int idx = eint->pins[eint_num].index;
 	struct irq_data *d;
 
 	if (!eint->hw->db_time)
@@ -432,8 +452,8 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
 	eint_offset = (eint_num % 4) * 8;
 	d = irq_get_irq_data(virq);
 
-	set_offset = (eint_num / 4) * 4 + eint->regs->dbnc_set;
-	clr_offset = (eint_num / 4) * 4 + eint->regs->dbnc_clr;
+	set_offset = (idx / 4) * 4 + eint->regs->dbnc_set;
+	clr_offset = (idx / 4) * 4 + eint->regs->dbnc_clr;
 
 	if (!mtk_eint_can_en_debounce(eint, eint_num))
 		return -EINVAL;
@@ -454,12 +474,12 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
 	}
 
 	clr_bit = 0xff << eint_offset;
-	writel(clr_bit, eint->base + clr_offset);
+	writel(clr_bit, eint->base[inst] + clr_offset);
 
 	bit = ((dbnc << MTK_EINT_DBNC_SET_DBNC_BITS) | MTK_EINT_DBNC_SET_EN) <<
 		eint_offset;
 	rst = MTK_EINT_DBNC_RST_BIT << eint_offset;
-	writel(rst | bit, eint->base + set_offset);
+	writel(rst | bit, eint->base[inst] + set_offset);
 
 	/*
 	 * Delay a while (more than 2T) to wait for hw debounce counter reset
@@ -487,32 +507,69 @@ EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
 
 int mtk_eint_do_init(struct mtk_eint *eint)
 {
-	int i;
+	unsigned int size, i, port, inst = 0;
+	struct mtk_pinctrl *hw = (struct mtk_pinctrl *)eint->pctl;
 
 	/* If clients don't assign a specific regs, let's use generic one */
 	if (!eint->regs)
 		eint->regs = &mtk_generic_eint_regs;
 
-	eint->wake_mask = devm_kcalloc(eint->dev, eint->hw->ports,
-				       sizeof(*eint->wake_mask), GFP_KERNEL);
-	if (!eint->wake_mask)
+	eint->base_pin_num = devm_kmalloc_array(eint->dev, eint->nbase, sizeof(u16),
+						GFP_KERNEL | __GFP_ZERO);
+	if (!eint->base_pin_num)
 		return -ENOMEM;
 
-	eint->cur_mask = devm_kcalloc(eint->dev, eint->hw->ports,
-				      sizeof(*eint->cur_mask), GFP_KERNEL);
-	if (!eint->cur_mask)
-		return -ENOMEM;
+	if (eint->nbase == 1) {
+		size = eint->hw->ap_num * sizeof(struct mtk_eint_pin);
+		eint->pins = devm_kmalloc(eint->dev, size, GFP_KERNEL);
+		if (!eint->pins)
+			goto err_pins;
+
+		eint->base_pin_num[inst] = eint->hw->ap_num;
+		for (i = 0; i < eint->hw->ap_num; i++) {
+			eint->pins[i].instance = inst;
+			eint->pins[i].index = i;
+			eint->pins[i].debounce = (i < eint->hw->db_cnt) ? 1 : 0;
+		}
+	}
 
-	eint->dual_edge = devm_kcalloc(eint->dev, eint->hw->ap_num,
-				       sizeof(int), GFP_KERNEL);
-	if (!eint->dual_edge)
-		return -ENOMEM;
+	if (hw && hw->soc && hw->soc->eint_pin) {
+		eint->pins = hw->soc->eint_pin;
+		for (i = 0; i < eint->hw->ap_num; i++) {
+			inst = eint->pins[i].instance;
+			if (inst >= eint->nbase)
+				continue;
+			eint->base_pin_num[inst]++;
+		}
+	}
+
+	eint->pin_list = devm_kmalloc(eint->dev, eint->nbase * sizeof(u16 *), GFP_KERNEL);
+	if (!eint->pin_list)
+		goto err_pin_list;
+
+	eint->wake_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
+	if (!eint->wake_mask)
+		goto err_wake_mask;
+
+	eint->cur_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
+	if (!eint->cur_mask)
+		goto err_cur_mask;
+
+	for (i = 0; i < eint->nbase; i++) {
+		eint->pin_list[i] = devm_kzalloc(eint->dev, eint->base_pin_num[i] * sizeof(u16),
+						 GFP_KERNEL);
+		port = DIV_ROUND_UP(eint->base_pin_num[i], 32);
+		eint->wake_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
+		eint->cur_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
+		if (!eint->pin_list[i] || !eint->wake_mask[i] || !eint->cur_mask[i])
+			goto err_eint;
+	}
 
 	eint->domain = irq_domain_add_linear(eint->dev->of_node,
 					     eint->hw->ap_num,
 					     &irq_domain_simple_ops, NULL);
 	if (!eint->domain)
-		return -ENOMEM;
+		goto err_eint;
 
 	if (eint->hw->db_time) {
 		for (i = 0; i < MTK_EINT_DBNC_MAX; i++)
@@ -523,8 +580,11 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 
 	mtk_eint_hw_init(eint);
 	for (i = 0; i < eint->hw->ap_num; i++) {
+		inst = eint->pins[i].instance;
+		if (inst >= eint->nbase)
+			continue;
+		eint->pin_list[inst][eint->pins[i].index] = i;
 		int virq = irq_create_mapping(eint->domain, i);
-
 		irq_set_chip_and_handler(virq, &mtk_eint_irq_chip,
 					 handle_level_irq);
 		irq_set_chip_data(virq, eint);
@@ -534,6 +594,27 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 					 eint);
 
 	return 0;
+
+err_eint:
+	for (i = 0; i < eint->nbase; i++) {
+		if (eint->cur_mask[i])
+			devm_kfree(eint->dev, eint->cur_mask[i]);
+		if (eint->wake_mask[i])
+			devm_kfree(eint->dev, eint->wake_mask[i]);
+		if (eint->pin_list[i])
+			devm_kfree(eint->dev, eint->pin_list[i]);
+	}
+	devm_kfree(eint->dev, eint->cur_mask);
+err_cur_mask:
+	devm_kfree(eint->dev, eint->wake_mask);
+err_wake_mask:
+	devm_kfree(eint->dev, eint->pin_list);
+err_pin_list:
+	if (eint->nbase == 1)
+		devm_kfree(eint->dev, eint->pins);
+err_pins:
+	devm_kfree(eint->dev, eint->base_pin_num);
+	return -ENOMEM;
 }
 EXPORT_SYMBOL_GPL(mtk_eint_do_init);
 
diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
index 6139b16cd225..f7f58cca0d5e 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.h
+++ b/drivers/pinctrl/mediatek/mtk-eint.h
@@ -1,10 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) 2014-2018 MediaTek Inc.
+ * Copyright (C) 2014-2025 MediaTek Inc.
  *
  * Author: Maoguang Meng <maoguang.meng@mediatek.com>
  *	   Sean Wang <sean.wang@mediatek.com>
- *
+ *	   Hao Chang <ot_chhao.chang@mediatek.com>
+ *	   Qingliang Li <qingliang.li@mediatek.com>
  */
 #ifndef __MTK_EINT_H
 #define __MTK_EINT_H
@@ -40,6 +41,14 @@ struct mtk_eint_hw {
 	const unsigned int *db_time;
 };
 
+struct mtk_eint_pin {
+	u16 number;
+	u8 instance;
+	u8 index;
+	bool debounce;
+	bool dual_edge;
+};
+
 extern const unsigned int debounce_time_mt2701[];
 extern const unsigned int debounce_time_mt6765[];
 extern const unsigned int debounce_time_mt6795[];
@@ -56,17 +65,21 @@ struct mtk_eint_xt {
 
 struct mtk_eint {
 	struct device *dev;
-	void __iomem *base;
+	void __iomem **base;
+	u8 nbase;
+	u16 *base_pin_num;
 	struct irq_domain *domain;
 	int irq;
 
 	int *dual_edge;
-	u32 *wake_mask;
-	u32 *cur_mask;
+	u16 **pin_list;
+	u32 **wake_mask;
+	u32 **cur_mask;
 
 	/* Used to fit into various EINT device */
 	const struct mtk_eint_hw *hw;
 	const struct mtk_eint_regs *regs;
+	struct mtk_eint_pin *pins;
 	u16 num_db_time;
 
 	/* Used to fit into various pinctrl device */
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 00e95682b9f8..d1556b75d9ef 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/of_irq.h>
 
 #include "mtk-eint.h"
@@ -367,7 +368,7 @@ static const struct mtk_eint_xt mtk_eint_xt = {
 int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	int ret;
+	int ret, i, j, count_reg_names;
 
 	if (!IS_ENABLED(CONFIG_EINT_MTK))
 		return 0;
@@ -379,10 +380,24 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 	if (!hw->eint)
 		return -ENOMEM;
 
-	hw->eint->base = devm_platform_ioremap_resource_byname(pdev, "eint");
-	if (IS_ERR(hw->eint->base)) {
-		ret = PTR_ERR(hw->eint->base);
-		goto err_free_eint;
+	count_reg_names = of_property_count_strings(np, "reg-names");
+	if (count_reg_names < hw->soc->nbase_names)
+		return -EINVAL;
+
+	hw->eint->nbase = count_reg_names - hw->soc->nbase_names;
+	hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
+					    sizeof(*hw->eint->base), GFP_KERNEL | __GFP_ZERO);
+	if (!hw->eint->base) {
+		ret = -ENOMEM;
+		goto err_free_base;
+	}
+
+	for (i = hw->soc->nbase_names, j = 0; i < count_reg_names; i++, j++) {
+		hw->eint->base[j] = of_iomap(np, i);
+		if (IS_ERR(hw->eint->base[j])) {
+			ret = PTR_ERR(hw->eint->base[j]);
+			goto err_free_eint;
+		}
 	}
 
 	hw->eint->irq = irq_of_parse_and_map(np, 0);
@@ -401,9 +416,19 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 	hw->eint->pctl = hw;
 	hw->eint->gpio_xlate = &mtk_eint_xt;
 
-	return mtk_eint_do_init(hw->eint);
+	ret = mtk_eint_do_init(hw->eint);
+	if (ret)
+		goto err_free_eint;
+
+	return 0;
 
 err_free_eint:
+	for (j = 0; j < hw->eint->nbase; j++) {
+		if (hw->eint->base[j])
+			iounmap(hw->eint->base[j]);
+	}
+	devm_kfree(hw->dev, hw->eint->base);
+err_free_base:
 	devm_kfree(hw->dev, hw->eint);
 	hw->eint = NULL;
 	return ret;
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 9c271dc2b521..36d2898037dd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -242,6 +242,7 @@ struct mtk_pin_soc {
 	unsigned int			nfuncs;
 	const struct mtk_eint_regs	*eint_regs;
 	const struct mtk_eint_hw	*eint_hw;
+	struct mtk_eint_pin		*eint_pin;
 
 	/* Specific parameters per SoC */
 	u8				gpio_m;
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
index 948ce126aa0c..d8c1822662fc 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.h
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
@@ -49,6 +49,13 @@
 			__VA_ARGS__, { } },				\
 	}
 
+#define MTK_EINT_PIN(_number, _instance, _index, _debounce) {	\
+		.number = _number,				\
+		.instance = _instance,				\
+		.index = _index,				\
+		.debounce = _debounce,				\
+	}
+
 #define PINCTRL_PIN_GROUP(_name_, id)							\
 	{										\
 		.grp = PINCTRL_PINGROUP(_name_,id##_pins, ARRAY_SIZE(id##_pins)),	\
-- 
2.46.0


