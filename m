Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B32E18E22
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 18:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfEIQ3p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 12:29:45 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35494 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbfEIQ33 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 12:29:29 -0400
Received: by mail-wr1-f65.google.com with SMTP id w12so3959982wrp.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2019 09:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3bTIGZtLo/SgPx/BV2GXu1z9QbwZbdzaquOZsij6Tb0=;
        b=O01zTx5QUqyB92KztT9OdKrkoKOJNimUWtcdBNT7Jh0J41zG1CV03+FLisi69ey0Z2
         NECCFRkBdtuq/oRb0gbcp0VtmL7Eb+/3Q0bjfHh6dvTtSPuZK2cMBbHPKi2ivN78b9Kh
         oXjBdQClhteTSzm/+C94gqGmSCRgpDo6D7WmegTaCSvu2S8Svaj6G/kIe+qIpA4Sb8Bb
         qQg8YgWKq0h3rUBsNh0T63UZ9D2AEgAQ3mb0noBf4d9ABwZ6LoSU0CFTXvQF/Qcwjgn+
         RhBbcfhTF9ZEATccWBCQX3ZNTtuCZTZJequpb2gg9sVrGnCcrHMUIDFxVGr2pbl9n6gB
         lYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3bTIGZtLo/SgPx/BV2GXu1z9QbwZbdzaquOZsij6Tb0=;
        b=a8J1V4K2I3Hl31thUwG0e4SoyrfBq6Y8YsLwt8mkyJdavPwoZqKrEsKz8WIkwhDpEF
         doEGScJc+F3pQVS6xa6MWIT9V6DXj6lEZWOF7i7uFaoLrVsmQw3U1bYnjaw3NYNwE9HR
         eMiOOMy88dHt9x6ISPlyozE0YT7xonswnQDwwlOsLDVyWBVaFf/Y+ano21iEnOpsjv+/
         5Dh5ueXjj2hSDVky+OwVLN8wRTDkH7YWR7d/2Ja5OaSkVGJ6bU1M/ughZ0BhEHbEGRKq
         6sjXNYzUgq2+c+D5JWuAkUhS4Hu4awSfjoIyYY5l91UFvRB1zuje2NSex2ATcisrAOqm
         Et6g==
X-Gm-Message-State: APjAAAWUfB7P/82fPnf5yRKyE17nJvZLb9KuRNsnUazwqDgCdR1yYA2h
        20oeKIux9+Yms68ujBJPpiMFUQ==
X-Google-Smtp-Source: APXvYqwZ0j0YT2pTu8ECb9Ibbo+UjZPTZd7r/aUlF3cxmcqeMItmFBksINCFW+2N9tQ+GDEjPXAkLg==
X-Received: by 2002:a5d:6912:: with SMTP id t18mr4076646wru.17.1557419367987;
        Thu, 09 May 2019 09:29:27 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id k2sm4116297wrg.22.2019.05.09.09.29.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:29:27 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] pinctrl: meson: add support of drive-strength-microamp
Date:   Thu,  9 May 2019 18:29:19 +0200
Message-Id: <20190509162920.7054-6-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509162920.7054-1-glaroque@baylibre.com>
References: <20190509162920.7054-1-glaroque@baylibre.com>
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

