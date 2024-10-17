Return-Path: <linux-gpio+bounces-11501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DEB9A1C0D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 09:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD63D1C20EF4
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 07:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06E01D040B;
	Thu, 17 Oct 2024 07:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KCW8rkDU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294F51CF5E7;
	Thu, 17 Oct 2024 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729151733; cv=none; b=CH9tiK7teiAL4EloWmP34RZoeMptWArygYUnqtTXRExCEDgY2U034NBMZdZu+Lb5dizMbkN+i9CLJjaiW0v2OQKtffRBoxgBzBNNnloqnRJQCFT/Rg7Zbc5gQfr4o/RiONf2ayqa1X8gFrfEs+Q5SS/908p+BeM5qYeUYiWcuUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729151733; c=relaxed/simple;
	bh=ldnyJkxkuGs3dggOkOYVwhzNzsqCgEtMStlRVEjS4b0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EaOjCQr9F7Y8Nbsw2GMrc4CjJL9c8dJ0HSGe+GxPMBfTWRzhdNTZqVQuyckBq8iSUgOhs7CBaNj0aoAZFYo3+VJMC2uvPcKHON1zmLCkvm6jZOaajfyQOBRTCrEjw9H96EZMin2MpUtkxL/ho3FZsh+Z2QBDD2ifLGyjL7vG1JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=KCW8rkDU; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2b8c7bd88c5d11efbd192953cf12861f-20241017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NG+cvB78j3HgiyVriRt2aR///VFc6kWwgdG3Bs9Odiw=;
	b=KCW8rkDUF8CLUmke9TvcqGoUs2gi+JB9QsV4AwUvtAPGVeWRp8qtaobQ+U9zgpaNnjnjTJ1sjSkKPSGxu7hUq3yHDePKeGOfAx3uqJpe47dTfLt4jE40MX4gLGiCkDDHcWMmlO58iFR74nPkrYEZ/XmDFjR+HAXjsZ2HGR1VN+Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:ecaa1a2c-100a-4546-9346-542fd64f74d1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:9eb66641-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 2b8c7bd88c5d11efbd192953cf12861f-20241017
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <bo.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 515316514; Thu, 17 Oct 2024 15:55:26 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Oct 2024 00:55:24 -0700
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Oct 2024 15:55:24 +0800
From: Bo Ye <bo.ye@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Yongdong Zhang <yongdong.zhang@mediatek.com>, Xiujuan Tan
	<xiujuan.tan@mediatek.com>, Browse Zhang <browse.zhang@mediatek.com>, Bo Ye
	<bo.ye@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>, Evan Cao
	<ot_evan.cao@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] pinctrl: mediatek: paris: Revert "Rework support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE"
Date: Thu, 17 Oct 2024 15:55:19 +0800
Message-ID: <20241017075522.178337-1-bo.ye@mediatek.com>
X-Mailer: git-send-email 2.17.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

[This reverts commit c5d3b64c568a344e998830e0e94a7c04e372f89b.]

For MTK HW,
1. to enable GPIO input direction: set DIR=0, IES=1
2. to enable GPIO output direction: set DIR=1, and set DO=1 to output high, set DO=0 to out low

The PIN_CONFIG_INPUT/PIN_CONFIG_OUTPUT/PIN_CONFIG_INPUT_ENABLE/PIN_CONFIG_OUTPUT_ENABLE shall
be implemented according to view of its purpose - set GPIO direction and output value (for
output only) according to specific HW design.

However, the reverted patch implement according to author's own explanation of IES without
understanding of MTK's HW. Such patch does not correctly set DIR/IES bit to control GPIO
direction on MTK's HW.

Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
Signed-off-by: Evan Cao <ot_evan.cao@mediatek.com>
Signed-off-by: Bo Ye <bo.ye@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 38 +++++++++++++++++-------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 87e958d827bf..a8af62e6f8ca 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -165,21 +165,20 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SR, &ret);
 		break;
 	case PIN_CONFIG_INPUT_ENABLE:
-		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_IES, &ret);
-		if (!ret)
-			err = -EINVAL;
-		break;
-	case PIN_CONFIG_OUTPUT:
+	case PIN_CONFIG_OUTPUT_ENABLE:
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
 		if (err)
 			break;
+		/*     CONFIG     Current direction return value
+		 * -------------  ----------------- ----------------------
+		 * OUTPUT_ENABLE       output       1 (= HW value)
+		 *                     input        0 (= HW value)
+		 * INPUT_ENABLE        output       0 (= reverse HW value)
+		 *                     input        1 (= reverse HW value)
+		 */
+		if (param == PIN_CONFIG_INPUT_ENABLE)
+			ret = !ret;
 
-		if (!ret) {
-			err = -EINVAL;
-			break;
-		}
-
-		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DO, &ret);
 		break;
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
@@ -284,9 +283,26 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 		err = hw->soc->bias_set_combo(hw, desc, 0, arg);
 		break;
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
+				       MTK_DISABLE);
+		/* Keep set direction to consider the case that a GPIO pin
+		 *  does not have SMT control
+		 */
+		if (err != -ENOTSUPP)
+			break;
+
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
+				       MTK_OUTPUT);
+		break;
 	case PIN_CONFIG_INPUT_ENABLE:
 		/* regard all non-zero value as enable */
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES, !!arg);
+		if (err)
+			break;
+
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
+				       MTK_INPUT);
 		break;
 	case PIN_CONFIG_SLEW_RATE:
 		/* regard all non-zero value as enable */
-- 
2.17.0


