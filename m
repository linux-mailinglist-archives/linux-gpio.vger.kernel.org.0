Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0A522171A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2020 23:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgGOVhw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jul 2020 17:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgGOVhv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2020 17:37:51 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C99C061755
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2020 14:37:51 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id j18so7379548wmi.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2020 14:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HyFILIT/gUI645DJupFX+tM8tnIK3DuEU83wYDmtA7k=;
        b=QSkLyk/FGZO77A3Htq+gJJHMt1QYPdoVrYARgw0eXPYT2hpMhVfJl3vgYkJ11yrZoy
         ZwqTfdk/UcFbE4KLjMcYUjMKJg6FELDcEnH8xg6bd5UPQZo/a4sauzqqfKYPKlpz4r4k
         GLQknMsyDRzVqHaPiWXmM76GTqoECcYiEEoHYFQra63pmlSoUMiyX2qSNfQDZw31SHzS
         riKRzeRu0zqF3y6+ZftsogYEX6/9kB20lVoR1/WktV5Q9Fr9TZAUib7FOBZwoWC8kb64
         Evd1TOA5TNAaxrnpoLmi32CqiNqhj8k0D4xAT0kyYi+CzErtdZdH7fvN7lMxlvYvmEbp
         Rh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HyFILIT/gUI645DJupFX+tM8tnIK3DuEU83wYDmtA7k=;
        b=E2NJAgBAE3FCmL6Qu6Yi6pml4f6A2Iq7/GJKqyCkH3zUTVZiRlpXs4GMrSz9lX3CCp
         K/f8LODtXMprctDpoLVv97YrcqeW151Xvl6JRHmXSoycrlcr6frMN9Z8tN5isID/4eNY
         531raFOM4wy2Qaq3lWYc6HSEFXMBtJrX4SrpOVrb8h+vCklWKtBn78lPoHILF3ashyR7
         y8P94l9BKzXIaUGfxBdkQ3Pp+My9pGPCEsbZjX7fR4fhaQV4rFL5qo8O7ovcAb7YFgiC
         Zw9Rkn0amUwPDGE3fp6aTBcnhYNdJegPEdtJFAZNU35/SJ/QNQj2ljxjlNhKC4JHauuA
         PCkA==
X-Gm-Message-State: AOAM5321s1Z5sOQ7nZGGZmNbhBaIK9gZ9XrPirhaZgXpWF84zTHp6+PD
        ptCOQJyLvkhNwdwnnMmLc1/FJ6ToUpoGPg==
X-Google-Smtp-Source: ABdhPJzcqpLuWXpo/hpnXPp0gS+btmAgwhD/w4G3mujYXm+iG48Sb/INLwJeJ7dFwKB0PnE8+rtwEw==
X-Received: by 2002:a1c:5646:: with SMTP id k67mr1519307wmb.61.1594849069775;
        Wed, 15 Jul 2020 14:37:49 -0700 (PDT)
Received: from localhost.localdomain (63.red-95-125-106.dynamicip.rima-tde.net. [95.125.106.63])
        by smtp.gmail.com with ESMTPSA id f197sm5523183wme.33.2020.07.15.14.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 14:37:49 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v2] gpio: omap: handle pin config bias flags
Date:   Wed, 15 Jul 2020 23:37:38 +0200
Message-Id: <20200715213738.1640030-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Modify omap_gpio_set_config() to handle pin config bias flags by calling
gpiochip_generic_config().

The pin group for the gpio line must have the corresponding pinconf
properties:

PIN_CONFIG_BIAS_PULL_UP requires "pinctrl-single,bias-pullup"
PIN_CONFIG_BIAS_PULL_DOWN requires "pinctrl-single,bias-pulldown"

This is necessary for pcs_pinconf_set() to find the requested bias
parameter in the PIN_MAP_TYPE_CONFIGS_GROUP pinctrl map.

Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>
Acked-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
v2 change:
- simplify handling of -ENOTSUPP return value per Grygorii's suggestion

 drivers/gpio/gpio-omap.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index b8e2ecc3eade..eba303cff7cb 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -896,12 +896,21 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 				unsigned long config)
 {
 	u32 debounce;
+	int ret = -ENOTSUPP;
 
-	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
-		return -ENOTSUPP;
+	if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE) ||
+	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP) ||
+	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_DOWN))
+	{
+		ret = gpiochip_generic_config(chip, offset, config);
+	}
+	else if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE)
+	{
+		debounce = pinconf_to_config_argument(config);
+		ret = omap_gpio_debounce(chip, offset, debounce);
+	}
 
-	debounce = pinconf_to_config_argument(config);
-	return omap_gpio_debounce(chip, offset, debounce);
+	return ret;
 }
 
 static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.25.1

