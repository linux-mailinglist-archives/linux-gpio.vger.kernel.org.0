Return-Path: <linux-gpio+bounces-17237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03980A5681D
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 13:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25E043B63C8
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 12:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F8B21A444;
	Fri,  7 Mar 2025 12:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bh8Wr3+r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16182219E86;
	Fri,  7 Mar 2025 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741351739; cv=none; b=E2SXsi083BblsHCjV0Q/drwTHymfCCm5IaMGmS2J++w37zH3ol4TZKg3+ZwvrFLtPSg4xgVq9w6a+QdIgfTZoFKNh8Lq7sg0IimxGz17RV18W2W9U/HHabQv1XU7BnKRjsA/EDZF3Fg98t3lqX34zFrRIN3+nr5ev8wxsH+uAFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741351739; c=relaxed/simple;
	bh=v+QgEBCJaWBHNdtn2c04pc83vclqiqIb3idMFL/gt+w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AkL+GMK866yrFyP2+XayeoAXQQ2oAemCA0ZYpH4Edj3Bd3521orBWvmKPhEFTKQ74zGzVrKvIh4uIoeSiLSie9MtZHAKY6O0rvRxsEMaCR7UXOCKgA7NklK3ZDBFZs/U+By3wUoDwVdO29b46nDBi3CLlgJ5J3g0VtKVEdK0EIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bh8Wr3+r; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 85514bb2fb5211efaae1fd9735fae912-20250307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=skVloWfjYX0Udap1CoSYzWq4P8c37FUFZ0XtJToyWgY=;
	b=bh8Wr3+rqZIHuPzwFMKs8tSX6XCy6L0ksqKEP44Dh2x+DQrW0RSG9c2gDBYE5aQfAH2b7LiwLYGnDQ2Nh4qvCIqH4vKJCU3fMWSd38iLGx2JpYyj/2edNnzE9sFE39kbcatEUgz4owR7vB6WZvZyaLFP1qZea8EjBP++9Z628v0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:0842d9a9-f76a-4aeb-9559-8cd21b078d09,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:a9ca0dc6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 85514bb2fb5211efaae1fd9735fae912-20250307
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1518708304; Fri, 07 Mar 2025 20:48:51 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 20:48:50 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 20:48:49 +0800
From: Darren.Ye <darren.ye@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, Darren Ye
	<darren.ye@mediatek.com>
Subject: [PATCH 02/14] ASoC: mediatek: common: modify mtk afe platform driver for mt8196
Date: Fri, 7 Mar 2025 20:47:28 +0800
Message-ID: <20250307124841.23777-3-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307124841.23777-1-darren.ye@mediatek.com>
References: <20250307124841.23777-1-darren.ye@mediatek.com>
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

Mofify the pcm pointer interface to support 64-bit address access.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 .../mediatek/common/mtk-afe-platform-driver.c | 63 ++++++++++++++-----
 .../mediatek/common/mtk-afe-platform-driver.h |  5 ++
 2 files changed, 52 insertions(+), 16 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 6b6330583941..5d8f4421e665 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -77,6 +77,16 @@ int mtk_afe_add_sub_dai_control(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(mtk_afe_add_sub_dai_control);
 
+int mtk_afe_pcm_open(struct snd_soc_component *component,
+		     struct snd_pcm_substream *substream)
+{
+	/* set the wait_for_avail to 2 sec*/
+	substream->wait_time = msecs_to_jiffies(2 * 1000);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_afe_pcm_open);
+
 snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream)
 {
@@ -86,29 +96,44 @@ snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
 	const struct mtk_base_memif_data *memif_data = memif->data;
 	struct regmap *regmap = afe->regmap;
 	struct device *dev = afe->dev;
-	int reg_ofs_base = memif_data->reg_ofs_base;
-	int reg_ofs_cur = memif_data->reg_ofs_cur;
-	unsigned int hw_ptr = 0, hw_base = 0;
-	int ret, pcm_ptr_bytes;
-
-	ret = regmap_read(regmap, reg_ofs_cur, &hw_ptr);
-	if (ret || hw_ptr == 0) {
-		dev_err(dev, "%s hw_ptr err\n", __func__);
-		pcm_ptr_bytes = 0;
+	unsigned int hw_ptr_lower32 = 0, hw_ptr_upper32 = 0;
+	unsigned int hw_base_lower32 = 0, hw_base_upper32 = 0;
+	unsigned long long hw_ptr = 0, hw_base = 0;
+	int ret;
+	unsigned long long pcm_ptr_bytes = 0;
+
+	ret = regmap_read(regmap, memif_data->reg_ofs_cur, &hw_ptr_lower32);
+	if (ret || hw_ptr_lower32 == 0) {
+		dev_err(dev, "%s hw_ptr_lower32 err\n", __func__);
 		goto POINTER_RETURN_FRAMES;
 	}
 
-	ret = regmap_read(regmap, reg_ofs_base, &hw_base);
-	if (ret || hw_base == 0) {
-		dev_err(dev, "%s hw_ptr err\n", __func__);
-		pcm_ptr_bytes = 0;
-		goto POINTER_RETURN_FRAMES;
+	if (memif_data->reg_ofs_cur_msb) {
+		ret = regmap_read(regmap, memif_data->reg_ofs_cur_msb, &hw_ptr_upper32);
+		if (ret) {
+			dev_err(dev, "%s hw_ptr_upper32 err\n", __func__);
+			goto POINTER_RETURN_FRAMES;
+		}
 	}
 
-	pcm_ptr_bytes = hw_ptr - hw_base;
+	ret = regmap_read(regmap, memif_data->reg_ofs_base, &hw_base_lower32);
+	if (ret || hw_base_lower32 == 0) {
+		dev_err(dev, "%s hw_base_lower32 err\n", __func__);
+		goto POINTER_RETURN_FRAMES;
+	}
+	if (memif_data->reg_ofs_base_msb) {
+		ret = regmap_read(regmap, memif_data->reg_ofs_base_msb, &hw_base_upper32);
+		if (ret) {
+			dev_err(dev, "%s hw_base_upper32 err\n", __func__);
+			goto POINTER_RETURN_FRAMES;
+		}
+	}
+	hw_ptr = ((unsigned long long)hw_ptr_upper32 << 32) + hw_ptr_lower32;
+	hw_base = ((unsigned long long)hw_base_upper32 << 32) + hw_base_lower32;
 
 POINTER_RETURN_FRAMES:
-	return bytes_to_frames(substream->runtime, pcm_ptr_bytes);
+	pcm_ptr_bytes = MTK_WORD_SIZE_ALIGN(hw_ptr - hw_base);
+	return bytes_to_frames(substream->runtime, (ssize_t)pcm_ptr_bytes);
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_pointer);
 
@@ -143,6 +168,12 @@ static int mtk_afe_component_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+void mtk_afe_pcm_free(struct snd_soc_component *component, struct snd_pcm *pcm)
+{
+	snd_pcm_lib_preallocate_free_for_all(pcm);
+}
+EXPORT_SYMBOL_GPL(mtk_afe_pcm_free);
+
 const struct snd_soc_component_driver mtk_afe_pcm_platform = {
 	.name		= AFE_PCM_NAME,
 	.pointer	= mtk_afe_pcm_pointer,
diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.h b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
index fcc923b88f12..948998968a45 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
@@ -12,15 +12,20 @@
 #define AFE_PCM_NAME "mtk-afe-pcm"
 extern const struct snd_soc_component_driver mtk_afe_pcm_platform;
 
+#define MTK_WORD_SIZE_ALIGN(x) ((x) & (0xfffffffff0))
+
 struct mtk_base_afe;
 struct snd_pcm;
 struct snd_soc_component;
 struct snd_soc_pcm_runtime;
 
+int mtk_afe_pcm_open(struct snd_soc_component *component,
+		     struct snd_pcm_substream *substream);
 snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream);
 int mtk_afe_pcm_new(struct snd_soc_component *component,
 		    struct snd_soc_pcm_runtime *rtd);
+void mtk_afe_pcm_free(struct snd_soc_component *component, struct snd_pcm *pcm);
 
 int mtk_afe_combine_sub_dai(struct mtk_base_afe *afe);
 int mtk_afe_add_sub_dai_control(struct snd_soc_component *component);
-- 
2.45.2


