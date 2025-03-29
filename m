Return-Path: <linux-gpio+bounces-18098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B81A7540C
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Mar 2025 03:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFF523ADD43
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Mar 2025 02:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E65923774;
	Sat, 29 Mar 2025 02:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VtcpE4Gt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C9815A8;
	Sat, 29 Mar 2025 02:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743216353; cv=none; b=uYPu2WZw+4Cp/X7VsxCyYuxt/h+wDEJFm484WrIcXzLjn26DLFJIRbqy9NQMjsMDeTjJhux6M8/JuFvdLFozVbGmAAXQyCnlWOjYqpwReVTX2zq9sQt1IEk46kOdeN1ZGpXHQmFmivIQ6zjJCg3SCN4JQne2EvifPA0KFMm2wWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743216353; c=relaxed/simple;
	bh=xR0kYYmDHYBvu8zW0lVbrQUftt/gZzoxa/JWUOZCI6c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WlXf3cT5kcpqxj6nmk0CW1naLlZ0Se5yz2/PEMWJniCaqS0TumJuyfVaQPRg3Twrf2eaXdW2wI0JSufPUk6Ypy1IHUO7Ub4DNiqJ/t9yIBasprAoie50taHlh7dZdAZtZUOQJt7HzWFjuumXu/ggt0mV4+vDkvxvEHNQvrPHnqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VtcpE4Gt; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e560bc300c4711f0aae1fd9735fae912-20250329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Mud+iDg4MCst5FqYuld9wlN2wQNOH84EC+hVthJ8uLo=;
	b=VtcpE4Gt5/Fm5lGshyGRnCNCwOrErrahaOJDD3FYHasvLEhlRXC4YfiUX6xXjDTkLeO45v9bFJLGYYCf+S8KSNkUYSf987S8aPnNclmA8mrrQ6r59zlDj6I0Hq3tPtNeTN+CR7SR/D8rUCMx3Up8LSekSm1tVM8rD4JD0OBXcf0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ea9136c0-9c83-4490-968a-63d943318f7f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:1197f78c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: e560bc300c4711f0aae1fd9735fae912-20250329
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 40643921; Sat, 29 Mar 2025 10:45:37 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 29 Mar 2025 10:45:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 29 Mar 2025 10:45:35 +0800
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
Subject: [PATCH] pinctrl: mediatek: Fix the invalid conditions
Date: Sat, 29 Mar 2025 10:40:29 +0800
Message-ID: <20250329024533.5279-1-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The variable count_reg_names is defined as an int type and cannot be
directly compared to an unsigned int. To resolve this issue,
first verify the correctness of count_reg_names.

https://lore.kernel.org/all/5ae93d42e4c4e70fb33bf35dcc37caebf324c8d3.camel@mediatek.com/T/

Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 drivers/pinctrl/mediatek/mtk-eint.c              | 4 ++--
 drivers/pinctrl/mediatek/mtk-eint.h              | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 7 +++++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index ced4ee509b5b..557dec75fa03 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -507,7 +507,7 @@ EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
 
 int mtk_eint_do_init(struct mtk_eint *eint)
 {
-	unsigned int size, i, port, inst = 0;
+	unsigned int size, i, port, virq, inst = 0;
 	struct mtk_pinctrl *hw = (struct mtk_pinctrl *)eint->pctl;
 
 	/* If clients don't assign a specific regs, let's use generic one */
@@ -584,7 +584,7 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 		if (inst >= eint->nbase)
 			continue;
 		eint->pin_list[inst][eint->pins[i].index] = i;
-		int virq = irq_create_mapping(eint->domain, i);
+		virq = irq_create_mapping(eint->domain, i);
 		irq_set_chip_and_handler(virq, &mtk_eint_irq_chip,
 					 handle_level_irq);
 		irq_set_chip_data(virq, eint);
diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
index f7f58cca0d5e..0c6bf7cbdc3a 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.h
+++ b/drivers/pinctrl/mediatek/mtk-eint.h
@@ -66,7 +66,7 @@ struct mtk_eint_xt {
 struct mtk_eint {
 	struct device *dev;
 	void __iomem **base;
-	u8 nbase;
+	int nbase;
 	u16 *base_pin_num;
 	struct irq_domain *domain;
 	int irq;
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index d1556b75d9ef..0884c0700b3e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -381,10 +381,13 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 		return -ENOMEM;
 
 	count_reg_names = of_property_count_strings(np, "reg-names");
-	if (count_reg_names < hw->soc->nbase_names)
+	if (count_reg_names < 0)
+		return -EINVAL;
+
+	hw->eint->nbase = count_reg_names - (int)hw->soc->nbase_names;
+	if (hw->eint->nbase <= 0)
 		return -EINVAL;
 
-	hw->eint->nbase = count_reg_names - hw->soc->nbase_names;
 	hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
 					    sizeof(*hw->eint->base), GFP_KERNEL | __GFP_ZERO);
 	if (!hw->eint->base) {
-- 
2.46.0


