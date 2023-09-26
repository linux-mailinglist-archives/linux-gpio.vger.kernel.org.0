Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3B97AF667
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 00:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjIZWly (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 18:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjIZWjy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 18:39:54 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7683717EB7
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 14:48:17 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c131ddfeb8so151594631fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 14:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695764896; x=1696369696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qB5IXPhlDrInJ4+uHWJuFNZT6fpdkJgSFfl8pKGqOw=;
        b=VoBsLbex+dcgZvna6lB2wr/DU7reAqKP2nW0mB0AoSw17gVe92mLnuqVfx2FTXv8+N
         tNl46h1QvKVge6SMHag9qUIYtctpR/n8uMXVHAObmajFj2rq8WPni3gFPuy3TRIZJe8m
         B4AuXrDc1Pz0/TB2wuYCfBBFpfDaqJuHFxNuT/vyv8rPCo44OAviw179J6jkqsRrxRh4
         Ul3x5PHs9Sk3mWjaoAzhaL4a9wSFcpxajQpJh7AU8CcWtPe8ehHTwcjO2Cyy6p0uYD8D
         51emj0mLCW+z5BKj5Gb3H+e5jC5U3LNLEdrpAeOQoYY3pCQ8yt+240NTdSZlNZ7LwIFG
         7Lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695764896; x=1696369696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qB5IXPhlDrInJ4+uHWJuFNZT6fpdkJgSFfl8pKGqOw=;
        b=Umadi+crCvCw2+mnGoMuL+HFzh5COiblmtoJmjqpyjApgTiLx9Vd51twMAqs5+DrKZ
         RsM1W8q9zHzEV1tb7gNP0un8FnNKqJkiuluZR2ov0l9NbOTXhNAzngGjrBxndAVfvG7J
         Ir/MxPvPgvmyMJYzTwyE31pN+sdy93mHAxL5pKbbrcGYQOKttYVVvmTozDzVc+tO6H++
         vxI+d51Ecf39a9TwF0xM9xBC6d1LH/sosUmC/yq4222GLpxecMqszKFA34r/KN2C57xg
         h8HLUC2EqrII9Wv2VqKr0AvfElkbURjpIHgOZYDPGbGg24h0WcwJHRDpaxX9NQ25U2GL
         8vBQ==
X-Gm-Message-State: AOJu0YytjJTT8edjFpTulzya0U52/Nrxpxvbpx0dCMEmndktVgXh8qtq
        ECXcIoTnm3oTd/ot0PeuHr4czyjA80s7HFoEft4=
X-Google-Smtp-Source: AGHT+IF07socDjKuzAFiIl/P5XoFGn0P3ljLEYY8uPVMH9VUnHqVycz5Tp/8JEsd/mhpicW4ais7Pw==
X-Received: by 2002:a05:6512:31c5:b0:500:b63f:4db3 with SMTP id j5-20020a05651231c500b00500b63f4db3mr38886lfe.35.1695764895770;
        Tue, 26 Sep 2023 14:48:15 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f10-20020a19ae0a000000b0050334e5f5a8sm2299982lfc.271.2023.09.26.14.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:48:15 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Sep 2023 23:48:11 +0200
Subject: [PATCH v2 1/3] gpiolib: of: Allow "trigger-sources" to reference a
 GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-gpio-led-trigger-dt-v2-1-e06e458b788e@linaro.org>
References: <20230926-gpio-led-trigger-dt-v2-0-e06e458b788e@linaro.org>
In-Reply-To: <20230926-gpio-led-trigger-dt-v2-0-e06e458b788e@linaro.org>
To:     =?utf-8?q?Jan_Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The "trigger-sources" phandle used for LED triggers are special:
the DT bindings mandate that such triggers have the same phandle
references no matter what the trigger is. A GPIO is just another
kind of device that can trigger a LED.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 531faabead0f..f4a660bf11fd 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -611,6 +611,33 @@ static struct gpio_desc *of_find_mt2701_gpio(struct device_node *np,
 	return desc;
 }
 
+/*
+ * Trigger sources are special, they allow us to use any GPIO as a LED trigger
+ * and have the name "trigger-sources" no matter which kind of phandle it is
+ * pointing to, whether to a GPIO, a USB host, a network PHY etc. So in this case
+ * we allow looking something up that is not named "foo-gpios".
+ */
+static struct gpio_desc *of_find_trigger_gpio(struct device_node *np,
+					      const char *con_id,
+					      unsigned int idx,
+					      enum of_gpio_flags *of_flags)
+{
+	struct gpio_desc *desc;
+
+	if (!IS_ENABLED(CONFIG_LEDS_TRIGGER_GPIO))
+		return ERR_PTR(-ENOENT);
+
+	if (!con_id || strcmp(con_id, "trigger-sources"))
+		return ERR_PTR(-ENOENT);
+
+	desc = of_get_named_gpiod_flags(np, con_id, idx, of_flags);
+	if (!gpiod_not_found(desc))
+		pr_debug("%s is used as a trigger\n", of_node_full_name(np));
+
+	return desc;
+}
+
+
 typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
 						const char *con_id,
 						unsigned int idx,
@@ -618,6 +645,7 @@ typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
 static const of_find_gpio_quirk of_find_gpio_quirks[] = {
 	of_find_gpio_rename,
 	of_find_mt2701_gpio,
+	of_find_trigger_gpio,
 	NULL
 };
 

-- 
2.34.1

