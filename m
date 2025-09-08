Return-Path: <linux-gpio+bounces-25762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F5B499AB
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 21:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C2761B261A1
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 19:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52BC247281;
	Mon,  8 Sep 2025 19:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="hIo7vUCn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B56246BB2
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 19:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757359117; cv=none; b=KfjWGwfPEUrIneZ8QPXcnzGY1cNtW2frsk/ev8mWOnqcRCuyvs4YJUdhLY1i++xeMX2TG6KG3F+kAQ5TikewJSKoL0hkYfGX0ECUUWhocxnHwkt3Qj8LXP+2NG8Yrn2xWAOiIdTllPjo3nPTPjo1y/J9LR8Zb2xSwTyo9wByVY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757359117; c=relaxed/simple;
	bh=fz5+hC0k8fKdAq/kcs2/S7hp4i321hoQaekwrPmVsBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYKMrc+lqtUxNG0aSQRg9h/qJsuQA2PwAaRTI7jUpnrOUwO5/mAN7x46qiw5nDoY3hScZTgA9L3E7AHVLRNRxVUga3pGRL/sWyMANrMG5UGIB0FyPWEDoDHjc19JTNA2Te4ICevMx+bGOIs+2KtP+klQkW8W5hbZ5XzwGJTFP6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=hIo7vUCn; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=hIo7vUCnNY2//I9ef15F+E9SgNi6e5JG1OVrEjYJN0vcAkGI4wLoWf03fJorImNa5xgaKLVd+U31H1vjMc/QJ53mQShn+cfKf/hN1mYsqbShF0s7vfBfZrqLywyLr91rRHRL8v9qbPwLmLqVPrQea0MLBJXFwLT8rRQWkoGy52FH5ueRtcweub9gf2tQxkn42lihPQ5MGVgKdUIykXDa26fHqXTMWgHKWSPbjOuM96gf87l/lzfyAOF/ZpFuetwlu3y+uP58QFPg2zMP73bCc4y2DCuL8vq2G7Rkc2uSHd4X//hLOD+3nr+Nrwe+zF7IeBKV24L/xixFqQZRUDqZXw==; s=purelymail2; d=purelymail.com; v=1; bh=fz5+hC0k8fKdAq/kcs2/S7hp4i321hoQaekwrPmVsBc=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-gpio@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 292196779;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 08 Sep 2025 19:18:12 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 08 Sep 2025 21:17:56 +0200
Subject: [PATCH 2/4] pinctrl: mediatek: Add support for eh bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-mt6878-pinctrl-support-v1-2-3fb78c8ab4e8@mentallysanemainliners.org>
References: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
In-Reply-To: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757359086; l=7133;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=fz5+hC0k8fKdAq/kcs2/S7hp4i321hoQaekwrPmVsBc=;
 b=uHH+kPHBczdt1S8MuHANUHg6xc/V8nPAANx362qza7nJhNXBxboj5kDxim59UaGMtzFGUPFf+
 7EqkBL+gsMCDrIV7tdQb6TU3LBfcCe6LFvZ572QcVuVt3dHenln9QYD
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=

The eh bit is used for setting drive mode for i2c pins on recent SoCs.
Add support for it.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 60 ++++++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 24 ++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 30 +++++++++---
 3 files changed, 108 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 4918d38abfc29de1f27ee75bc6a51c32b3ca1ac5..51fbdbdf61c901bb7ee43405d36f2c1602b3616f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -249,6 +249,58 @@ static int mtk_xt_find_eint_num(struct mtk_pinctrl *hw, unsigned long eint_n)
 	return EINT_NA;
 }
 
+/*
+ * The eh register determines the selection of the driving control
+ * for i2c pins.
+ * eh = 0: Non-i2c mode.
+ * eh = 1: i2c mode.
+ */
+int mtk_eh_ctrl(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
+		u16 mode)
+{
+	const struct mtk_eh_pin_pinmux *p = hw->soc->eh_pin_pinmux;
+	u32 eh_info_num = hw->soc->neh_pins;
+	u32 val = 0, on = 0, found = 0, i = 0;
+	int err;
+
+	while (i < eh_info_num) {
+		if (desc->number == p[i].pin) {
+			found = 1;
+			if (mode == p[i].pinmux) {
+				on = 1;
+				break;
+			}
+		}
+		/*
+		 * It is possible that one pin may have more than one pinmux
+		 *   that shall enable eh.
+		 * Besides, we assume that hw->soc->eh_pin_pinmux is sorted
+		 *   according to field 'pin'.
+		 * So when desc->number < p->pin, it mean no match will be
+		 *   found and we can leave.
+		 */
+		if (desc->number < p[i].pin)
+			break;
+
+		i++;
+	}
+
+	if (!found)
+		return 0;
+
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV_EH, &val);
+	if (err)
+		return err;
+
+	if (on)
+		val |= on;
+	else
+		val &= MTK_EH_ENABLE_MASK;
+
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV_EH, val);
+}
+EXPORT_SYMBOL_GPL(mtk_eh_ctrl);
+
 /*
  * Virtual GPIO only used inside SOC and not being exported to outside SOC.
  * Some modules use virtual GPIO as eint (e.g. pmif or usb).
@@ -1231,6 +1283,10 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
 	int e0 = !!(arg & 2);
 	int e1 = !!(arg & 4);
 
+	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV_EH, arg);
+	if (!err)
+		return 0;
+
 	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV_EN, en);
 	if (err)
 		return err;
@@ -1256,6 +1312,10 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
 	u32 en, e0, e1;
 	int err;
 
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV_EH, val);
+	if (!err)
+		return 0;
+
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV_EN, &en);
 	if (err)
 		return err;
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index fa7c0ed49346486ba32ec615aa2b3483217f5077..a2ff8ae5ba43e5be87c8b478c07d9d4640c2e8ec 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -35,6 +35,8 @@
 				 MTK_PULL_PUPD_R1R0_TYPE |\
 				 MTK_PULL_RSEL_TYPE)
 
+#define MTK_EH_ENABLE_MASK	0xfffffffe
+
 #define EINT_NA	U16_MAX
 #define NO_EINT_SUPPORT	EINT_NA
 
@@ -67,6 +69,11 @@
 		.down_rsel = _down_rsel,				\
 	}
 
+#define PIN_MUX_EH(_pin, _pinmux) {						\
+		.pin = _pin,						\
+		.pinmux = _pinmux,					\
+	}
+
 /* List these attributes which could be modified for the pin */
 enum {
 	PINCTRL_PIN_REG_MODE,
@@ -88,6 +95,7 @@ enum {
 	PINCTRL_PIN_REG_IES,
 	PINCTRL_PIN_REG_PULLEN,
 	PINCTRL_PIN_REG_PULLSEL,
+	PINCTRL_PIN_REG_DRV_EH,
 	PINCTRL_PIN_REG_DRV_EN,
 	PINCTRL_PIN_REG_DRV_E0,
 	PINCTRL_PIN_REG_DRV_E1,
@@ -204,6 +212,17 @@ struct mtk_eint_desc {
 	u16 eint_n;
 };
 
+/**
+ * struct mtk_eh_pin_pinmux - entry recording (pin, pinmux) whose
+ *			      eh can be enabled
+ * @pin:                pin number
+ * @pinmux:             pinmux number
+ */
+struct mtk_eh_pin_pinmux {
+	u16 pin;
+	u16 pinmux;
+};
+
 /**
  * struct mtk_pin_desc - the structure that providing information
  *			       for each pin of chips
@@ -252,6 +271,8 @@ struct mtk_pin_soc {
 	const unsigned int		*pull_type;
 	const struct mtk_pin_rsel	*pin_rsel;
 	unsigned int			npin_rsel;
+	const struct mtk_eh_pin_pinmux  *eh_pin_pinmux;
+	unsigned int			neh_pins;
 
 	/* Specific pinconfig operations */
 	int (*bias_disable_set)(struct mtk_pinctrl *hw,
@@ -311,6 +332,9 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
 int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
 		     int field, int *value);
 
+int mtk_eh_ctrl(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
+		u16 mode);
+
 int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev);
 
 int mtk_pinconf_bias_disable_set(struct mtk_pinctrl *hw,
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 3e714554789d0e7e31ecce92388f53b906bdf122..f87447d6f879a3f7b57db44ed97cc91f8e93b425 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -104,13 +104,21 @@ static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
 					  struct pinctrl_gpio_range *range,
 					  unsigned int pin)
 {
+	int err;
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
-	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE,
-				hw->soc->gpio_m);
+	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE,
+			       hw->soc->gpio_m);
+	if (err)
+		return err;
+
+	if (hw->soc->eh_pin_pinmux)
+		err = mtk_eh_ctrl(hw, desc, hw->soc->gpio_m);
+
+	return err;
 }
 
 static int mtk_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
@@ -749,10 +757,10 @@ static int mtk_pmx_set_mux(struct pinctrl_dev *pctldev,
 	struct mtk_pinctrl_group *grp = hw->groups + group;
 	const struct mtk_func_desc *desc_func;
 	const struct mtk_pin_desc *desc;
-	bool ret;
+	int err;
 
-	ret = mtk_pctrl_is_function_valid(hw, grp->pin, function);
-	if (!ret) {
+	err = mtk_pctrl_is_function_valid(hw, grp->pin, function);
+	if (!err) {
 		dev_err(hw->dev, "invalid function %d on group %d .\n",
 			function, group);
 		return -EINVAL;
@@ -763,7 +771,17 @@ static int mtk_pmx_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[grp->pin];
-	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE, desc_func->muxval);
+
+	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE,
+			       desc_func->muxval);
+
+	if (!err)
+		return err;
+
+	if (hw->soc->eh_pin_pinmux)
+		err = mtk_eh_ctrl(hw, desc, desc_func->muxval);
+
+	return err;
 }
 
 static const struct pinmux_ops mtk_pmxops = {

-- 
2.51.0


