Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB4633B15D
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhCOLmu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbhCOLmT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:42:19 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36070C06175F;
        Mon, 15 Mar 2021 04:42:19 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id 61so5518593wrm.12;
        Mon, 15 Mar 2021 04:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PD9HjKWFmvLdbPAjldOGGzMm/Hz1Oa5DoKh83oaNvj4=;
        b=aUf5SCeWNCvGpPGuF/Al8oG3/IjAPcdDg1XbjoxXlf49/qYMdMoq4lKVVpAByOD7k4
         4o6C+FREmpzqUczzvRsJc9g0gIIHoFZUHl+iaGTYMfFPeHpYKhRZ8jGImblOCkG503Oi
         UQSslLSZsqACAytRckB4JdF31fTA6PwhlTImbE1ECDY/xguOa90bB13O6SpgKigcPD/c
         oAgOqrXVB8wdATDkM5mgmYo2uwbVF7jPh0ZONyWOfM1aPMd+ex2ATtjPWwyprxovPX+M
         K5DQ8J/ZND3hcSa7npw8LxhiRs001lgBk5GTIAo1ka/q91DKih0oCxFiwsyrdruXFYJb
         C6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PD9HjKWFmvLdbPAjldOGGzMm/Hz1Oa5DoKh83oaNvj4=;
        b=SPfnc714eTlW3hmQuoObPjlKB2LE9754abw1QZiQN/GJvVzGUcAn0tUPdYch4buqBV
         Y/GA2k+oxj4BclTfgR/MisZyYVuWYadllWiM8atVLpwYJ+jqG5nkQHTDN7eiFXFwFpQw
         cJDiFwttY97Wfjh4bLqa3oY+vwcxMpD4CVV57ThRWo6o59jTPFypDH/DE0L/LLQFHeGY
         Zg/FR5vMlLXLzyG3fzYYEqLJ20WwDSk8S2Ua/64Csbx7F/1Vr0UEnSytaSZ47be6PyuR
         AKTRyMp5I0+NJvkX34aKnYHVEnG3Ioa7372neeInZdxSTG+VdRAlrzhxpxQXh1geZcKn
         CuFQ==
X-Gm-Message-State: AOAM531Y5Nn/eQPo1zFZotLlwED0gDy2dKsUqlXAOdTfspuK6HQZuLM2
        59W2+cgJrULnF+4bUYAH72k=
X-Google-Smtp-Source: ABdhPJwEXl6oKZXYYw39l2udjwZ+Vpw89auVV+N61txUSzzDfze5iolVXjmvLhFa0aieNYQZ9ij5Qg==
X-Received: by 2002:adf:9d82:: with SMTP id p2mr27184130wre.234.1615808537950;
        Mon, 15 Mar 2021 04:42:17 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v189sm12648187wme.39.2021.03.15.04.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:42:17 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 01/22] gpio: guard gpiochip_irqchip_add_domain() with GPIOLIB_IRQCHIP
Date:   Mon, 15 Mar 2021 12:41:53 +0100
Message-Id: <20210315114214.3096-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315114214.3096-1-noltari@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The current code doesn't check if GPIOLIB_IRQCHIP is enabled, which results in
a compilation error when trying to build gpio-regmap if CONFIG_GPIOLIB_IRQCHIP
isn't enabled.

Fixes: 6a45b0e2589f ("gpiolib: Introduce gpiochip_irqchip_add_domain()")
Suggested-by: Michael Walle <michael@walle.cc>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 v7: no changes
 v5: add missing Suggested-by tag
 v4: add patch (fix include instead of gpio-regmap.c)

 include/linux/gpio/driver.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 286de0520574..ecf0032a0995 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -624,8 +624,17 @@ void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
 bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
 				unsigned int offset);
 
+#ifdef CONFIG_GPIOLIB_IRQCHIP
 int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
 				struct irq_domain *domain);
+#else
+static inline int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
+					      struct irq_domain *domain)
+{
+	WARN_ON(1);
+	return -EINVAL;
+}
+#endif
 
 int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset);
-- 
2.20.1

