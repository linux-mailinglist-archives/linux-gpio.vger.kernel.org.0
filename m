Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E6C40EF43
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 04:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242750AbhIQCdz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 22:33:55 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:37536 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S242784AbhIQCdu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 22:33:50 -0400
X-UUID: f59dea137a0d4c78bb3359de1ef2da72-20210917
X-UUID: f59dea137a0d4c78bb3359de1ef2da72-20210917
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1873056277; Fri, 17 Sep 2021 10:32:24 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 10:32:22 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Sep 2021 10:32:21 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>,
        <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
        <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v12 4/5] pinctrl: mediatek: support rsel feature
Date:   Fri, 17 Sep 2021 10:32:15 +0800
Message-ID: <20210917023216.18384-5-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917023216.18384-1-zhiyong.tao@mediatek.com>
References: <20210917023216.18384-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch supports rsel(resistance selection) feature for I2C pins.
It provides more resistance selection solution in different ICs.
It provides rsel define and si unit solution by identifying
"mediatek,rsel_resistance_in_si_unit" property in pio dtsi node.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 231 +++++++++++++++---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  45 ++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  60 +++--
 3 files changed, 288 insertions(+), 48 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 5b3b048725cc..a73a5f624228 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -661,6 +661,181 @@ static int mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
 	return err;
 }
 
+static int mtk_hw_pin_rsel_lookup(struct mtk_pinctrl *hw,
+				  const struct mtk_pin_desc *desc,
+				  u32 pullup, u32 arg, u32 *rsel_val)
+{
+	const struct mtk_pin_rsel *rsel;
+	int check;
+	bool found = false;
+
+	rsel = hw->soc->pin_rsel;
+
+	for (check = 0; check <= hw->soc->npin_rsel - 1; check++) {
+		if (desc->number >= rsel[check].s_pin &&
+		    desc->number <= rsel[check].e_pin) {
+			if (pullup) {
+				if (rsel[check].up_rsel == arg) {
+					found = true;
+					*rsel_val = rsel[check].rsel_index;
+					break;
+				}
+			} else {
+				if (rsel[check].down_rsel == arg) {
+					found = true;
+					*rsel_val = rsel[check].rsel_index;
+					break;
+				}
+			}
+		}
+	}
+
+	if (!found) {
+		dev_err(hw->dev, "Not support rsel value %d Ohm for pin = %d (%s)\n",
+			arg, desc->number, desc->name);
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int mtk_pinconf_bias_set_rsel(struct mtk_pinctrl *hw,
+				     const struct mtk_pin_desc *desc,
+				     u32 pullup, u32 arg)
+{
+	int err, rsel_val;
+
+	if (hw->rsel_si_unit) {
+		/* find pin rsel_index from pin_rsel array*/
+		err = mtk_hw_pin_rsel_lookup(hw, desc, pullup, arg, &rsel_val);
+		if (err)
+			goto out;
+	} else {
+		if (arg < MTK_PULL_SET_RSEL_000 ||
+		    arg > MTK_PULL_SET_RSEL_111) {
+			err = -EINVAL;
+			goto out;
+		}
+
+		rsel_val = arg - MTK_PULL_SET_RSEL_000;
+	}
+
+	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_RSEL, rsel_val);
+	if (err)
+		goto out;
+
+	err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, MTK_ENABLE);
+
+out:
+	return err;
+}
+
+int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
+			       const struct mtk_pin_desc *desc,
+			       u32 pullup, u32 arg)
+{
+	int err = -EOPNOTSUPP;
+	u32 try_all_type;
+
+	if (hw->soc->pull_type)
+		try_all_type = hw->soc->pull_type[desc->number];
+	else
+		try_all_type = MTK_PULL_TYPE_MASK;
+
+	if (try_all_type & MTK_PULL_RSEL_TYPE) {
+		err = mtk_pinconf_bias_set_rsel(hw, desc, pullup, arg);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
+		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type & MTK_PULL_PULLSEL_TYPE) {
+		err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc,
+							  pullup, arg);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type & MTK_PULL_PUPD_R1R0_TYPE)
+		err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc, pullup, arg);
+
+	if (err)
+		dev_err(hw->dev, "Invalid pull argument\n");
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
+
+static int mtk_rsel_get_si_unit(struct mtk_pinctrl *hw,
+				const struct mtk_pin_desc *desc,
+				u32 pullup, u32 rsel_val, u32 *si_unit)
+{
+	const struct mtk_pin_rsel *rsel;
+	int check;
+
+	rsel = hw->soc->pin_rsel;
+
+	for (check = 0; check <= hw->soc->npin_rsel - 1; check++) {
+		if (desc->number >= rsel[check].s_pin &&
+		    desc->number <= rsel[check].e_pin) {
+			if (rsel_val == rsel[check].rsel_index) {
+				if (pullup)
+					*si_unit = rsel[check].up_rsel;
+				else
+					*si_unit = rsel[check].down_rsel;
+				break;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int mtk_pinconf_bias_get_rsel(struct mtk_pinctrl *hw,
+				     const struct mtk_pin_desc *desc,
+				     u32 *pullup, u32 *enable)
+{
+	int pu, pd, rsel, err;
+
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_RSEL, &rsel);
+	if (err)
+		goto out;
+
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PU, &pu);
+	if (err)
+		goto out;
+
+	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PD, &pd);
+
+	if (pu == 0 && pd == 0) {
+		*pullup = 0;
+		*enable = MTK_DISABLE;
+	} else if (pu == 1 && pd == 0) {
+		*pullup = 1;
+		if (hw->rsel_si_unit)
+			mtk_rsel_get_si_unit(hw, desc, *pullup, rsel, enable);
+		else
+			*enable = rsel + MTK_PULL_SET_RSEL_000;
+	} else if (pu == 0 && pd == 1) {
+		*pullup = 0;
+		if (hw->rsel_si_unit)
+			mtk_rsel_get_si_unit(hw, desc, *pullup, rsel, enable);
+		else
+			*enable = rsel + MTK_PULL_SET_RSEL_000;
+	} else {
+		err = -EINVAL;
+		goto out;
+	}
+
+out:
+	return err;
+}
+
 static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
 				const struct mtk_pin_desc *desc,
 				u32 *pullup, u32 *enable)
@@ -742,44 +917,40 @@ static int mtk_pinconf_bias_get_pupd_r1_r0(struct mtk_pinctrl *hw,
 	return err;
 }
 
-int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
-				const struct mtk_pin_desc *desc,
-				u32 pullup, u32 arg)
-{
-	int err;
-
-	err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
-	if (!err)
-		goto out;
-
-	err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc, pullup, arg);
-	if (!err)
-		goto out;
-
-	err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc, pullup, arg);
-
-out:
-	return err;
-}
-EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
-
 int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc,
 			      u32 *pullup, u32 *enable)
 {
-	int err;
+	int err = -EOPNOTSUPP;
+	u32 try_all_type;
 
-	err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
-	if (!err)
-		goto out;
+	if (hw->soc->pull_type)
+		try_all_type = hw->soc->pull_type[desc->number];
+	else
+		try_all_type = MTK_PULL_TYPE_MASK;
 
-	err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc, pullup, enable);
-	if (!err)
-		goto out;
+	if (try_all_type & MTK_PULL_RSEL_TYPE) {
+		err = mtk_pinconf_bias_get_rsel(hw, desc, pullup, enable);
+		if (!err)
+			return err;
+	}
 
-	err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup, enable);
+	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
+		err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type & MTK_PULL_PULLSEL_TYPE) {
+		err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc,
+							  pullup, enable);
+		if (!err)
+			return err;
+	}
+
+	if (try_all_type & MTK_PULL_PUPD_R1R0_TYPE)
+		err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup, enable);
 
-out:
 	return err;
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_combo);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index a6f1bdb2083b..4908c7aedbe0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -17,6 +17,22 @@
 #define MTK_ENABLE     1
 #define MTK_PULLDOWN   0
 #define MTK_PULLUP     1
+#define MTK_PULL_PU_PD_TYPE		BIT(0)
+#define MTK_PULL_PULLSEL_TYPE		BIT(1)
+#define MTK_PULL_PUPD_R1R0_TYPE		BIT(2)
+/* MTK_PULL_RSEL_TYPE can select resistance and can be
+ * turned on/off itself. But it can't be selected pull up/down
+ */
+#define MTK_PULL_RSEL_TYPE		BIT(3)
+/* MTK_PULL_PU_PD_RSEL_TYPE is a type which is controlled by
+ * MTK_PULL_PU_PD_TYPE and MTK_PULL_RSEL_TYPE.
+ */
+#define MTK_PULL_PU_PD_RSEL_TYPE	(MTK_PULL_PU_PD_TYPE \
+					| MTK_PULL_RSEL_TYPE)
+#define MTK_PULL_TYPE_MASK	(MTK_PULL_PU_PD_TYPE |\
+				 MTK_PULL_PULLSEL_TYPE |\
+				 MTK_PULL_PUPD_R1R0_TYPE |\
+				 MTK_PULL_RSEL_TYPE)
 
 #define EINT_NA	U16_MAX
 #define NO_EINT_SUPPORT	EINT_NA
@@ -42,6 +58,14 @@
 	PIN_FIELD_CALC(_s_pin, _e_pin, 0, _s_addr, _x_addrs, _s_bit,	\
 		       _x_bits, 32, 1)
 
+#define PIN_RSEL(_s_pin, _e_pin, _rsel_index, _up_resl, _down_rsel) {	\
+		.s_pin = _s_pin,					\
+		.e_pin = _e_pin,					\
+		.rsel_index = _rsel_index,				\
+		.up_rsel = _up_resl,					\
+		.down_rsel = _down_rsel,				\
+	}
+
 /* List these attributes which could be modified for the pin */
 enum {
 	PINCTRL_PIN_REG_MODE,
@@ -67,6 +91,7 @@ enum {
 	PINCTRL_PIN_REG_DRV_E0,
 	PINCTRL_PIN_REG_DRV_E1,
 	PINCTRL_PIN_REG_DRV_ADV,
+	PINCTRL_PIN_REG_RSEL,
 	PINCTRL_PIN_REG_MAX,
 };
 
@@ -129,6 +154,21 @@ struct mtk_pin_field_calc {
 	u8  fixed;
 };
 
+/* struct mtk_pin_rsel - the structure that provides bias resistance selection.
+ * @s_pin:		the start pin within the rsel range
+ * @e_pin:		the end pin within the rsel range
+ * @rsel_index:	the rsel bias resistance index
+ * @up_rsel:	the pullup rsel bias resistance value
+ * @down_rsel:	the pulldown rsel bias resistance value
+ */
+struct mtk_pin_rsel {
+	u16 s_pin;
+	u16 e_pin;
+	u16 rsel_index;
+	u32 up_rsel;
+	u32 down_rsel;
+};
+
 /* struct mtk_pin_reg_calc - the structure that holds all ranges used to
  *			     determine which register the pin would make use of
  *			     for certain pin attribute.
@@ -206,6 +246,9 @@ struct mtk_pin_soc {
 	bool				ies_present;
 	const char * const		*base_names;
 	unsigned int			nbase_names;
+	const unsigned int		*pull_type;
+	const struct mtk_pin_rsel	*pin_rsel;
+	unsigned int			npin_rsel;
 
 	/* Specific pinconfig operations */
 	int (*bias_disable_set)(struct mtk_pinctrl *hw,
@@ -254,6 +297,8 @@ struct mtk_pinctrl {
 	const char          **grp_names;
 	/* lock pin's register resource to avoid multiple threads issue*/
 	spinlock_t lock;
+	/* identify rsel setting by si unit or rsel define in dts node */
+	bool rsel_si_unit;
 };
 
 void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 38aec0177d15..d4e02c5d74a8 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -579,8 +579,9 @@ static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int
 ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	unsigned int gpio, char *buf, unsigned int buf_len)
 {
-	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
+	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1, rsel = -1;
 	const struct mtk_pin_desc *desc;
+	u32 try_all_type;
 
 	if (gpio >= hw->soc->npins)
 		return -EINVAL;
@@ -591,24 +592,39 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 		pinmux -= hw->soc->nfuncs;
 
 	mtk_pinconf_bias_get_combo(hw, desc, &pullup, &pullen);
-	if (pullen == MTK_PUPD_SET_R1R0_00) {
-		pullen = 0;
-		r1 = 0;
-		r0 = 0;
-	} else if (pullen == MTK_PUPD_SET_R1R0_01) {
-		pullen = 1;
-		r1 = 0;
-		r0 = 1;
-	} else if (pullen == MTK_PUPD_SET_R1R0_10) {
-		pullen = 1;
-		r1 = 1;
-		r0 = 0;
-	} else if (pullen == MTK_PUPD_SET_R1R0_11) {
+
+	if (hw->soc->pull_type)
+		try_all_type = hw->soc->pull_type[desc->number];
+
+	if (hw->rsel_si_unit && (try_all_type & MTK_PULL_RSEL_TYPE)) {
+		rsel = pullen;
 		pullen = 1;
-		r1 = 1;
-		r0 = 1;
-	} else if (pullen != MTK_DISABLE && pullen != MTK_ENABLE) {
-		pullen = 0;
+	} else {
+		/* Case for: R1R0 */
+		if (pullen == MTK_PUPD_SET_R1R0_00) {
+			pullen = 0;
+			r1 = 0;
+			r0 = 0;
+		} else if (pullen == MTK_PUPD_SET_R1R0_01) {
+			pullen = 1;
+			r1 = 0;
+			r0 = 1;
+		} else if (pullen == MTK_PUPD_SET_R1R0_10) {
+			pullen = 1;
+			r1 = 1;
+			r0 = 0;
+		} else if (pullen == MTK_PUPD_SET_R1R0_11) {
+			pullen = 1;
+			r1 = 1;
+			r0 = 1;
+		}
+
+		/* Case for: RSEL */
+		if (pullen >= MTK_PULL_SET_RSEL_000 &&
+		    pullen <= MTK_PULL_SET_RSEL_111) {
+			rsel = pullen - MTK_PULL_SET_RSEL_000;
+			pullen = 1;
+		}
 	}
 	len += scnprintf(buf + len, buf_len - len,
 			"%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
@@ -626,6 +642,8 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	if (r1 != -1) {
 		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
 			r1, r0);
+	} else if (rsel != -1) {
+		len += scnprintf(buf + len, buf_len - len, " (%1d)\n", rsel);
 	} else {
 		len += scnprintf(buf + len, buf_len - len, "\n");
 	}
@@ -970,6 +988,12 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 
 	hw->nbase = hw->soc->nbase_names;
 
+	if (of_find_property(hw->dev->of_node,
+			     "mediatek,rsel_resistance_in_si_unit", NULL))
+		hw->rsel_si_unit = true;
+	else
+		hw->rsel_si_unit = false;
+
 	spin_lock_init(&hw->lock);
 
 	err = mtk_pctrl_build_state(pdev);
-- 
2.25.1

