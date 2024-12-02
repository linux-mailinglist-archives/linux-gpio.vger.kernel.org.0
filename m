Return-Path: <linux-gpio+bounces-13383-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D229DFFBC
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 12:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04AE816208B
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 11:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9417B1FCFF0;
	Mon,  2 Dec 2024 11:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="dH1QId37"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897E21FCFFF;
	Mon,  2 Dec 2024 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733137703; cv=none; b=nNso6WF5VcV1h5vv/yvXKx2IrWTTNuVGzX1PMKjnRwOCiN51oQCe4ej8VZkCAujwmpm1wml0fI8xyTjwCP8Z7bkmd8tVMdeflLxcKjNXfcD9dHYaiY6qoC+6Cw8aXWs7iyoCgD5MPh+7krbxDTc+9bmym92hIhm4O6HKfG3rKxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733137703; c=relaxed/simple;
	bh=re6cKiQn+0ZANLSz6NjNoLOhDvC9IPmP5rXbLjhXoi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eR9nNys0mGfCCdFotAIs2GqlID3TmsF8cFMtUnz5tZiCbWjA/I33qMbcWhxXsMPo0Q86n278yrT9DVLkpYwyI2ON3qz6VEKV4xy1H79A1/u4jk+3V9zTR1XkVKAj2vzKoAbou/FyfoJTKg+aBytjXWhYv9KBTMCcfjVfDIJl68A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=dH1QId37; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 495505FCA8;
	Mon,  2 Dec 2024 11:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733137258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CrZfKQeVzPeaNb9MAoWKYkGY3YjePUtQn3/HLjKeboI=;
	b=dH1QId37nZPxSlNP3XQoaXZnT3i/for4Ta+v6QWC6PQ2Uk0CmKIGLstuYTHK2M39mQZ0aK
	pG2RFgQO9rusAU9PC1dj+8FQxse07nroa6ELRJok7yGNW+48rIGBDjAUAKS5FKrMrm5TaH
	paMvKSmZMZblIrV7FSozQ5bMGtGl6/k=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 6BE07100475;
	Mon,  2 Dec 2024 11:00:57 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH v5 1/5] pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
Date: Mon,  2 Dec 2024 12:00:35 +0100
Message-ID: <20241202110045.22084-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202110045.22084-1-linux@fw-web.de>
References: <20241202110045.22084-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: fcedbf82-7749-4dbe-b55e-fa060d388412

From: Daniel Golle <daniel@makrotopia.org>

The MediaTek MT7988 SoC got some pins which only got configurable
pull-down but unlike previous designs there is no pull-up option.
Add new type MTK_PULL_PD_TYPE to support configuring such pins.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v5:
- add changes suggested by angelo (pd_only), long version, tested with emmc
---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 73 ++++++++++++++++---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  1 +
 2 files changed, 63 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 54301fbba524..7b704cc55c9f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -573,7 +573,7 @@ EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_rev1);
  */
 static int mtk_pinconf_bias_set_pu_pd(struct mtk_pinctrl *hw,
 				const struct mtk_pin_desc *desc,
-				u32 pullup, u32 arg)
+				u32 pullup, u32 arg, bool pd_only)
 {
 	int err, pu, pd;
 
@@ -587,18 +587,34 @@ static int mtk_pinconf_bias_set_pu_pd(struct mtk_pinctrl *hw,
 		pu = 0;
 		pd = 1;
 	} else {
-		err = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
-	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PU, pu);
-	if (err)
-		goto out;
+	if (!pd_only) {
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PU, pu);
+		if (err)
+			return err;
+	}
 
-	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
+}
+
+static int mtk_pinconf_bias_set_pd(struct mtk_pinctrl *hw,
+				const struct mtk_pin_desc *desc,
+				u32 pullup, u32 arg)
+{
+	int err, pd;
+
+	if (arg != MTK_DISABLE && arg != MTK_ENABLE)
+		return -EINVAL;
+
+	if (arg == MTK_DISABLE || pullup)
+		pd = 0;
+	else if (!pullup)
+		pd = 1;
+
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
 
-out:
-	return err;
 }
 
 static int mtk_pinconf_bias_set_pullsel_pullen(struct mtk_pinctrl *hw,
@@ -737,7 +753,7 @@ static int mtk_pinconf_bias_set_pu_pd_rsel(struct mtk_pinctrl *hw,
 			return err;
 	}
 
-	return mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, enable);
+	return mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, enable, false);
 }
 
 int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
@@ -758,8 +774,14 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
 			return 0;
 	}
 
+	if (try_all_type & MTK_PULL_PD_TYPE) {
+		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg, true);
+		if (!err)
+			return err;
+	}
+
 	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
-		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
+		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg, false);
 		if (!err)
 			return 0;
 	}
@@ -878,6 +900,29 @@ static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
 	return err;
 }
 
+static int mtk_pinconf_bias_get_pd(struct mtk_pinctrl *hw,
+				const struct mtk_pin_desc *desc,
+				u32 *pullup, u32 *enable)
+{
+	int err, pd;
+
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PD, &pd);
+	if (err)
+		goto out;
+
+	if (pd == 0) {
+		*pullup = 0;
+		*enable = MTK_DISABLE;
+	} else if (pd == 1) {
+		*pullup = 0;
+		*enable = MTK_ENABLE;
+	} else
+		err = -EINVAL;
+
+out:
+	return err;
+}
+
 static int mtk_pinconf_bias_get_pullsel_pullen(struct mtk_pinctrl *hw,
 				const struct mtk_pin_desc *desc,
 				u32 *pullup, u32 *enable)
@@ -947,6 +992,12 @@ int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
 			return 0;
 	}
 
+	if (try_all_type & MTK_PULL_PD_TYPE) {
+		err = mtk_pinconf_bias_get_pd(hw, desc, pullup, enable);
+		if (!err)
+			return err;
+	}
+
 	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
 		err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
 		if (!err)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 23688ca6d04e..9c271dc2b521 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -24,6 +24,7 @@
  * turned on/off itself. But it can't be selected pull up/down
  */
 #define MTK_PULL_RSEL_TYPE		BIT(3)
+#define MTK_PULL_PD_TYPE        BIT(4)
 /* MTK_PULL_PU_PD_RSEL_TYPE is a type which is controlled by
  * MTK_PULL_PU_PD_TYPE and MTK_PULL_RSEL_TYPE.
  */
-- 
2.43.0


