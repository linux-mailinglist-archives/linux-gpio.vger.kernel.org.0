Return-Path: <linux-gpio+bounces-17239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC0EA56825
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 13:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D89A1895146
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 12:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9BF21ABC8;
	Fri,  7 Mar 2025 12:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bpZcIkwp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0373C21ABA5;
	Fri,  7 Mar 2025 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741351749; cv=none; b=Paof0z9SZNKLRJo6MwUulLXETtPFS4jCcCx9lDfNS1uE7PissUa/CfyShGztn89DMfiotGPxghyfPpFfDzkgwLuZkGsGGhr0FZ5/o8LNf8Cl2JDFAqX34RbDr3RQ3BpTqpobBOpzavL4s6lCn7CdJaeB0HDDUbgVdnOpgljkvDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741351749; c=relaxed/simple;
	bh=ltSkocDHbOWAwSClJMyDeEKWRgNm1eki8nk0+AvbHis=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mdt47/jLVRM5sWy4BEy4eaVEvuGh8LYjJtP+pyWIdQmjdaosgmMzjRhuqyq8gbS9Em1G3blNi8ZjZ2v8tERzq8kbwmvCJC7nOjvn5QyEJXV0lFvL6ftIXM1ZMu/87JsyxaEm554dVZQbJdQSmNGOdC/KyA9GVxyjxIaXV/MZ9yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bpZcIkwp; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8b241952fb5211ef8eb9c36241bbb6fb-20250307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=579JrFWpi95wWUZ2IKof6bunu2c/sHpygySN/3e4uJg=;
	b=bpZcIkwpq+XpBw2w7/kBl/rU3C6icF+bEk81ugnV3Mk5pe/LoqVEYnICI1Jc2DWhVbcr+w5NaFEgNjL5hJIAjuPlCYUntZMvlEzf9O7BpKxGVb3mXXq8+rckJ5N+i5y8GJNYy4dXodYmssHt/uXdR8wtduQF2W47MC1CxGZek+E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ba04b81b-3ce8-4c50-b2b9-f13ea30a0e1f,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:3253168c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8b241952fb5211ef8eb9c36241bbb6fb-20250307
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1676230440; Fri, 07 Mar 2025 20:49:01 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 20:48:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 20:48:59 +0800
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
Subject: [PATCH 06/14] ASoC: mediatek: mt8196: support audio GPIO control
Date: Fri, 7 Mar 2025 20:47:32 +0800
Message-ID: <20250307124841.23777-7-darren.ye@mediatek.com>
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

Implement mode switching for audio GPIO.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-gpio.c | 239 ++++++++++++++++++++
 sound/soc/mediatek/mt8196/mt8196-afe-gpio.h |  58 +++++
 2 files changed, 297 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-gpio.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-gpio.h

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-gpio.c b/sound/soc/mediatek/mt8196/mt8196-afe-gpio.c
new file mode 100644
index 000000000000..17ba409af7c4
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-gpio.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  mt8196-afe-gpio.c  --  Mediatek 8196 afe gpio ctrl
+ *
+ *  Copyright (c) 2024 MediaTek Inc.
+ *  Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#include <linux/gpio.h>
+#include <linux/pinctrl/consumer.h>
+
+#include "mt8196-afe-common.h"
+#include "mt8196-afe-gpio.h"
+
+struct pinctrl *aud_pinctrl;
+struct audio_gpio_attr {
+	const char *name;
+	bool gpio_prepare;
+	struct pinctrl_state *gpioctrl;
+};
+
+static struct audio_gpio_attr aud_gpios[MT8196_AFE_GPIO_GPIO_NUM] = {
+	[MT8196_AFE_GPIO_DAT_MISO0_OFF] = {"aud-dat-miso0-off", false, NULL},
+	[MT8196_AFE_GPIO_DAT_MISO0_ON] = {"aud-dat-miso0-on", false, NULL},
+	[MT8196_AFE_GPIO_DAT_MISO1_OFF] = {"aud-dat-miso1-off", false, NULL},
+	[MT8196_AFE_GPIO_DAT_MISO1_ON] = {"aud-dat-miso1-on", false, NULL},
+	[MT8196_AFE_GPIO_DAT_MOSI_OFF] = {"aud-dat-mosi-off", false, NULL},
+	[MT8196_AFE_GPIO_DAT_MOSI_ON] = {"aud-dat-mosi-on", false, NULL},
+	[MT8196_AFE_GPIO_I2SOUT0_OFF] = {"aud-gpio-i2sout0-off", false, NULL},
+	[MT8196_AFE_GPIO_I2SOUT0_ON] = {"aud-gpio-i2sout0-on", false, NULL},
+	[MT8196_AFE_GPIO_I2SIN0_OFF] = {"aud-gpio-i2sin0-off", false, NULL},
+	[MT8196_AFE_GPIO_I2SIN0_ON] = {"aud-gpio-i2sin0-on", false, NULL},
+	[MT8196_AFE_GPIO_I2SOUT1_OFF] = {"aud-gpio-i2sout1-off", false, NULL},
+	[MT8196_AFE_GPIO_I2SOUT1_ON] = {"aud-gpio-i2sout1-on", false, NULL},
+	[MT8196_AFE_GPIO_I2SIN1_OFF] = {"aud-gpio-i2sin1-off", false, NULL},
+	[MT8196_AFE_GPIO_I2SIN1_ON] = {"aud-gpio-i2sin1-on", false, NULL},
+	[MT8196_AFE_GPIO_I2SOUT4_OFF] = {"aud-gpio-i2sout4-off", false, NULL},
+	[MT8196_AFE_GPIO_I2SOUT4_ON] = {"aud-gpio-i2sout4-on", false, NULL},
+	[MT8196_AFE_GPIO_I2SIN4_OFF] = {"aud-gpio-i2sin4-off", false, NULL},
+	[MT8196_AFE_GPIO_I2SIN4_ON] = {"aud-gpio-i2sin4-on", false, NULL},
+	[MT8196_AFE_GPIO_I2SOUT6_OFF] = {"aud-gpio-i2sout6-off", false, NULL},
+	[MT8196_AFE_GPIO_I2SOUT6_ON] = {"aud-gpio-i2sout6-on", false, NULL},
+	[MT8196_AFE_GPIO_I2SIN6_OFF] = {"aud-gpio-i2sin6-off", false, NULL},
+	[MT8196_AFE_GPIO_I2SIN6_ON] = {"aud-gpio-i2sin6-on", false, NULL},
+	[MT8196_AFE_GPIO_AP_DMIC_OFF] = {"aud-gpio-ap-dmic-off", false, NULL},
+	[MT8196_AFE_GPIO_AP_DMIC_ON] = {"aud-gpio-ap-dmic-on", false, NULL},
+	[MT8196_AFE_GPIO_AP_DMIC1_OFF] = {"aud-gpio-ap-dmic1-off", false, NULL},
+	[MT8196_AFE_GPIO_AP_DMIC1_ON] = {"aud-gpio-ap-dmic1-on", false, NULL},
+	[MT8196_AFE_GPIO_DAT_MOSI_CH34_OFF] = {"aud-dat-mosi-ch34-off", false, NULL},
+	[MT8196_AFE_GPIO_DAT_MOSI_CH34_ON] = {"aud-dat-mosi-ch34-on", false, NULL},
+	[MT8196_AFE_GPIO_DAT_MISO_ONLY_OFF] = {"aud-dat-miso-only-off", false, NULL},
+	[MT8196_AFE_GPIO_DAT_MISO_ONLY_ON] = {"aud-dat-miso-only-on", false, NULL},
+	[MT8196_AFE_GPIO_I2SOUT3_OFF] = {"aud-gpio-i2sout3-off", false, NULL},
+	[MT8196_AFE_GPIO_I2SOUT3_ON] = {"aud-gpio-i2sout3-on", false, NULL},
+	[MT8196_AFE_GPIO_I2SIN3_OFF] = {"aud-gpio-i2sin3-off", false, NULL},
+	[MT8196_AFE_GPIO_I2SIN3_ON] = {"aud-gpio-i2sin3-on", false, NULL},
+};
+
+static DEFINE_MUTEX(gpio_request_mutex);
+
+int mt8196_afe_gpio_init(struct mtk_base_afe *afe)
+{
+	int ret;
+	int i = 0;
+
+	aud_pinctrl = devm_pinctrl_get(afe->dev);
+	if (IS_ERR(aud_pinctrl)) {
+		ret = PTR_ERR(aud_pinctrl);
+		dev_info(afe->dev, "%s(), ret %d, cannot get aud_pinctrl!\n",
+			 __func__, ret);
+		return -ENODEV;
+	}
+
+	for (i = 0; i < MT8196_AFE_GPIO_GPIO_NUM; i++) {
+		if (!aud_gpios[i].name) {
+			dev_info(afe->dev, "%s(), gpio id %d not define!!!\n",
+				 __func__, i);
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(aud_gpios); i++) {
+		aud_gpios[i].gpioctrl = pinctrl_lookup_state(aud_pinctrl,
+							     aud_gpios[i].name);
+		if (IS_ERR(aud_gpios[i].gpioctrl)) {
+			ret = PTR_ERR(aud_gpios[i].gpioctrl);
+			dev_info(afe->dev, "%s(), pinctrl_lookup_state %s fail, ret %d\n",
+				 __func__, aud_gpios[i].name, ret);
+		} else {
+			aud_gpios[i].gpio_prepare = true;
+		}
+	}
+
+	/* gpio status init */
+	mt8196_afe_gpio_request(afe, false, MT8196_DAI_ADDA, 0);
+	mt8196_afe_gpio_request(afe, false, MT8196_DAI_ADDA, 1);
+
+	return 0;
+}
+
+static int mt8196_afe_gpio_select(struct mtk_base_afe *afe,
+				  enum mt8196_afe_gpio type)
+{
+	int ret = 0;
+
+	dev_dbg(afe->dev, "%s(), type: %d.\n", __func__, type);
+
+	if (type >= MT8196_AFE_GPIO_GPIO_NUM) {
+		dev_info(afe->dev, "%s(), error, invalid gpio type %d\n",
+			 __func__, type);
+		return -EINVAL;
+	}
+
+	if (!aud_gpios[type].gpio_prepare) {
+		dev_info(afe->dev, "%s(), error, gpio type %d not prepared\n",
+			 __func__, type);
+		return -EIO;
+	}
+
+	ret = pinctrl_select_state(aud_pinctrl,
+				   aud_gpios[type].gpioctrl);
+	if (ret)
+		dev_info(afe->dev, "%s(), error, can not set gpio type %d\n",
+			 __func__, type);
+
+	return ret;
+}
+
+int mt8196_afe_gpio_request(struct mtk_base_afe *afe, bool enable,
+			    int dai, int uplink)
+{
+	dev_dbg(afe->dev, "%s(), enable: %d, dai: %d, uplink: %d.\n", __func__,
+		enable, dai, uplink);
+
+	mutex_lock(&gpio_request_mutex);
+	switch (dai) {
+	case MT8196_DAI_ADDA:
+		break;
+	case MT8196_DAI_ADDA_CH34:
+		break;
+	case MT8196_DAI_ADDA_CH56:
+		break;
+	case MT8196_DAI_I2S_IN0:
+	case MT8196_DAI_I2S_OUT0:
+		if (enable) {
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SIN0_ON);
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SOUT0_ON);
+		} else {
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SIN0_OFF);
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SOUT0_OFF);
+		}
+		break;
+	case MT8196_DAI_I2S_IN1:
+	case MT8196_DAI_I2S_OUT1:
+		if (enable) {
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SIN1_ON);
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SOUT1_ON);
+		} else {
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SIN1_OFF);
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SOUT1_OFF);
+		}
+		break;
+	case MT8196_DAI_I2S_IN3:
+	case MT8196_DAI_I2S_OUT3:
+		if (enable) {
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SIN3_ON);
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SOUT3_ON);
+		} else {
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SIN3_OFF);
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SOUT3_OFF);
+		}
+		break;
+	case MT8196_DAI_I2S_IN4:
+	case MT8196_DAI_I2S_OUT4:
+		if (enable) {
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SIN4_ON);
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SOUT4_ON);
+		} else {
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SIN4_OFF);
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SOUT4_OFF);
+		}
+		break;
+	case MT8196_DAI_I2S_IN6:
+	case MT8196_DAI_I2S_OUT6:
+		if (enable) {
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SIN6_ON);
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SOUT6_ON);
+		} else {
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SIN6_OFF);
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_I2SOUT6_OFF);
+		}
+		break;
+	case MT8196_DAI_VOW:
+		break;
+	case MT8196_DAI_VOW_SCP_DMIC:
+		break;
+	case MT8196_DAI_MTKAIF:
+		if (enable) {
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_DAT_MISO1_ON);
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_DAT_MISO0_ON);
+		} else {
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_DAT_MISO1_OFF);
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_DAT_MISO0_OFF);
+		}
+		break;
+	case MT8196_DAI_MISO_ONLY:
+		if (enable)
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_DAT_MISO_ONLY_ON);
+		else
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_DAT_MISO_ONLY_OFF);
+		break;
+	case MT8196_DAI_AP_DMIC:
+		if (enable)
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_AP_DMIC_ON);
+		else
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_AP_DMIC_OFF);
+		break;
+	case MT8196_DAI_AP_DMIC_CH34:
+		if (enable)
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_AP_DMIC1_ON);
+		else
+			mt8196_afe_gpio_select(afe, MT8196_AFE_GPIO_AP_DMIC1_OFF);
+		break;
+	default:
+		mutex_unlock(&gpio_request_mutex);
+		dev_info(afe->dev, "%s(), invalid dai %d\n", __func__, dai);
+		return -EINVAL;
+	}
+	mutex_unlock(&gpio_request_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8196_afe_gpio_request);
+
+bool mt8196_afe_gpio_is_prepared(enum mt8196_afe_gpio type)
+{
+	return aud_gpios[type].gpio_prepare;
+}
+EXPORT_SYMBOL(mt8196_afe_gpio_is_prepared);
+
diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-gpio.h b/sound/soc/mediatek/mt8196/mt8196-afe-gpio.h
new file mode 100644
index 000000000000..b36a8201d649
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-gpio.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8196-afe-gpio.h  --  Mediatek 8196 afe gpio ctrl definition
+ *
+ *  Copyright (c) 2023 MediaTek Inc.
+ *  Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#ifndef _MT8196_AFE_GPIO_H_
+#define _MT8196_AFE_GPIO_H_
+#include "mt8196-afe-common.h"
+
+enum mt8196_afe_gpio {
+	MT8196_AFE_GPIO_DAT_MISO0_OFF,
+	MT8196_AFE_GPIO_DAT_MISO0_ON,
+	MT8196_AFE_GPIO_DAT_MISO1_OFF,
+	MT8196_AFE_GPIO_DAT_MISO1_ON,
+	MT8196_AFE_GPIO_DAT_MOSI_OFF,
+	MT8196_AFE_GPIO_DAT_MOSI_ON,
+	MT8196_AFE_GPIO_DAT_MOSI_CH34_OFF,
+	MT8196_AFE_GPIO_DAT_MOSI_CH34_ON,
+	MT8196_AFE_GPIO_DAT_MISO_ONLY_OFF,
+	MT8196_AFE_GPIO_DAT_MISO_ONLY_ON,
+	MT8196_AFE_GPIO_I2SIN0_OFF,
+	MT8196_AFE_GPIO_I2SIN0_ON,
+	MT8196_AFE_GPIO_I2SOUT0_OFF,
+	MT8196_AFE_GPIO_I2SOUT0_ON,
+	MT8196_AFE_GPIO_I2SIN1_OFF,
+	MT8196_AFE_GPIO_I2SIN1_ON,
+	MT8196_AFE_GPIO_I2SOUT1_OFF,
+	MT8196_AFE_GPIO_I2SOUT1_ON,
+	MT8196_AFE_GPIO_I2SIN4_OFF,
+	MT8196_AFE_GPIO_I2SIN4_ON,
+	MT8196_AFE_GPIO_I2SOUT4_OFF,
+	MT8196_AFE_GPIO_I2SOUT4_ON,
+	MT8196_AFE_GPIO_I2SIN6_OFF,
+	MT8196_AFE_GPIO_I2SIN6_ON,
+	MT8196_AFE_GPIO_I2SOUT6_OFF,
+	MT8196_AFE_GPIO_I2SOUT6_ON,
+	MT8196_AFE_GPIO_AP_DMIC_OFF,
+	MT8196_AFE_GPIO_AP_DMIC_ON,
+	MT8196_AFE_GPIO_AP_DMIC1_OFF,
+	MT8196_AFE_GPIO_AP_DMIC1_ON,
+	MT8196_AFE_GPIO_I2SIN3_OFF,
+	MT8196_AFE_GPIO_I2SIN3_ON,
+	MT8196_AFE_GPIO_I2SOUT3_OFF,
+	MT8196_AFE_GPIO_I2SOUT3_ON,
+	MT8196_AFE_GPIO_GPIO_NUM
+};
+
+struct mtk_base_afe;
+
+int mt8196_afe_gpio_init(struct mtk_base_afe *afe);
+int mt8196_afe_gpio_request(struct mtk_base_afe *afe, bool enable,
+			    int dai, int uplink);
+bool mt8196_afe_gpio_is_prepared(enum mt8196_afe_gpio type);
+
+#endif
-- 
2.45.2


