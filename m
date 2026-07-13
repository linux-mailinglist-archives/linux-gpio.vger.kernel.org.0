Return-Path: <linux-gpio+bounces-39956-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lJldMAukVGqgogMAu9opvQ
	(envelope-from <linux-gpio+bounces-39956-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:38:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C13748CD3
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:38:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=HlDCpqMp;
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39956-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39956-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0A88300ACA1
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 08:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7333A3B777F;
	Mon, 13 Jul 2026 08:38:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399683B5837;
	Mon, 13 Jul 2026 08:38:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931904; cv=none; b=BKDMkwWX3yt713i7+3AfiGc6UrbIt89vGMZ/jF52iFjB1LOKjs6NbBKwkw0IGPaKYD4gY6aGcmE/oNpYZhFCM93wjvSUpTsDFLHiaGdnPiXEU7Y7UGT++CymO4oxywEBl5wInUz848S+Vgw02vqXO4ABRR9DQxRp5sRL4YGUb00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931904; c=relaxed/simple;
	bh=ZVDJmuFMKz0DC3PvrMlK7WoZjGCAQIAawo3qSpVtMuo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9rGz/BZxNGWqLVRXqct42RCy6TXLtAgm6UczV07atgSokwBRNvfp6ct8SDaTy45vxrju+BOnwgjgP4PvFVVXF8vWXsP1uo9ikheifKA4VVzAwTyJqxZw2eZWc1WKalSMuGIhFBeZRFn0e1rB/xvdQzkBBZFoOhqjbg7PANQFxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HlDCpqMp; arc=none smtp.client-ip=210.61.82.184
X-UUID: 307ec97a7e9611f18dc8c9802ae25ab1-20260713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kl7+mc2oAYcNRZ648KTKzRhgvWfW5JNgBpw4aDm/2MQ=;
	b=HlDCpqMpWTFK7j4RiUERh4RszOrI5mOX1oKL74yjglrCxQ0RWuoDp7yHPYX7qgCwVR08F4gm0qJMVfqwTI9PvZzYHx+iSN1BkE7Qv6zLA1kIhQDqVzNzRW1X68XPQU7Y32Pl5U3fxElsws3T0ezVHZM1SkKem649NVcTAxqm62Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:e3f8023e-9396-4c05-9c1b-5866906490dc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:73b2a255-f38b-430b-a6f2-741debd53b1f,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 307ec97a7e9611f18dc8c9802ae25ab1-20260713
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2048954005; Mon, 13 Jul 2026 16:38:14 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 13 Jul 2026 16:38:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 13 Jul 2026 16:38:13 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v6 1/5] pinctrl: mediatek: use devm_gpiochip_add_data() for GPIO chip
Date: Mon, 13 Jul 2026 16:37:53 +0800
Message-ID: <20260713083808.168957-2-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260713083808.168957-1-justin.yeh@mediatek.com>
References: <20260713083808.168957-1-justin.yeh@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[justin.yeh@mediatek.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39956-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sean.wang@kernel.org,m:linusw@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:linux-mediatek@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:justin.yeh@mediatek.com,m:wenst@chromium.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justin.yeh@mediatek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5C13748CD3

The gpio_chip is allocated with device-managed memory but registered with
the non-managed gpiochip_add_data(). This was harmless while the drivers
were built-in, but once they can be built as modules and unbound/rmmod'd,
devm frees the gpio_chip's memory while it is still registered, causing a
use-after-free.

Register it with devm_gpiochip_add_data() so it shares the same
device-managed lifecycle, which also lets the manual gpiochip_remove()
error paths go away.

Fixes: a6df410d420a ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt8135.")
Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
Fixes: e78d57b2f87c ("pinctrl: mediatek: add pinctrl-moore that implements the generic pinctrl dt-bindings")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c      |  6 ++----
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 14 ++++----------
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  2 +-
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 17e30f83dc19..38f15dbe9a28 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -594,7 +594,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->base		= -1;
 	chip->ngpio		= hw->soc->npins;
 
-	ret = gpiochip_add_data(chip, hw);
+	ret = devm_gpiochip_add_data(hw->dev, chip, hw);
 	if (ret < 0)
 		return ret;
 
@@ -608,10 +608,8 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	if (!of_property_present(hw->dev->of_node, "gpio-ranges")) {
 		ret = gpiochip_add_pin_range(chip, dev_name(hw->dev), 0, 0,
 					     chip->ngpio);
-		if (ret < 0) {
-			gpiochip_remove(chip);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index dd2c8aa03938..791eddd7a2c6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1130,30 +1130,24 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	pctl->chip->parent = &pdev->dev;
 	pctl->chip->base = -1;
 
-	ret = gpiochip_add_data(pctl->chip, pctl);
+	ret = devm_gpiochip_add_data(&pdev->dev, pctl->chip, pctl);
 	if (ret)
 		return -EINVAL;
 
 	/* Register the GPIO to pin mappings. */
 	ret = gpiochip_add_pin_range(pctl->chip, dev_name(&pdev->dev),
 			0, 0, pctl->devdata->npins);
-	if (ret) {
-		ret = -EINVAL;
-		goto chip_error;
-	}
+	if (ret)
+		return -EINVAL;
 
 	/* Only initialize EINT if we have EINT pins */
 	if (data->eint_hw.ap_num > 0) {
 		ret = mtk_eint_init(pctl, pdev);
 		if (ret)
-			goto chip_error;
+			return ret;
 	}
 
 	return 0;
-
-chip_error:
-	gpiochip_remove(pctl->chip);
-	return ret;
 }
 
 int mtk_pctrl_common_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 23f04b24fd65..09098b68f725 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -957,7 +957,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->base		= -1;
 	chip->ngpio		= hw->soc->npins;
 
-	ret = gpiochip_add_data(chip, hw);
+	ret = devm_gpiochip_add_data(hw->dev, chip, hw);
 	if (ret < 0)
 		return ret;
 
-- 
2.45.2


