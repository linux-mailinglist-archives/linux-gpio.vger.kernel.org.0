Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A289816337
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 13:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbfEGL5f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 07:57:35 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52647 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726611AbfEGL5e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 07:57:34 -0400
Received: by mail-wm1-f65.google.com with SMTP id o25so8956403wmf.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2019 04:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/Ryaw0CwF3TL07iEm7ZRTzsdOIYoEQ5xbLX69lpJF4M=;
        b=eVnhrsbD0eL9XxWgaC4xyCq3cICT92y5RNfh7j5ubwQ4rKvO2lpin4vROxI5x7x0/V
         LQ7N3YZAw55ojIg14I4t1OjfbqUv5YoN7mWIRoHIUsxy3l+8CB+adcnjf3BOFB9Rx4bK
         5B8lwt5+7NsdSpzDSYBxqJgrrxb6Ovt7grrBVN3Ct2dcvAgqPIKzzfNhaBOA38WywQcW
         Dqb0MAL751uovhqSYERs+EWp8L2RmC1GXWxYq/gRuFXJeU2x7AOm7Pr/Hy3SmhxR9U2l
         5X2SD9U9Y5LWYpIg+of1Qr5b0Oy7AnfCqkmkg+V+kmphYWFxBbd7w/HTaWVxKecUSFV4
         /79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/Ryaw0CwF3TL07iEm7ZRTzsdOIYoEQ5xbLX69lpJF4M=;
        b=CcrFHxbbkH383CdQrlrfvU4esvk2AHaLnU/TT5XIAa9QYLiVu+iI/VygOApIsmou8P
         9Wycn28GkC2HciIADzS5GLjnO2a8XF4nLtIB2fhDKaIAIT96lnzcfimvMnum1Er2v0mY
         O3BgQ4RzreQxY81elQg1Gg2mAnW89RpOZOL6GsZTXYtzyXyqHV6t61GudtgvFPtLkft9
         R6K8Ecd8FaSSgTxnhcqmR9k3X2t0URngfmfafO5MPHfSkayJ00JxnFWvJgznmzENncQ9
         2w1W7cDVGl2+FYZJ12K9+WZueWZ+vx608DFoXZTcGfIZPPbDo8VbHXjy6r3FGgF5fd5n
         77yg==
X-Gm-Message-State: APjAAAVyki38CkyHt6Y94aHDGLzZ8xBxY8gMgDHuckDTYn+2j6WXaMAK
        ZBztaD0+46jwr/v8szg2o7T+dg==
X-Google-Smtp-Source: APXvYqzEacsy89ALKCTymPo15I4g3w8N3ARKDejdEEc425gQlSCFtRO3sTNSphkl0j6dxmMWGolZjA==
X-Received: by 2002:a1c:f205:: with SMTP id s5mr19644763wmc.131.1557230252671;
        Tue, 07 May 2019 04:57:32 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s11sm7120274wrb.71.2019.05.07.04.57.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 04:57:31 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        khilman@baylibre.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] pinctrl: meson: Rework enable/disable bias part
Date:   Tue,  7 May 2019 13:57:24 +0200
Message-Id: <20190507115726.23714-5-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507115726.23714-1-glaroque@baylibre.com>
References: <20190507115726.23714-1-glaroque@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

rework bias enable/disable part to prepare drive-strength integration

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 79 ++++++++++++++++-----------
 1 file changed, 48 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 96a4a72708e4..a216a7537564 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -174,13 +174,57 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
 	return 0;
 }
 
+static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
+				      unsigned int pin)
+{
+	struct meson_bank *bank;
+	unsigned int reg, bit = 0;
+	int ret;
+
+	ret = meson_get_bank(pc, pin, &bank);
+	if (ret)
+		return ret;
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
 static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 			     unsigned long *configs, unsigned num_configs)
 {
 	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 	struct meson_bank *bank;
 	enum pin_config_param param;
-	unsigned int reg, bit;
 	int i, ret;
 
 	ret = meson_get_bank(pc, pin, &bank);
@@ -192,44 +236,17 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 
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
+			ret = meson_pinconf_enable_bias(pc, pin, 1);
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
+			ret = meson_pinconf_enable_bias(pc, pin, 0);
 			if (ret)
 				return ret;
 			break;
-- 
2.17.1

