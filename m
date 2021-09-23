Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D62D541588D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 08:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239549AbhIWG5W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 02:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239516AbhIWG5U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 02:57:20 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A791C061762
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 23:55:49 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id j14so3398511plx.4
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fc6vpP8FqBbPsZnX7OmEY0kYGdml5Q/LdtxFp8UW6Ac=;
        b=k4kPsG/gzpz0nKhfed6jf7oj6OLIDRzx9VS9pDWpBfMNIXsdU5W8izdzvmJa4A9wSN
         t/Pp5QQI5LEaHKUNKzWSLUa0jgZMmgbcxMHFGGt9YtU7oFi7ej0V55PYvbLugq7JxwuE
         1Gde75a8XNLesRG6yfx/WV0/Hrf3kU5wLZT7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fc6vpP8FqBbPsZnX7OmEY0kYGdml5Q/LdtxFp8UW6Ac=;
        b=aMuYddYUGAgzayXjJ5Ps9u2ErDPBMOebas/i69vn7iEai21pVHV7qcWsaAoAjg2oLw
         KPoZnmsTa4cEoo0xJxiQmSWGJN2FwdaR+I1BoCboaCce7HvOCwvqpHc34aewOXVUVnVl
         9V3tt0OpYCvpIh14YxVAnaGQv83AUKPBbVIigpGRErZf6cRC6Z2wZP3ds20SaP4y0Haw
         2HkOuAgzSJKzBNiLvMacaQE908Yp2LC0J942/fCPNzJFSLWH0Fv2YZd1O60J0AksDLd0
         XglRRsmSp9UreGSW1JKoCu3vCllzDqLdNGIz6tmTAWZDxUtgCJ9R1/kjSuUrcrsJyVT6
         jRhA==
X-Gm-Message-State: AOAM5317nu3qYaSIuIhuMVmYoEyk3y6G8xi7dV4TtU9c56jyzqTBwAIJ
        j0hfApaQNFHIaAm74MvkP2iuSA==
X-Google-Smtp-Source: ABdhPJzX7ntnnla8i+Y4V7t6fjVk5t8d/WR6Oboj3+h/uAxrc7w/ab4NTT1PJr+xx9C0o0+dXAD3gw==
X-Received: by 2002:a17:90b:1987:: with SMTP id mv7mr3584296pjb.91.1632380149208;
        Wed, 22 Sep 2021 23:55:49 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id e12sm1581888pgv.82.2021.09.22.23.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 23:55:48 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, pavel@ucw.cz,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 04/11] gpio: msc313: Code clean ups
Date:   Thu, 23 Sep 2021 15:54:53 +0900
Message-Id: <20210923065500.2284347-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923065500.2284347-1-daniel@0x0f.com>
References: <20210923065500.2284347-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

- Remove the unneeded assignment of ret before returning it.
- Remove an unneeded blank line

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-msc313.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index da31a5ff7a2b..a894bafbd4c3 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -344,7 +344,6 @@ static int msc313_gpio_probe(struct platform_device *pdev)
 	struct irq_domain *parent_domain;
 	struct device_node *parent_node;
 	struct device *dev = &pdev->dev;
-	int ret;
 
 	match_data = of_device_get_match_data(dev);
 	if (!match_data)
@@ -399,8 +398,7 @@ static int msc313_gpio_probe(struct platform_device *pdev)
 	gpioirqchip->handler = handle_bad_irq;
 	gpioirqchip->default_type = IRQ_TYPE_NONE;
 
-	ret = devm_gpiochip_add_data(dev, gpiochip, gpio);
-	return ret;
+	return devm_gpiochip_add_data(dev, gpiochip, gpio);
 }
 
 static int msc313_gpio_remove(struct platform_device *pdev)
@@ -456,5 +454,4 @@ static struct platform_driver msc313_gpio_driver = {
 	.probe = msc313_gpio_probe,
 	.remove = msc313_gpio_remove,
 };
-
 builtin_platform_driver(msc313_gpio_driver);
-- 
2.33.0

