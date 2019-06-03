Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB49D329B8
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 09:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfFCHfM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 03:35:12 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39804 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfFCHfL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 03:35:11 -0400
Received: by mail-pg1-f193.google.com with SMTP id 196so7781614pgc.6
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2019 00:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3QNw8nhaZHDfKLrM0rv9vo2EpHsekryGUP7JjhXswAQ=;
        b=llOF4BIuNJVs6GZM6jHa50wWVhu2+prvVN55nttzggTtirL9mkyR79tSCkK0F1r2JC
         zTuErus7hyjRG/rhqILe2Xgapbe45GSvYw36o1+Bk7MQptFO97IcXFmuIAxBLLF7rZJv
         OorL9OtrLD/UcBR/42PN6cJ7ChB8WwtQ5UY+nSXRWVvLVHQAPXFAxieSMt8b+ViBBob6
         6WQO3f/aqEFVMlZKOqOmSap/GEEN6oCP3O3cM3ZBCboORm+tflyIyBXIzH3Oof0Cbk2i
         haxhSAZJg4ygfOxrLLWdestnBCgIgc2ER0RtvDUrHaiYcnZIC1uohCDUZwplqlXAg+hW
         3Txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3QNw8nhaZHDfKLrM0rv9vo2EpHsekryGUP7JjhXswAQ=;
        b=J0dB+X3UXMmM7A63ugJvo8TH2Cxlm9zLun/WoD5r4ZHUNE+JzPyvwsUoamfltBF+TD
         euzTqxpdOUnhf5iLhutNIf+ukDYSFsgFMtg9IVlCCToJXURjoQhmDyhJRpNbes2+3uT5
         m32w3Xn+U70EB4F4rM+0AHsBNJrXqlfSaOrMavGCx0roeu3cnPl9GqkyfN/vIbeIakE8
         QkHfy3sTHMXWFkdyWLgRQFmpDNN0vvNwF70DR8pA80EBt7pgkjOISJj9XP7Ze6lTOgFX
         0pKj/BvCyeHXRVI5loECwMWwO+GUDrSXkMXzGc4GYXBx7nlgGcS/vM2iAB1Htsb4fTTO
         EL2A==
X-Gm-Message-State: APjAAAWBDnYmPbrNwGCeD2toC1SgbW6qZl4K5zJjgqkhYL/j0MB0gk+O
        XviTlz61CtAaHQyvYZItSvqj
X-Google-Smtp-Source: APXvYqzT4SOCES3EtOazssZ500M5Rx6RROevM/d2u42V7d6omrpIcPcrQfFsubZVlEu28rAD7ApHbw==
X-Received: by 2002:a62:764d:: with SMTP id r74mr5369615pfc.110.1559547310720;
        Mon, 03 Jun 2019 00:35:10 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:716:e714:cd5e:23ab:e451:ee6a])
        by smtp.gmail.com with ESMTPSA id r64sm17547366pfr.58.2019.06.03.00.35.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 00:35:10 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        linux-gpio@vger.kernel.org, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] pinctrl: Add drive strength support for BM1880 SoC
Date:   Mon,  3 Jun 2019 13:04:21 +0530
Message-Id: <20190603073421.10314-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603073421.10314-1-manivannan.sadhasivam@linaro.org>
References: <20190603073421.10314-1-manivannan.sadhasivam@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add drive strength support for Bitmain BM1880 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pinctrl/pinctrl-bm1880.c | 290 ++++++++++++++++++++++++++++++-
 1 file changed, 287 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
index 1aaed46d5c30..63b130cb1ffb 100644
--- a/drivers/pinctrl/pinctrl-bm1880.c
+++ b/drivers/pinctrl/pinctrl-bm1880.c
@@ -4,8 +4,6 @@
  *
  * Copyright (c) 2019 Linaro Ltd.
  * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
- *
- * TODO: Drive strength support
  */
 
 #include <linux/io.h>
@@ -29,6 +27,7 @@
  * @ngroups:	Number of @groups
  * @funcs:	Pinmux functions
  * @nfuncs:	Number of @funcs
+ * @pconf:	Pinconf data
  */
 struct bm1880_pinctrl {
 	void __iomem *base;
@@ -37,6 +36,7 @@ struct bm1880_pinctrl {
 	unsigned int ngroups;
 	const struct bm1880_pinmux_function *funcs;
 	unsigned int nfuncs;
+	const struct bm1880_pinconf_data *pinconf;
 };
 
 /**
@@ -69,6 +69,14 @@ struct bm1880_pinmux_function {
 	u8 mux_shift;
 };
 
+/**
+ * struct bm1880_pinconf_data - pinconf data
+ * @drv_bits:	Drive strength bit width
+ */
+struct bm1880_pinconf_data {
+	u32 drv_bits;
+};
+
 static const struct pinctrl_pin_desc bm1880_pins[] = {
 	PINCTRL_PIN(0,   "MIO0"),
 	PINCTRL_PIN(1,   "MIO1"),
@@ -785,6 +793,126 @@ static const struct bm1880_pinmux_function bm1880_pmux_functions[] = {
 	BM1880_PINMUX_FUNCTION(spi0, 1),
 };
 
+#define BM1880_PINCONF_DAT(_width)		\
+	{					\
+		.drv_bits = _width,		\
+	}
+
+static const struct bm1880_pinconf_data bm1880_pinconf[] = {
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+};
+
 static int bm1880_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct bm1880_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
@@ -878,9 +1006,145 @@ static int bm1880_pinmux_set_mux(struct pinctrl_dev *pctldev,
 #define BM1880_PINCONF_PULLCTRL(pin)	BM1880_PINCONF(pin, 0)
 #define BM1880_PINCONF_PULLUP(pin)	BM1880_PINCONF(pin, 1)
 #define BM1880_PINCONF_PULLDOWN(pin)	BM1880_PINCONF(pin, 2)
+#define BM1880_PINCONF_DRV(pin)		BM1880_PINCONF(pin, 6)
 #define BM1880_PINCONF_SCHMITT(pin)	BM1880_PINCONF(pin, 9)
 #define BM1880_PINCONF_SLEW(pin)	BM1880_PINCONF(pin, 10)
 
+static int bm1880_pinconf_drv_set(unsigned int mA, u32 width,
+				  u32 *regval, u32 bit_offset)
+{
+	u32 _regval;
+
+	_regval = *regval;
+
+	/*
+	 * There are two sets of drive strength bit width exposed by the
+	 * SoC at 4mA step, hence we need to handle them separately.
+	 */
+	if (width == 0x03) {
+		switch (mA) {
+		case 4:
+			_regval &= ~(width << bit_offset);
+			_regval |= (0 << bit_offset);
+			break;
+		case 8:
+			_regval &= ~(width << bit_offset);
+			_regval |= (1 << bit_offset);
+			break;
+		case 12:
+			_regval &= ~(width << bit_offset);
+			_regval |= (2 << bit_offset);
+			break;
+		case 16:
+			_regval &= ~(width << bit_offset);
+			_regval |= (3 << bit_offset);
+			break;
+		case 20:
+			_regval &= ~(width << bit_offset);
+			_regval |= (4 << bit_offset);
+			break;
+		case 24:
+			_regval &= ~(width << bit_offset);
+			_regval |= (5 << bit_offset);
+			break;
+		case 28:
+			_regval &= ~(width << bit_offset);
+			_regval |= (6 << bit_offset);
+			break;
+		case 32:
+			_regval &= ~(width << bit_offset);
+			_regval |= (7 << bit_offset);
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else {
+		switch (mA) {
+		case 4:
+			_regval &= ~(width << bit_offset);
+			_regval |= (0 << bit_offset);
+			break;
+		case 8:
+			_regval &= ~(width << bit_offset);
+			_regval |= (1 << bit_offset);
+			break;
+		case 12:
+			_regval &= ~(width << bit_offset);
+			_regval |= (2 << bit_offset);
+			break;
+		case 16:
+			_regval &= ~(width << bit_offset);
+			_regval |= (3 << bit_offset);
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	*regval = _regval;
+
+	return 0;
+}
+
+static int bm1880_pinconf_drv_get(u32 width, u32 drv)
+{
+	int ret = -ENOTSUPP;
+
+	/*
+	 * There are two sets of drive strength bit width exposed by the
+	 * SoC at 4mA step, hence we need to handle them separately.
+	 */
+	if (width == 0x03) {
+		switch (drv) {
+		case 0:
+			ret  = 4;
+			break;
+		case 1:
+			ret  = 8;
+			break;
+		case 2:
+			ret  = 12;
+			break;
+		case 3:
+			ret  = 16;
+			break;
+		case 4:
+			ret  = 20;
+			break;
+		case 5:
+			ret  = 24;
+			break;
+		case 6:
+			ret  = 28;
+			break;
+		case 7:
+			ret  = 32;
+			break;
+		default:
+			break;
+		}
+	} else {
+		switch (drv) {
+		case 0:
+			ret  = 4;
+			break;
+		case 1:
+			ret  = 8;
+			break;
+		case 2:
+			ret  = 12;
+			break;
+		case 3:
+			ret  = 16;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return ret;
+}
+
 static int bm1880_pinconf_cfg_get(struct pinctrl_dev *pctldev,
 				  unsigned int pin,
 				  unsigned long *config)
@@ -889,6 +1153,7 @@ static int bm1880_pinconf_cfg_get(struct pinctrl_dev *pctldev,
 	unsigned int param = pinconf_to_config_param(*config);
 	unsigned int arg = 0;
 	u32 regval, offset, bit_offset;
+	int ret;
 
 	offset = (pin >> 1) << 2;
 	regval = readl_relaxed(pctrl->base + BM1880_REG_MUX + offset);
@@ -914,6 +1179,15 @@ static int bm1880_pinconf_cfg_get(struct pinctrl_dev *pctldev,
 		bit_offset = BM1880_PINCONF_SLEW(pin);
 		arg = !!(regval & BIT(bit_offset));
 		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		bit_offset = BM1880_PINCONF_DRV(pin);
+		ret = bm1880_pinconf_drv_get(pctrl->pinconf[pin].drv_bits,
+					     !!(regval & BIT(bit_offset)));
+		if (ret < 0)
+			return ret;
+
+		arg = ret;
+		break;
 	default:
 		return -ENOTSUPP;
 	}
@@ -930,7 +1204,7 @@ static int bm1880_pinconf_cfg_set(struct pinctrl_dev *pctldev,
 {
 	struct bm1880_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	u32 regval, offset, bit_offset;
-	int i;
+	int i, ret;
 
 	offset = (pin >> 1) << 2;
 	regval = readl_relaxed(pctrl->base + BM1880_REG_MUX + offset);
@@ -966,6 +1240,15 @@ static int bm1880_pinconf_cfg_set(struct pinctrl_dev *pctldev,
 			else
 				regval &= ~BIT(bit_offset);
 			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			bit_offset = BM1880_PINCONF_DRV(pin);
+			ret = bm1880_pinconf_drv_set(arg,
+						pctrl->pinconf[pin].drv_bits,
+						&regval, bit_offset);
+			if (ret < 0)
+				return ret;
+
+			break;
 		default:
 			dev_warn(pctldev->dev,
 				 "unsupported configuration parameter '%u'\n",
@@ -1041,6 +1324,7 @@ static int bm1880_pinctrl_probe(struct platform_device *pdev)
 	pctrl->ngroups = ARRAY_SIZE(bm1880_pctrl_groups);
 	pctrl->funcs = bm1880_pmux_functions;
 	pctrl->nfuncs = ARRAY_SIZE(bm1880_pmux_functions);
+	pctrl->pinconf = bm1880_pinconf;
 
 	pctrl->pctrldev = devm_pinctrl_register(&pdev->dev, &bm1880_desc,
 						pctrl);
-- 
2.17.1

