Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF782B4177
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 11:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbgKPKmz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 05:42:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbgKPKmx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 05:42:53 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30B7C0613D2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 02:42:52 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id p1so18096513wrf.12
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 02:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F5kdznBrJW+VypbGEPNf0OtiokFm6vP4lO2T+vXUmHA=;
        b=EVXPZ0TiziQKgJREjWEH4+lVZA8i3kfpAqcUeIU4xCWDqfKl0OSo8QzyyIsg9EinRn
         U3Ivt+N8tfUK8gXiitH9aELWzjQiciHk/lpQmNdL540ODe2cHm1d5W+k9jb/GhVLM/J/
         IPp6LCg4rrDpquMBvpsNCpr7kWE/CoWvHnoMP/l/lRsyMMpBxTiIT+lOtoTCcujzLGmm
         6fOAWM8PryqoyEpRH4rOaCSP9FOPz8B8bXXT1mOf7Kp7WLnF7MyECcBNdhP0SOt3bi7R
         VmMgglUFBk7iFwzg1GXuBcMfb/KcWMVbkPHDkGbp8DGknPA7YnmctXWDE4lKjz/7ipYD
         DwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F5kdznBrJW+VypbGEPNf0OtiokFm6vP4lO2T+vXUmHA=;
        b=ni90dzGTh6Ny4uGAax1N1KCRPZbq4r0BfAbFyvZfV4Hmj/rH/ay3z5HKJZTC1PUDvn
         k8ANt+ARBTbbNQHN+eYXfLKU2SdYAPFHdmFnbcVAng+TFAEs8ogCg+/xYhfGjrQKFaBM
         ozb6SbxNx8+NcsMWw14jjYuwayJ4q+KbHobZaVugAejnIZvQj7vSiQgM87BXtGxeRu2h
         hcyH4a0FASDRbgu1KQ15OSmobgfJ1ugq0KXYaZgutlbU09YfsOxXK+LHoXZ6uSJv9V9S
         DKY3/0ffPgjD2y0p9MpPqwgXsGXut12y1OZ5/ypn15ZeBX/IXmO8R2AapLEfDr1mkTH9
         Qpdw==
X-Gm-Message-State: AOAM531P0kNrN8x1gqX74g20nQSnmzCMlBc5NdUrLSV7KMXf+tpgeo+O
        xRx2I0dX7piBTJnFND7co6H9Wg==
X-Google-Smtp-Source: ABdhPJw3GjFgCz8jbwzhIXBPnEYlFhjGQd9hwHbFk5wksN1FbDj4MswRxXCr7Xt3Hg1WEFgX/oBXZg==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr18324947wrr.353.1605523371487;
        Mon, 16 Nov 2020 02:42:51 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id v16sm20583283wml.33.2020.11.16.02.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 02:42:50 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 5/7] gpio: exar: unduplicate address and offset computation
Date:   Mon, 16 Nov 2020 11:42:40 +0100
Message-Id: <20201116104242.19907-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201116104242.19907-1-brgl@bgdev.pl>
References: <20201116104242.19907-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide and use helpers for calculating the register address and bit
offset instead of hand coding it in every function.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

