Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E0B32CEFA
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236927AbhCDI6F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236964AbhCDI55 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:57:57 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2721C061756;
        Thu,  4 Mar 2021 00:57:16 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id l22so7307955wme.1;
        Thu, 04 Mar 2021 00:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=d7UnnrDiJMeQb765OaBCGK57AwvN6Ffv496e4UsVM3I=;
        b=SyTegDWk2XFqAnfo/nf/qo21Oy78nMjrUs2fVmwE/D6juqCLW1gginOD7dDk1JEKfO
         064nksyoUcj2kUqkID2yzx5yYEaaLYenhn8gQtlJEV7c14pC48h654wjFiHAucinayYo
         EDCoxy8ACr2eMwcj+13nWam9Oy0DwN3SZinbqv5vwZJXLSSV67fWo9QflNwlvT+JGNay
         JWJ5lpuMJIDpBiwWUlmQCLihics1HARTiHoCDqMPAXyxuSDE4kjYoHMcrfW/WnkX2Hu5
         PmcmYqkSZ+EvDGnl2k3Epu5CIeViZDLqWciXH59RU6DERuaE0ixNsMNPtUygbigZ3LDU
         obzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d7UnnrDiJMeQb765OaBCGK57AwvN6Ffv496e4UsVM3I=;
        b=HLTE9DWflS90BDXJrRvqDhec+WZ+10hmm/fmPbsN4CCBHM3kpfhv4QvoFI71tiPGTd
         EfvlT763JLJ/zEV1axdODiaIO8IDIOdfsnoAfNpAMV0uxqjlepItpQao8HPW0OGxulKb
         z99ygHCEDioE0cic9/M5PLpqJCEX/RR51d5hASBqurQ5jFoiy6IoNjQKNQasu12gAkmX
         EqBoHa6Di0tiMpW4w1BVCt+ZQwhrT+jfB/fxF3TlY6go8AMtkGXu6UFqyNQxKbJOrM4H
         zNqF14Ftnp6rJSFHAQ+VgV4P2U021xQ1T0LZI2NLN2LpJkhG+2pUwrhRBNk0P8j4xwoB
         KfVw==
X-Gm-Message-State: AOAM5334jNaodbDYLy0Q0SGS9ZQtZL+w1OPYrdFZm0hF1cDyuPrzz8Vi
        ZYCLBD1+RwOowAzBXzSGFWU=
X-Google-Smtp-Source: ABdhPJzvf34zwhcnUR2uuC2kuV0GnaTj5yTgXrLd9BKA4UAe9q6XkLF8/nJpleTo9fEuHmFrQ2dquA==
X-Received: by 2002:a05:600c:4305:: with SMTP id p5mr2348689wme.58.1614848235418;
        Thu, 04 Mar 2021 00:57:15 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id q15sm2828976wrx.56.2021.03.04.00.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 00:57:15 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 01/15] gpio: guard gpiochip_irqchip_add_domain() with GPIOLIB_IRQCHIP
Date:   Thu,  4 Mar 2021 09:56:56 +0100
Message-Id: <20210304085710.7128-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304085710.7128-1-noltari@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
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
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
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

