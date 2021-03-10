Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4640D333CF3
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 13:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbhCJMzd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 07:55:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232598AbhCJMzJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 07:55:09 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D37C061760;
        Wed, 10 Mar 2021 04:55:09 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id u187so7028710wmg.4;
        Wed, 10 Mar 2021 04:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sSch/5wksUDthsaLNwHNQHxAijIb6OwKSPbl9xmbVF0=;
        b=pb73dXNrhv2abYwzcvtVroyfwEt5vMAXX0gE0L4mzVVryQ7YakAJYCCAEo4p0Qylwl
         4G7nu46eXrIlChwqVxGsoCETfypqEyP7/osVMnrNPNmqKY0aYFyCTgQjIu310gXo3sOE
         sbvzGLmErpVTtSgbcYf7HLmKVnf4VQNcF49jqc5VB3Bh9DetID7JhCVRA6/It7/9tVTL
         m3nI1nTxyKYFnlhzGZUW4YIdHxdbxmvB+F88Ew8nAZOrd50hZxIkr2Vas7uM6u2ZLT/Q
         06HlzjUi+TE1B3r1JlzkUpyPi68TeaMSfVCVstsdsMuMrnTyhZgm/hZeBn7YOG3DZk14
         jqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sSch/5wksUDthsaLNwHNQHxAijIb6OwKSPbl9xmbVF0=;
        b=RnKemzTHIBBoboW/SqPDDolpCLxZSuKL6g7buQyQzMK8krHNAM4MONEuybSoFClnzw
         bHe6gQ7VQFD2SxBeQ3HlKUyl/fkP1rvxpA3SCrF4cNq7IHhIL7EMmhB5ZSRDkvD0jXfr
         WElbyk5NSUcT8g3PjloraNiUuPIpM3Fi1lBR/KmSuTNb5IzwZpXSMR6fCpePP4KW2TbK
         PFhfLiQJezld8rIyFAyFnoOiamQFdqZ4qC58vjrY/xEkEnCRkLQQFYpqzTU4hSTN2iAS
         FcypDZMTo+bBJzI33Sbrrv/XoyM2wP9rhF+yJ4skhAuNVAyGjAVVwoUxuCNojjcaadro
         L/EQ==
X-Gm-Message-State: AOAM5320p3P2NtZoiypdszMxdXzkO/MsW3a/Fi6dmX07GovsbSbCKcA8
        DM2p9Qq/q9dHpjNYda91MUY=
X-Google-Smtp-Source: ABdhPJxSmktWnpxP3NOD7h9yEQlwW/62KOpSdQ5Cg7L0OxXt6w4h9Cf+W/o+y2zhyd1UsQWzsuZa9g==
X-Received: by 2002:a1c:2390:: with SMTP id j138mr3200930wmj.72.1615380907885;
        Wed, 10 Mar 2021 04:55:07 -0800 (PST)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v6sm29403398wrx.32.2021.03.10.04.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 04:55:07 -0800 (PST)
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
Subject: [PATCH v6 01/15] gpio: guard gpiochip_irqchip_add_domain() with GPIOLIB_IRQCHIP
Date:   Wed, 10 Mar 2021 13:54:49 +0100
Message-Id: <20210310125504.31886-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310125504.31886-1-noltari@gmail.com>
References: <20210310125504.31886-1-noltari@gmail.com>
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

