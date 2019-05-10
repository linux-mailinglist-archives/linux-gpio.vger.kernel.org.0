Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D70319987
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2019 10:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbfEJIXo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 May 2019 04:23:44 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38708 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfEJIXe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 May 2019 04:23:34 -0400
Received: by mail-wr1-f68.google.com with SMTP id v11so6699574wru.5
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2019 01:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3bTIGZtLo/SgPx/BV2GXu1z9QbwZbdzaquOZsij6Tb0=;
        b=PcnekScnb36h1KOi6x2STEbqWgdloFg5tbrvRIM9S1Ia55AbG/P7mn8IR/xJzgdIP8
         yOvvUal0wpr1osdHlor69kQUdsIASssP76bNocQowTdDpdkeNU75atIJ1SRt3AbQkO11
         8KnE2GbIO3mf3HBFNfXU/VDiOyNs+oxa0VjOitiIKAFUG8CaoO3InLFdx+7RbOZ+GRJ4
         sAXp+fKZPurq0je7yGWBdNEy2U8RRZzZHe0XCHVIt+5GFxtXXoSKOT704r5hUHuR4alA
         M9F/5xQ3THRGEO4VwcT07cWBUeAyb4j+AACgMcIRiA56n6jtV5s4MbhhBPfUvLlSUNt7
         kZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3bTIGZtLo/SgPx/BV2GXu1z9QbwZbdzaquOZsij6Tb0=;
        b=R/R/LJH9dg4MQHXvWWrZhBXVrEKNt7RAqlzC5LDLBSDotOrLpF6jdyYeBL5YzbjM9J
         +GCYBxuS837gYxwFSbKRLZRgh53CzE8O4cjN5XdBb+YDStoIyJSN5NWYgp2bdiAKc715
         LXhVo2xmJzeVMN6GgnK+1v+ozpprZ0vz1xUZ1I2kNU/LgoL3p+VXUmU5S4l9DHYsu4hC
         8NXyOWew5ucnkwHFyrFZAldy7laRCmyCWNDobhlLvEM3DGgCthsik+5CQs+iyhwub0yu
         IWlWCkzsjsZef5RU67XcatV0qgDjpccDug7qKCcV63NkAtekh/6d/z3FMh48wwqsB8qG
         wsQw==
X-Gm-Message-State: APjAAAU3Uk+0rFqF/sX1O94iAyTdzDfmXJJCUtOfI5sC+N0GBehNijz1
        nOnoXMljYYh8IpyHjBh3jiCQqQ==
X-Google-Smtp-Source: APXvYqzXtHdGnLnflP9dbQ8lmUVERHNxuyP/6ag3Cz0jeAm5yjR8xuOEEi5P7YNX9ZXMbXxPviiwWQ==
X-Received: by 2002:a5d:638c:: with SMTP id p12mr3802905wru.61.1557476611712;
        Fri, 10 May 2019 01:23:31 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z4sm3790285wmk.5.2019.05.10.01.23.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 01:23:31 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/6] pinctrl: meson: add support of drive-strength-microamp
Date:   Fri, 10 May 2019 10:23:23 +0200
Message-Id: <20190510082324.21181-6-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510082324.21181-1-glaroque@baylibre.com>
References: <20190510082324.21181-1-glaroque@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

drive-strength-microamp is a new feature needed for G12A SoC.
the default DS setting after boot is usually 500uA and it is not enough for
many functions. We need to be able to set the drive strength to reliably
enable things like MMC, I2C, etc ...

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
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

