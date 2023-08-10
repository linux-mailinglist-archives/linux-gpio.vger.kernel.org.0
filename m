Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC993777541
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 12:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235196AbjHJKB1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 06:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235200AbjHJKAn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 06:00:43 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7919D3A9A
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 02:59:53 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fe1fc8768aso6496815e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 02:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691661592; x=1692266392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJXvTg58XDbx4i4A8NrA1fC2E4j4PcqR0iCH6KEa268=;
        b=XKMjJDmMFUurPthBODl+2KlNLRPYXp0+KFyY2I0nZpzv46ZY3yxvoRHCZN1uF8Z0qc
         rO5a0FBDVJvowNnwdG97IzkweVNR7xNg07G1a5v5O5cqJ1zNtyNiFENJnyGMVGADfTY5
         rsAoPqIRDxI9TZIMGg5b0bOT0Nr01yBllk66CpItzTI6nBYOeyv05OjCCuA43MsZOSX1
         ymHXT8nnAhJ9C3z9PSma9zOK36h1Rk/UtnqewAP/308c8C6ZzB1x7ELNhJoOg7snmPea
         idYVj40m4Orzjk2YXhB6svg6za9Q6OLf3cjQqJKK5r/KUnP6s/NrnkVrJyFJaAQKg1NH
         nRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691661592; x=1692266392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJXvTg58XDbx4i4A8NrA1fC2E4j4PcqR0iCH6KEa268=;
        b=AZTQK+daGgDZSVkRGzaXRIZNp82xW2YXTbss+7QWGmi+AsLnP+3ztC1i2biWpliP57
         rhXDnWGjIs5HTYRUZcFxhmOUxO8N57ivGSGo93YDCJkZvN0yq6x2EAGSH/dr09Iat8hL
         VRLc4xJxdtvzo+yhpzAI2WVTS1DGxjtpvrrb2RJzDqP461l3ZcN/S9sfhbofmQoEZ+cP
         4kgGSK9YJdaCx9Rswb3mGoLwDPKVLafImACfUlnuO1vsPxlAFZBQMg/ZxqfKokWsHQap
         VfWSOGuP5kEZsml+qL6dA/vga4Xqz3iF3KMwpeEJZokdHlbCoaPt49PQaktyB5WJVej8
         q1/A==
X-Gm-Message-State: AOJu0YwRByS4tbyKoy3d0l3qfnlB6pnWcCyCaFG0DdPuzS1OrcFLZ+H3
        ZuazEoXhCzYri74H5DnMpcgZ+w==
X-Google-Smtp-Source: AGHT+IGd10fu9EAcIecdqEAWBZhHVO1Yz+JANm/al9RrEnhLlQT/PNyBInSUk1GU5oE1piekumI+xw==
X-Received: by 2002:a05:600c:2113:b0:3fe:1fdb:cf5 with SMTP id u19-20020a05600c211300b003fe1fdb0cf5mr1652257wml.1.1691661592083;
        Thu, 10 Aug 2023 02:59:52 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id k17-20020adfe8d1000000b0031455482d1fsm1640069wrn.47.2023.08.10.02.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:59:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] gpio: mxs: fix Wvoid-pointer-to-enum-cast warning
Date:   Thu, 10 Aug 2023 11:59:49 +0200
Message-Id: <20230810095949.123473-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

'devid' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  gpio-mxs.c:274:16: error: cast to smaller integer type 'enum mxs_gpio_id' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-mxs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 8e04c9c4b5a2..024ad077e98d 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -271,7 +271,7 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 	port->id = of_alias_get_id(np, "gpio");
 	if (port->id < 0)
 		return port->id;
-	port->devid = (enum mxs_gpio_id)of_device_get_match_data(&pdev->dev);
+	port->devid = (uintptr_t)of_device_get_match_data(&pdev->dev);
 	port->dev = &pdev->dev;
 	port->irq = platform_get_irq(pdev, 0);
 	if (port->irq < 0)
-- 
2.34.1

