Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF733588ED
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 17:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhDHPy0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 11:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbhDHPy0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 11:54:26 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D707C061760;
        Thu,  8 Apr 2021 08:54:14 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id e186so2738736iof.7;
        Thu, 08 Apr 2021 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rIN8pFCeaL2LoZFYDNHo3e85mHPCiEYXPwyKOYGtHaE=;
        b=KrZZDITGFhojERnsGR8KbTUSZbtk2xO0nBn8F+jYUkCPdGr4cnqz69qOZdOmX0nkFP
         QU6GYIOaFOftunS3/+RuVzO1J+pZHV3B6VNxImBVphRXlyGV7gSRE1FjJ7k8P7m0y8eU
         Ps8STwkDR51xbMxXqQHEzOi/YlK6y/mYO8Ha0IBaOzQT0j6RpQLusQyeZQ7H6LAS0rDv
         F66pThJEIoDdYsiVHABaQgz+uTlHxGMuA+whU0ZMvFQgj2Z3TWYhHlnfJtt2vp4IB/ds
         Yl9aK0x4DrZ6el0HxLIgC6mcdBp0Sid0siS+OfEQq+uqDjLcZF/egqz8A+zeidCFWqfN
         4mmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rIN8pFCeaL2LoZFYDNHo3e85mHPCiEYXPwyKOYGtHaE=;
        b=fl4Yz1JA+L/TZ6n97OwijYjnBIBfMp7of1yrUhXo+YzWfpyAmMwOT4yvmy9Lphm7Vq
         GnFPh2/8F85m+crN5PMuKxEjC/0nPDVYoliQuWHmPLVD5MykjFMGHQCpRu/MjxouMdKJ
         EyfDml+m1cO9aB/J5zp6DNYydZARw6+OlMnkW89aqwmGEjmgShzl6mFWkG/ZjW+f81oj
         fjiBK4I7OWhnvp4vS5RiszyeEFAj0qPuWuF5R/wAK8iEjpIeIHiomcKiOW3CXKNUHtAR
         1i1RWYgBUXqjVWMb48UBEoCb9J54dtNN9Rqxs2dFNIu2rRvLPG1WoZHgZAlEoqSZaDqI
         sJow==
X-Gm-Message-State: AOAM531Qh6/V2nMzbyW4bpknJ/UHN0d6OIW63ZbI2kSriDKmKHnkkIth
        AO7+XgXXhTlIMkpO0Pj6hrZ5tjs34cjSM5q8
X-Google-Smtp-Source: ABdhPJxYKEFHrqjRpiXMINjjaX8WFGq5kHiicHt+ZbEM9GII5uK4VSe0JbWh5S5Jly5JeK1j3nlR5A==
X-Received: by 2002:a05:6638:371e:: with SMTP id k30mr9555521jav.4.1617897253918;
        Thu, 08 Apr 2021 08:54:13 -0700 (PDT)
Received: from Ubu (97-116-48-27.mpls.qwest.net. [97.116.48.27])
        by smtp.gmail.com with ESMTPSA id z12sm15962435ilb.18.2021.04.08.08.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 08:54:13 -0700 (PDT)
From:   Barney Goette <barneygoette@gmail.com>
To:     vilhelm.gray@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Barney Goette <barneygoette@gmail.com>
Subject: [PATCH v2] gpio: gpio-104-dio-48e: Fixed coding style issues (revised)
Date:   Thu,  8 Apr 2021 10:53:34 -0500
Message-Id: <20210408155334.12919-1-barneygoette@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixed multiple bare uses of 'unsigned' without 'int'.
Fixed space around "*" operator.
Fixed function parameter alignment to opening parenthesis.
Reported by checkpatch.

Signed-off-by: Barney Goette <barneygoette@gmail.com>
Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-dio-48e.c | 50 ++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 7a9021c4fa48..71c0bea34d7b 100644
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
@@ -65,14 +65,14 @@ static int dio48e_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
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
+	const unsigned int control_addr = dio48egpio->base + 3 + control_port * 4;
 	unsigned long flags;
-	unsigned control;
+	unsigned int control;
 
 	raw_spin_lock_irqsave(&dio48egpio->lock, flags);
 
@@ -104,17 +104,17 @@ static int dio48e_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
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
 
@@ -154,14 +154,14 @@ static int dio48e_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
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
 
@@ -202,12 +202,12 @@ static int dio48e_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
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
@@ -306,7 +306,7 @@ static void dio48e_irq_unmask(struct irq_data *data)
 	raw_spin_unlock_irqrestore(&dio48egpio->lock, flags);
 }
 
-static int dio48e_irq_set_type(struct irq_data *data, unsigned flow_type)
+static int dio48e_irq_set_type(struct irq_data *data, unsigned int flow_type)
 {
 	const unsigned long offset = irqd_to_hwirq(data);
 
-- 
2.25.1

