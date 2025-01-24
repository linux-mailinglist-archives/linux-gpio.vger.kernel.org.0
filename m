Return-Path: <linux-gpio+bounces-15048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B101AA1B73D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2025 14:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0F5F3AF684
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2025 13:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89386142903;
	Fri, 24 Jan 2025 13:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FbbuCz5r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E636612B169;
	Fri, 24 Jan 2025 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737726074; cv=none; b=adm9Ro5C5Fcda7Y5QUzWEOGi76oj5ZX4SuCKPxMh4alewi2oYAWpKyS0DoZczKblSppEvCoDAaF32gKSovsd0ez6Ykgeilx7sipvgsHF5UGJ5GgMT6T2UvEFEW1LjezTUgDfDceQUvL3d0dJ6w6gHLFWOLx0Dk+26S14zlQlT68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737726074; c=relaxed/simple;
	bh=dma3HqGkmYpW96N3lOqvq3NMtg7+Eu5CwYZ2sR+o6tA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uJobVrvL325qNj5NvoimpJpUyiLafMo2Y9SNepO+Bq/fptN4+02BM22N7T4iPIZ81GvqFNCSOvpI8FXRMxy8cWPesbSV1q9Yrp049+5sLwos2yQn+sQozY4olQVs1izfueHSWpnAfa0aLfXq/UoMU83KV97ak8xidRg96yNj/Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=FbbuCz5r; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: dbd5ef58da5811ef99858b75a2457dd9-20250124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vHG0wIAtoOemWkPtzFx9h/lFGmdkP7r/cg9y4ucBGZw=;
	b=FbbuCz5rig0R7dbLi2deTTtoi+6AIC9FRf9g4jLH63nUgcKz/R2ihcB1kI+ijtmBxWKIt+nnWRAQgtIMaRY5TXJ2C/sM34GXczh/bqnqehi+13IlDNBwZr9up/J1DdqDYnuaXZF2VVa85WmQg+3PBYxzLVJovghWuVXcbipoFXI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:26044635-9aab-4159-bf4b-e867cf53d1a4,IP:0,U
	RL:0,TC:0,Content:29,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:4
X-CID-META: VersionHash:60aa074,CLOUDID:dd68a53d-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:4|50,EDM:1,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dbd5ef58da5811ef99858b75a2457dd9-20250124
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 47129546; Fri, 24 Jan 2025 21:41:05 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 24 Jan 2025 21:41:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 24 Jan 2025 21:41:03 +0800
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
Subject: [PATCH v3 2/2] pinctrl: mediatek: adapt to multi-base design
Date: Fri, 24 Jan 2025 21:40:14 +0800
Message-ID: <20250124134025.2666-3-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250124134025.2666-1-ot_chhao.chang@mediatek.com>
References: <20250124134025.2666-1-ot_chhao.chang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The eint num will obtain the operation address through pins.
Change the traversal method of irq handle from traversing a set of
registers to traversing one by one.

Change-Id: I3962b78042d32501a73153201cddf52c6b62a695
Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 38 +++++++++++++++++++----------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 540245c3128d..949a20196f74 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -513,6 +513,7 @@ EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
 int mtk_eint_do_init(struct mtk_eint *eint)
 {
 	unsigned int size, i, port;
+	struct mtk_pinctrl *hw = (struct mtk_pinctrl *)eint->pctl;
 
 	/* If clients don't assign a specific regs, let's use generic one */
 	if (!eint->regs)
@@ -523,11 +524,11 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 	if (!eint->base_pin_num)
 		return -ENOMEM;
 
-	if (!eint->pins) {
+	if (eint->nbase == 1) {
 		size = eint->hw->ap_num * sizeof(struct mtk_eint_pin);
 		eint->pins = devm_kmalloc(eint->dev, size, GFP_KERNEL);
 		if (!eint->pins)
-			return -ENOMEM;
+			goto err_eint;
 
 		eint->base_pin_num[0] = eint->hw->ap_num;
 		for (i = 0; i < eint->hw->ap_num; i++) {
@@ -536,34 +537,29 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 			eint->pins[i].debounce = (i < eint->hw->db_cnt) ? 1 : 0;
 		}
 	} else {
+		eint->pins = hw->soc->eint_pin;
 		for (i = 0; i < eint->hw->ap_num; i++)
 			eint->base_pin_num[eint->pins[i].instance]++;
 	}
 
 	eint->wake_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
-	if (!eint->wake_mask)
-		return -ENOMEM;
-
 	eint->cur_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
-	if (!eint->wake_mask)
-		return -ENOMEM;
+	if (!eint->wake_mask || !eint->wake_mask)
+		goto err_eint;
 
 	for (i = 0; i < eint->nbase; i++) {
 		port = (eint->base_pin_num[i] + 31) / 32;
 		eint->wake_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
-		if (!eint->wake_mask[i])
-			return -ENOMEM;
-
 		eint->cur_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
-		if (!eint->cur_mask[i])
-			return -ENOMEM;
+		if (!eint->cur_mask[i] || !eint->wake_mask[i])
+			goto err_eint;
 	}
 
 	eint->domain = irq_domain_add_linear(eint->dev->of_node,
 					     eint->hw->ap_num,
 					     &irq_domain_simple_ops, NULL);
 	if (!eint->domain)
-		return -ENOMEM;
+		goto err_eint;
 
 	if (eint->hw->db_time) {
 		for (i = 0; i < MTK_EINT_DBNC_MAX; i++)
@@ -585,6 +581,22 @@ int mtk_eint_do_init(struct mtk_eint *eint)
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
+	if (eint->cur_mask)
+		devm_kfree(eint->dev, eint->cur_mask);
+	if (eint->wake_mask)
+		devm_kfree(eint->dev, eint->wake_mask);
+	if (eint->nbase == 1)
+		devm_kfree(eint->dev, eint->pins);
+	devm_kfree(eint->dev, eint->base_pin_num);
+	return -ENOMEM;
 }
 EXPORT_SYMBOL_GPL(mtk_eint_do_init);
 
-- 
2.46.0


