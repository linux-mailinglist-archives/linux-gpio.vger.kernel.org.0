Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 916851C4B2
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2019 10:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfENI1B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 May 2019 04:27:01 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38253 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbfENI1A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 May 2019 04:27:00 -0400
Received: by mail-wr1-f67.google.com with SMTP id v11so291618wru.5
        for <linux-gpio@vger.kernel.org>; Tue, 14 May 2019 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ABNodvidPpmQibNK03maenhQOWEuJJdUvRf24Z3W14k=;
        b=V5p+VSaIHFJiu028UV0cKcC4xTMdP7TT7IlerUXE9FLCbzyJhGUgx5wYnuBsaaSMX1
         LNcViMP4OrXhUjvE8zSVvPm3syH9Glc/58weTycU7bK7eP/dC5C/bhNtwRZ1goZE3zcI
         sERDfGVwifJoD+nMoQuMlFvID1739aQ1Z3vARzbOlKlLaEuyBpFrj0P+H7HhS36+ob8g
         7IN+4QuoUy6CgCDhkhHpUp28VqCo+ZA7deerUWW+yKSXlkNKquuLX5UotZSiiaXkNEbL
         kS13t/L0FUpbmV4/49fu8coD5iKKhOlfJ/BTt4bW/bzxFXtYzrZTyhrw1yNB+NSGTVny
         ipiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ABNodvidPpmQibNK03maenhQOWEuJJdUvRf24Z3W14k=;
        b=sDI5vhzNk9tMA4LmRO6qlPJWfokHM45sdotcOx1EDJCSkhh80Lvok/BCK0mrbFsYkK
         1INQsGhPtxDmB43SQKQCHH9AK9+kyTffeCmf2jj8xnnZGEuT/hZvoZeQMK0pmTImD3AC
         78YLRlsCTOE6QPWypHol9tx8aHzRgdCky8tjeVB05KyOXR9Z4/dwSvoaY0AdXG2heEd3
         LXwMjC5ENvjJV3gbpBryFm9Ew8qiACtoHXgrATVlVKmXivMrsUi0u+db86k5VyRYceDG
         EJ8fX8+huL4g+ubAylw2zip1/03dXnJgpqjsokK8r/x13+6xihIjsF2DMkTBD9gtllUw
         Aqog==
X-Gm-Message-State: APjAAAXtlrJdpRORMgOkHuMCATBVy3d490k6rZGWyX0ml8O364vUJS+Z
        8rQaB9dQUrWmI4WJNVvDisKNwQ==
X-Google-Smtp-Source: APXvYqxDB4ujZcu4wi+99AP5cvFV4yfG5NrLvHLGnQ+xsd2i6Tfm4wBOsp6h6hPNffVml94ddIn/wQ==
X-Received: by 2002:a5d:4109:: with SMTP id l9mr20002695wrp.204.1557822419187;
        Tue, 14 May 2019 01:26:59 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id j190sm2450772wmb.19.2019.05.14.01.26.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 01:26:58 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/6] pinctrl: meson: Rework enable/disable bias part
Date:   Tue, 14 May 2019 10:26:50 +0200
Message-Id: <20190514082652.20686-5-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514082652.20686-1-glaroque@baylibre.com>
References: <20190514082652.20686-1-glaroque@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

rework bias enable/disable part to prepare drive-strength integration
no functional changes

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 85 +++++++++++++++------------
 1 file changed, 49 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 96a4a72708e4..8ea5c1527064 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -174,62 +174,75 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
 	return 0;
 }
 
-static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
-			     unsigned long *configs, unsigned num_configs)
+static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
+				      unsigned int pin)
 {
-	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 	struct meson_bank *bank;
-	enum pin_config_param param;
-	unsigned int reg, bit;
-	int i, ret;
+	unsigned int reg, bit = 0;
+	int ret;
 
 	ret = meson_get_bank(pc, pin, &bank);
 	if (ret)
 		return ret;
 
+	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit), 0);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
+				     bool pull_up)
+{
+	struct meson_bank *bank;
+	unsigned int reg, bit, val = 0;
+	int ret;
+
+	ret = meson_get_bank(pc, pin, &bank);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
+	if (pull_up)
+		val = BIT(bit);
+
+	ret = regmap_update_bits(pc->reg_pull, reg, BIT(bit), val);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit),	BIT(bit));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
+			     unsigned long *configs, unsigned num_configs)
+{
+	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
+	enum pin_config_param param;
+	int i, ret;
+
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
-			dev_dbg(pc->dev, "pin %u: disable bias\n", pin);
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg,
-					       &bit);
-			ret = regmap_update_bits(pc->reg_pullen, reg,
-						 BIT(bit), 0);
+			ret = meson_pinconf_disable_bias(pc, pin);
 			if (ret)
 				return ret;
 			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
-			dev_dbg(pc->dev, "pin %u: enable pull-up\n", pin);
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
-					       &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pullen, reg,
-						 BIT(bit), BIT(bit));
-			if (ret)
-				return ret;
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pull, reg,
-						 BIT(bit), BIT(bit));
+			ret = meson_pinconf_enable_bias(pc, pin, true);
 			if (ret)
 				return ret;
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
-			dev_dbg(pc->dev, "pin %u: enable pull-down\n", pin);
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
-					       &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pullen, reg,
-						 BIT(bit), BIT(bit));
-			if (ret)
-				return ret;
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pull, reg,
-						 BIT(bit), 0);
+			ret = meson_pinconf_enable_bias(pc, pin, false);
 			if (ret)
 				return ret;
 			break;
-- 
2.17.1

