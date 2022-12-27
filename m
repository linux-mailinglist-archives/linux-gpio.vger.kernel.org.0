Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80441656BD9
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Dec 2022 15:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbiL0Ocq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Dec 2022 09:32:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbiL0Ocp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Dec 2022 09:32:45 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F626566
        for <linux-gpio@vger.kernel.org>; Tue, 27 Dec 2022 06:32:44 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id c133so12579529oif.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Dec 2022 06:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ri0mZ2K/fUhEx8zLPRzENIukosBulaHGjs8vpkuOJm0=;
        b=FzsUiFWzBJpv2JmeTGUVSttBRVVcokZ01iBLWstsIaKIarGbhHdLV1eWQTjALe9WsZ
         ao99I0x39hdNKMhO08W1vKYeFDpvjnhPElDfw8mktYJIfFN+B1Why6P6g6nTaIKyFBEN
         7x9EqwL+4A1mx/5F4BA5GcVi8QRvM+Bssn8Is/7xT6qBlMrdrEaa9WGXG3ElndaiuRpk
         4/efYE43oJKDvOdnwvL5Y668pA4OGaH3q7gJsmAHMekeWzIUZnnfkB0/YTiu2KROtTB/
         UPT0Z7n/FlLaAkHL2AaczxJycL5lFcy4VneFbp409c45Sq0vJ8K3ILSY3XQq/ijgqwWS
         jaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ri0mZ2K/fUhEx8zLPRzENIukosBulaHGjs8vpkuOJm0=;
        b=S+EOt93k3d4/I5wERgxBdydsP1ryO170v/zZcQtCTHIaJH3vb5+EwSZGUqDhwjEU0G
         wy7+MFk0vWK8by/tWPpUT3tbcEAQAAPUTNUXpqFb04wH4mv6A1O6186jThxCfp/DqQs4
         jk8LWuks6G+NMWuB+UqC5MMjkpm6aFh95VTtwkawiR1EICG7OWwfh/WFPSp3oIhWIfil
         EX2O0gSm2ObPgrKNwOutxn9LJFpWjsElsHLg3bf1VGZ8ERc+dEbBOKpSOT4qSUzpgtB3
         l12Gd1u5uxMLONFvoQoJ9gp0YRb2z1vkwBwzq4NCqfbOh0a7i5Yk1AZO2Zb0BL7cgTT2
         1mVg==
X-Gm-Message-State: AFqh2krMNX+m091WrXNADP58tRuG2Ri8i0GgiHiCTs96EqciiWzRjB8S
        T+ZlAIPAQzc0lxFQl1Myql9UgA==
X-Google-Smtp-Source: AMrXdXsfa8XvWG+xNY9yQw9yxMAS5xYahVfrADa6LKlUY/J9RXyRtrdeXRtLB/UnWVQmd+WtgQcbLQ==
X-Received: by 2002:a54:4081:0:b0:35a:d72:5505 with SMTP id i1-20020a544081000000b0035a0d725505mr17025178oii.12.1672151563943;
        Tue, 27 Dec 2022 06:32:43 -0800 (PST)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id q205-20020acac0d6000000b0035bce2a39c7sm5864969oif.21.2022.12.27.06.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 06:32:43 -0800 (PST)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, michael@walle.cc,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH v5 1/8] gpio: regmap: Always set gpio_chip get_direction
Date:   Tue, 27 Dec 2022 09:09:39 -0500
Message-Id: <a3181025b434fc0148d74bf37f2a16569c85ed1c.1672149007.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1672149007.git.william.gray@linaro.org>
References: <cover.1672149007.git.william.gray@linaro.org>
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

If you only have reg_dat_base set, then it is input-only; if you only
have reg_set_base set, then it is output-only. Thus, we can always set
gpio_chip get_direction to gpio_regmap_get_direction and return
GPIO_LINE_DIRECTION_IN/GPIO_LINE_DIRECTION_OUT given the respective
register base addresses configuration.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Michael Walle <michael@walle.cc>
Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
 drivers/gpio/gpio-regmap.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 6383136cbe59..f907c9c19fce 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -111,6 +111,11 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
 	unsigned int base, val, reg, mask;
 	int invert, ret;
 
+	if (gpio->reg_dat_base && !gpio->reg_set_base)
+		return GPIO_LINE_DIRECTION_IN;
+	if (gpio->reg_set_base && !gpio->reg_dat_base)
+		return GPIO_LINE_DIRECTION_OUT;
+
 	if (gpio->reg_dir_out_base) {
 		base = gpio_regmap_addr(gpio->reg_dir_out_base);
 		invert = 0;
@@ -265,8 +270,8 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	else if (gpio->reg_set_base)
 		chip->set = gpio_regmap_set;
 
+	chip->get_direction = gpio_regmap_get_direction;
 	if (gpio->reg_dir_in_base || gpio->reg_dir_out_base) {
-		chip->get_direction = gpio_regmap_get_direction;
 		chip->direction_input = gpio_regmap_direction_input;
 		chip->direction_output = gpio_regmap_direction_output;
 	}
-- 
2.38.1

