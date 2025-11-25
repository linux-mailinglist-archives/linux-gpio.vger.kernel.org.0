Return-Path: <linux-gpio+bounces-29055-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A1BC831C3
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 03:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3D97634B657
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 02:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CB11DF273;
	Tue, 25 Nov 2025 02:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="F1OGCNsZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0912A1BF;
	Tue, 25 Nov 2025 02:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764038215; cv=none; b=o31H5ZgvDaveQm7waJalTtiqXnlAjV+oQVe8uQoT5YvcQ2wsbbbgtTWpNw6y+eiiNCwJi3EAMNXzaA4adICXk7N40cbqGMCb/GnKJy9D5Z6UERi3IevMSCGeXDjiHtJI2uMvZrjjlx9AUUCk423ytbUTLwBPqtspWz3XUqtB6PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764038215; c=relaxed/simple;
	bh=lROLs2uHTfOwuLUqkzZVSKJCL76Ah2DTCEJimRLS+3M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZkDlxY7pdABZinq+XDUl6/8YDdd6odNk8i8urG5wj7PZyGWN6ZRQ0K16Re1W+zDhGRjr1UxYgp49kkuHoKugEPI4aiBV0dSMhtQLfpGc+Rur3WncWoKcliT2bWWP60VavOoUeUzJ/KfToOCgRbaOmBKCitRWG7HRu00tswPlGCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=F1OGCNsZ; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9588c130c9a711f0b33aeb1e7f16c2b6-20251125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=o6QtJlfCbi2vmRizwzAAbAg9tkpq0rLQMlJsmLOUvTE=;
	b=F1OGCNsZPRhYg/zCFEgczClQKEdyld1019ueJCFR1GT/j8lHBNEOvNMwweupXxwXhIaTltpf5aIMDFX9JeHoCGqvUz8G7wYtH3XlQHmfI4Uz6mDe0zwt027rQHEaeZ72NCf+jSRsn702LUL5fngorx5pa2nN0GcMM60Efkc1Fio=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:0715351e-745b-4b0b-a737-18a7adcf8a11,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:1e650283-b6af-4b29-9981-6bf838f9504d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9588c130c9a711f0b33aeb1e7f16c2b6-20251125
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <lei.xue@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1269316375; Tue, 25 Nov 2025 10:36:45 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 25 Nov 2025 10:36:43 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 25 Nov 2025 10:36:43 +0800
From: Lei Xue <lei.xue@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<yong.mao@mediatek.com>, <lei.xue@mediatek.com>, <qingliang.li@mediatek.com>,
	<Fred-WY.Chen@mediatek.com>, <ot_cathy.xu@mediatek.com>,
	<ot_shunxi.zhang@mediatek.com>, <ot_yaoy.wang@mediatek.com>,
	<ot_ye.wang@mediatek.com>
Subject: [PATCH 2/3] pinctrl: mediatek: Add acpi support
Date: Tue, 25 Nov 2025 10:36:35 +0800
Message-ID: <20251125023639.2416546-3-lei.xue@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125023639.2416546-1-lei.xue@mediatek.com>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add acpi support in the common part of pinctrl driver. Parsing
hardware base addresses and irq number to initialize eint
accroding to the acpi table data.

Signed-off-by: Lei Xue <lei.xue@mediatek.com>
---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 24 +++++++++++++++----
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  6 +++--
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 4918d38abfc2..afa406afead2 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -369,18 +369,30 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	int ret, i, j, count_reg_names;
+	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
+	struct resource *res;
 
 	if (!IS_ENABLED(CONFIG_EINT_MTK))
 		return 0;
 
-	if (!of_property_read_bool(np, "interrupt-controller"))
+	if (is_of_node(fwnode) && !of_property_read_bool(np, "interrupt-controller"))
 		return -ENODEV;
 
 	hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
 	if (!hw->eint)
 		return -ENOMEM;
 
-	count_reg_names = of_property_count_strings(np, "reg-names");
+	if (is_of_node(fwnode)) {
+		count_reg_names = of_property_count_strings(np, "reg-names");
+	} else {
+		count_reg_names = 0;
+		for (i = 0; i < pdev->num_resources; i++) {
+			struct resource *r = &pdev->resource[i];
+
+			if (resource_type(r) == IORESOURCE_MEM)
+				count_reg_names++;
+		}
+	}
 	if (count_reg_names < 0)
 		return -EINVAL;
 
@@ -396,14 +408,18 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 	}
 
 	for (i = hw->soc->nbase_names, j = 0; i < count_reg_names; i++, j++) {
-		hw->eint->base[j] = of_iomap(np, i);
+		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
+		hw->eint->base[j] = is_of_node(fwnode) ? of_iomap(np, i) :
+					ioremap(res->start, resource_size(res));
 		if (IS_ERR(hw->eint->base[j])) {
 			ret = PTR_ERR(hw->eint->base[j]);
 			goto err_free_eint;
 		}
 	}
 
-	hw->eint->irq = irq_of_parse_and_map(np, 0);
+	hw->eint->irq = is_of_node(fwnode)
+			? irq_of_parse_and_map(np, 0)
+			: platform_get_irq(pdev, 0);
 	if (!hw->eint->irq) {
 		ret = -EINVAL;
 		goto err_free_eint;
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 2cf61cfe809e..9c2751b9b065 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -1008,6 +1008,7 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct pinctrl_pin_desc *pins;
 	struct mtk_pinctrl *hw;
+	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 	int err, i;
 
 	hw = devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
@@ -1032,8 +1033,9 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < hw->soc->nbase_names; i++) {
-		hw->base[i] = devm_platform_ioremap_resource_byname(pdev,
-					hw->soc->base_names[i]);
+		hw->base[i] = is_of_node(fwnode)
+			? devm_platform_ioremap_resource_byname(pdev, hw->soc->base_names[i])
+			: devm_platform_get_and_ioremap_resource(pdev, i, NULL);
 		if (IS_ERR(hw->base[i]))
 			return PTR_ERR(hw->base[i]);
 	}
-- 
2.45.2


