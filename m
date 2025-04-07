Return-Path: <linux-gpio+bounces-18333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8465DA7DCAC
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 13:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D272E1891362
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 11:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0905B2459CA;
	Mon,  7 Apr 2025 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IRw7hkQl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60119245038;
	Mon,  7 Apr 2025 11:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026501; cv=none; b=r9GUlkfEwinW8NCIHx9hd1Sq1L9PuMh+lObqt+5CjQOK0W4R31Dmjd5jMMuhRGjEWNJTZueFjsv/RFX3g2jsSeeR/2+1MVSihW2TaLLuxhCnpIQQuBvbO5qqb0b0JdH7wk3QIrAycmDQK4+ekT3d0NvgP47SlHgQ3gJRfTcuk3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026501; c=relaxed/simple;
	bh=muPUZ77kfA9Av545vi+9iJF31G7JcE9qkimniOnh6bM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rKbRYRM/BFA0CIbbJ+A0DAQS0amKKoSVaKrro224YZWOTHw6Emf1mo6VTymTosmreF86p4ZDve8soPs9xoPVMy5WK6VcUNFK8g+B5/TyIr6wFywWb8RSW5g4RC94S0nFwd+b0cSjFpils/Xb5Ce8/7GD7mBHPppCSg0YSirjGrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IRw7hkQl; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2f89303413a611f08eb9c36241bbb6fb-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=t45h2K/DAsVv7bzVikraPn5qJ6SE+6gaua4uz6B/apM=;
	b=IRw7hkQlIuW4iacbxGanHICLyJkARxqMMFg3T3Nt2aKPJSWqz4Rn8yfom2IYvIy12D2npwtzkgiYkBY1kCp4Pk7QqW3VDNe//ROqHcLgJfVOvAg/C4bCRH5cnPVvYjxSjfghJWoFOm9UFAZ29gp6QBHwecLHF/vIZRxvrJs0QCg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:6d15f2ca-5cfa-44b9-9cb9-c59d190e89f1,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:8ac80a4b-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2f89303413a611f08eb9c36241bbb6fb-20250407
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1001136366; Mon, 07 Apr 2025 19:48:13 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 19:48:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 19:48:10 +0800
From: Darren.Ye <darren.ye@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, Darren Ye
	<darren.ye@mediatek.com>
Subject: [PATCH 01/11] ASoC: mediatek: common: modify mtk afe common driver for mt8196
Date: Mon, 7 Apr 2025 19:47:14 +0800
Message-ID: <20250407114759.24835-3-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250407114759.24835-1-darren.ye@mediatek.com>
References: <20250407114759.24835-1-darren.ye@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Darren Ye <darren.ye@mediatek.com>

update the mtk_memif_set_channel interface for the mt8196 platform.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 23 +++++++++++++---------
 sound/soc/mediatek/common/mtk-afe-fe-dai.h |  1 +
 sound/soc/mediatek/common/mtk-base-afe.h   | 13 ++++++++++++
 3 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3809068f5620..caf703faf424 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -459,8 +459,13 @@ int mtk_memif_set_channel(struct mtk_base_afe *afe,
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	unsigned int mono;
 
-	if (memif->data->mono_shift < 0)
-		return 0;
+	dev_dbg(afe->dev, "id: %d, channel: %d\n", id, channel);
+
+	mono = memif->data->mono_invert ^ (channel == 1);
+
+	if (memif->data->mono_shift > 0)
+		mtk_regmap_update_bits(afe->regmap, memif->data->mono_reg,
+				       0x1, mono, memif->data->mono_shift);
 
 	if (memif->data->quad_ch_mask) {
 		unsigned int quad_ch = (channel == 4) ? 1 : 0;
@@ -470,11 +475,6 @@ int mtk_memif_set_channel(struct mtk_base_afe *afe,
 				       quad_ch, memif->data->quad_ch_shift);
 	}
 
-	if (memif->data->mono_invert)
-		mono = (channel == 1) ? 0 : 1;
-	else
-		mono = (channel == 1) ? 1 : 0;
-
 	/* for specific configuration of memif mono mode */
 	if (memif->data->int_odd_flag_reg)
 		mtk_regmap_update_bits(afe->regmap,
@@ -482,8 +482,13 @@ int mtk_memif_set_channel(struct mtk_base_afe *afe,
 				       1, mono,
 				       memif->data->int_odd_flag_shift);
 
-	return mtk_regmap_update_bits(afe->regmap, memif->data->mono_reg,
-				      1, mono, memif->data->mono_shift);
+	if (memif->data->ch_num_maskbit) {
+		mtk_regmap_update_bits(afe->regmap, memif->data->ch_num_reg,
+				       memif->data->ch_num_maskbit,
+				       channel, memif->data->ch_num_shift);
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_memif_set_channel);
 
diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.h b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
index b6d0f2b27e86..b720c1dd8012 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.h
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
@@ -12,6 +12,7 @@
 struct snd_soc_dai_ops;
 struct mtk_base_afe;
 struct mtk_base_afe_memif;
+struct mtk_base_irq_data;
 
 int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 		       struct snd_soc_dai *dai);
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index f51578b6c50a..01c27fe92e2f 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -53,9 +53,11 @@ struct mtk_base_memif_data {
 	int enable_reg;
 	int enable_shift;
 	int hd_reg;
+	int hd_mask;
 	int hd_shift;
 	int hd_align_reg;
 	int hd_align_mshift;
+	int hd_msb_shift;
 	int msb_reg;
 	int msb_shift;
 	int msb_end_reg;
@@ -65,6 +67,10 @@ struct mtk_base_memif_data {
 	int ch_num_reg;
 	int ch_num_shift;
 	int ch_num_maskbit;
+	/* VUL 24~26 only for CM2 */
+	int out_on_use_reg;
+	int out_on_use_mask;
+	int out_on_use_shift;
 	/* playback memif only */
 	int pbuf_reg;
 	int pbuf_mask;
@@ -72,6 +78,9 @@ struct mtk_base_memif_data {
 	int minlen_reg;
 	int minlen_mask;
 	int minlen_shift;
+	int maxlen_reg;
+	int maxlen_mask;
+	int maxlen_shift;
 };
 
 struct mtk_base_irq_data {
@@ -87,6 +96,10 @@ struct mtk_base_irq_data {
 	int irq_clr_reg;
 	int irq_clr_shift;
 	int irq_status_shift;
+	int irq_ap_en_reg;
+	int irq_ap_en_shift;
+	int irq_scp_en_reg;
+	int irq_scp_en_shift;
 };
 
 struct device;
-- 
2.45.2


