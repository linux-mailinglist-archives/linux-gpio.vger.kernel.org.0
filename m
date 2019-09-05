Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67383A97EF
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 03:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbfIEBRo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 21:17:44 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43836 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfIEBRo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 21:17:44 -0400
Received: by mail-pg1-f193.google.com with SMTP id u72so397532pgb.10;
        Wed, 04 Sep 2019 18:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8b8JTddlNjepQv6Et6Ofu7H5cTa0ZFtL5UnNYenz5Ik=;
        b=ImiaCR4z4YjsLdGPtkli/vpoEyohlGYmidyJCVskHO+y5Lo5ENb+8/5TAAE//R/5W1
         20XhyHodIXgTEnUzmSpYxLUWba+SokhMvK75/lqxqAsf+wsR8dI/IH/D4tl/H0LyNyA+
         VxgWnj9vVBdnzcYwDvjUhHYLp4GqEEXt/TiFb+adAYRg4gZy86qQXpVi37wLSm+wwPbW
         P12hb/5RCmbnjvlOqOzIdZTen13U1sjGG7HJdbgYgt3uOu2GB5BL/kH2rIhCoxMTJYup
         pJoGJEwh+LRZPe3oS7iotltWGaKvNpTXqCasN2kj1Zasnjdq4+/7Y7M1YU+5u5gKr9Tz
         qLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8b8JTddlNjepQv6Et6Ofu7H5cTa0ZFtL5UnNYenz5Ik=;
        b=ROmN0fWYX3T1+G6J86awiMrvmSufJEV3/ta1HKXWETYK697nzDRu/GY2kD2s1444+z
         yPk+ZT/GHZig6zyfHPxDhRZL3Efa8RFFFKIpOx7r2mJ22XPCwLCVtryPugnx2mrbbZxO
         FSPIzBGwl+gIo0cjcDBByR8teZBaS+3t0Pmq7h3HUIUgWNAY1wh/b7HUIO3BBbWgcHXc
         U5g+ZqQNmwbFJxYXB6VlMIVVzD+ofYpqKL47znguhRRv4DULaKns9aeYKfj+s6wjNloi
         7Ccuo7CDgW3Q1B4BTXFmj3zmRhLw1O14C0Rn8yvACU4uNOuy7bJMiFZPxp+8bAVDbgff
         wgcA==
X-Gm-Message-State: APjAAAWLZpq2AcV/DVmhDntucmFbe/V1Lx32bZvJ2Hk7nNOnieH5tMl6
        R+shphwl0hIrXVVo6X43qbo=
X-Google-Smtp-Source: APXvYqwo7QKr0i7hZZv/zgo7jyZpDVEZUvySKhDUw2ropW4zGMZGwYJmQ4tAdDvYAs9+X1JPyH87YQ==
X-Received: by 2002:a62:e910:: with SMTP id j16mr690815pfh.123.1567646263758;
        Wed, 04 Sep 2019 18:17:43 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.gmail.com with ESMTPSA id h66sm5434430pjb.0.2019.09.04.18.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 18:17:43 -0700 (PDT)
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     linus.walleij@linaro.org
Cc:     Rashmica Gupta <rashmica.g@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] gpio: Add in ast2600 details to Aspeed driver
Date:   Thu,  5 Sep 2019 11:17:32 +1000
Message-Id: <20190905011732.16059-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ast2600 is a new generation of SoC from ASPEED. Similarly to the
ast2400 and ast2500, it has a GPIO controller for it's 3.6V GPIO pins.
Additionally, it has a GPIO controller for 36 1.8V GPIO pins. These
voltages are fixed and cannot be configured via pinconf, so we need two
separate drivers for them.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 16c6eaf70857..4723b8780a8c 100644
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
+	banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
+	for (i = 0; i < banks; i++) {
 		const struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
 
 		reg = ioread32(bank_reg(data, bank, reg_irq_status));
@@ -1108,9 +1110,33 @@ static const struct aspeed_gpio_config ast2500_config =
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
+	{ .compatible = "aspeed,ast2600-1-8v-gpio",
+	  .data = &ast2600_1_8v_config, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
-- 
2.20.1

