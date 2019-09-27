Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5AEEBFE5D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2019 07:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbfI0FCW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 01:02:22 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:59385 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725268AbfI0FCW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Sep 2019 01:02:22 -0400
X-UUID: 0a58ff07878449ae942ade5c2842ea3e-20190927
X-UUID: 0a58ff07878449ae942ade5c2842ea3e-20190927
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1988281203; Fri, 27 Sep 2019 13:02:15 +0800
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
Subject: [PATCH v6 5/5] pinctrl: mediatek: Add support for pin configuration dump     via debugfs.
Date:   Fri, 27 Sep 2019 13:02:12 +0800
Message-ID: <1569560532-1886-5-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1569560532-1886-1-git-send-email-light.hsieh@mediatek.com>
References: <1569560532-1886-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 202708E8AF92206FD4F0E6B2CF22597832A8A6D80EDB5FED26C295C43CD1303D2000:8
X-MTK:  N
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for pin configuration dump via catting
/sys/kernel/debug/pinctrl/$platform_dependent_path/pinconf-pins.
pinctrl framework had already support such dump. This patch implement the
operation function pointer to fullfill this dump.

---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 88 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.h | 30 +++++++++++
 2 files changed, 118 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 2a47c45..f531908 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -538,12 +538,99 @@ static int mtk_pctrl_get_group_pins(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int field)
+{
+	const struct mtk_pin_desc *desc;
+	int value, err;
+
+	if (gpio > hw->soc->npins)
+		return -EINVAL;
+
+	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
+
+	err = mtk_hw_get_value(hw, desc, field, &value);
+	if (err)
+		return err;
+
+	return value;
+}
+
+ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
+	unsigned int gpio, char *buf, unsigned int bufLen)
+{
+	const struct mtk_pin_desc *desc;
+	int pinmux, pullup, pullen, r1 = -1, r0 = -1, len = 0;
+
+	if (gpio > hw->soc->npins)
+		return -EINVAL;
+
+	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
+	pinmux = mtk_pctrl_get_pinmux(hw, gpio);
+	if (pinmux >= hw->soc->nfuncs)
+		pinmux -= hw->soc->nfuncs;
+
+	mtk_pinconf_bias_get_combo(hw, desc, &pullup, &pullen);
+	if (pullen == MTK_PUPD_SET_R1R0_00) {
+		pullen = 0;
+		r1 = 0;
+		r0 = 0;
+	} else if (pullen == MTK_PUPD_SET_R1R0_01) {
+		pullen = 1;
+		r1 = 0;
+		r0 = 1;
+	} else if (pullen == MTK_PUPD_SET_R1R0_10) {
+		pullen = 1;
+		r1 = 1;
+		r0 = 0;
+	} else if (pullen == MTK_PUPD_SET_R1R0_11) {
+		pullen = 1;
+		r1 = 1;
+		r0 = 1;
+	} else if (pullen != MTK_DISABLE && pullen != MTK_ENABLE) {
+		pullen = 0;
+	}
+	len += snprintf(buf + len, bufLen - len,
+			"%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
+			gpio,
+			pinmux,
+			mtk_pctrl_get_direction(hw, gpio),
+			mtk_pctrl_get_out(hw, gpio),
+			mtk_pctrl_get_in(hw, gpio),
+			mtk_pctrl_get_driving(hw, gpio),
+			mtk_pctrl_get_smt(hw, gpio),
+			mtk_pctrl_get_ies(hw, gpio),
+			pullen,
+			pullup);
+
+	if (r1 != -1) {
+		len += snprintf(buf + len, bufLen - len, " (%1d %1d)\n",
+			r1, r0);
+	} else {
+		len += snprintf(buf + len, bufLen - len, "\n");
+	}
+
+	return len;
+}
+
+#define PIN_DBG_BUF_SZ 96
+static void mtk_pctrl_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
+			  unsigned int gpio)
+{
+	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
+	char buf[PIN_DBG_BUF_SZ];
+
+	(void)mtk_pctrl_show_one_pin(hw, gpio, buf, PIN_DBG_BUF_SZ);
+
+	seq_printf(s, "%s", buf);
+}
+
 static const struct pinctrl_ops mtk_pctlops = {
 	.dt_node_to_map		= mtk_pctrl_dt_node_to_map,
 	.dt_free_map		= pinctrl_utils_free_map,
 	.get_groups_count	= mtk_pctrl_get_groups_count,
 	.get_group_name		= mtk_pctrl_get_group_name,
 	.get_group_pins		= mtk_pctrl_get_group_pins,
+	.pin_dbg_show           = mtk_pctrl_dbg_show,
 };
 
 static int mtk_pmx_get_funcs_cnt(struct pinctrl_dev *pctldev)
@@ -640,6 +727,7 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 	.pin_config_get = mtk_pinconf_get,
 	.pin_config_group_get	= mtk_pconf_group_get,
 	.pin_config_group_set	= mtk_pconf_group_set,
+	.is_generic = true,
 };
 
 static struct pinctrl_desc mtk_desc = {
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
index 3d43771..d73f4b6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.h
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
@@ -60,6 +60,36 @@
 int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc);
 
+int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int field);
+
+#define mtk_pctrl_get_pinmux(hw, gpio)			\
+	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_MODE)
+
+/* MTK HW use 0 as input, 1 for output
+ * This interface is for get direct register value,
+ * so don't reverse
+ */
+#define mtk_pctrl_get_direction(hw, gpio)		\
+	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DIR)
+
+#define mtk_pctrl_get_out(hw, gpio)			\
+	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DO)
+
+#define mtk_pctrl_get_in(hw, gpio)			\
+	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DI)
+
+#define mtk_pctrl_get_smt(hw, gpio)			\
+	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_SMT)
+
+#define mtk_pctrl_get_ies(hw, gpio)			\
+	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_IES)
+
+#define mtk_pctrl_get_driving(hw, gpio)			\
+	mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DRV)
+
+ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
+	unsigned int gpio, char *buf, unsigned int bufLen);
+
 extern const struct dev_pm_ops mtk_paris_pinctrl_pm_ops;
 
 #endif /* __PINCTRL_PARIS_H */
-- 
1.8.1.1.dirty

