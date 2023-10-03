Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6DEC7B6C42
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240337AbjJCOwI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240288AbjJCOwB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:52:01 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9C310E
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:40 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40651a72807so9986795e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344699; x=1696949499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgDYd9Rguhjm4qQEjlLUgCLw45ItMDY7i661tMI87TY=;
        b=n7D1Gr4cFJ0uVO+hGDVa8WtEuGmthdxvZq9P89jE3Bue5skG/lyHfDpoS/MSd4Z7Wu
         KVswtkj0kDPI6c0CXeJYlOcp3QHyKGGc1DIVORzmZy8+75wB8v5c4C8cS3mrE4G9CMJX
         0JkxqKiceqhhBQeAc+KLf96XmOcer7/5MuS9pcW7VLOvaxED89q9IU1HJHFXEvZN42lz
         +XcRbNmPdYaFEqMT1TJ4bPhNyg1G24iK/VldPZ/lZzZZPrqS6awyUXohNy8NPvP5Ke7g
         vrSVywpuELMAg+s6wvfQ5Rr2wh0I9HvNU4Tdxs5ERy7Pjl9iIyDMDa9GVWVaJVifKRfI
         0N3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344699; x=1696949499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgDYd9Rguhjm4qQEjlLUgCLw45ItMDY7i661tMI87TY=;
        b=nOtFeYnSchUV3CIQ8XR4YoamzNgDoHyS5fg+QHWiUSB6qdO5JC/jNrGBJX2fA1R5Wt
         1Kc35cnFL3PI4Q1hw3yr3zbumNhZPuq+a06yskzQQv8ZfvvLeuRWgnS0CmzvdUIa9onD
         U2R9C1p7CqFLC8yAFJS9ywA8/+NGB36DfQCD/Xcgc2Jz9sMrIpSgnB1+9QGYl1JmktPW
         RDJ1KmwiB8WTJ9VY9kmnudJDnl/98sWpow6ZqkwNzPn8RuAkDZMGu5BL2TcoY3zOmM5V
         Y/5DP/wRG2QQD9Pb9zybml+nSpiEZRecjVBfexuZlN5HtDJmQDP+f5HBqp3lmqItTLJi
         DLQQ==
X-Gm-Message-State: AOJu0YzYUzYLiUXdh6I4dhPpNXnbMQZnzNtHsT86LjE4zdTkZ09/rmWR
        kU/K3jbMbkJX6S31ZzNTlfxNlw==
X-Google-Smtp-Source: AGHT+IH6YAoLNEHHvimtWeVC8d3A1YFAiEfqAuJDkC/G0uqJtxZ62sDko6wUTkIUwvYjB/EuocWeLA==
X-Received: by 2002:a1c:7905:0:b0:405:7b92:453e with SMTP id l5-20020a1c7905000000b004057b92453emr13180495wme.37.1696344698922;
        Tue, 03 Oct 2023 07:51:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:38 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 20/36] pinctrl: rk805: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:50:58 +0200
Message-Id: <20231003145114.21637-21-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-rk805.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
index 2639a9ee82cd..58e6dd932bc7 100644
--- a/drivers/pinctrl/pinctrl-rk805.c
+++ b/drivers/pinctrl/pinctrl-rk805.c
@@ -289,14 +289,14 @@ static void rk805_gpio_set(struct gpio_chip *chip,
 static int rk805_gpio_direction_input(struct gpio_chip *chip,
 				      unsigned int offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int rk805_gpio_direction_output(struct gpio_chip *chip,
 				       unsigned int offset, int value)
 {
 	rk805_gpio_set(chip, offset, value);
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static int rk805_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
-- 
2.39.2

