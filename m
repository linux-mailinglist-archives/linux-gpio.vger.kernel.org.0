Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568432282B8
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbgGUOun (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbgGUOun (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:50:43 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1101BC061794;
        Tue, 21 Jul 2020 07:50:43 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a14so6642853wra.5;
        Tue, 21 Jul 2020 07:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FtjYeahfsCoCJrIFHdJmpOZhvdKjfhqQhW/t+coglS4=;
        b=X7+S6hW6US6cqheTHA43adQBscqeFGGNMkVYD4RYcEA2NdskJ0tJOUqHwc2N1OjC/m
         FnMmBC5OUbkvtKjJoq7eGEEe76VPWNZfUWhGNM99mXLKqXcw1owp60Zhmgl9y8GLpqx4
         JoQFEb0qQn2zZ8tWBNY/vUMs+vwqFIKYK8vcjnHDpeXS0VFFuEYKwB2/yhuPj2EME5q3
         GPnaMBNlNps4iu4HDoXtfsPguw7aoDe6kSjtIT/Jx72uYN8n27FuwMGukekgC0yFOr7S
         /6xlwn5ajp2kiQ6RuDDp8SGkLMPeBHfNZjACAaE2dgZsjkmXna896WuoYrqI8WSYu0lu
         39xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FtjYeahfsCoCJrIFHdJmpOZhvdKjfhqQhW/t+coglS4=;
        b=T6ByOFrU7PpvCEmiLaNnDtNjosgGhx1VqqTeG88HeR5QqYyhI5s1gOESOoh42BgZTr
         UVUmFKcpbitVK1gavdaQS46Q+pw58ZJqkGmEAgUwgxdk5AqUZrZev848m7HywJAp+WG7
         bIOWfAVgywp2dMkFdkalUQ+VEgFZTcw02vV9aqh/N3rJbqYpT14e6sRN4wkdo7rn9BoT
         gZlq5vCVsnxKVdE/YhsFXPlaHNipl9xN/kzsAAfc2q5eYXpbfnVkY2rKHJM36O7TnyMS
         Qif6LO11+DsQUFtqT8DfQZoR4K8SF1zxb4PDILlvnoAMGzxZ2gQ16UcVYaVhcZnuUbY9
         ZgGA==
X-Gm-Message-State: AOAM530PiuNliYA7PfRcXC3Gzj2/haNsYmcFZTtBWEGegz3TIrX8KyzE
        VUvUh8XPEGNGfUzMcGcaXxc=
X-Google-Smtp-Source: ABdhPJyFUeHKHbAaIHOvBoUkGx4gQOyjJrIgjh4of36BxdtWDNGTrLQq8uMp3JMd3QP9w0fHUjGWrQ==
X-Received: by 2002:adf:94a1:: with SMTP id 30mr25844514wrr.37.1595343041778;
        Tue, 21 Jul 2020 07:50:41 -0700 (PDT)
Received: from localhost ([156.204.74.63])
        by smtp.gmail.com with ESMTPSA id u16sm3680271wmn.11.2020.07.21.07.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:50:41 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 1/4] gpio: gpio-msic.c: changed every 'unsigned' to 'unsigned int'
Date:   Tue, 21 Jul 2020 16:50:24 +0200
Message-Id: <20200721145027.770268-1-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changed 'unsigned' to 'unsigned int'.
This makes the code more uniform, and compliant with the kernel coding style.

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpio/gpio-msic.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index 7e3c96e4ab2c..ea5ff2c84a26 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -43,9 +43,9 @@ struct msic_gpio {
 	struct mutex		buslock;
 	struct gpio_chip	chip;
 	int			irq;
-	unsigned		irq_base;
+	unsigned int		irq_base;
 	unsigned long		trig_change_mask;
-	unsigned		trig_type;
+	unsigned int		trig_type;
 };
 
 /*
@@ -58,7 +58,7 @@ struct msic_gpio {
  * GPIO1HV0..GPIO1HV3: high voltage, bank 1, gpio_base + 20
  */
 
-static int msic_gpio_to_ireg(unsigned offset)
+static int msic_gpio_to_ireg(unsigned int offset)
 {
 	if (offset >= MSIC_NUM_GPIO)
 		return -EINVAL;
@@ -73,7 +73,7 @@ static int msic_gpio_to_ireg(unsigned offset)
 	return INTEL_MSIC_GPIO1HV0CTLI - offset + 20;
 }
 
-static int msic_gpio_to_oreg(unsigned offset)
+static int msic_gpio_to_oreg(unsigned int offset)
 {
 	if (offset >= MSIC_NUM_GPIO)
 		return -EINVAL;
@@ -88,7 +88,7 @@ static int msic_gpio_to_oreg(unsigned offset)
 	return INTEL_MSIC_GPIO1HV0CTLO - offset + 20;
 }
 
-static int msic_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int msic_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	int reg;
 
@@ -100,10 +100,10 @@ static int msic_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 }
 
 static int msic_gpio_direction_output(struct gpio_chip *chip,
-			unsigned offset, int value)
+			unsigned int offset, int value)
 {
 	int reg;
-	unsigned mask;
+	unsigned int mask;
 
 	value = (!!value) | MSIC_GPIO_DIR_OUT;
 	mask = MSIC_GPIO_DIR_MASK | MSIC_GPIO_DOUT_MASK;
@@ -115,7 +115,7 @@ static int msic_gpio_direction_output(struct gpio_chip *chip,
 	return intel_msic_reg_update(reg, value, mask);
 }
 
-static int msic_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int msic_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	u8 r;
 	int ret;
@@ -132,7 +132,7 @@ static int msic_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(r & MSIC_GPIO_DIN_MASK);
 }
 
-static void msic_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void msic_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	int reg;
 
@@ -148,7 +148,7 @@ static void msic_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
  * irq_desc->lock held. We can not access the scu bus here, so we
  * store the change and update in the bus_sync_unlock() function below
  */
-static int msic_irq_type(struct irq_data *data, unsigned type)
+static int msic_irq_type(struct irq_data *data, unsigned int type)
 {
 	struct msic_gpio *mg = irq_data_get_irq_chip_data(data);
 	u32 gpio = data->irq - mg->irq_base;
@@ -163,7 +163,7 @@ static int msic_irq_type(struct irq_data *data, unsigned type)
 	return 0;
 }
 
-static int msic_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int msic_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct msic_gpio *mg = gpiochip_get_data(chip);
 	return mg->irq_base + offset;
-- 
2.28.0.rc0

