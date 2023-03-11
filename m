Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62C806B5AD5
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Mar 2023 12:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbjCKLNk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Mar 2023 06:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjCKLNW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Mar 2023 06:13:22 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2548C12BC4
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 03:13:19 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id g10so1853849eda.1
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 03:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rB3q6hozgVfcdPrbsf67fNWfSHcvZZqXt4YDenx5ZE=;
        b=aR94cJVoY8K4fjPFcZX1W2Np8gTXFJjYSQFlXozjBDUfwYPGSwW5v/z2JMbYAb6PrV
         zvI8CVyNbm8DQWlo/jPMGrZOOEYh+8xzf6zcwtEtKo2YYnAdSWrWI37lG2nUP4WXW8ji
         z9oa3Xqhq6tE+3BhZT8REto2kEPxkpt76BtKLIgPfaWA8OhMI1iv0Pkxbnc3B06hyfai
         bZmGvnKCEWNwnCweyCire/5fdZ3VL05AgWek3S561QdETMTDBza1e0MByy7W8T2LBzlA
         FBaPIxdIPNItOV0d+1VPl1Qwzoqk8pRI0VXM4aAzqAc7oLnJq6+UwC7O0c70IRtCEDUN
         SGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rB3q6hozgVfcdPrbsf67fNWfSHcvZZqXt4YDenx5ZE=;
        b=mx05hddP/d7XZKr08GIp7m6I7m5l/b7k2U72w+BLyFVl3PaGLZwbfrig5AXAov3xsz
         mHPKE+swugUhpcsDenCmydk6+7md3lPFHuV5DkyB+w372kAYjqifZikI2ofldlix/7W+
         W8QsclVb9Mmw2rQkOvGU10bg6RVQEsQ+xU4Rrxy+15cB8b1dt9al6/eO3AKZMJzCeM4T
         axq/2RJxcZjdYZvuhm2cKFj9TKCen/AG06GrFrUVWXughNvLXKs8TL+PLdReUKbiygXB
         4ZQzg70oSY1ZHQjbPw5SpBsG4kkRhXzcXURpWiZaZaOIQkFxDTLCn7pbrh0pV9UidfSJ
         +SqQ==
X-Gm-Message-State: AO0yUKWyy6SXHGeYNyj//X61ILBITTVFm/usR06K5r4xNh1bjKpatDFe
        MZDDHjejbFZu1cGHvOmJV417Dg==
X-Google-Smtp-Source: AK7set89JC1vv0eQfsiqhM1cfuy+WEUarXTfD53+WNNyBec5EzYrz2984z8U96HUMhNZHJ58eIlczQ==
X-Received: by 2002:a17:907:6d86:b0:879:ab3:2864 with SMTP id sb6-20020a1709076d8600b008790ab32864mr32513247ejc.24.1678533197638;
        Sat, 11 Mar 2023 03:13:17 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906bc4b00b008ee95ccfe06sm973189ejv.119.2023.03.11.03.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:13:17 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mun Yew Tham <mun.yew.tham@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Nandor Han <nandor.han@ge.com>,
        Semi Malinen <semi.malinen@ge.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 8/8] gpio: raspberrypi-exp: mark OF related data as maybe unused
Date:   Sat, 11 Mar 2023 12:13:07 +0100
Message-Id: <20230311111307.251123-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/gpio/gpio-raspberrypi-exp.c:237:34: error: ‘rpi_exp_gpio_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-raspberrypi-exp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-raspberrypi-exp.c b/drivers/gpio/gpio-raspberrypi-exp.c
index 3c414e0005fc..ecb0d3800dfe 100644
--- a/drivers/gpio/gpio-raspberrypi-exp.c
+++ b/drivers/gpio/gpio-raspberrypi-exp.c
@@ -234,7 +234,7 @@ static int rpi_exp_gpio_probe(struct platform_device *pdev)
 	return devm_gpiochip_add_data(dev, &rpi_gpio->gc, rpi_gpio);
 }
 
-static const struct of_device_id rpi_exp_gpio_ids[] = {
+static const struct of_device_id rpi_exp_gpio_ids[] __maybe_unused = {
 	{ .compatible = "raspberrypi,firmware-gpio" },
 	{ }
 };
-- 
2.34.1

