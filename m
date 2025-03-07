Return-Path: <linux-gpio+bounces-17238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8255EA5681F
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 13:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA7A53B6775
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 12:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754BF21ABA2;
	Fri,  7 Mar 2025 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZECAXa76"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CE320E713;
	Fri,  7 Mar 2025 12:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741351746; cv=none; b=VWi+tU1F5zsORLmjJHtQIWeqnJqzrgdIRoamX+F+K3X0GYsSAbGZCrOJpLNge3aDW31+rC8hSP8pH26cB2aZWGe8K5Jqvv3NeiyChiC/58wWP9QYZ+pU97TvZ4KhW0cZMZBRemhO56xVdFrbh08JFMRZLZDFGyjHG6ppjwJLYRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741351746; c=relaxed/simple;
	bh=nxW8gV48YW5n/O/O9pjGH+DjJKmvdmlG+4UYrYasoBk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y73YzrXeMzI/1Fs4/cMo41mMSqqNARrkMfV1YKK8rzmviXyA0MBsYPTEIeCwG3NSURg2h94AJj7ZPoNsgAmFnL/v1ne4CMRSP4pDhl/+Ru3/qYNF4sbyULh659eHPcAEpxfJxDhqHZqReFnEUMMNqrJi1KL5GpitqU/iwAQO1tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ZECAXa76; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8866db1efb5211efaae1fd9735fae912-20250307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3YKZgSoMuTXktamYFQTdo3ZV/YxOMNDKsaOxZk019Kc=;
	b=ZECAXa767BcFHiJMBToLMtyuqrBSeeXcyRVCVfJRCpiTsRWbMsq0JnHx9yI7Okg46OPTkfnsjxhmmzcHwOyknDpV8FqMBZdyt6sunjMp7RZ3QQjV/Gtf3tyDidpzJLcBk56FbbKTtgYWpMqoaiUS7rhYRU1+wY9sow/XU5sJQ6k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:45c339c5-c85e-4b99-844c-7315d05bb0b0,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:0753168c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8866db1efb5211efaae1fd9735fae912-20250307
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 464746380; Fri, 07 Mar 2025 20:48:56 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 20:48:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 20:48:54 +0800
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
Subject: [PATCH 04/14] ASoC: mediatek: mt8196: add common interface for mt8196 DAI driver
Date: Fri, 7 Mar 2025 20:47:30 +0800
Message-ID: <20250307124841.23777-5-darren.ye@mediatek.com>
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

Implement sample rate conversion and set private data for mt8196.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 .../soc/mediatek/mt8196/mt8196-afe-control.c  | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-control.c

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-control.c b/sound/soc/mediatek/mt8196/mt8196-afe-control.c
new file mode 100644
index 000000000000..bb85f4ad8585
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-control.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  MediaTek ALSA SoC Audio Control
+ *
+ *  Copyright (c) 2024 MediaTek Inc.
+ *  Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#include "mt8196-afe-common.h"
+#include <linux/pm_runtime.h>
+
+unsigned int mt8196_general_rate_transform(struct device *dev,
+					   unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_IPM2P0_RATE_8K;
+	case 11025:
+		return MTK_AFE_IPM2P0_RATE_11K;
+	case 12000:
+		return MTK_AFE_IPM2P0_RATE_12K;
+	case 16000:
+		return MTK_AFE_IPM2P0_RATE_16K;
+	case 22050:
+		return MTK_AFE_IPM2P0_RATE_22K;
+	case 24000:
+		return MTK_AFE_IPM2P0_RATE_24K;
+	case 32000:
+		return MTK_AFE_IPM2P0_RATE_32K;
+	case 44100:
+		return MTK_AFE_IPM2P0_RATE_44K;
+	case 48000:
+		return MTK_AFE_IPM2P0_RATE_48K;
+	case 88200:
+		return MTK_AFE_IPM2P0_RATE_88K;
+	case 96000:
+		return MTK_AFE_IPM2P0_RATE_96K;
+	case 176400:
+		return MTK_AFE_IPM2P0_RATE_176K;
+	case 192000:
+		return MTK_AFE_IPM2P0_RATE_192K;
+	/* not support 260K */
+	case 352800:
+		return MTK_AFE_IPM2P0_RATE_352K;
+	case 384000:
+		return MTK_AFE_IPM2P0_RATE_384K;
+	default:
+		dev_info(dev, "%s(), rate %u invalid, use %d!!!\n",
+			 __func__,
+			 rate, MTK_AFE_IPM2P0_RATE_48K);
+		return MTK_AFE_IPM2P0_RATE_48K;
+	}
+}
+
+static unsigned int pcm_rate_transform(struct device *dev,
+				       unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_PCM_RATE_8K;
+	case 16000:
+		return MTK_AFE_PCM_RATE_16K;
+	case 32000:
+		return MTK_AFE_PCM_RATE_32K;
+	case 48000:
+		return MTK_AFE_PCM_RATE_48K;
+	default:
+		dev_info(dev, "%s(), rate %u invalid, use %d!!!\n",
+			 __func__,
+			 rate, MTK_AFE_PCM_RATE_32K);
+		return MTK_AFE_PCM_RATE_32K;
+	}
+}
+
+unsigned int mt8196_rate_transform(struct device *dev,
+				   unsigned int rate, int aud_blk)
+{
+	switch (aud_blk) {
+	case MT8196_DAI_PCM_0:
+	case MT8196_DAI_PCM_1:
+		return pcm_rate_transform(dev, rate);
+	default:
+		return mt8196_general_rate_transform(dev, rate);
+	}
+}
+
+int mt8196_dai_set_priv(struct mtk_base_afe *afe, int id,
+			int priv_size, const void *priv_data)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	void *temp_data;
+
+	temp_data = devm_kzalloc(afe->dev,
+				 priv_size,
+				 GFP_KERNEL);
+	if (!temp_data)
+		return -ENOMEM;
+
+	if (priv_data)
+		memcpy(temp_data, priv_data, priv_size);
+
+	if (id >= MT8196_DAI_NUM || id < 0)
+		return -EINVAL;
+
+	afe_priv->dai_priv[id] = temp_data;
+
+	return 0;
+}
+
-- 
2.45.2


