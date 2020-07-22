Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2AE2297E4
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 14:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgGVMJN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 08:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731630AbgGVMJN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 08:09:13 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E0FC0619DF
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 05:09:12 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f2so1656617wrp.7
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 05:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tqHxcywQyVz1wfQvBGx3vpEtZ8YqD1CPktgmCd8zLdc=;
        b=gnuS6aH1Z4+o6kdQgqoa7jvwbtLsfXA0ZmIQoHVWFjcQCBaB72XsvvMy+iiGTDr7FR
         eZWTN6R+9wO8Vzt+lAXECEneA6FaZoBbjMb+5XruTj2zqJ+vUxX8E9A2KBdlDFpriudM
         TV2OnwnG+XnlNHojz2MN6h49JUtWDs714yEYfBccT9OpZ/3Q0CGegDDWUcdvukrF+rWt
         9wCHhPBFCCoNzk4u/31jInctoCb5e7vlmaTrSE4XxKeP8+CvMSFcnof+BUGFfZkvjOdZ
         NGAVlCBCxc14B1kpyLLfdsOIds3mFz2Y4oXpIrpx93QZmrxvI+p4kKnM8diRhr1QXqce
         p0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tqHxcywQyVz1wfQvBGx3vpEtZ8YqD1CPktgmCd8zLdc=;
        b=IYOGg+ar5ff/TtwE+CoeA5hUc4mYghvBlltpqxj3sTkEkVveZWwEOQ2juRHSQVzKDL
         rD/cEIYblnjlsStfkrkgC7riGSXetoav/dagG3mxroUcwSFC/qVoNQBPA+IrDH1nLm2L
         3nmuMjJkceY+HHlClgc4SFaG0CHh1GL2j653YT5iK/b5WrsZF0txCaTMT3HulmfnqBDZ
         ch3wvN81ylHRwmDTvqeEs4KKZukaHtCjrChKjBZgHyilM+1uv+S3esg80RSt7stuUgo0
         1+UJC6zeJD2ytUaBPduoqxx2o3PQNMLGCpOc2nrKnaMcHLwvqUw6fVg3h0v3IwjXPKky
         2fBQ==
X-Gm-Message-State: AOAM533wX2kzAJ8JT3DoI0bYPdLnzZ2nwHdx7kwupGzc8EBx1y39eMvZ
        UKwjbZ7/TwPTwkiT4bpF/8YF+A==
X-Google-Smtp-Source: ABdhPJyEIrrWfWDnGxTltj2DTpGuaDacNmpFZhftR7gDW78DkgWP3WGw2p75qhnhfmYpYtGiWYlZvg==
X-Received: by 2002:adf:e48f:: with SMTP id i15mr29109610wrm.327.1595419751422;
        Wed, 22 Jul 2020 05:09:11 -0700 (PDT)
Received: from localhost.localdomain (172.red-80-27-177.dynamicip.rima-tde.net. [80.27.177.172])
        by smtp.gmail.com with ESMTPSA id o7sm28003296wrv.50.2020.07.22.05.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 05:09:09 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] gpio: omap: improve coding style for pin config flags
Date:   Wed, 22 Jul 2020 14:07:56 +0200
Message-Id: <20200722120755.230741-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change the handling of pin config flags from if/else to switch
statement to make the code more readable and cleaner.

Suggested-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/gpio/gpio-omap.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index e0eada82178c..7fbe0c9e1fc1 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -899,13 +899,18 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 	u32 debounce;
 	int ret = -ENOTSUPP;
 
-	if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE) ||
-	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP) ||
-	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_DOWN)) {
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
 		ret = gpiochip_generic_config(chip, offset, config);
-	} else if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE) {
+		break;
+	case PIN_CONFIG_INPUT_DEBOUNCE:
 		debounce = pinconf_to_config_argument(config);
 		ret = omap_gpio_debounce(chip, offset, debounce);
+		break;
+	default:
+		break;
 	}
 
 	return ret;
-- 
2.25.1

