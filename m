Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2308C6E2538
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Apr 2023 16:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjDNOHN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Apr 2023 10:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbjDNOHK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Apr 2023 10:07:10 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 374AFAF30
        for <linux-gpio@vger.kernel.org>; Fri, 14 Apr 2023 07:06:43 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id d7so34618558lfj.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Apr 2023 07:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681481185; x=1684073185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piZtR9c1XXRUhN80nr5uI5PYaUW6B0TX8Yk94OoYNYM=;
        b=L0hMZaKd8aAn3gP0arCyVc3RvZA3y2s9OpyXKpUgLA6BbsiNQ43gXoMT6ccrGNzYvt
         gS31vXMWqQra92iOxWdau4KgHn3JsuGoLXDzONZw+aJUJ9WLULDE9/NbyxRtyGkxGl0+
         pDjJCDPfsPTgtov87i84MWWaQtTRQ2ZweNzWlxs4rPoYF4lpqjyzHwwZSw73lBuBlea0
         1rRD5s5wOHNxLPA5YqNTBtIA3rq569dfYfAMY6oQOOpXx69E9lM1zQt2UCQUvvvZy+IY
         ateBY2nUCkgzlCaVT0lcivFrRvOPTBxeLa1xiBy0WGGrtEXFyURHGLVu/Q/bp1E5YChR
         YzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681481185; x=1684073185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piZtR9c1XXRUhN80nr5uI5PYaUW6B0TX8Yk94OoYNYM=;
        b=OWrxKEF8cB5rjgdW5oQADvRbgm0mRQyfOgEzCYo/80k3sZIvP2QgSM6WNr/T44J8kO
         voe4ZsPAZO+Cu4H9VqTQifrRuvpB4SKozDZzQpn0gVArWAOL1tOii2lgUZaqi5P5DSmy
         tYPk1HnzH1KzoL0f1rwqjJsKv4AsWh9i/ze6MHCuJ1KLIX4T/lc6yJrjd1YCGJi8S6Aq
         cpF0WWH+U91Q0nFy5PcbX6uBHMajTxcTDvgdphdXL6//S8ML0zKbIQLQ8PxqJTuKw819
         HADrMIW9O4RVK3XEPQ4YYoHsGEet8emaDrYcg5bz8Qe5YSjN+apKMZbgD9Lg9xqTCtKD
         ioQA==
X-Gm-Message-State: AAQBX9cV+cwpsBjctCABtF9WS8Qwqlm/RDEauEsKlBMNnD7rCWmeX8mG
        fWGBcY2o3YWbAPI1Kn0Nzfpzfw==
X-Google-Smtp-Source: AKy350aW2kYqU5rDczMtKrNTsBvQThixg5YPYjr6NGvHe7Ksi053ZZLv1eU36D2PlJ7d55hE7KR07w==
X-Received: by 2002:ac2:4428:0:b0:4ec:8615:304e with SMTP id w8-20020ac24428000000b004ec8615304emr2172956lfl.32.1681481185139;
        Fri, 14 Apr 2023 07:06:25 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b10-20020ac25e8a000000b004d856fe5121sm808794lfq.194.2023.04.14.07.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:06:24 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Apr 2023 16:06:19 +0200
Subject: [PATCH 3/6] pinctrl: plgpio: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230414-immutable-irqchips-2-v1-3-6b59a5186b00@linaro.org>
References: <20230414-immutable-irqchips-2-v1-0-6b59a5186b00@linaro.org>
In-Reply-To: <20230414-immutable-irqchips-2-v1-0-6b59a5186b00@linaro.org>
To:     Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the driver to immutable irq-chip with a bit of
intuition.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/spear/pinctrl-plgpio.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index ada401ef4342..722681e0b89b 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -301,6 +301,7 @@ static void plgpio_irq_disable(struct irq_data *d)
 	spin_lock_irqsave(&plgpio->lock, flags);
 	plgpio_reg_set(plgpio->regmap, offset, plgpio->regs.ie);
 	spin_unlock_irqrestore(&plgpio->lock, flags);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void plgpio_irq_enable(struct irq_data *d)
@@ -317,6 +318,7 @@ static void plgpio_irq_enable(struct irq_data *d)
 			return;
 	}
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	spin_lock_irqsave(&plgpio->lock, flags);
 	plgpio_reg_reset(plgpio->regmap, offset, plgpio->regs.ie);
 	spin_unlock_irqrestore(&plgpio->lock, flags);
@@ -356,11 +358,13 @@ static int plgpio_irq_set_type(struct irq_data *d, unsigned trigger)
 	return 0;
 }
 
-static struct irq_chip plgpio_irqchip = {
+static const struct irq_chip plgpio_irqchip = {
 	.name		= "PLGPIO",
 	.irq_enable	= plgpio_irq_enable,
 	.irq_disable	= plgpio_irq_disable,
 	.irq_set_type	= plgpio_irq_set_type,
+	.flags		= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static void plgpio_irq_handler(struct irq_desc *desc)
@@ -595,7 +599,7 @@ static int plgpio_probe(struct platform_device *pdev)
 		struct gpio_irq_chip *girq;
 
 		girq = &plgpio->chip.irq;
-		girq->chip = &plgpio_irqchip;
+		gpio_irq_chip_set_chip(girq, &plgpio_irqchip);
 		girq->parent_handler = plgpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(&pdev->dev, 1,

-- 
2.34.1

