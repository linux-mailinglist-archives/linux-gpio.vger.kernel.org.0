Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3C0EB4D28
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2019 13:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbfIQLrf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Sep 2019 07:47:35 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:29391 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726932AbfIQLre (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Sep 2019 07:47:34 -0400
X-UUID: 9970c36752cb47759516b2789e3ec271-20190917
X-UUID: 9970c36752cb47759516b2789e3ec271-20190917
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1491415223; Tue, 17 Sep 2019 19:47:28 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 17 Sep 2019 19:47:27 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 17 Sep 2019 19:47:27 +0800
From:   Light Hsieh <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v4 5/5] pinctrl: mediatek: Add support for pin configuration dump   via debugfs.
Date:   Tue, 17 Sep 2019 19:47:25 +0800
Message-ID: <1568720845-20254-5-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1568720845-20254-1-git-send-email-light.hsieh@mediatek.com>
References: <1568720845-20254-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: B0DEE8EB08E43451646114D2D3BDD91E5DE4E5DCB2E01BEA73918ED9A2828C5B2000:8
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
 1 file changed, 88 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index e847867..6acbdc3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -530,12 +530,99 @@ static int mtk_pctrl_get_group_pins(struct pinctrl_dev *pctldev,
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
@@ -632,6 +719,7 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 	.pin_config_get = mtk_pinconf_get,
 	.pin_config_group_get	= mtk_pconf_group_get,
 	.pin_config_group_set	= mtk_pconf_group_set,
+	.is_generic = true,
 };
 
 static struct pinctrl_desc mtk_desc = {
-- 
1.8.1.1.dirty

