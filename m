Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63F9CD60A4
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 12:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731524AbfJNKzD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 06:55:03 -0400
Received: from mail-sz.amlogic.com ([211.162.65.117]:58199 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731010AbfJNKzC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 06:55:02 -0400
Received: from localhost.localdomain (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Mon, 14 Oct 2019
 18:55:04 +0800
From:   Qianggui Song <qianggui.song@amlogic.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Qianggui Song <qianggui.song@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Carlo Caione <carlo@caione.org>,
        Rob Herring <robh+dt@kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/4] pinctrl: meson: add a new dt parse callback for Meson-A series SoCs
Date:   Mon, 14 Oct 2019 18:54:50 +0800
Message-ID: <1571050492-6598-3-git-send-email-qianggui.song@amlogic.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1571050492-6598-1-git-send-email-qianggui.song@amlogic.com>
References: <1571050492-6598-1-git-send-email-qianggui.song@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.28.8.19]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Meson A1 Soc share the same register layout of pinmux with previous
Meson-G12A, however there is difference for gpio and pin config register
in A1. The main difference is that registers before A1 are grouped by
function while those of A1 are by bank. The new register layout is as
below:

/* first bank */	      /* addr */
- P_PADCTRL_GPIOP_I         base + 0x00 << 2
- P_PADCTRL_GPIOP_O         base + 0x01 << 2
- P_PADCTRL_GPIOP_OEN       base + 0x02 << 2
- P_PADCTRL_GPIOP_PULL_EN   base + 0x03 << 2
- P_PADCTRL_GPIOP_PULL_UP   base + 0x04 << 2
- P_PADCTRL_GPIOP_DS        base + 0x05 << 2

/* second bank */
- P_PADCTRL_GPIOB_I         base + 0x10 << 2
- P_PADCTRL_GPIOB_O         base + 0x11 << 2
- P_PADCTRL_GPIOB_OEN       base + 0x12 << 2
- P_PADCTRL_GPIOB_PULL_EN   base + 0x13 << 2
- P_PADCTRL_GPIOB_PULL_UP   base + 0x14 << 2
- P_PADCTRL_GPIOB_DS        base + 0x15 << 2

Each bank contains at least 6 registers to be configured, if one bank
has more than 16 gpios, an extra P_PADCTRL_GPIO[X]_DS_EXT is included.
Between two adjacent P_PADCTRL_GPIO[X]_I, there is an offset 0x10, that
is to say, for third bank, the offsets will be 0x20,0x21,0x22,0x23,0x24
,0x25 according to above register layout. For previous chips, registers
are grouped according to their functions while registers of A1 are
according to bank.

Current Meson pinctrl driver can cover such change by using base address
of GPIO as that of drive-strength.While simply giving reg_ds = reg_pullen
make wrong value to reg_ds for Socs that do not support drive-strength
like AXG.To make things simple, add an extra dt parser function for
a1 or later chip and remain the old dt parser function for old Socs.

Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 16 +++++++++++++++-
 drivers/pinctrl/meson/pinctrl-meson.h |  7 +++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 8bba9d053d9f..e8f6298fc96a 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -695,6 +695,17 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
 	return 0;
 }
 
+int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
+				 struct device_node *node)
+{
+	int ret;
+
+	ret = meson_pinctrl_parse_dt(pc, node);
+	pc->reg_ds = pc->reg_pullen;
+
+	return ret;
+}
+
 int meson_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -708,7 +719,10 @@ int meson_pinctrl_probe(struct platform_device *pdev)
 	pc->dev = dev;
 	pc->data = (struct meson_pinctrl_data *) of_device_get_match_data(dev);
 
-	ret = meson_pinctrl_parse_dt(pc, dev->of_node);
+	if (pc->data->parse_dt)
+		ret = pc->data->parse_dt(pc, dev->of_node);
+	else
+		ret = meson_pinctrl_parse_dt(pc, dev->of_node);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index c696f3241a36..0cd6a869cae3 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -11,6 +11,8 @@
 #include <linux/regmap.h>
 #include <linux/types.h>
 
+struct meson_pinctrl;
+
 /**
  * struct meson_pmx_group - a pinmux group
  *
@@ -114,6 +116,7 @@ struct meson_pinctrl_data {
 	unsigned int num_banks;
 	const struct pinmux_ops *pmx_ops;
 	void *pmx_data;
+	int (*parse_dt)(struct meson_pinctrl *pc, struct device_node *node);
 };
 
 struct meson_pinctrl {
@@ -171,3 +174,7 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev,
 
 /* Common probe function */
 int meson_pinctrl_probe(struct platform_device *pdev);
+
+/* Extra dt parse function for register layout grouped by bank */
+int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
+				 struct device_node *node);
-- 
1.9.1

