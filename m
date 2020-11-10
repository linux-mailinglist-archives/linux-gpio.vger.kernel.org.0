Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE83A2AD97C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732628AbgKJO5S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:57:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731365AbgKJO4M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:56:12 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E11C0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:56:12 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id d142so3272678wmd.4
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SyfsPFMi1Ol5bHDdeg25EiAHS6gH8P7QyAg8QmJ1Sho=;
        b=zDD20QVMC5IWBHog2KuNoZ8pGkgPX7Zgy2+KbJMYTZd7PKhDV4IOzOKifhW8EuzDVK
         D0U/twFCuXZ3WEeYgaxiAHj5xg5Sab2cVpforIiTC+gHdaOo4vIxiq6Ck47ijCy+UjZ6
         amPapieoKB19FzEe7XAlat3NXSfFVxI5Zieabreptqz//W5hT1Fy8o+6mi2LiTpAIrQg
         U7gawmdly0dGU8m5G8tglRiier3RXnuLCy6oRDMNKXgbVNnDTWtzeXFfn4KE+4HKc3OG
         fVejE3kUK5B71SR2eBjKFiiKInsZ0q1k3XN4h9j3i6IiqiteJ7VC757UDUZc1fiWNU3V
         6gvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SyfsPFMi1Ol5bHDdeg25EiAHS6gH8P7QyAg8QmJ1Sho=;
        b=Ds2SA8vZxO9Ml6ZUQ7BFC9SXAGyjHffYAt+ibP/sZpCdt6/m+wOnBx5KgGL6FUzS5z
         42jSwFl+thqLEnMUeUCHpOHE5BzQWR7k+JTAdIfJCqXh/oy9m2m8u5cS+LcJIBH5Dwao
         G3aCeFjEbADeL2hr3OLX5eUZGK7hsHl7Ld96uqHbJJGY6+BGXR2+N4T8CyuWGe/l/Kb+
         F3McXGlqhqvleLAYLAAw2AfUPoTgx5s08IfL6hhin+Cdt0CVAw8+BRfyAnMiCeg7nTRe
         bCm0Lg/WY/TAXpKXEAU/QwLSD+V7HIVZec2XE8/CES296zuAI8mNpA6PIY/8116wJ9qt
         sEbg==
X-Gm-Message-State: AOAM530wMzViw3zKWIHUeaSS+F8968nD9teUq83M4oLmYQD6cg9Y9AcT
        ptmyBsLYZtH6k9S+ZWkzkFRJ+A==
X-Google-Smtp-Source: ABdhPJzaDMq9yF/90PfbDtmjMrDDyU6nQWF5HcfMvUY6Hf+4iouCXqUCX+g+a816+uzUAvJbyXGhyA==
X-Received: by 2002:a1c:3d54:: with SMTP id k81mr60297wma.144.1605020170860;
        Tue, 10 Nov 2020 06:56:10 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f17sm3261827wmf.41.2020.11.10.06.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 06:56:10 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 5/7] gpio: exar: unduplicate address and offset computation
Date:   Tue, 10 Nov 2020 15:55:50 +0100
Message-Id: <20201110145552.23024-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201110145552.23024-1-brgl@bgdev.pl>
References: <20201110145552.23024-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide and use helpers for calculating the register address and bit
offset instead of hand coding it in every function.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-exar.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index db366d85b6b4..28b0b4b5fa35 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -33,6 +33,26 @@ struct exar_gpio_chip {
 	unsigned int first_pin;
 };
 
+static unsigned int
+exar_offset_to_sel_addr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
+{
+	return (offset + exar_gpio->first_pin) / 8 ? EXAR_OFFSET_MPIOSEL_HI
+						   : EXAR_OFFSET_MPIOSEL_LO;
+}
+
+static unsigned int
+exar_offset_to_lvl_addr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
+{
+	return (offset + exar_gpio->first_pin) / 8 ? EXAR_OFFSET_MPIOLVL_HI
+						   : EXAR_OFFSET_MPIOLVL_LO;
+}
+
+static unsigned int
+exar_offset_to_bit(struct exar_gpio_chip *exar_gpio, unsigned int offset)
+{
+	return (offset + exar_gpio->first_pin) % 8;
+}
+
 static void exar_update(struct gpio_chip *chip, unsigned int reg, int val,
 			unsigned int offset)
 {
@@ -52,9 +72,8 @@ static int exar_set_direction(struct gpio_chip *chip, int direction,
 			      unsigned int offset)
 {
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
-	unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
-		EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
-	unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
+	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
+	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
 
 	exar_update(chip, addr, direction, bit);
 	return 0;
@@ -75,9 +94,8 @@ static int exar_get(struct gpio_chip *chip, unsigned int reg)
 static int exar_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
-	unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
-		EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
-	unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
+	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
+	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
 
 	if (exar_get(chip, addr) & BIT(bit))
 		return GPIO_LINE_DIRECTION_IN;
@@ -88,9 +106,8 @@ static int exar_get_direction(struct gpio_chip *chip, unsigned int offset)
 static int exar_get_value(struct gpio_chip *chip, unsigned int offset)
 {
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
-	unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
-		EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
-	unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
+	unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
+	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
 
 	return !!(exar_get(chip, addr) & BIT(bit));
 }
@@ -99,9 +116,8 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
 			   int value)
 {
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
-	unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
-		EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
-	unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
+	unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
+	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
 
 	exar_update(chip, addr, value, bit);
 }
-- 
2.29.1

