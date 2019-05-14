Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 456FD1C4AA
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2019 10:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfENI1N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 May 2019 04:27:13 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54444 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbfENI1C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 May 2019 04:27:02 -0400
Received: by mail-wm1-f65.google.com with SMTP id i3so1841930wml.4
        for <linux-gpio@vger.kernel.org>; Tue, 14 May 2019 01:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3x2u8vlc03FHovk1PpbzpzB1pPYYC7ub3O0NI270oZ4=;
        b=17bJ23npG2bMne9d34MSyf1rIZo65eCy1LLYDwEGPQ2fV3WdZIa7MznfXDA59GUdRU
         CYITe88smMfolqZEoSIrjAv3DmN+NZCqYAup2wVJdIbvonjWbstCQLCyI3JpRvcK3w66
         2XAU+Y830fRFUGxjuhBFYUpze8TCflnSgbWEVX/FhECkasdw/GvevACABSx0RpBPIPYg
         cy2spwy/ui9W0AoG2uqnQCwHTDvJEqzReqqRH9y+qsnlvD/s6hM1XThcCeIj0DK7D0Dr
         MjMhhYdvC5ls8Rneq2gCwWn5G+vPAAp+rFOnQs8w7pW835eE9wCkIVkkuGrjWnUesC1t
         pGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3x2u8vlc03FHovk1PpbzpzB1pPYYC7ub3O0NI270oZ4=;
        b=Lwdh2tqJHh0fJXo/Q/pgVmN+rrQ/iBBM8NNbwyHHrEASkRFN0ku0ZgFPZPIaTfeEYl
         BvAc+PX4fBt8EYHTKmwhF5r4lI9R/w2iCVkHBSrIRhgS0WwP0HoaYpCQr3iGytQ5geJa
         Gxf0HwvyjV26/C+iH5FrKyeWUJYG3DdbzdM28+33LGHEIJ+OW7LqA/PSafut+qnuZ3aI
         3jRt7TSWCpR1a80q1cBksADD3K+elrhzakqYDDp6OtXLxD1+hQNRYDvtRHPO8vXTZlD4
         LJpwfYJ32VdqKRjBv+atU6lXP5C5JJg5QGn6QVVFUMrU+V7GmE42OJVO2iLOpVSuiupL
         sgJA==
X-Gm-Message-State: APjAAAWR9TFwjAjxnSjE5b97JYvdu8nSeQLLfXB73wLLJBKzYsmmU3XE
        Uw8/5lxbHRJ6AcGfl5mZC9Y4tw==
X-Google-Smtp-Source: APXvYqxNp0B1W3vmolo0/yB3tvq+dlrEEznG/wDIMjshPBVbtrnqxnX42Jh4+yw7iHbguIGEkPUsWA==
X-Received: by 2002:a7b:c0d5:: with SMTP id s21mr3373767wmh.152.1557822420305;
        Tue, 14 May 2019 01:27:00 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id j190sm2450772wmb.19.2019.05.14.01.26.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 01:26:59 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/6] pinctrl: meson: add support of drive-strength-microamp
Date:   Tue, 14 May 2019 10:26:51 +0200
Message-Id: <20190514082652.20686-6-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514082652.20686-1-glaroque@baylibre.com>
References: <20190514082652.20686-1-glaroque@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

drive-strength-microamp is a new feature needed for G12A SoC.
the default DS setting after boot is usually 500uA and it is not enough for
many functions. We need to be able to set the drive strength to reliably
enable things like MMC, I2C, etc ...

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 99 +++++++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.h | 18 ++++-
 2 files changed, 116 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 8ea5c1527064..33b4b141baac 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -220,11 +220,54 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
 	return 0;
 }
 
+static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
+					    unsigned int pin,
+					    u16 drive_strength_ua)
+{
+	struct meson_bank *bank;
+	unsigned int reg, bit, ds_val;
+	int ret;
+
+	if (!pc->reg_ds) {
+		dev_err(pc->dev, "drive-strength not supported\n");
+		return -ENOTSUPP;
+	}
+
+	ret = meson_get_bank(pc, pin, &bank);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
+	bit = bit << 1;
+
+	if (drive_strength_ua <= 500) {
+		ds_val = MESON_PINCONF_DRV_500UA;
+	} else if (drive_strength_ua <= 2500) {
+		ds_val = MESON_PINCONF_DRV_2500UA;
+	} else if (drive_strength_ua <= 3000) {
+		ds_val = MESON_PINCONF_DRV_3000UA;
+	} else if (drive_strength_ua <= 4000) {
+		ds_val = MESON_PINCONF_DRV_4000UA;
+	} else {
+		dev_warn_once(pc->dev,
+			      "pin %u: invalid drive-strength : %d , default to 4mA\n",
+			      pin, drive_strength_ua);
+		ds_val = MESON_PINCONF_DRV_4000UA;
+	}
+
+	ret = regmap_update_bits(pc->reg_ds, reg, 0x3 << bit, ds_val << bit);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 			     unsigned long *configs, unsigned num_configs)
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 	enum pin_config_param param;
+	unsigned int drive_strength_ua;
 	int i, ret;
 
 	for (i = 0; i < num_configs; i++) {
@@ -246,6 +289,14 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 			if (ret)
 				return ret;
 			break;
+		case PIN_CONFIG_DRIVE_STRENGTH_UA:
+			drive_strength_ua =
+				pinconf_to_config_argument(configs[i]);
+			ret = meson_pinconf_set_drive_strength
+				(pc, pin, drive_strength_ua);
+			if (ret)
+				return ret;
+			break;
 		default:
 			return -ENOTSUPP;
 		}
@@ -288,12 +339,55 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
 	return conf;
 }
 
+static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
+					    unsigned int pin,
+					    u16 *drive_strength_ua)
+{
+	struct meson_bank *bank;
+	unsigned int reg, bit;
+	unsigned int val;
+	int ret;
+
+	if (!pc->reg_ds)
+		return -ENOTSUPP;
+
+	ret = meson_get_bank(pc, pin, &bank);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
+
+	ret = regmap_read(pc->reg_ds, reg, &val);
+	if (ret)
+		return ret;
+
+	switch ((val >> bit) & 0x3) {
+	case MESON_PINCONF_DRV_500UA:
+		*drive_strength_ua = 500;
+		break;
+	case MESON_PINCONF_DRV_2500UA:
+		*drive_strength_ua = 2500;
+		break;
+	case MESON_PINCONF_DRV_3000UA:
+		*drive_strength_ua = 3000;
+		break;
+	case MESON_PINCONF_DRV_4000UA:
+		*drive_strength_ua = 4000;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 			     unsigned long *config)
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	u16 arg;
+	int ret;
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
@@ -304,6 +398,11 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
 		else
 			return -EINVAL;
 		break;
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		ret = meson_pinconf_get_drive_strength(pc, pin, &arg);
+		if (ret)
+			return ret;
+		break;
 	default:
 		return -ENOTSUPP;
 	}
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 5eaab925f427..cd955fb7c2ce 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -71,9 +71,20 @@ enum meson_reg_type {
 	REG_DIR,
 	REG_OUT,
 	REG_IN,
+	REG_DS,
 	NUM_REG,
 };
 
+/**
+ * enum meson_pinconf_drv - value of drive-strength supported
+ */
+enum meson_pinconf_drv {
+	MESON_PINCONF_DRV_500UA,
+	MESON_PINCONF_DRV_2500UA,
+	MESON_PINCONF_DRV_3000UA,
+	MESON_PINCONF_DRV_4000UA,
+};
+
 /**
  * struct meson bank
  *
@@ -132,7 +143,8 @@ struct meson_pinctrl {
 		.num_groups = ARRAY_SIZE(fn ## _groups),		\
 	}
 
-#define BANK(n, f, l, fi, li, per, peb, pr, pb, dr, db, or, ob, ir, ib)	\
+#define BANK_DS(n, f, l, fi, li, per, peb, pr, pb, dr, db, or, ob, ir, ib,     \
+		dsr, dsb)                                                      \
 	{								\
 		.name		= n,					\
 		.first		= f,					\
@@ -145,9 +157,13 @@ struct meson_pinctrl {
 			[REG_DIR]	= { dr, db },			\
 			[REG_OUT]	= { or, ob },			\
 			[REG_IN]	= { ir, ib },			\
+			[REG_DS]	= { dsr, dsb },			\
 		},							\
 	 }
 
+#define BANK(n, f, l, fi, li, per, peb, pr, pb, dr, db, or, ob, ir, ib) \
+	BANK_DS(n, f, l, fi, li, per, peb, pr, pb, dr, db, or, ob, ir, ib, 0, 0)
+
 #define MESON_PIN(x) PINCTRL_PIN(x, #x)
 
 /* Common pmx functions */
-- 
2.17.1

