Return-Path: <linux-gpio+bounces-11117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF81E997255
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 18:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1669283385
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 16:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F271A0BF3;
	Wed,  9 Oct 2024 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="tKzRsn+X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9843F13634C;
	Wed,  9 Oct 2024 16:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728492765; cv=none; b=bCzfo+YV5Hj+UZX+Naz3hP/BmJhVYYmYyZAu3yiHqtLxuPVOmQZ8VTAk0YIVP1tCPJNevwgaJvqLUWP3hlDK+yIItJE2kDMhjj0idT97s0633DAkTdE6bYeTwEJfgeMusPIzy9bMeC9H1OdQex3D4VaqgFcfa9lIA0MpdbMSkvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728492765; c=relaxed/simple;
	bh=bdyLieRPf6yjQgw4XtJXBy39oY02YGAVMtBF73rDX/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDQEEvyz6EHNDzzQrqi+ZNS1UoWxloGKAKxMcEvD9+nvC5Np3LgECksCp/cB5fKGL04x/NlgXJLZmpZr8UGXk0DVpT9Jfbi4zSFB8A60PXJcpXNRV6zifHAfVmeSFfQDBXi06HESb+mTNqwaM9JSmar8Sg8u8mX6gEXxRpd6f38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=tKzRsn+X; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id 2C8EA40832;
	Wed,  9 Oct 2024 16:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728492755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHaUG5cyywTVSn0olx177yyudjZMx8d30jdAXK4qx8Y=;
	b=tKzRsn+XYL+kNWeDP0kRjPwW5FAqN86ZvAGRVM3Q9hLb7aKhid9hkvKu6TgScEgsSCDmJo
	JEUmi2ZuDC9/lm7k81lGCGMLPOjxWyXb/rurZgHnPHZoVO96DZDwHq2iMTONYi1R8uaTAH
	UNjdZhDzfbClmtdtiePcHQPV9p9wsig=
Received: from frank-u24.. (fttx-pool-217.61.150.182.bambit.de [217.61.150.182])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 5911080345;
	Wed,  9 Oct 2024 16:52:34 +0000 (UTC)
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
	daniel@makrotopia.org,
	john@phrozen.org,
	ansuelsmth@gmail.com,
	eladwf@gmail.com
Subject: [PATCH v4 1/4] pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
Date: Wed,  9 Oct 2024 18:52:11 +0200
Message-ID: <20241009165222.5670-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009165222.5670-1-linux@fw-web.de>
References: <20241009165222.5670-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 12846c23-6375-4ecd-9e8c-71fd268a7718

From: Daniel Golle <daniel@makrotopia.org>

The MediaTek MT7988 SoC got some pins which only got configurable
pull-down but unlike previous designs there is no pull-up option.
Add new type MTK_PULL_PD_TYPE to support configuring such pins.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 59 +++++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  1 +
 2 files changed, 60 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 54301fbba524..eff2aecd31dd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -601,6 +601,30 @@ static int mtk_pinconf_bias_set_pu_pd(struct mtk_pinctrl *hw,
 	return err;
 }
 
+static int mtk_pinconf_bias_set_pd(struct mtk_pinctrl *hw,
+				const struct mtk_pin_desc *desc,
+				u32 pullup, u32 arg)
+{
+	int err, pd;
+
+	if (arg == MTK_DISABLE)
+		pd = 0;
+	else if ((arg == MTK_ENABLE) && pullup)
+		pd = 0;
+	else if ((arg == MTK_ENABLE) && !pullup)
+		pd = 1;
+	else {
+		err = -EINVAL;
+		goto out;
+	}
+
+	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
+
+out:
+	return err;
+
+}
+
 static int mtk_pinconf_bias_set_pullsel_pullen(struct mtk_pinctrl *hw,
 				const struct mtk_pin_desc *desc,
 				u32 pullup, u32 arg)
@@ -758,6 +782,12 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
 			return 0;
 	}
 
+	if (try_all_type & MTK_PULL_PD_TYPE) {
+		err = mtk_pinconf_bias_set_pd(hw, desc, pullup, arg);
+		if (!err)
+			return err;
+	}
+
 	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
 		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
 		if (!err)
@@ -878,6 +908,29 @@ static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
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
@@ -947,6 +1000,12 @@ int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
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


