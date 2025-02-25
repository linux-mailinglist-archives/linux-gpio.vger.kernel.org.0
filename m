Return-Path: <linux-gpio+bounces-16565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74017A4421E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 15:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5559A3AA1BC
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 14:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C005F26B2AF;
	Tue, 25 Feb 2025 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="c5GOBmMM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D5826A1CA;
	Tue, 25 Feb 2025 14:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740492480; cv=none; b=h1WSvHsMex5Q/g5juHFUb2Lhfrkd3Ths/wepDtqRy6TI6wnRwARp/bqMdc3S/swaXjJ0bKtpfHqEsgjJYU83RhV6xHKYZhqL8WvHbWKyjcgOQesnJEg2/bPDWdOtSoagp4qVazTBwODRPSVPhuH5TDdLWRoOOiYSRILNf44xYNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740492480; c=relaxed/simple;
	bh=gZlOYgVnbblmwijeZzErncKju8p/OVIR/yJYWF+beDk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z1GQfYXvyn2J90ATgLHTL+BijXE1z8VqtZntdIX31SrVxRwYLIEE1M+9WcH+0ZXaeJhV8rYaFYLkKTTNeTNWxQjQu+uCjmNmRE3jps09Nvusf92MlGluPsyaWvEe3t/NjUQb10PVWJbQ+yqbg+agYILAeTuny3SHk5co0KeVVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=c5GOBmMM; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e66c1356f38111ef8eb9c36241bbb6fb-20250225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kfNBgrRKwydEhEo2AyM2Tq9/ATcCXKMleiGHsjYyfrA=;
	b=c5GOBmMM4DMfbnjZbkSe5zfuhciQMRg7ElkPgE81bXy90jXQLVDAQ5ME/YwSZISDkVMSxAgzZzmkAt0ct8suqIdrAso1t2HGWV9QjnHB5QwwJAQYtJVtBV2Kdf76d24szosTVREh+cY22TAg6ZcNshoxmrL0D61ZhjTGFd4Y+FI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:0ac53fd6-0a45-4c93-99db-ad4033d247fc,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:e2ce8aa4-5c06-4e72-8298-91cabc9efadf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: e66c1356f38111ef8eb9c36241bbb6fb-20250225
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 430829940; Tue, 25 Feb 2025 22:07:51 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 25 Feb 2025 22:07:50 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 25 Feb 2025 22:07:49 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen
	<hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Hao
 Chang <ot_chhao.chang@mediatek.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH v4 3/3] pinctrl: mediatek: adapt to EINT multi-segment addresses
Date: Tue, 25 Feb 2025 22:07:24 +0800
Message-ID: <20250225140732.21557-4-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250225140732.21557-1-ot_chhao.chang@mediatek.com>
References: <20250225140732.21557-1-ot_chhao.chang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The eint num will obtain the operation address through pins.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412021959.txWIlGI0-lkp@intel.com/
Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 246 ++++++++++++++++++----------
 drivers/pinctrl/mediatek/mtk-eint.h |   8 +-
 2 files changed, 164 insertions(+), 90 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 27f0a54e12bf..dafcbeff9506 100644
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
+	u32 idx = eint->pins[d->hwirq].index;
+	u32 inst = eint->pins[d->hwirq].instance;
+	u32 mask = BIT(idx & 0x1f);
 	void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
 						eint->regs->mask_set);
 
-	eint->cur_mask[d->hwirq >> 5] &= ~mask;
+	eint->cur_mask[inst][idx >> 5] &= ~mask;
 
 	writel(mask, reg);
 }
@@ -138,32 +141,44 @@ static void mtk_eint_mask(struct irq_data *d)
 static void mtk_eint_unmask(struct irq_data *d)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
-	u32 mask = BIT(d->hwirq & 0x1f);
+	u32 idx = eint->pins[d->hwirq].index;
+	u32 inst = eint->pins[d->hwirq].instance;
+	u32 mask = BIT(idx & 0x1f);
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
 
 	return !!(readl(reg) & bit);
 }
 
+static unsigned int mtk_eint_get_status(struct mtk_eint *eint,
+					unsigned int eint_num)
+{
+	unsigned int bit = BIT(eint->pins[eint_num].index % 32);
+	void __iomem *reg = mtk_eint_get_offset(eint, eint_num,
+						eint->regs->stat);
+
+	return !!(readl(reg) & bit);
+}
+
 static void mtk_eint_ack(struct irq_data *d)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
-	u32 mask = BIT(d->hwirq & 0x1f);
+	u32 mask = BIT(eint->pins[d->hwirq].index & 0x1f);
 	void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
 						eint->regs->ack);
 
@@ -174,7 +189,7 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
 {
 	struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
 	bool masked;
-	u32 mask = BIT(d->hwirq & 0x1f);
+	unsigned int mask = BIT(eint->pins[d->hwirq].index & 0x1f);
 	void __iomem *reg;
 
 	if (((type & IRQ_TYPE_EDGE_BOTH) && (type & IRQ_TYPE_LEVEL_MASK)) ||
@@ -186,9 +201,9 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
 	}
 
 	if ((type & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH)
-		eint->dual_edge[d->hwirq] = 1;
+		eint->pins[d->hwirq].dual_edge = 1;
 	else
-		eint->dual_edge[d->hwirq] = 0;
+		eint->pins[d->hwirq].dual_edge = 0;
 
 	if (!mtk_eint_get_mask(eint, d->hwirq)) {
 		mtk_eint_mask(d);
@@ -223,27 +238,32 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
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
+				     void __iomem *base, u32 **buf)
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
 
@@ -303,15 +323,18 @@ static struct irq_chip mtk_eint_irq_chip = {
 
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
@@ -322,14 +345,16 @@ mtk_eint_debounce_process(struct mtk_eint *eint, int index)
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
 
@@ -337,20 +362,18 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct mtk_eint *eint = irq_desc_get_handler_data(desc);
-	unsigned int status, eint_num;
-	int offset, mask_offset, index;
-	void __iomem *reg =  mtk_eint_get_offset(eint, 0, eint->regs->stat);
+	unsigned int index, inst, idx, mask;
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
+	for (index = 0; index < eint->hw->ap_num; index++) {
+		inst = eint->pins[index].instance;
+		if (inst >= eint->nbase)
+			continue;
+		if (mtk_eint_get_status(eint, index)) {
+			idx = eint->pins[index].index;
+			mask = BIT(idx & 0x1f);
 
 			/*
 			 * If we get an interrupt on pin that was only required
@@ -358,21 +381,22 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 			 * interrupt (as would mtk_eint_resume do anyway later
 			 * in the resume sequence).
 			 */
-			if (eint->wake_mask[mask_offset] & BIT(offset) &&
-			    !(eint->cur_mask[mask_offset] & BIT(offset))) {
-				writel_relaxed(BIT(offset), reg -
-					eint->regs->stat +
-					eint->regs->mask_set);
+			if (eint->wake_mask[inst][idx >> 5] & mask &&
+			    !(eint->cur_mask[inst][idx >> 5] & mask)) {
+				reg = mtk_eint_get_offset(eint, index,
+							  eint->regs->mask_set);
+				writel_relaxed(mask, reg);
 			}
 
-			dual_edge = eint->dual_edge[index];
+			dual_edge = eint->pins[index].dual_edge;
 			if (dual_edge) {
 				/*
 				 * Clear soft-irq in case we raised it last
 				 * time.
 				 */
-				writel(BIT(offset), reg - eint->regs->stat +
-				       eint->regs->soft_clr);
+				reg = mtk_eint_get_offset(eint, index,
+							  eint->regs->soft_clr);
+				writel(mask, reg);
 
 				start_level =
 				eint->gpio_xlate->get_gpio_state(eint->pctl,
@@ -388,13 +412,14 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 				 * If level changed, we might lost one edge
 				 * interrupt, raised it through soft-irq.
 				 */
-				if (start_level != curr_level)
-					writel(BIT(offset), reg -
-					       eint->regs->stat +
-					       eint->regs->soft_set);
+				if (start_level != curr_level) {
+					reg = mtk_eint_get_offset(eint, index,
+								  eint->regs->soft_set);
+					writel(mask, reg);
+				}
 			}
 
-			if (index < eint->hw->db_cnt)
+			if (eint->pins[index].debounce)
 				mtk_eint_debounce_process(eint, index);
 		}
 	}
@@ -423,6 +448,8 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
 	int virq, eint_offset;
 	unsigned int set_offset, bit, clr_bit, clr_offset, rst, i, unmask,
 		     dbnc;
+	unsigned int inst = eint->pins[eint_num].instance;
+	unsigned int idx = eint->pins[eint_num].index;
 	struct irq_data *d;
 
 	if (!eint->hw->db_time)
@@ -432,8 +459,8 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
 	eint_offset = (eint_num % 4) * 8;
 	d = irq_get_irq_data(virq);
 
-	set_offset = (eint_num / 4) * 4 + eint->regs->dbnc_set;
-	clr_offset = (eint_num / 4) * 4 + eint->regs->dbnc_clr;
+	set_offset = (idx / 4) * 4 + eint->regs->dbnc_set;
+	clr_offset = (idx / 4) * 4 + eint->regs->dbnc_clr;
 
 	if (!mtk_eint_can_en_debounce(eint, eint_num))
 		return -EINVAL;
@@ -454,12 +481,12 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
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
@@ -487,32 +514,57 @@ EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
 
 int mtk_eint_do_init(struct mtk_eint *eint)
 {
-	int i;
+	unsigned int size, i, port;
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
+		eint->base_pin_num[0] = eint->hw->ap_num;
+		for (i = 0; i < eint->hw->ap_num; i++) {
+			eint->pins[i].instance = 0;
+			eint->pins[i].index = i;
+			eint->pins[i].debounce = (i < eint->hw->db_cnt) ? 1 : 0;
+		}
+	} else {
+		eint->pins = hw->soc->eint_pin;
+		for (i = 0; i < eint->hw->ap_num; i++)
+			eint->base_pin_num[eint->pins[i].instance]++;
+	}
 
-	eint->dual_edge = devm_kcalloc(eint->dev, eint->hw->ap_num,
-				       sizeof(int), GFP_KERNEL);
-	if (!eint->dual_edge)
-		return -ENOMEM;
+	eint->wake_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
+	if (!eint->wake_mask)
+		goto err_wake_mask;
+
+	eint->cur_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
+	if (!eint->cur_mask)
+		goto err_cur_mask;
+
+	for (i = 0; i < eint->nbase; i++) {
+		port = DIV_ROUND_UP(eint->base_pin_num[i], 32);
+		eint->wake_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
+		eint->cur_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
+		if (!eint->cur_mask[i] || !eint->wake_mask[i])
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
@@ -523,6 +575,9 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 
 	mtk_eint_hw_init(eint);
 	for (i = 0; i < eint->hw->ap_num; i++) {
+		if (eint->pins[i].instance >= eint->nbase)
+			continue;
+
 		int virq = irq_create_mapping(eint->domain, i);
 
 		irq_set_chip_and_handler(virq, &mtk_eint_irq_chip,
@@ -534,6 +589,23 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 					 eint);
 
 	return 0;
+
+err_eint:
+	for (i = 0; i < eint->nbase; i++) {
+		if (eint->wake_mask[i])
+			devm_kfree(eint->dev, eint->wake_mask[i]);
+		if (eint->cur_mask[i])
+			devm_kfree(eint->dev, eint->cur_mask[i]);
+	}
+	devm_kfree(eint->dev, eint->cur_mask);
+err_cur_mask:
+	devm_kfree(eint->dev, eint->wake_mask);
+err_wake_mask:
+	if (eint->nbase == 1)
+		devm_kfree(eint->dev, eint->pins);
+err_pins:
+	devm_kfree(eint->dev, eint->base_pin_num);
+	return -ENOMEM;
 }
 EXPORT_SYMBOL_GPL(mtk_eint_do_init);
 
diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
index c1efdf02fb49..daaf0442b8b8 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.h
+++ b/drivers/pinctrl/mediatek/mtk-eint.h
@@ -1,9 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) 2014-2018 MediaTek Inc.
+ * Copyright (C) 2014-2025 MediaTek Inc.
  *
  * Author: Maoguang Meng <maoguang.meng@mediatek.com>
  *	   Sean Wang <sean.wang@mediatek.com>
+ *	   Hao Chang <ot_chhao.chang@mediatek.com>
+ *	   Qingliang Li <qingliang.li@mediatek.com>
  *
  */
 #ifndef __MTK_EINT_H
@@ -71,8 +73,8 @@ struct mtk_eint {
 	int irq;
 
 	int *dual_edge;
-	u32 *wake_mask;
-	u32 *cur_mask;
+	u32 **wake_mask;
+	u32 **cur_mask;
 
 	/* Used to fit into various EINT device */
 	const struct mtk_eint_hw *hw;
-- 
2.46.0


