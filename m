Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC30E223DEF
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 16:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgGQOTc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 10:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgGQOTb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 10:19:31 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED42C0619D2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 07:19:31 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id f5so12851674ljj.10
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 07:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ho3ZEEORlxZ8C/ETPsIrzpS5/CtpXeOB/WhdydwuomM=;
        b=KwzNSHhqdetwd9oRpRaEhqSHP7nwTyofdRmVxVt85UaUnnfj90xKFlgUMlCrTLHtdI
         KF9ZoGj9+Zd05LmCOkSObKNqj7fW/EoVeaDf5mSNwSq5KjFwU8+5I9pfkO0vIJWsummZ
         sDBIbKNxtUzJ+Elp/B9nEA3uANcBRlzG7HMwVbI+tpkCUshGmt6HAZZuJD+npuAuZpWZ
         HfoRJCn+uvo8Q+wT1u408sfsdf80zNAwr5ck9X2LlZ46XCUQ8lVc/jxs2uKidp0uctfw
         GaAADEqKVJmK3cRJXAHZ42BEBGXbwXBNwV8Bwt/rK3lYn90ekCzJ6s8iQUZSIdxQslyO
         shuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ho3ZEEORlxZ8C/ETPsIrzpS5/CtpXeOB/WhdydwuomM=;
        b=oS/8UEuY/JJPbwAitlc9zCjg7a41nMnsx/QpbF52FNYt7/X5K+gsgrjCrxAwRqXeKr
         h1szXJj53mY9mLbl/rL3GHq2GpUyivXtNlVTM1c85dAONazkKhIrrQZmmBRjhEFN3NIE
         lP8fgD654bEyosIWM246MRSivDf53sNAJAfSWApzN9H+KgR1SJsw+rKEs19+A/Fm9D7h
         kTMq9dOgWuxqWpnVjKDIHXPWYO+nlfGzBw2XqbkvUDAZ9oPh2ugKoy3JJwRw6Z0O+eNH
         SGO59uqsZtrVqHs7NVGsj3mLrCmgDJJk7kkJQWGzSOrFV+iEyQijmCCyCC1DH7OEGHo+
         1Nkw==
X-Gm-Message-State: AOAM533PvCYPnqAKOaX9cQO97TNgqnODm8futPzTsYN6Xb2o8CsMFT2M
        aHCH1XrcHhSU1ZQ6qGAYmg0LijfGfHo=
X-Google-Smtp-Source: ABdhPJzoCELraXSuMP8w3Hh7Nk1xokM0vPWB8rlinggOAx1q3H7tGHEBMOuRtHMgRYHrEN8fblKxMQ==
X-Received: by 2002:a2e:3a14:: with SMTP id h20mr4356980lja.331.1594995569676;
        Fri, 17 Jul 2020 07:19:29 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id p8sm1979859ljn.117.2020.07.17.07.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:19:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH] gpio: max732x: Use irqchip template
Date:   Fri, 17 Jul 2020 16:19:24 +0200
Message-Id: <20200717141924.57887-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the driver use the irqchip template to assign
properties to the gpio_irq_chip instead of using the
explicit calls to gpiochip_irqchip_add_nested() and
gpiochip_set_nested_irqchip(). The irqchip is instead
added while adding the gpiochip.

Cc: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-max732x.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 63472f308857..347415344a20 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -503,6 +503,8 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 
 	if (((pdata && pdata->irq_base) || client->irq)
 			&& has_irq != INT_NONE) {
+		struct gpio_irq_chip *girq;
+
 		if (pdata)
 			irq_base = pdata->irq_base;
 		chip->irq_features = has_irq;
@@ -517,19 +519,17 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 				client->irq);
 			return ret;
 		}
-		ret =  gpiochip_irqchip_add_nested(&chip->gpio_chip,
-						   &max732x_irq_chip,
-						   irq_base,
-						   handle_simple_irq,
-						   IRQ_TYPE_NONE);
-		if (ret) {
-			dev_err(&client->dev,
-				"could not connect irqchip to gpiochip\n");
-			return ret;
-		}
-		gpiochip_set_nested_irqchip(&chip->gpio_chip,
-					    &max732x_irq_chip,
-					    client->irq);
+
+		girq = &chip->gpio_chip.irq;
+		girq->chip = &max732x_irq_chip;
+		/* This will let us handle the parent IRQ in the driver */
+		girq->parent_handler = NULL;
+		girq->num_parents = 0;
+		girq->parents = NULL;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_simple_irq;
+		girq->threaded = true;
+		girq->first = irq_base; /* FIXME: get rid of this */
 	}
 
 	return 0;
-- 
2.26.2

