Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10E0F5ABA3C
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 23:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbiIBVkc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 17:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbiIBVka (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 17:40:30 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7ADC31DD4
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 14:40:22 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id s22so2766846qkj.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 14:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=a/6y1tnbijdXc5qSMdd4IK5j90OSsiP2sEjvKMKEBTI=;
        b=K6w/ph2YvbrAoqqGMdDTbzaJxkU/GCskA/gO5HYUyptfDzMuD/PCZN1AbjYE3Gz7kp
         4qog5itKarci+dzN0DwAog50b8cVEWazuo1qmQbyjZzx4E7UdlnoZWRUB/dwB5pHj3v8
         dqf50X1ggz6hSRBfL7zG0xJ6GyDhVmlADQKfkdiJUXCX4J4Wu51qxWaHi5XmELZEqF+3
         KOdG549A38ufAzxL+PHq59/SFtS3W4i9tr9FaiKwl7dyXHUpYW7EXoBAoKMWyWLMRs0r
         X2dref2ucuJ9yK/mW1v3ZguZpL9hmvpWKa64EWt++3TyJTjV0/wCRB8Ef5MH1ai19vZh
         txcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=a/6y1tnbijdXc5qSMdd4IK5j90OSsiP2sEjvKMKEBTI=;
        b=RyxEBgX/eXughjZ6Au68G3fuM94P3YTqDqLhQGqF07NFr/1evE90O2Ln9D9vuruRvz
         dqxQscfFgT0rw7+ZxeFOGnmNBLiuGH9oiy5LNCYqQxa1HF7a8Ya5b7W20vACqv2wDhRf
         TgSXo8sAwhIfe2NJ4/UONbOY5kPkOVz0X2Wce8Ifi9avToh6Xd2lwqhB1fgNcHmFUnCU
         tlcbECLA7Jw4d2H3Wg/l9r+qYwBvLZvpxpv0B0bYIhrhDdYL2Z46pdKlgTAdwzZeoag8
         LTeex1lNqFS6H/JZ03T50hRF0Vo3N8kStA4ajOWwRThVUeQ+62jvhPTw0eWXNjWOcrnR
         ZePQ==
X-Gm-Message-State: ACgBeo05mzhaEnYHbhdHO8yj/k/jw1H908SDUPojd/KAnB2/rEPK9+cZ
        Et1K2qxEh0lXz10Mdu8eVXZB61WDnlmxcw==
X-Google-Smtp-Source: AA6agR6OyuWkqksbnk9o2odwFhmHjE3fR48VDFM11LQr6zwHpcQ+2cXpaK5b2lZ0sKIUAtzPPBNrgA==
X-Received: by 2002:ae9:e841:0:b0:6b9:c69e:ac99 with SMTP id a62-20020ae9e841000000b006b9c69eac99mr24436570qkg.450.1662154821173;
        Fri, 02 Sep 2022 14:40:21 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id 15-20020ac84e8f000000b0031f0b43629dsm1819533qtp.23.2022.09.02.14.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 14:40:20 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     brgl@bgdev.pl, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH 4/4] gpio: ws16c48: Make irq_chip immutable
Date:   Fri,  2 Sep 2022 13:45:26 -0400
Message-Id: <f4a75e8784f04247e0ef1b7af64d93e68cc373b0.1662140119.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1662140119.git.william.gray@linaro.org>
References: <cover.1662140119.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kernel warns about mutable irq_chips:

    "not an immutable chip, please consider fixing!"

Make the struct irq_chip const, flag it as IRQCHIP_IMMUTABLE, add the
new helper functions, and call the appropriate gpiolib functions.

Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
 drivers/gpio/gpio-ws16c48.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index b098f2dc196b..59fb10641598 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -265,6 +265,7 @@ static void ws16c48_irq_mask(struct irq_data *data)
 	raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
 
 	ws16c48gpio->irq_mask &= ~mask;
+	gpiochip_disable_irq(chip, offset);
 	port_state = ws16c48gpio->irq_mask >> (8 * port);
 
 	/* Select Register Page 2; Unlock all I/O ports */
@@ -295,6 +296,7 @@ static void ws16c48_irq_unmask(struct irq_data *data)
 
 	raw_spin_lock_irqsave(&ws16c48gpio->lock, flags);
 
+	gpiochip_enable_irq(chip, offset);
 	ws16c48gpio->irq_mask |= mask;
 	port_state = ws16c48gpio->irq_mask >> (8 * port);
 
@@ -356,12 +358,14 @@ static int ws16c48_irq_set_type(struct irq_data *data, unsigned flow_type)
 	return 0;
 }
 
-static struct irq_chip ws16c48_irqchip = {
+static const struct irq_chip ws16c48_irqchip = {
 	.name = "ws16c48",
 	.irq_ack = ws16c48_irq_ack,
 	.irq_mask = ws16c48_irq_mask,
 	.irq_unmask = ws16c48_irq_unmask,
-	.irq_set_type = ws16c48_irq_set_type
+	.irq_set_type = ws16c48_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static irqreturn_t ws16c48_irq_handler(int irq, void *dev_id)
@@ -463,7 +467,7 @@ static int ws16c48_probe(struct device *dev, unsigned int id)
 	ws16c48gpio->chip.set_multiple = ws16c48_gpio_set_multiple;
 
 	girq = &ws16c48gpio->chip.irq;
-	girq->chip = &ws16c48_irqchip;
+	gpio_irq_chip_set_chip(girq, &ws16c48_irqchip);
 	/* This will let us handle the parent IRQ in the driver */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;
-- 
2.37.2

