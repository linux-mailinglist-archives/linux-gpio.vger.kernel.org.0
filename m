Return-Path: <linux-gpio+bounces-15008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FB8A192FE
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 14:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A96431684C1
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 13:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28317213E80;
	Wed, 22 Jan 2025 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="X5jRbGgW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FC32135DB;
	Wed, 22 Jan 2025 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737553921; cv=none; b=o41c088n1go5cO7Up0LJXXWgIBo9pgwEcq/U/U/c9hg5i4aLRZ7MdIak/cgE5M/ZFckrIS8MgTrlT36mtrHwCCZ1xQQfEByqNsFXzvrLbDZ8za/SDQYN7GJjWrRcJSRICxiybqPr38IzUVqs/0EGaMqj84dz7F08fKCGdecWT/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737553921; c=relaxed/simple;
	bh=+Cn0WOnfJqCZTbaOmrJam3A5lGB5MTLcdW9nUOGa9pw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gIk9yGeC9oMkYQJtcJOZiZa2zJVfB56g7ghaQlS+ryEj8LDNtsUxQwrKc05GGDshMBlje7f2AGh5yPTCfYw65qqO817QvSDOdXlUHRa7CjvoLO+ErLiYtVA7Nhz7DSe6f8h5Av3mHLODKSLflSArUZM1PvakZFAQBBU7gEAciIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=X5jRbGgW; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0a97fbb6d8c811efbd192953cf12861f-20250122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=b5ekmF15/+fzo4PuU+c8z4+uaFDlYNigyE/Dwz+MhF0=;
	b=X5jRbGgW91u5907yM3CivA45jfa4AoR1GO7RBKh0g3xSgVT2O14cjw2/S3MyZjqbruiDIfFM0fV3HlYJE4yWys57mp4oNQWbFYukIA8QX4f9dHT9XoDVRV3IRFrJNqLryLlmzTeALpRFtIcjnrU1uoxRm2nZe5LtB4LGoQBbPwk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:951eb84e-a893-422c-8465-c678352d1118,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:d80fd7a9-a151-42b8-a6f0-8a479a6bae47,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0a97fbb6d8c811efbd192953cf12861f-20250122
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 856134441; Wed, 22 Jan 2025 21:51:55 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 22 Jan 2025 21:51:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 22 Jan 2025 21:51:53 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Hao
 Chang <ot_chhao.chang@mediatek.com>
Subject: [PATCH v2 2/3] pinctrl: mediatek: update EINT base retrieval method
Date: Wed, 22 Jan 2025 21:51:24 +0800
Message-ID: <20250122135135.15234-3-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250122135135.15234-1-ot_chhao.chang@mediatek.com>
References: <20250122135135.15234-1-ot_chhao.chang@mediatek.com>
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

Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 drivers/pinctrl/mediatek/mtk-eint.h           |  4 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 45 ++++++++++---------
 2 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
index 44360d97a34a..c1efdf02fb49 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.h
+++ b/drivers/pinctrl/mediatek/mtk-eint.h
@@ -64,7 +64,9 @@ struct mtk_eint_xt {
 
 struct mtk_eint {
 	struct device *dev;
-	void __iomem *base;
+	void __iomem **base;
+	u8 nbase;
+	u16 *base_pin_num;
 	struct irq_domain *domain;
 	int irq;
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 00e95682b9f8..6411c10cb637 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/of_irq.h>
 
 #include "mtk-eint.h"
@@ -367,34 +368,43 @@ static const struct mtk_eint_xt mtk_eint_xt = {
 int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	int ret;
+	unsigned int i, j, count_reg_names;
 
 	if (!IS_ENABLED(CONFIG_EINT_MTK))
 		return 0;
 
-	if (!of_property_read_bool(np, "interrupt-controller"))
+	if (!hw->soc->eint_hw)
 		return -ENODEV;
 
-	hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
+	count_reg_names = of_property_count_strings(np, "reg-names");
+	if (count_reg_names < 0 || count_reg_names < hw->soc->nbase_names)
+		return -EINVAL;
+
+	hw->eint = devm_kmalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
 	if (!hw->eint)
 		return -ENOMEM;
 
-	hw->eint->base = devm_platform_ioremap_resource_byname(pdev, "eint");
-	if (IS_ERR(hw->eint->base)) {
-		ret = PTR_ERR(hw->eint->base);
-		goto err_free_eint;
+	hw->eint->nbase = count_reg_names - hw->soc->nbase_names;
+	hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
+					    sizeof(*hw->eint->base), GFP_KERNEL);
+	if (!hw->eint->base)
+		return -ENOMEM;
+
+	for (i = hw->soc->nbase_names, j = 0; i < count_reg_names; i++, j++) {
+		hw->eint->base[j] = of_iomap(np, i);
+		if (IS_ERR(hw->eint->base[j]))
+			return PTR_ERR(hw->eint->base[j]);
 	}
 
+	if (!of_property_read_bool(np, "interrupt-controller"))
+		return -ENODEV;
+
 	hw->eint->irq = irq_of_parse_and_map(np, 0);
-	if (!hw->eint->irq) {
-		ret = -EINVAL;
-		goto err_free_eint;
-	}
+	if (!hw->eint->irq)
+		return -EINVAL;
 
-	if (!hw->soc->eint_hw) {
-		ret = -ENODEV;
-		goto err_free_eint;
-	}
+	if (hw->soc->eint_pin)
+		hw->eint->pins = hw->soc->eint_pin;
 
 	hw->eint->dev = &pdev->dev;
 	hw->eint->hw = hw->soc->eint_hw;
@@ -402,11 +412,6 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 	hw->eint->gpio_xlate = &mtk_eint_xt;
 
 	return mtk_eint_do_init(hw->eint);
-
-err_free_eint:
-	devm_kfree(hw->dev, hw->eint);
-	hw->eint = NULL;
-	return ret;
 }
 EXPORT_SYMBOL_GPL(mtk_build_eint);
 
-- 
2.34.1


