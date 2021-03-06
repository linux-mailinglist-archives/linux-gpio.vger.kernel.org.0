Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A4A32FB82
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Mar 2021 16:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhCFP5q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Mar 2021 10:57:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhCFP5Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Mar 2021 10:57:16 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2CBC06174A;
        Sat,  6 Mar 2021 07:57:16 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo1124548wmq.4;
        Sat, 06 Mar 2021 07:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PcCnT8hlePYBrVx9+vaY6Viur8QCCOHDFsB+RfHcbdI=;
        b=MTuXyPDlVhV+cpBWlaU/KIhgzHKNYscLm3fbJhN+iR6TRNY3HCVRm0ObtckAdqD8oD
         mHak32ZxcjBcMpIWnsvMegmUO1R9gf3Ay/qE8trTUlmtoAuuCnsBCNABwL5dwWrJ+MEb
         lOYmDhf/aTPPZ/TeAAQ8v6sC46ZRXAJ6MintQeNm13XttiIdZAoDQlgLYMxsCeeG989S
         n/8Qes3xrSiBgtqw0MME2/5sv5dq/MUk//qNpUF88jnHp4l2lPu9C5ZvJi5B4CEtUj47
         18RbFHJzwJkle4d1UutAM8Mw55518cGhpPZXfzKEC2h9vnNXTzSZ7eAFoxVq0umwbBO0
         6qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PcCnT8hlePYBrVx9+vaY6Viur8QCCOHDFsB+RfHcbdI=;
        b=Mg3WHfrpB2EJjaIuQzVm2opaTsy6cs38str/Xp8lNG4kkKwHzBF2wlTcwuuuZDjnTK
         Nv+F6HHk5HXPsBIr5ioa1iZKFMoQ0ddPKRGn5gR0SymdDzvHQw1Mt69UGizKR4QE1uOt
         qnm5TEFmhH9xB+2uyH91SwzrJ8zYP+AGbQMCc8b9OdqnAJmc1d7PAV6Q+K6BqYM6tKhm
         DUq3pQKTWRTmJVjPUzmpqoCqD3/5XZ89JNNw2yd56GzcF92mBvp+AF5XO+OxPAjDdaG3
         hk4ejxpiNji6aozi2DJz2/CgD5cSNDM/Qn7OhLReWr0MtYMXRgDSL3yIsxuJW15j0UiB
         kkBg==
X-Gm-Message-State: AOAM531XYsACIwqyWlF9dda0KClX0Lu7S3IC1sSHn2Ex00k+pdiGWc8k
        QwOHqV2Xes9SnRID2wTGUTwOIJGpibtgkA==
X-Google-Smtp-Source: ABdhPJwYwev+H2twyUy1n4rIomNoNpbm3gAAQz6R4vcH+bISHt92e1c8PqSYVdlsQ+thVY5Hi/yIAg==
X-Received: by 2002:a1c:bb0b:: with SMTP id l11mr14468249wmf.150.1615046234857;
        Sat, 06 Mar 2021 07:57:14 -0800 (PST)
Received: from skynet.lan (224.red-2-138-103.dynamicip.rima-tde.net. [2.138.103.224])
        by smtp.gmail.com with ESMTPSA id p6sm9315188wru.2.2021.03.06.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 07:57:14 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 01/15] gpio: guard gpiochip_irqchip_add_domain() with GPIOLIB_IRQCHIP
Date:   Sat,  6 Mar 2021 16:56:58 +0100
Message-Id: <20210306155712.4298-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210306155712.4298-1-noltari@gmail.com>
References: <20210306155712.4298-1-noltari@gmail.com>
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
---
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

