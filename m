Return-Path: <linux-gpio+bounces-16564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6092CA441F8
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 15:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 578AD1730C4
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 14:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F6126B08D;
	Tue, 25 Feb 2025 14:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ejpbwUCX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061DE26A1AA;
	Tue, 25 Feb 2025 14:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740492473; cv=none; b=s1BQ0zTH4uJoISqzSEgOE3RIYVT3eKiCbbooJnkcUpl+po2SLpUwi97yZYTBPXfVRaxK5n6H50DLfE4W2jWURGPMw1L7ffP77AR5tqbwNeCxwzp+OHyEwmBjak2oAASyQH1d8AB6Wi5k8pAkxlos9kLU8+hKv55pW5ZxseWoiww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740492473; c=relaxed/simple;
	bh=o6TbePaam4xGXeBcOBdXz+AxshT2EUUB32WdbgZv1nM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BdpPDEe6e97diLZXLeIiW11FjLxA6mxc8gHEFhycgJUBx+QD4R6O5zB1cOdCZpX9DrCk88e9l+Nazk+zKWzjeh0ZHe80N5K248k9ZG8usr2yULPoG7W0v4rpKpW46CqyHq94tE17ZPUF4h+jLrCmqtNfG4En6eQw7kmnZolL3LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ejpbwUCX; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e3bcf17af38111efaae1fd9735fae912-20250225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3Qi8cCPLaX4275PMkDxz1m99StqNcEg9glNxJpwmiy8=;
	b=ejpbwUCXiaPCc8W7zllBoyLbngSTIPeTBJOzUMNlpyUdgB8SsP0GR4ibkJ+zfQVcH1nEBwUuxIeeOl+e+cRWf3CIpqbBV7QiL1AuKbBo6LWUho1XF9pH/jyOMOHwDMnix4bkQdA8kxdi+MWn+de7Z4yqewcxOiqNaGcTFaE0gNE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:299d53d2-76d7-472c-8a90-92ab010ed24b,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:89fb8fb5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e3bcf17af38111efaae1fd9735fae912-20250225
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 222217389; Tue, 25 Feb 2025 22:07:46 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 25 Feb 2025 22:07:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 25 Feb 2025 22:07:44 +0800
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
Subject: [PATCH v4 2/3] pinctrl: mediatek: modify the method of obtaining eint address
Date: Tue, 25 Feb 2025 22:07:23 +0800
Message-ID: <20250225140732.21557-3-ot_chhao.chang@mediatek.com>
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

Increase nbase for address counting and pin number for calculating
pin count on address.

Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 drivers/pinctrl/mediatek/mtk-eint.h           |  4 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 49 ++++++++++++++-----
 2 files changed, 40 insertions(+), 13 deletions(-)

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
index 00e95682b9f8..9e87dddafb12 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/of_irq.h>
 
 #include "mtk-eint.h"
@@ -367,21 +368,40 @@ static const struct mtk_eint_xt mtk_eint_xt = {
 int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	int ret;
+	int ret, i, j, count_reg_names;
 
 	if (!IS_ENABLED(CONFIG_EINT_MTK))
 		return 0;
 
-	if (!of_property_read_bool(np, "interrupt-controller"))
+	if (!hw->soc->eint_hw)
 		return -ENODEV;
 
-	hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
+	count_reg_names = of_property_count_strings(np, "reg-names");
+	if (count_reg_names < hw->soc->nbase_names)
+		return -EINVAL;
+
+	hw->eint = devm_kmalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
 	if (!hw->eint)
 		return -ENOMEM;
 
-	hw->eint->base = devm_platform_ioremap_resource_byname(pdev, "eint");
-	if (IS_ERR(hw->eint->base)) {
-		ret = PTR_ERR(hw->eint->base);
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
+	}
+
+	if (!of_property_read_bool(np, "interrupt-controller")) {
+		ret = -ENODEV;
 		goto err_free_eint;
 	}
 
@@ -391,19 +411,24 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 		goto err_free_eint;
 	}
 
-	if (!hw->soc->eint_hw) {
-		ret = -ENODEV;
-		goto err_free_eint;
-	}
-
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
-- 
2.46.0


