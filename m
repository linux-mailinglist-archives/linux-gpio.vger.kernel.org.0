Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C211675155
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 10:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjATJiS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 04:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbjATJiR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 04:38:17 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684AC46165
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:38:06 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id tz11so12583452ejc.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fFTtrjPjgWgZCjs7f/QFQJI0o2vhOnFPDlXQjK3nBs=;
        b=Wj1wYMEPdUZjLePgPA8TsHlz6ptekvnDV+cRVM+WxiJhTXV1oybwc6rcf7aCQVF2Xs
         L42aZVosHT4obi6RP2PZusbaDCIwWyon1IOw/QMPHiL/0Bh4PP169ngQ5/OxsLbnunK0
         czYk6WjXaEAWWzVWV3m/GlRbMPeEep8vaLLLTTb4zHwLibjMiF9hU5U3WwrFv73QMa/i
         cNz/4n2jyZZuj8pDNUre/Jpb4ysI80t/JNPhzuB8ZHek4Q7gifY+CQdeIDQJc9yqZ3fP
         yTazq2hHIpRyw95byx3XHdL2NXtVZYaeCpescf4+DHFOB09V0LC6VCgizFlp9aK/Xozu
         5/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fFTtrjPjgWgZCjs7f/QFQJI0o2vhOnFPDlXQjK3nBs=;
        b=59niDpeaM8Y7lRKK/flOhMz4cAXrmhRnn00G1MSOQWBy65czOBpF2dRQ0jjeHVzy2+
         gDLG4vbjrW+WgKS2jR2oQHey80Bk9TIo7Da+mNPKjgBYAOPqmj0NGkTWLfrvEEiTyT6H
         EtGmEAqvhfxxnQuq/8IG7C6ZES4ghYWEUMQsOFTE+SACr48gnxVK8vmZc/Lwtjjb3s3L
         HSLozgjPIEJlcZY844Jsq5wcrJLAeyKvOKd9fSRyjofiGVBbYyirxLkf6V2QEeVYQkOu
         vbnMlWau1y9He1XlU3Ryzgo3ehkzcemtPhDHD97V+QPghcGGbbs+3krWlHoxwJp83cNS
         9l+g==
X-Gm-Message-State: AFqh2kpCUjS2YrZtvVAXKUptl4m+wxTKXf3wdAcwCnKAnMfeuBc1Z9AR
        DA159OjcbS+mX2lnU1k8yfyuqq6Aiz4TlxRQ
X-Google-Smtp-Source: AMrXdXt8HBhS5Pe7JUa3+mJJ4hGT4mbAOE/nNxuztxEheXQJMez4RV5KVnhYnSjX08nNfsylZEZThg==
X-Received: by 2002:a17:906:eb0e:b0:871:be7:c984 with SMTP id mb14-20020a170906eb0e00b008710be7c984mr14133457ejb.34.1674207484637;
        Fri, 20 Jan 2023 01:38:04 -0800 (PST)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id n4-20020a170906164400b007c11e5ac250sm17986325ejd.91.2023.01.20.01.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 01:38:04 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Get rid of gpio_to_chip()
Date:   Fri, 20 Jan 2023 10:38:00 +0100
Message-Id: <20230120093800.653126-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpio_to_chip() function refers to the global GPIO numberspace
which is a problem we want to get rid of. Get this function out
of the header and open code it into gpiolib with appropriate FIXME
notices so no new users appear in the kernel.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/core.c     | 14 ++++++++++++--
 include/asm-generic/gpio.h |  6 ------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 41fd84738707..d6e6c751255f 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -325,7 +325,12 @@ static bool pinctrl_ready_for_gpio_range(unsigned gpio)
 {
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_gpio_range *range = NULL;
-	struct gpio_chip *chip = gpio_to_chip(gpio);
+	/*
+	 * FIXME: "gpio" here is a number in the global GPIO numberspace.
+	 * get rid of this from the ranges eventually and get the GPIO
+	 * descriptor from the gpio_chip.
+	 */
+	struct gpio_chip *chip = gpiod_to_chip(gpio_to_desc(gpio));
 
 	if (WARN(!chip, "no gpio_chip for gpio%i?", gpio))
 		return false;
@@ -1657,7 +1662,12 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 			}
 		}
 		if (gpio_num >= 0)
-			chip = gpio_to_chip(gpio_num);
+			/*
+			 * FIXME: gpio_num comes from the global GPIO numberspace.
+			 * we need to get rid of the range->base eventually and
+			 * get the descriptor directly from the gpio_chip.
+			 */
+			chip = gpiod_to_chip(gpio_to_desc(gpio_num));
 		else
 			chip = NULL;
 		if (chip)
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index a7752cf152ce..21437fc96835 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -31,12 +31,6 @@ struct module;
 struct device_node;
 struct gpio_desc;
 
-/* caller holds gpio_lock *OR* gpio is marked as requested */
-static inline struct gpio_chip *gpio_to_chip(unsigned gpio)
-{
-	return gpiod_to_chip(gpio_to_desc(gpio));
-}
-
 /* Always use the library code for GPIO management calls,
  * or when sleeping may be involved.
  */
-- 
2.34.1

