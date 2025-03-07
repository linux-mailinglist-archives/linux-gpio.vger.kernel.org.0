Return-Path: <linux-gpio+bounces-17243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ACFA56835
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 13:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F0EF1899D0A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 12:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7290A21B9F7;
	Fri,  7 Mar 2025 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D8E1kDCG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA5C21B8F6;
	Fri,  7 Mar 2025 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741351756; cv=none; b=UCPG/ajjQAf5cXBaYTdsDjtMeqtXb/yIgXZ1VAF1gctBTbQa+n17o6atUm7FDqeSMnM4QNHN3sjh+NBERn1AUvH01c7o8SknMhUu5Bke4uXmo7RBFF+1UFQfMuyQJfnIkc0IH/HU2Q0bgoe+PCu+s/zgFjvLAHmLI7BQrN9Nn7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741351756; c=relaxed/simple;
	bh=izdjzC3ery1TpiA7IstLwJ2/uQLj9hQxDc7mzdJX5b8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LaUMgvHPnVo2ShSGZMp3fwu6UjdEHYadMAn9n+6NFRmrfAtmc56puZ6d2jPi/4zil0WK5paMidqP7eyQCQLXQcCJtcdz2YPxCEuzCGBr0HSbkzFxkcFvTBkI+xYRYzuuSetmwoYqzanvDeCRBTGgFSAJSNMwx2GIA/IzvAVP0t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=D8E1kDCG; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9048d918fb5211ef8eb9c36241bbb6fb-20250307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=46TuSHd10UP8OUoJJnde8lojq/wh9uzhaE+3oLPotOE=;
	b=D8E1kDCG3lez9XLOa7ME45S4aqW5M1vAdwFaj9tCzIeCPgEYFq8JhTltP/ag6ZbZA4Xpmlue/U0I7bQ7E1dFHtrUqSjUFu47wYFQLE5AamgT70rwxbNKIGn0CvQ60pQHfVdEEG34bfQ5I5X6WQFcI1KwWLDUcE1z1NSOlVR/t+M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:5c940e58-a1d3-4d6f-a764-850a834929fe,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:7a53168c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9048d918fb5211ef8eb9c36241bbb6fb-20250307
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2090608775; Fri, 07 Mar 2025 20:49:09 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 20:49:08 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 20:49:07 +0800
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
Subject: [PATCH 10/14] ASoC: mediatek: mt8196: support CM in platform driver
Date: Fri, 7 Mar 2025 20:47:36 +0800
Message-ID: <20250307124841.23777-11-darren.ye@mediatek.com>
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

Add mt8196 CM driver support for ADDA multi-channel.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-cm.c | 94 +++++++++++++++++++++++
 sound/soc/mediatek/mt8196/mt8196-afe-cm.h | 23 ++++++
 2 files changed, 117 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-cm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-cm.h

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-cm.c b/sound/soc/mediatek/mt8196/mt8196-afe-cm.c
new file mode 100644
index 000000000000..b923844a76f8
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-cm.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 MediaTek Inc.
+ * Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+
+#include "mtk-afe-fe-dai.h"
+#include "mtk-base-afe.h"
+
+#include "mt8196-afe-cm.h"
+#include "mt8196-afe-common.h"
+
+void mt8196_set_cm_rate(struct mtk_base_afe *afe, int id, unsigned int rate)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	afe_priv->cm_rate[id] = rate;
+}
+EXPORT_SYMBOL_GPL(mt8196_set_cm_rate);
+
+static int mt8196_convert_cm_ch(unsigned int ch)
+{
+	return ch - 1;
+}
+
+static unsigned int calculate_cm_update(int rate, int ch)
+{
+	unsigned int update_val;
+
+	update_val = 26000000 / rate / (ch / 2);
+	update_val = update_val * 10 / 7;
+	if (update_val > 100)
+		update_val = 100;
+	if (update_val < 7)
+		update_val = 7;
+
+	return update_val;
+}
+
+int mt8196_set_cm(struct mtk_base_afe *afe, int id,
+		  bool update, bool swap, unsigned int ch)
+{
+	unsigned int rate = 0;
+	unsigned int update_val = 0;
+	int reg;
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	dev_dbg(afe->dev, "%s()-0, CM%d, rate %d, update %d, swap %d, ch %d\n",
+		__func__, id, rate, update, swap, ch);
+
+	rate = afe_priv->cm_rate[id];
+	update_val = update ? calculate_cm_update(rate, (int)ch) : 0x64;
+
+	reg = AFE_CM0_CON0 + 0x10 * id;
+	/* update cnt */
+	mtk_regmap_update_bits(afe->regmap, reg, AFE_CM_UPDATE_CNT_MASK,
+			       update_val, AFE_CM_UPDATE_CNT_SFT);
+
+	/* rate */
+	mtk_regmap_update_bits(afe->regmap, reg, AFE_CM_1X_EN_SEL_FS_MASK,
+			       rate, AFE_CM_1X_EN_SEL_FS_SFT);
+
+	/* ch num */
+	ch = mt8196_convert_cm_ch(ch);
+	mtk_regmap_update_bits(afe->regmap, reg, AFE_CM_CH_NUM_MASK,
+			       ch, AFE_CM_CH_NUM_SFT);
+
+	/* swap */
+	mtk_regmap_update_bits(afe->regmap, reg, AFE_CM_BYTE_SWAP_MASK,
+			       swap, AFE_CM_BYTE_SWAP_SFT);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8196_set_cm);
+
+int mt8196_enable_cm_bypass(struct mtk_base_afe *afe, int id, bool en)
+{
+	int reg = AFE_CM0_CON0 + 0x10 * id;
+
+	mtk_regmap_update_bits(afe->regmap, reg, AFE_CM_BYPASS_MODE_MASK,
+			       en, AFE_CM_BYPASS_MODE_SFT);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8196_enable_cm_bypass);
+
+MODULE_DESCRIPTION("Mediatek afe cm");
+MODULE_AUTHOR("darren ye <darren.ye@mediatek.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-cm.h b/sound/soc/mediatek/mt8196/mt8196-afe-cm.h
new file mode 100644
index 000000000000..18115ec8fa70
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-cm.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 MediaTek Inc.
+ * Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#ifndef MTK_AFE_CM_H_
+#define MTK_AFE_CM_H_
+enum {
+	CM0,
+	CM1,
+	CM2,
+	CM_NUM,
+};
+
+void mt8196_set_cm_rate(struct mtk_base_afe *afe, int id, unsigned int rate);
+
+int mt8196_set_cm(struct mtk_base_afe *afe, int id, bool update,
+		  bool swap, unsigned int ch);
+int mt8196_enable_cm_bypass(struct mtk_base_afe *afe, int id, bool en);
+
+#endif /* MTK_AFE_CM_H_ */
+
-- 
2.45.2


