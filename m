Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80CCB7C53BA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbjJKMXM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234955AbjJKMWy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:22:54 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB244D7B
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:52 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50337b43ee6so8904767e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026175; x=1697630975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVYKJ7dUlELxmiFW4y8r54186U4zVx3Xhgz6tJx0AYw=;
        b=MDoA0aGYpynCNnsTb+4lYEHczMp+DN3WyDH/WnFh6qcRCi+mnMx/PG3O66/NkemFUF
         E3gPA8noJP/b4m6R/9u4H9reYpsXOM5let27S2g5dUqs1YefifDWw89jpFC202682MDh
         /gv2dRmvi8x+EjgYji3d+viG5SfQ25wb13gt+Qs+mc+6cBlgzlXG/4/tLrXq/1+hn/Xc
         SApNmfPUartnd5D8e9BYwaW9lc39S/kSSc86efvg1pOpblzzEZB3OCWbd5pREic7HVOM
         bgvGkaftf+//Ut+qfbDiI948OGBNhRBL9W6ZWI00IhIhN71qcYxkLqJgTZY7T0mIREZI
         hPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026175; x=1697630975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVYKJ7dUlELxmiFW4y8r54186U4zVx3Xhgz6tJx0AYw=;
        b=R5evrjFzUpGnDiRf7q7Gi+WmUIdSh1zimW+cRZXWn+Em1EqF0Sljv8ENdZvgPAVVdF
         0LpXln5pQiEXeogVwk2/dBrXzcKsOJwvSlqh85iGsRq60qxIY241cvaZ7uANSrisYNmh
         c7ibQ8z+iRRc+ks8rloupurm3+aulMNpfAJb8oa+PNOeNVNrddNGEfSqzOpVGMOGxxfD
         dkapBdti5DOWIQ5A7+IEoe0s8I91pXqGJyKRDuJ+wEcfG9txTPLko0Hp6T3sY3r5+jta
         EAryUKb7krGNdXf6Yi+Id23bEJogbnCenBHNGvEgWN1XTZfN9lvxdlyk9Z1p+4UFQyYq
         19nw==
X-Gm-Message-State: AOJu0Yyplv+/WxKperGqpa4/EzO5GRii54DXs8lZcLhZxiNFwvYUCxFz
        ToLz/TExy/MY5oveOn7xz0+Z3A==
X-Google-Smtp-Source: AGHT+IFfI2xCs3AIdGr05wUftkpnNBwNE1Wv/Hh1fFtpiEKHUFmLjVVOQuCQ0f3q/KEst+W8KfVWWA==
X-Received: by 2002:a05:6512:1307:b0:500:7f71:e46b with SMTP id x7-20020a056512130700b005007f71e46bmr19422619lfu.1.1697026175434;
        Wed, 11 Oct 2023 05:09:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 31/62] pinctrl: remove pinctrl_gpio_request()
Date:   Wed, 11 Oct 2023 14:07:59 +0200
Message-Id: <20231011120830.49324-32-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
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

There are no more users of pinctrl_gpio_request() so remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c           | 51 ++++++++++++++------------------
 include/linux/pinctrl/consumer.h |  1 -
 2 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 024e3825fa98..837d35b0e5c3 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -783,34 +783,6 @@ bool pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_can_use_line_new);
 
-/* This function is deprecated and will be removed. Don't use. */
-int pinctrl_gpio_request(unsigned gpio)
-{
-	struct pinctrl_dev *pctldev;
-	struct pinctrl_gpio_range *range;
-	int ret;
-	int pin;
-
-	ret = pinctrl_get_device_gpio_range(gpio, &pctldev, &range);
-	if (ret) {
-		if (pinctrl_ready_for_gpio_range(gpio))
-			ret = 0;
-		return ret;
-	}
-
-	mutex_lock(&pctldev->mutex);
-
-	/* Convert to the pin controllers number space */
-	pin = gpio_to_pin(range, gpio);
-
-	ret = pinmux_request_gpio(pctldev, range, pin, gpio);
-
-	mutex_unlock(&pctldev->mutex);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(pinctrl_gpio_request);
-
 /**
  * pinctrl_gpio_request_new() - request a single pin to be used as GPIO
  * @gc: GPIO chip structure from the GPIO subsystem
@@ -822,7 +794,28 @@ EXPORT_SYMBOL_GPL(pinctrl_gpio_request);
  */
 int pinctrl_gpio_request_new(struct gpio_chip *gc, unsigned int offset)
 {
-	return pinctrl_gpio_request(gc->base + offset);
+	struct pinctrl_gpio_range *range;
+	struct pinctrl_dev *pctldev;
+	int ret, pin;
+
+	ret = pinctrl_get_device_gpio_range(gc->base + offset, &pctldev,
+					    &range);
+	if (ret) {
+		if (pinctrl_ready_for_gpio_range(gc->base + offset))
+			ret = 0;
+		return ret;
+	}
+
+	mutex_lock(&pctldev->mutex);
+
+	/* Convert to the pin controllers number space */
+	pin = gpio_to_pin(range, gc->base + offset);
+
+	ret = pinmux_request_gpio(pctldev, range, pin, gc->base + offset);
+
+	mutex_unlock(&pctldev->mutex);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_request_new);
 
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 105a4b0c1c14..ffce8d7dd0d3 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -27,7 +27,6 @@ struct pinctrl_state;
 
 /* External interface to pin control */
 bool pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset);
-int pinctrl_gpio_request(unsigned gpio);
 int pinctrl_gpio_request_new(struct gpio_chip *gc, unsigned int offset);
 void pinctrl_gpio_free(unsigned gpio);
 void pinctrl_gpio_free_new(struct gpio_chip *gc, unsigned int offset);
-- 
2.39.2

