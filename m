Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E715333F2C8
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 15:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbhCQOiR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 10:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbhCQOiI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 10:38:08 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE657C06174A;
        Wed, 17 Mar 2021 07:38:07 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so1429339wmi.3;
        Wed, 17 Mar 2021 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1idDhBR6sHz3yNmB9rvAHE1elX2hdNaMi/nnqFKAAEA=;
        b=tVzttT7i+DgQChJCd+w5jWcpOjufTlHEbRVPP7M1iNapVIdmKpzaR1PmwSp9zwWfhQ
         +d6jSAom8DBCOeyak8ZpEgor+TG17i7igsEEhhM4iJxIMlFhcX2veN/nwcHOnJAmTKe0
         Jt1jsBvlqI0KbCAoZL52gwey1AwZ4xOWuXOTYO6TA/j/tf8ef8kKKxCs5w6k4HfGKhwy
         krnqaD0RxVNXki38+/nDHjeXT+LPv1uUT6cgpz9nmi5PjyS6NsdOgHSelJdlx62ZkHoC
         Ih8coZ4DheGtOWT9qVMvVXzCwyWvogZL9xNUOdiLwd21rS4HH7uJ+nxZmm6XRK3T215c
         CPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1idDhBR6sHz3yNmB9rvAHE1elX2hdNaMi/nnqFKAAEA=;
        b=iEG3rr7lBJJL8ySaJnMUNrz2lZLcsmVFM3Hdtjiy+u0atW6rt3MNZojVYaj9u9/jTr
         j6Wlid1x+jEoalfy5us+fRX+kkBG7JBvZVjJsozuT/ZvnVKTc/tSFy5+i61fbLc/0zBJ
         rjT4ara/QZt6CBINnylieHxmeN3CFtj2UIgLgDcR1huKgxJLI0djkm5g4xB4gWC7o/8f
         qFWcKGPU55CDIrS/xUWStuBHvj+SNrgi+BbbdjJYwDxteKc+8SeIEbFQSbzuk38tA1Fu
         +tnTTlPWtcY9sisP6ULVE3VDfgTLsz5w2rbfnVnoHq/K+gGMZb/ReprH+cznNsNKFV/3
         yxwg==
X-Gm-Message-State: AOAM532lWh6QeuK4QFOnMnVBXsxCk89qK0tKDzNLoRRhC8JYNECTlfwu
        OOfiqPDrvbPGsjXCjEPrQlA=
X-Google-Smtp-Source: ABdhPJyPEXpSV8JQyGQJOeMyEkk4QTe76xmD4tPEoU17EnjG+cQwX36wm+1LGjxzWUPOvCB666a70w==
X-Received: by 2002:a1c:7415:: with SMTP id p21mr4040460wmc.187.1615991886690;
        Wed, 17 Mar 2021 07:38:06 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a75sm2518948wme.10.2021.03.17.07.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:38:06 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 01/22] gpio: guard gpiochip_irqchip_add_domain() with GPIOLIB_IRQCHIP
Date:   Wed, 17 Mar 2021 15:37:42 +0100
Message-Id: <20210317143803.26127-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317143803.26127-1-noltari@gmail.com>
References: <20210317143803.26127-1-noltari@gmail.com>
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
 v8: no changes
 v7: no changes
 v6: no changes
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

