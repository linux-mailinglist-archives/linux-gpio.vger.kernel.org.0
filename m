Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F6B357A89
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 04:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbhDHCtU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Apr 2021 22:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhDHCtU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Apr 2021 22:49:20 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE70C061760;
        Wed,  7 Apr 2021 19:49:09 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id k8so617771iop.12;
        Wed, 07 Apr 2021 19:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VSBB6TlL4KOiUXjfb7F26RoHjiHWr0eGjTCodR8brho=;
        b=PG2lTgObOhRJwYgEbG/o2m2sHSFnsKBPH81OnTpenYWOxvF3fNu+9bWpNqeQPl73Vc
         ZU96/2Wrvboh/Xxentp51/x4k5Cqa5xmPE4BcIhzzxg4Yt98IhBYCy+Eny6BYUvHdgr3
         9l6CjVZo9XJWjjXtVlnFVrKZN52CQkh/Vq8+DBlnY/tfiAYZpQ4Oo5Tu2SIqxMdiML8i
         YQ6YOCaKvabbBw0YgNQnAltvExIxgW6UNnA9pIeciNuErdBiTGkLKQmjX23qy4Hk0B6V
         3FdHQHinnetaBIIClulkVdH3clqFj1evnkDRLUDgsKrEro/dxdw8fG9i5T5OcwMyF77g
         as+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VSBB6TlL4KOiUXjfb7F26RoHjiHWr0eGjTCodR8brho=;
        b=F9kkrXFO0y49hv9NHM+4EBj6ecQLCWeGwOX/ATpnUsiz2NFVUgxAbzCLqo0Q/dyn9m
         dnTSNj3K1BvcIjo736aG6QxZL8bkR45rdQO8ypxDAmWOoXN4evikJ6HZzvnijBdRDRkq
         DdWGp9YgS8KLCZhdh1+kZp/Ni+9XHZ0uDPp1zCn4JMcI8rIySWNQqqheCyc9tmNeiwkJ
         skGYx1iWsi4iCEI7KGaLp68Qz/IQK1NSSzzbi01lUKuBpSGvip5Fk0DJpELQkrhu+OQ9
         ktJdGM79E3ojAOal2lhA/HGocMWcDx4v1LYMNYovkObNW2R0jTYKCAUzgYLD/dNSHwID
         0vTQ==
X-Gm-Message-State: AOAM5323jdtJBDnDBwF5UP9M3x7BtwIxPbQICvw4XmqU8s/KS+VS97pF
        UnQfOzEZldOrygGa4RR5V2E=
X-Google-Smtp-Source: ABdhPJxZm0U/uviAGN+G1EaR50eBMtqIIL8kIR/FrZmSizMn0b9eD2R/YStaRQE92/JM5zxaFA4NYA==
X-Received: by 2002:a6b:6e06:: with SMTP id d6mr4884662ioh.116.1617850148440;
        Wed, 07 Apr 2021 19:49:08 -0700 (PDT)
Received: from Ubu (97-116-48-27.mpls.qwest.net. [97.116.48.27])
        by smtp.gmail.com with ESMTPSA id j6sm14542973ila.31.2021.04.07.19.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 19:49:08 -0700 (PDT)
From:   Barney Goette <barneygoette@gmail.com>
To:     vilhelm.gray@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Barney Goette <barneygoette@gmail.com>
Subject: [PATCH] gpio: gpio-104-dio-48e: Fixed coding style issues
Date:   Wed,  7 Apr 2021 21:49:00 -0500
Message-Id: <20210408024900.1937-1-barneygoette@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixed multiple bare uses of 'unsigned' without 'int'.
Fixed space around '*' operator.
Fixed function parameter alignment to opening parenthesis.
Reported by checkpatch.

Signed-off-by: Barney Goette <barneygoette@gmail.com>
---
 drivers/gpio/gpio-104-dio-48e.c | 53 +++++++++++++++++----------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 7a9021c4fa48..38badc421c32 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -49,15 +49,15 @@ struct dio48e_gpio {
 	unsigned char out_state[6];
 	unsigned char control[2];
 	raw_spinlock_t lock;
-	unsigned base;
+	unsigned int base;
 	unsigned char irq_mask;
 };
 
-static int dio48e_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int dio48e_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(chip);
-	const unsigned port = offset / 8;
-	const unsigned mask = BIT(offset % 8);
+	const unsigned int port = offset / 8;
+	const unsigned int mask = BIT(offset % 8);
 
 	if (dio48egpio->io_state[port] & mask)
 		return  GPIO_LINE_DIRECTION_IN;
@@ -65,14 +65,15 @@ static int dio48e_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static int dio48e_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int dio48e_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(chip);
-	const unsigned io_port = offset / 8;
+	const unsigned int io_port = offset / 8;
 	const unsigned int control_port = io_port / 3;
-	const unsigned control_addr = dio48egpio->base + 3 + control_port*4;
-	unsigned long flags;
-	unsigned control;
+	const unsigned int control_addr = dio48egpio->base + 3 + control_port * 4;
+
+	unsigned int long flags;
+	unsigned int control;
 
 	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
 
@@ -104,17 +105,17 @@ static int dio48e_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int dio48e_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
-	int value)
+static int dio48e_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
+					int value)
 {
 	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(chip);
-	const unsigned io_port = offset / 8;
+	const unsigned int io_port = offset / 8;
 	const unsigned int control_port = io_port / 3;
-	const unsigned mask = BIT(offset % 8);
-	const unsigned control_addr = dio48egpio->base + 3 + control_port*4;
-	const unsigned out_port = (io_port > 2) ? io_port + 1 : io_port;
+	const unsigned int mask = BIT(offset % 8);
+	const unsigned int control_addr = dio48egpio->base + 3 + control_port * 4;
+	const unsigned int out_port = (io_port > 2) ? io_port + 1 : io_port;
 	unsigned long flags;
-	unsigned control;
+	unsigned int control;
 
 	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
 
@@ -154,14 +155,14 @@ static int dio48e_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
-static int dio48e_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int dio48e_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(chip);
-	const unsigned port = offset / 8;
-	const unsigned mask = BIT(offset % 8);
-	const unsigned in_port = (port > 2) ? port + 1 : port;
+	const unsigned int port = offset / 8;
+	const unsigned int mask = BIT(offset % 8);
+	const unsigned int in_port = (port > 2) ? port + 1 : port;
 	unsigned long flags;
-	unsigned port_state;
+	unsigned int port_state;
 
 	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
 
@@ -202,12 +203,12 @@ static int dio48e_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 	return 0;
 }
 
-static void dio48e_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void dio48e_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct dio48e_gpio *const dio48egpio = gpiochip_get_data(chip);
-	const unsigned port = offset / 8;
-	const unsigned mask = BIT(offset % 8);
-	const unsigned out_port = (port > 2) ? port + 1 : port;
+	const unsigned int port = offset / 8;
+	const unsigned int mask = BIT(offset % 8);
+	const unsigned int out_port = (port > 2) ? port + 1 : port;
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
@@ -306,7 +307,7 @@ static void dio48e_irq_unmask(struct irq_data *data)
 	raw_spin_unlock_irqrestore(&dio48egpio->lock, flags);
 }
 
-static int dio48e_irq_set_type(struct irq_data *data, unsigned flow_type)
+static int dio48e_irq_set_type(struct irq_data *data, unsigned int flow_type)
 {
 	const unsigned long offset = irqd_to_hwirq(data);
 
-- 
2.25.1

