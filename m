Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4AC9BFE6B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2019 07:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbfI0FCW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 01:02:22 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:5983 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725996AbfI0FCW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Sep 2019 01:02:22 -0400
X-UUID: ac10d32fcf8948568c6efee55045391f-20190927
X-UUID: ac10d32fcf8948568c6efee55045391f-20190927
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1933294486; Fri, 27 Sep 2019 13:02:15 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Sep 2019 13:02:12 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 27 Sep 2019 13:02:12 +0800
From:   Light Hsieh <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v6 2/5] pinctrl: mediatek: Supporting driving setting without  mapping current to register value
Date:   Fri, 27 Sep 2019 13:02:09 +0800
Message-ID: <1569560532-1886-2-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1569560532-1886-1-git-send-email-light.hsieh@mediatek.com>
References: <1569560532-1886-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 9AE9BB4C62F6457BAF6EABC35F940C01FF1014D91E5D57F63A81A5710AD12F942000:8
X-MTK:  N
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Mediatek's smarphone project actual usage does need to know current value
(in mA) in procedure of finding the best driving setting.
The steps in the procedure is like as follow:

1. set driving setting field in setting register as 0, measure waveform,
   perform test, and etc.
2. set driving setting field in setting register as 1, measure waveform,
   perform test, and etc.
...
n. set driving setting field in setting register as n-1, measure
   waveform, perform test, and etc.
Check the results of steps 1~n and adopt the setting that get best result.

This procedure does need to know the mapping between current to register
value.
Therefore, setting driving without mapping current is more pratical for
Mediatek's smartphone usage.

---
 drivers/pinctrl/mediatek/pinctrl-mt6765.c        |  4 ++--
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 21 +++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  5 +++++
 drivers/pinctrl/mediatek/pinctrl-paris.c         |  1 +
 4 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
index 32451e8..e024ebc 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
@@ -1077,8 +1077,8 @@
 	.bias_disable_get = mtk_pinconf_bias_disable_get,
 	.bias_set = mtk_pinconf_bias_set,
 	.bias_get = mtk_pinconf_bias_get,
-	.drive_set = mtk_pinconf_drive_set_rev1,
-	.drive_get = mtk_pinconf_drive_get_rev1,
+	.drive_set = mtk_pinconf_drive_set_direct_val,
+	.drive_get = mtk_pinconf_drive_get_direct_val,
 	.adv_pull_get = mtk_pinconf_adv_pull_get,
 	.adv_pull_set = mtk_pinconf_adv_pull_set,
 };
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 8077855..acfddf9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -608,6 +608,27 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
 	return 0;
 }
 
+/* Revision direct value */
+int mtk_pinconf_drive_set_direct_val(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc, u32 arg)
+{
+	int err;
+
+	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV, arg);
+
+	return err;
+}
+
+int mtk_pinconf_drive_get_direct_val(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc, int *val)
+{
+	int err;
+
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, val);
+
+	return err;
+}
+
 int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
 			     const struct mtk_pin_desc *desc, bool pullup,
 			     u32 arg)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 1b7da42..b3bada0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -288,6 +288,11 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
 int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
 			       const struct mtk_pin_desc *desc, int *val);
 
+int mtk_pinconf_drive_set_direct_val(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc, u32 arg);
+int mtk_pinconf_drive_get_direct_val(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc, int *val);
+
 int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
 			     const struct mtk_pin_desc *desc, bool pullup,
 			     u32 arg);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 3e13ae7..5217f76 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -970,3 +970,4 @@ static int mtk_paris_pinctrl_resume(struct device *device)
 	.suspend_noirq = mtk_paris_pinctrl_suspend,
 	.resume_noirq = mtk_paris_pinctrl_resume,
 };
+
-- 
1.8.1.1.dirty

