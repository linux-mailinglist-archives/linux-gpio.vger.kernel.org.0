Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1277CC284
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343815AbjJQMIN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234836AbjJQMHX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:07:23 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B9410C1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:44 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c50906f941so56971611fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544343; x=1698149143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3y3UgqVY6nN2yuJKg1qLnssekXYPB1hZ4I9p5/uy+k=;
        b=xwHlbuDzt2SzWHX3ZUsSQijj9TcUNwYqPkN+PAB9EfN6AfIliL2GO9+nGQ6Ibm10/N
         VwLbbliD9ONy4RbcJ+dF/vyXvzx8mo97EVMXvgG1EAuiEeBrB0OC/t8i0ASLOI/Q5KVU
         /pD8tOgMLKRr/9GF6E8mO/2qqDDS29C6uPGFA4QebLSY0jPWPHlPxLW4yDDHzs6NulMP
         J4+MANeTtMv+x4hk03i3ZCIrl3WYMkgXTyOfb3Hz+5fFPp7oH+a3iDpO9f6JV5yjgdvq
         AmWargOYvQhJpAqAd39C1n4gpFOFjtwYca87lyGVsO+zxUFhvc38e3MlAMUbGYk4ZFeX
         Dd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544343; x=1698149143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3y3UgqVY6nN2yuJKg1qLnssekXYPB1hZ4I9p5/uy+k=;
        b=craBXunmcbxTgc93bw69lvrSfb74K7C5KZfxL7p77CbgEF5MSbz+mbt3wd1rcI0RhB
         srcN6PLrs1LNMrWvnQstNhk6s/LoPHLcymNjLb7jTyUb0z5Lcr7juO50TssLGaeHTU+f
         UyIyjmTGX111R3iZpvN9E1Is2AnMwIszgGzH01dcmHBTqPCPFXIb60wEWsNDF/vok3W9
         kxT17d4W8zMBjzW7JDEdZ/47TeHs98/fHBy7u/f9PqfvJS6PhHWLdRUEtoJmf3bVmL1e
         s+BgdTDQVfzPGstom1bnN3iEF8HFIe30FSRPTcPCz7IOGvxmXvZi+ZOUxfQWLCQ5zk/f
         j7Zw==
X-Gm-Message-State: AOJu0YyY6tiTl441VHtONkGaA7mBIYEWZcHi4CypcWYUicw7c4+GP4Ex
        VzPVSWUIoPckkECNDgRb9Dq8hQ==
X-Google-Smtp-Source: AGHT+IF6ECMWmhqjzqbgShi0omVxCc5i3+lrCmLK5UV9zA2MGFiXGSi3U8Akd0N4yBX0NbciHbXrxA==
X-Received: by 2002:a2e:a44b:0:b0:2bc:dcd6:97b1 with SMTP id v11-20020a2ea44b000000b002bcdcd697b1mr1390356ljn.47.1697544342875;
        Tue, 17 Oct 2023 05:05:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:42 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 56/73] pinctrl: st: drop the wrapper around pinctrl_gpio_direction_input()
Date:   Tue, 17 Oct 2023 14:04:14 +0200
Message-Id: <20231017120431.68847-57-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

pinctrl_gpio_direction_input() now has the same signature as the
wrapper around it so we can drop it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-st.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index db511dbd50e5..1485573b523c 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -717,13 +717,6 @@ static void st_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	__st_gpio_set(bank, offset, value);
 }
 
-static int st_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	pinctrl_gpio_direction_input(chip, offset);
-
-	return 0;
-}
-
 static int st_gpio_direction_output(struct gpio_chip *chip,
 	unsigned offset, int value)
 {
@@ -1330,7 +1323,7 @@ static int st_gpio_irq_request_resources(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 
-	st_gpio_direction_input(gc, d->hwirq);
+	pinctrl_gpio_direction_input(gc, d->hwirq);
 
 	return gpiochip_reqres_irq(gc, d->hwirq);
 }
@@ -1488,7 +1481,7 @@ static const struct gpio_chip st_gpio_template = {
 	.free			= gpiochip_generic_free,
 	.get			= st_gpio_get,
 	.set			= st_gpio_set,
-	.direction_input	= st_gpio_direction_input,
+	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= st_gpio_direction_output,
 	.get_direction		= st_gpio_get_direction,
 	.ngpio			= ST_GPIO_PINS_PER_BANK,
-- 
2.39.2

