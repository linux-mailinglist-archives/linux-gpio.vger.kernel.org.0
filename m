Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783A22AD664
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 13:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730368AbgKJMem (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 07:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730453AbgKJMeT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 07:34:19 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76EDC0613D6
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 04:34:18 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id l1so8079429wrb.9
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 04:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SyfsPFMi1Ol5bHDdeg25EiAHS6gH8P7QyAg8QmJ1Sho=;
        b=eg3CytypQM/HEfeJZPkKrA2oP/01+B03QechvtoIHMDtU8esfU21sNd52SdNAw9xbj
         093aEREwgXpWgcZQmdfdclrtzVRzoAhhA5WeMmZauY57ovozBJOURv0uVMgjglMbL3wO
         Sew1fvb1nxFOkLTYFSdr3Z98b9iAOSHr8Df5iAESDXzX7nhdHGHko/ikYtY8VVkWypMB
         vDY/1fgeqm8HIsenIJi5j4rq/qPjKYbVh9pfQIQNZHdH6ZkzoAgsRPAM7c4EiCCeFDVr
         nkxea5m3EN9zHg9Zmne3gsMoCDK6Kf/5Y3sBEU5/DjWyvHPM8C1hrKIKfCDJUyzymUNW
         HL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SyfsPFMi1Ol5bHDdeg25EiAHS6gH8P7QyAg8QmJ1Sho=;
        b=UwkKGk4cfVvHrQSZsbaYH72WkxWxarHHKgGyLwTEeqpzYNDCMtxzLjNgAxu1f7qarG
         2MTm8M6GkDybP/m+wvrMeCwimnaZjkgg0NhFQinoZnirYBDjPz2BWReoCq9ByxVfKCDJ
         V6MhX3XbB0FB+5wVGv0lgDhe0qbtlR6uCiroouHeKLk7xQbKUkTE8q0vsvHbaKq3rzM2
         OkVMY069mlm/9qFyHjFfYY8P7SHD9mnkOHnHEJhiLsY4AqqUPQ/piNl39rDjBX/SFXl1
         ffK2Ssm5dJwfZ2mEyF0vQ/xJ9xmXJRv/DqqAD9hGB0Syh++SRMYsZyc1ptubVyn9RiT3
         qvSA==
X-Gm-Message-State: AOAM531PU6QjsulKe/F4+eJO25gX37ainoM7LYkBiA53h/wPrlFz7FD3
        nUaeOCivHMkt1/xfN78AhoFnDQ==
X-Google-Smtp-Source: ABdhPJz84ubKcc4CsVo6fw8BzfaAA0tY9l4m5kYH7MIpwiFA6x1J57ZkFnzMZQgGo9wDw7gGq8jRdQ==
X-Received: by 2002:a5d:514f:: with SMTP id u15mr12722798wrt.385.1605011657513;
        Tue, 10 Nov 2020 04:34:17 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id s8sm12942217wrn.33.2020.11.10.04.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 04:34:16 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 5/7] gpio: exar: unduplicate address and offset computation
Date:   Tue, 10 Nov 2020 13:34:04 +0100
Message-Id: <20201110123406.3261-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201110123406.3261-1-brgl@bgdev.pl>
References: <20201110123406.3261-1-brgl@bgdev.pl>
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

