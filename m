Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06D221AA9C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 00:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgGIWes (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 18:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgGIWer (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 18:34:47 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98961C08C5DD
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2020 15:34:47 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id e13so3489278qkg.5
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2020 15:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nGzR1WtRF8Y8tGKLwHQjy7lggywuCqvt56g9Ssnty14=;
        b=XN33SzHhxER6ZyVjHyeXjMhX536wgzMnw6B/6NCjLZgko9k/DgUnON6auLfZbFRNHH
         zADdDT8A3f3eiKj+EM8oF9OEfH6P3gTKjqNl33W5Aq4BT32OI1hOdTiqeo0lC77A9O7X
         cgSSNWnoK4cKsVFryv7xhGj5pW7W0eDx7m0vkSNbIA4H4ByzBzgOep9KnJhDcatSk7ti
         2nIFgycv6LN49S6zBfaV3cErfAfTqf0mTpLyRZXncXzmZAnU/kk9fMtp+LFltmHfPnVU
         F8eWqAUP6oAZGhHDogHLVB9YQIdiM1fRE/y8zSSY/tPhaZuN7R6kB4C2eVDKrg48/uhN
         Kw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nGzR1WtRF8Y8tGKLwHQjy7lggywuCqvt56g9Ssnty14=;
        b=JbRv2pD43s7r+MAdTokP+z4nTEuKO497bZu7Op+O9rSQ2cOaTJ18QEvoOr0Ux5jwlK
         V6OGfFE46nSE3hLsBhGNfAj18+xkcgfmjTj2Tzu+XY2G9fU8rDsl0MzTqqrbWtmIrnij
         d5BHsZQIP3PyIGFge0fCsw/LfZLaNQrMeUBVytDgvdwSvxgSlquf+YRsvT1uJe2IwJRK
         zMO4DpSTTjZyuViDij1miaSSLIIAdWRDFtS1FASEhcuMKgckN+xPIWV90tQDtwavnxmz
         3nCZaa4EShDGW5c2x4ZCav6bRIo7YRXtoxqvTc+OcbbpwoLwl+55KYyRNzatk3UkeWXl
         B5Cw==
X-Gm-Message-State: AOAM532VXrbYXc7uyJelox/cIH+Ot4jywBaf3xVq5eYVnAl7zll2yFQ9
        bVl0Kt03G0faCZUj5EE8zS4nGg==
X-Google-Smtp-Source: ABdhPJz3R95qBwSgxEru/Shu4hNfF1GuP4jw2nXmuF6ITk4JjFBp3/peBCYE1DJSJYvsLz702FTn+g==
X-Received: by 2002:a37:88c2:: with SMTP id k185mr53706537qkd.53.1594334086637;
        Thu, 09 Jul 2020 15:34:46 -0700 (PDT)
Received: from localhost.localdomain ([196.52.2.97])
        by smtp.gmail.com with ESMTPSA id o12sm5029160qtl.48.2020.07.09.15.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 15:34:45 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] gpio: omap: handle pin config bias flags
Date:   Fri, 10 Jul 2020 00:34:01 +0200
Message-Id: <20200709223401.780051-1-drew@beagleboard.org>
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

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/gpio/gpio-omap.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index b8e2ecc3eade..a471a152f318 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -896,12 +896,25 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 				unsigned long config)
 {
 	u32 debounce;
+	int ret;
 
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
+	else
+	{
+		ret = -ENOTSUPP;
+	}
 
-	debounce = pinconf_to_config_argument(config);
-	return omap_gpio_debounce(chip, offset, debounce);
+	return ret;
 }
 
 static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.25.1

