Return-Path: <linux-gpio+bounces-15047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDC1A1B735
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2025 14:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A07E61642FD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2025 13:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751C078F29;
	Fri, 24 Jan 2025 13:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Wym0Oyjw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D8E4AEE2;
	Fri, 24 Jan 2025 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737726070; cv=none; b=fNyS63ubrZ3T4OLrsnkjb9hb40fGX5k0pocoyset7WrZXpB3+c/nNgKbgWkz3sQe/uXxG59eBgm4wJVGUrw56ZXoYyImJWadmuFy5TgkWTk3Wneh8OpppkW0uV6SElwOyrrUAIGwwY89XfyYXUt+csj09KnHeojSfIUaLOD7Lgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737726070; c=relaxed/simple;
	bh=dLonNhI7NkQyBIyIgOCDzUB+e6joMkqam4L7soGDxUM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LtTpR0TZ4fddIfq63O1sO8WpVIGEzWg2UZWEim0mYW4By8fi9kPPJvdK3qAG+BeGqOpGxq7uZcNycUbl6ATEg2P4U1wiKo4oFw5c9a3OxgexErsUNlKVtLRv3DtoxKqUKtac8/5aT6McMA1rRe1bi465TQ24JN84dGZuzoKNvT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Wym0Oyjw; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d96e963eda5811efbd192953cf12861f-20250124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mxd6y8xWCXx2qwD35/Qus8yO+IDrLVV1lvVQaT0RaxQ=;
	b=Wym0OyjwpBcFlmioi5P+U0EZINCrySu9eMiWju42iWXRIeiFtSkxCCCmDreRCf9p9zWsHGzrX6SYHM1zbeg/9TBTz+vJHKwFmETsnHPHoXbQlttGIw7sGXjkhAyAYkmXPS2QdmoXaceDs4nfYPJDsEGXuJRlmbcghCNOZ3sJ0Vk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:c4f1de46-66cc-4625-b946-52ef10d587e6,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:3a17c0fe-c190-4cfe-938d-595d7f10e0dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d96e963eda5811efbd192953cf12861f-20250124
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1147173618; Fri, 24 Jan 2025 21:41:01 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 24 Jan 2025 21:40:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 24 Jan 2025 21:40:59 +0800
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
Subject: [PATCH v3 1/2] pinctrl: mediatek: update EINT base retrieval method
Date: Fri, 24 Jan 2025 21:40:13 +0800
Message-ID: <20250124134025.2666-2-ot_chhao.chang@mediatek.com>
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

Change the method of obtaining the EINT base from a single value to
multiple values.
Modify the EINT base and add nbase for counting.

Change-Id: I708f2eaa4c57b5705201025c252a7122914c4a40
Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 50 +++++++++++++------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 6411c10cb637..e74fc68f631d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -368,7 +368,7 @@ static const struct mtk_eint_xt mtk_eint_xt = {
 int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	unsigned int i, j, count_reg_names;
+	int ret, i, j, count_reg_names;
 
 	if (!IS_ENABLED(CONFIG_EINT_MTK))
 		return 0;
@@ -377,7 +377,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 		return -ENODEV;
 
 	count_reg_names = of_property_count_strings(np, "reg-names");
-	if (count_reg_names < 0 || count_reg_names < hw->soc->nbase_names)
+	if (count_reg_names < hw->soc->nbase_names)
 		return -EINVAL;
 
 	hw->eint = devm_kmalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
@@ -385,33 +385,53 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 		return -ENOMEM;
 
 	hw->eint->nbase = count_reg_names - hw->soc->nbase_names;
-	hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
+	hw->eint->base = devm_kmalloc_array(hw->dev, hw->eint->nbase,
 					    sizeof(*hw->eint->base), GFP_KERNEL);
-	if (!hw->eint->base)
-		return -ENOMEM;
+	if (!hw->eint->base) {
+		ret = -ENOMEM;
+		goto err_free_eint;
+	}
 
 	for (i = hw->soc->nbase_names, j = 0; i < count_reg_names; i++, j++) {
 		hw->eint->base[j] = of_iomap(np, i);
-		if (IS_ERR(hw->eint->base[j]))
-			return PTR_ERR(hw->eint->base[j]);
+		if (IS_ERR(hw->eint->base[j])) {
+			ret = PTR_ERR(hw->eint->base[j]);
+			goto err_free_eint;
+		}
 	}
 
-	if (!of_property_read_bool(np, "interrupt-controller"))
-		return -ENODEV;
+	if (!of_property_read_bool(np, "interrupt-controller")) {
+		ret = -ENODEV;
+		goto err_free_eint;
+	}
 
 	hw->eint->irq = irq_of_parse_and_map(np, 0);
-	if (!hw->eint->irq)
-		return -EINVAL;
-
-	if (hw->soc->eint_pin)
-		hw->eint->pins = hw->soc->eint_pin;
+	if (!hw->eint->irq) {
+		ret = -EINVAL;
+		goto err_free_eint;
+	}
 
 	hw->eint->dev = &pdev->dev;
 	hw->eint->hw = hw->soc->eint_hw;
 	hw->eint->pctl = hw;
 	hw->eint->gpio_xlate = &mtk_eint_xt;
 
-	return mtk_eint_do_init(hw->eint);
+	ret = mtk_eint_do_init(hw->eint);
+	if (ret)
+		goto err_free_eint;
+
+	return 0;
+
+err_free_eint:
+	for (j = 0; j < hw->eint->nbase; j++) {
+		if (hw->eint->base[j])
+			iounmap(hw->eint->base[j]);
+	}
+	if (hw->eint->base)
+		devm_kfree(hw->dev, hw->eint->base);
+	devm_kfree(hw->dev, hw->eint);
+	hw->eint = NULL;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(mtk_build_eint);
 
-- 
2.46.0


