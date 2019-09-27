Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16FE1BFE63
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2019 07:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfI0FCZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 01:02:25 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:59385 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727653AbfI0FCZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Sep 2019 01:02:25 -0400
X-UUID: 8bce1f9c57974ba3bfd6825a28333b58-20190927
X-UUID: 8bce1f9c57974ba3bfd6825a28333b58-20190927
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1793130382; Fri, 27 Sep 2019 13:02:15 +0800
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
Subject: [PATCH v6 3/5] pinctrl: mediatek: Refine mtk_pinconf_get() and  mtk_pinconf_set()
Date:   Fri, 27 Sep 2019 13:02:10 +0800
Message-ID: <1569560532-1886-3-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1569560532-1886-1-git-send-email-light.hsieh@mediatek.com>
References: <1569560532-1886-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 6F640C398AB77A650F84C7F24FE7EAFF7D0D94B3703A1EA16F0D5465FC719A132000:8
X-MTK:  N
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

1.Refine mtk_pinconf_get():
1.1 Use only one occurrence of return at end of this function.
1.2 Correct cases for PIN_CONFIG_SLEW_RATE, PIN_CONFIG_INPUT_SCHMITT_ENABLE,
    and PIN_CONFIG_OUTPUT_ENABLE -
    Use variable ret to receive value in mtk_hw_get_value() (instead of
    variable val) since pinconf_to_config_packed() at end of this function
    use variable ret to pack config value.

2.Refine mtk_pinconf_set():
2.1 Use only one occurrence of return at end of this function.
2.2 Modify case of PIN_CONFIG_INPUT_ENABLE -
    Remove check of ies_present flag and always invoke mtk_hw_set_value()
    since mtk_hw_pin_field_lookup() invoked inside mtk_hw_set_value() has
    the same effect of checking if ies control is supported.
    [The rationale is that: available of a control is always checked
     in mtk_hw_pin_field_lookup() and no need to add ies_present flag
     specially for ies control.]
2.3 Simply code logic for case of PIN_CONFIG_INPUT_SCHMITT.
2.4 Add case for PIN_CONFIG_INPUT_SCHMITT_ENABLE and process it with the
    same code for case of PIN_CONFIG_INPUT_SCHMITT.

---
 drivers/pinctrl/mediatek/pinctrl-mt6765.c |   1 -
 drivers/pinctrl/mediatek/pinctrl-paris.c  | 211 +++++++++++-------------------
 2 files changed, 79 insertions(+), 133 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
index e024ebc..bada37f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
@@ -1070,7 +1070,6 @@
 	.ngrps = ARRAY_SIZE(mtk_pins_mt6765),
 	.eint_hw = &mt6765_eint_hw,
 	.gpio_m = 0,
-	.ies_present = true,
 	.base_names = mt6765_pinctrl_register_base_names,
 	.nbase_names = ARRAY_SIZE(mt6765_pinctrl_register_base_names),
 	.bias_disable_set = mtk_pinconf_bias_disable_set,
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 5217f76..54f069b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -78,95 +78,79 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	u32 param = pinconf_to_config_param(*config);
-	int val, val2, err, reg, ret = 1;
+	int err, reg, ret = 1;
 	const struct mtk_pin_desc *desc;
 
-	if (pin >= hw->soc->npins)
-		return -EINVAL;
+	if (pin >= hw->soc->npins) {
+		err = -EINVAL;
+		goto out;
+	}
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-		if (hw->soc->bias_disable_get) {
+		if (hw->soc->bias_disable_get)
 			err = hw->soc->bias_disable_get(hw, desc, &ret);
-			if (err)
-				return err;
-		} else {
-			return -ENOTSUPP;
-		}
+		else
+			err = -ENOTSUPP;
 		break;
 	case PIN_CONFIG_BIAS_PULL_UP:
-		if (hw->soc->bias_get) {
+		if (hw->soc->bias_get)
 			err = hw->soc->bias_get(hw, desc, 1, &ret);
-			if (err)
-				return err;
-		} else {
-			return -ENOTSUPP;
-		}
+		else
+			err = -ENOTSUPP;
 		break;
 	case PIN_CONFIG_BIAS_PULL_DOWN:
-		if (hw->soc->bias_get) {
+		if (hw->soc->bias_get)
 			err = hw->soc->bias_get(hw, desc, 0, &ret);
-			if (err)
-				return err;
-		} else {
-			return -ENOTSUPP;
-		}
+		else
+			err = -ENOTSUPP;
 		break;
 	case PIN_CONFIG_SLEW_RATE:
-		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SR, &val);
-		if (err)
-			return err;
-
-		if (!val)
-			return -EINVAL;
-
+		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SR, &ret);
 		break;
 	case PIN_CONFIG_INPUT_ENABLE:
 	case PIN_CONFIG_OUTPUT_ENABLE:
-		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &val);
+		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
 		if (err)
-			return err;
-
-		/* HW takes input mode as zero; output mode as non-zero */
-		if ((val && param == PIN_CONFIG_INPUT_ENABLE) ||
-		    (!val && param == PIN_CONFIG_OUTPUT_ENABLE))
-			return -EINVAL;
+			goto out;
+		/*     CONFIG     Current direction return value
+		 * -------------  ----------------- ----------------------
+		 * OUTPUT_ENABLE       output       1 (= HW value)
+		 *                     input        0 (= HW value)
+		 * INPUT_ENABLE        output       0 (= reverse HW value)
+		 *                     input        1 (= reverse HW value)
+		 */
+		if (param == PIN_CONFIG_INPUT_ENABLE)
+			ret = !ret;
 
 		break;
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &val);
-		if (err)
-			return err;
-
-		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SMT, &val2);
+		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
 		if (err)
-			return err;
+			goto out;
+		/* return error when in output mode
+		 * because schmitt trigger only work in input mode
+		 */
+		if (ret) {
+			err = -EINVAL;
+			goto out;
+		}
 
-		if (val || !val2)
-			return -EINVAL;
+		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SMT, &ret);
 
 		break;
 	case PIN_CONFIG_DRIVE_STRENGTH:
-		if (hw->soc->drive_get) {
+		if (hw->soc->drive_get)
 			err = hw->soc->drive_get(hw, desc, &ret);
-			if (err)
-				return err;
-		} else {
+		else
 			err = -ENOTSUPP;
-		}
 		break;
 	case MTK_PIN_CONFIG_TDSEL:
 	case MTK_PIN_CONFIG_RDSEL:
 		reg = (param == MTK_PIN_CONFIG_TDSEL) ?
 		       PINCTRL_PIN_REG_TDSEL : PINCTRL_PIN_REG_RDSEL;
-
-		err = mtk_hw_get_value(hw, desc, reg, &val);
-		if (err)
-			return err;
-
-		ret = val;
-
+		err = mtk_hw_get_value(hw, desc, reg, &ret);
 		break;
 	case MTK_PIN_CONFIG_PU_ADV:
 	case MTK_PIN_CONFIG_PD_ADV:
@@ -175,28 +159,24 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 
 			pullup = param == MTK_PIN_CONFIG_PU_ADV;
 			err = hw->soc->adv_pull_get(hw, desc, pullup, &ret);
-			if (err)
-				return err;
-		} else {
-			return -ENOTSUPP;
-		}
+		} else
+			err = -ENOTSUPP;
 		break;
 	case MTK_PIN_CONFIG_DRV_ADV:
-		if (hw->soc->adv_drive_get) {
+		if (hw->soc->adv_drive_get)
 			err = hw->soc->adv_drive_get(hw, desc, &ret);
-			if (err)
-				return err;
-		} else {
-			return -ENOTSUPP;
-		}
+		else
+			err = -ENOTSUPP;
 		break;
 	default:
-		return -ENOTSUPP;
+		err = -ENOTSUPP;
 	}
 
-	*config = pinconf_to_config_packed(param, ret);
+out:
+	if (!err)
+		*config = pinconf_to_config_packed(param, ret);
 
-	return 0;
+	return err;
 }
 
 static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
@@ -216,60 +196,45 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 
 	switch ((u32)param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-		if (hw->soc->bias_disable_set) {
+		if (hw->soc->bias_disable_set)
 			err = hw->soc->bias_disable_set(hw, desc);
-			if (err)
-				return err;
-		} else {
-			return -ENOTSUPP;
-		}
+		else
+			err = -ENOTSUPP;
 		break;
 	case PIN_CONFIG_BIAS_PULL_UP:
-		if (hw->soc->bias_set) {
+		if (hw->soc->bias_set)
 			err = hw->soc->bias_set(hw, desc, 1);
-			if (err)
-				return err;
-		} else {
-			return -ENOTSUPP;
-		}
+		else
+			err = -ENOTSUPP;
 		break;
 	case PIN_CONFIG_BIAS_PULL_DOWN:
-		if (hw->soc->bias_set) {
+		if (hw->soc->bias_set)
 			err = hw->soc->bias_set(hw, desc, 0);
-			if (err)
-				return err;
-		} else {
-			return -ENOTSUPP;
-		}
+		else
+			err = -ENOTSUPP;
 		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
 				       MTK_DISABLE);
-		if (err)
+		/* keep set direction to if SMT is not supported on this pin */
+		if (err != -ENOTSUPP)
 			goto err;
 
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
 				       MTK_OUTPUT);
-		if (err)
-			goto err;
 		break;
 	case PIN_CONFIG_INPUT_ENABLE:
-		if (hw->soc->ies_present) {
-			mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES,
-					 MTK_ENABLE);
-		}
+		/* regard all non-zero value as enable */
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES, !!arg);
+		if (err)
+			goto err;
 
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
 				       MTK_INPUT);
-		if (err)
-			goto err;
 		break;
 	case PIN_CONFIG_SLEW_RATE:
-		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SR,
-				       arg);
-		if (err)
-			goto err;
-
+		/* regard all non-zero value as enable */
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SR, !!arg);
 		break;
 	case PIN_CONFIG_OUTPUT:
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
@@ -279,41 +244,29 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO,
 				       arg);
-		if (err)
-			goto err;
 		break;
+	case PIN_CONFIG_INPUT_SCHMITT:
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		/* arg = 1: Input mode & SMT enable ;
+		/* arg = 1: Input mode & SMT enable
 		 * arg = 0: Output mode & SMT disable
 		 */
-		arg = arg ? 2 : 1;
-		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
-				       arg & 1);
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, !arg);
 		if (err)
 			goto err;
 
-		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
-				       !!(arg & 2));
-		if (err)
-			goto err;
+		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, !!arg);
 		break;
 	case PIN_CONFIG_DRIVE_STRENGTH:
-		if (hw->soc->drive_set) {
+		if (hw->soc->drive_set)
 			err = hw->soc->drive_set(hw, desc, arg);
-			if (err)
-				return err;
-		} else {
-			return -ENOTSUPP;
-		}
+		else
+			err = -ENOTSUPP;
 		break;
 	case MTK_PIN_CONFIG_TDSEL:
 	case MTK_PIN_CONFIG_RDSEL:
 		reg = (param == MTK_PIN_CONFIG_TDSEL) ?
 		       PINCTRL_PIN_REG_TDSEL : PINCTRL_PIN_REG_RDSEL;
-
 		err = mtk_hw_set_value(hw, desc, reg, arg);
-		if (err)
-			goto err;
 		break;
 	case MTK_PIN_CONFIG_PU_ADV:
 	case MTK_PIN_CONFIG_PD_ADV:
@@ -323,20 +276,14 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			pullup = param == MTK_PIN_CONFIG_PU_ADV;
 			err = hw->soc->adv_pull_set(hw, desc, pullup,
 						    arg);
-			if (err)
-				return err;
-		} else {
-			return -ENOTSUPP;
-		}
+		} else
+			err = -ENOTSUPP;
 		break;
 	case MTK_PIN_CONFIG_DRV_ADV:
-		if (hw->soc->adv_drive_set) {
+		if (hw->soc->adv_drive_set)
 			err = hw->soc->adv_drive_set(hw, desc, arg);
-			if (err)
-				return err;
-		} else {
-			return -ENOTSUPP;
-		}
+		else
+			err = -ENOTSUPP;
 		break;
 	default:
 		err = -ENOTSUPP;
@@ -952,6 +899,7 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 	return 0;
 }
 
+
 static int mtk_paris_pinctrl_suspend(struct device *device)
 {
 	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
@@ -970,4 +918,3 @@ static int mtk_paris_pinctrl_resume(struct device *device)
 	.suspend_noirq = mtk_paris_pinctrl_suspend,
 	.resume_noirq = mtk_paris_pinctrl_resume,
 };
-
-- 
1.8.1.1.dirty

