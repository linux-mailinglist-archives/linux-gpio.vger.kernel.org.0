Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A253472623
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Dec 2021 10:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235518AbhLMJtO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Dec 2021 04:49:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235969AbhLMJpj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Dec 2021 04:45:39 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA7DC08EB20
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 01:40:57 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id z6so14413230pfe.7
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 01:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+PLgOGUr24N3pCfDF0pm4vBw2jPEHVpOf1ojIAGQtAc=;
        b=TCXK6mvqNJC7RUZVwMT8njl9FfId+1tDmDUOhMpo9QmLfg9Idm63tAxC/8kUYCtSpa
         6w0N7qb/e01yjEnKfRFzcAS4fvSEIn8npxTL++nHc2ThpwxVe4DDU2IdLkRZMi5yYWdX
         7As7ZhM0Bd4P1WpM/rYtYMumJSeCAvzJnIsIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+PLgOGUr24N3pCfDF0pm4vBw2jPEHVpOf1ojIAGQtAc=;
        b=U4ucPQAYY44OQ6YTww1pIyx4zMljcBNyPFCO8l0/cgiT26GO4/G/teK6vXt5REO+2+
         LjHT7nw7aOJpghAuFzS97HsUKSUtup87OsiHsYj35SF3Ug0LsZUCJXcRQMBG6G8c5Vcd
         /lwyZcvULVNp0+OUzUyi3XwBeLhwTtRV+mAUcKFoVLh8Sb3zu5skhCzFzBBsFSg1bV4l
         RCuxDL4dAtAc4s85ZLNx9RPWIJoRVRapA+N7SfKbJGPZWW2ARuN2GoVpfNi3xxTtvgL4
         aqts/sqP0UAkbbsqeTw9HU8NdBRdpJFARbfCRxr4GyTMUNCyDR5Qgxsy8ZFbyjo2GcZW
         DgYA==
X-Gm-Message-State: AOAM532DBGuPY+HNhR8s9w2J++RmqI6o/T0bjHZ+CgpJ5/Py9i8w3bhx
        cnBcG6S1hdpd9e/eWCcoBGLTrQ==
X-Google-Smtp-Source: ABdhPJwnIC/1GG8HGXvC3beYsltFQ8bMno1f7ktTReaDdiWgvDzepwh8gUYFEaTxeqRdekJDmu2ciQ==
X-Received: by 2002:a62:7803:0:b0:494:64ef:7bd7 with SMTP id t3-20020a627803000000b0049464ef7bd7mr32508766pfc.85.1639388456397;
        Mon, 13 Dec 2021 01:40:56 -0800 (PST)
Received: from shiro.work (p864106-ipngn200510sizuokaden.shizuoka.ocn.ne.jp. [180.9.58.106])
        by smtp.googlemail.com with ESMTPSA id d195sm10237609pga.41.2021.12.13.01.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 01:40:55 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v3 3/5] gpio: msc313: Code clean ups
Date:   Mon, 13 Dec 2021 18:40:34 +0900
Message-Id: <20211213094036.1787950-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213094036.1787950-1-daniel@0x0f.com>
References: <20211213094036.1787950-1-daniel@0x0f.com>
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
2.34.1

