Return-Path: <linux-gpio+bounces-18350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AB4A7DD48
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 14:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD06C1764EA
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 12:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB262459E0;
	Mon,  7 Apr 2025 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NM5kFFib"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B353922DFAB;
	Mon,  7 Apr 2025 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027858; cv=none; b=ki65XrmDMk5YJNSMM/JWidcgCG8u/bZGSABnwi42YD2Oj6QhhxSXJ6s3hF4ASs3j44mOJJ8/zdm+CFQ0sUNRMliTQTIPxhIswtQ9pxsUW7q6lfGHuNlPTTdT6u0q9BJ0YLU+GlnxHkbof3HO5YaWrgiwJhJx/BK82yw8uVQ+NA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027858; c=relaxed/simple;
	bh=KftcZJazIWdYCu6rKdUa6TZNUiTn2x/2NQcRHKN6gxQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k0NbRQsQYKfthNvQHE4hVd+y9p3Z9KBYAajLeqDMb9Q515lD76eOk/v+x9zXj+OlUN8khDaXj+lv9rDZTlXQxXXIss6KhkE5+yOI9yki3UgTpjjXnoq2zbJ79tOFbAWWMSUGaR3atUqou07iVairtprHZMLP4ZqUdZRGR0cW2J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NM5kFFib; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 57b2642e13a911f0aae1fd9735fae912-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HYC8Ft7WO/9ijtWK9sD+DX7+Mw9W4ec8Qkcd3+7kWEo=;
	b=NM5kFFibFY/BQebPR2xBeTJOZw5y2rtDRz/W1W1+++6zlPMSI6fpAz1jN4LhIn6wJDlwaWDJr6ezfqWPDiJbnZ7LfiIpiaC5aY9CGIXjOV7MARTlGgDgcWERy5nS9JkuIXL2+C3YR2ltrEF/XQyDmNCDjdWDQNpfTe5kDuS4vKQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b5fa4663-0a55-4a07-8475-cc5913a9c017,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:d4d74e8d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 57b2642e13a911f0aae1fd9735fae912-20250407
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1587093632; Mon, 07 Apr 2025 20:10:49 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 20:10:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 20:10:46 +0800
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
Subject: [PATCH v2 02/11] ASoC: mediatek: common: modify mtk afe platform driver for mt8196
Date: Mon, 7 Apr 2025 20:06:26 +0800
Message-ID: <20250407120708.26495-3-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250407120708.26495-1-darren.ye@mediatek.com>
References: <20250407120708.26495-1-darren.ye@mediatek.com>
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
 .../mediatek/common/mtk-afe-platform-driver.c | 47 ++++++++++++-------
 .../mediatek/common/mtk-afe-platform-driver.h |  2 +
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 6b6330583941..a86594dca2b7 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -86,29 +86,44 @@ snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
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
 
diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.h b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
index fcc923b88f12..9809e60db511 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
@@ -12,6 +12,8 @@
 #define AFE_PCM_NAME "mtk-afe-pcm"
 extern const struct snd_soc_component_driver mtk_afe_pcm_platform;
 
+#define MTK_WORD_SIZE_ALIGN(x) ((x) & (0xfffffffff0))
+
 struct mtk_base_afe;
 struct snd_pcm;
 struct snd_soc_component;
-- 
2.45.2


