Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21242A7B4A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 08:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728747AbfIDGN0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 02:13:26 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33893 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728610AbfIDGN0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 02:13:26 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so10649098pgc.1;
        Tue, 03 Sep 2019 23:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dwQylTZAjlDddzlsHBHSBMQ7EYoKKuHnayRWM7T5y0g=;
        b=H0et8VQzTf/uK3fL10utxIcqVuxPIx2H3Vl488KJZDiBDKzJLiUaTE6zesw/JS82fI
         TuAxT91S5OOEkThao21DilskqA0EVmzlPrw3COcOihDzsEHMcgxNeDf0wcyrmAmCtFGX
         bNSbnu9rLkEd8TMy68Udy4QbZwDYNXeTYmXAk+GvNf7Poyvc5FeFggyBAOhsSKGnnELr
         rhSQshNpztoyGRg76+SB9eSHPloob0uHEUyn3e4CGvSIWaiR5HfyJ0Fvf+cEBPub1lB1
         M3Vpy8wmoH9guLbEjXO9CidL+I0QejrU32T62EVqCCB6Uw/PbFNvkvQSKWdS1SoWiYzH
         tHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dwQylTZAjlDddzlsHBHSBMQ7EYoKKuHnayRWM7T5y0g=;
        b=ezipcbf7AyQ1WyPV/sIHPv/QsOQPjKtcwphknrwNGyjQVrZ9ZRZvXvIaUS6vMuXATg
         vd3RiQZejknGlkVLcJ7d09l5UkxUX/v7HyxhM/9TR5Jq/MmUiDM6d0DWnQ6g/KHEVYIv
         KWFewAJEpQqNhhHae1yDvSVLjnFFDLOR/+vj+iiFVbNuvXKYe3kxCjvOMFUivcRqGcAA
         H/qlni3sA708wyU2ZEUhL771cCxL7sUscPLkHSyTAcANdyn8JmB4jbsUXKrM64IJMEJr
         XyG0xcBeUNEnucYemL/gbziMAD8NAh74X4HYs8z1vMO+X/YQf6xml4yT7uod/3T7QDOv
         hUEw==
X-Gm-Message-State: APjAAAXqLb0PB4y2MziDls/ol6iARUBfABUF/zg1pCZD000DrJenEB5F
        ZSjahONxqurgo2Z5zrK3vFI=
X-Google-Smtp-Source: APXvYqyBhY/AnfgGoWby13Aai3moACfpQi6PDqg+npBn9MK9a3FjZAgErqSjzTgubNlEgXTLsfTHbA==
X-Received: by 2002:a17:90a:c305:: with SMTP id g5mr3396371pjt.58.1567577605456;
        Tue, 03 Sep 2019 23:13:25 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.gmail.com with ESMTPSA id i9sm42443093pgo.46.2019.09.03.23.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 23:13:25 -0700 (PDT)
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au,
        Rashmica Gupta <rashmica.g@gmail.com>
Subject: [PATCH 3/4] gpio: Add in ast2600 details to Aspeed driver
Date:   Wed,  4 Sep 2019 16:12:44 +1000
Message-Id: <20190904061245.30770-3-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904061245.30770-1-rashmica.g@gmail.com>
References: <20190904061245.30770-1-rashmica.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ast2600 has two gpio controllers, one for 3.6V GPIOS and one for 1.8V GPIOS.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 60ab042c9129..98881c99d0b9 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -662,12 +662,14 @@ static void aspeed_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct aspeed_gpio *data = gpiochip_get_data(gc);
-	unsigned int i, p, girq;
+	unsigned int i, p, girq, banks;
 	unsigned long reg;
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
 
 	chained_irq_enter(ic, desc);
 
-	for (i = 0; i < ARRAY_SIZE(aspeed_gpio_banks); i++) {
+	banks = (gpio->config->nr_gpios >> 5) + 1;
+	for (i = 0; i < banks; i++) {
 		const struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
 
 		reg = ioread32(bank_reg(data, bank, reg_irq_status));
@@ -1108,9 +1110,32 @@ static const struct aspeed_gpio_config ast2500_config =
 	/* 232 for simplicity, actual number is 228 (4-GPIO hole in GPIOAB) */
 	{ .nr_gpios = 232, .props = ast2500_bank_props, };
 
+static const struct aspeed_bank_props ast2600_bank_props[] = {
+	/*     input	  output   */
+	{5, 0xffffffff,  0x0000ffff}, /* U/V/W/X */
+	{6, 0xffff0000,  0x0fff0000}, /* Y/Z */
+	{ },
+};
+
+static const struct aspeed_gpio_config ast2600_config =
+	/* 208 3.6V GPIOs */
+	{ .nr_gpios = 208, .props = ast2600_bank_props, };
+
+static const struct aspeed_bank_props ast2600_1_8v_bank_props[] = {
+	/*     input	  output   */
+	{1, 0x0000000f,  0x0000000f}, /* E */
+	{ },
+};
+
+static const struct aspeed_gpio_config ast2600_1_8v_config =
+	/* 36 1.8V GPIOs */
+	{ .nr_gpios = 36, .props = ast2600_1_8v_bank_props, };
+
 static const struct of_device_id aspeed_gpio_of_table[] = {
 	{ .compatible = "aspeed,ast2400-gpio", .data = &ast2400_config, },
 	{ .compatible = "aspeed,ast2500-gpio", .data = &ast2500_config, },
+	{ .compatible = "aspeed,ast2600-gpio", .data = &ast2600_config, },
+	{ .compatible = "aspeed,ast2600-1-8v-gpio", .data = &ast2600_1_8v_config,},
 	{}
 };
 MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
-- 
2.20.1

