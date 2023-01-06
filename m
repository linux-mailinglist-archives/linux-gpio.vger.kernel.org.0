Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7C56603E6
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jan 2023 17:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbjAFQGA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Jan 2023 11:06:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234213AbjAFQFs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Jan 2023 11:05:48 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D12380ADD
        for <linux-gpio@vger.kernel.org>; Fri,  6 Jan 2023 08:05:36 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id g7so2462038qts.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jan 2023 08:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBzZIniUiDrAbKUBOEl7Fu05saOkQZfmXP6dGp7yl+c=;
        b=l0Fj4XX/BTtj86WqzVx/ekh0var0EdLZOobnaKeT0jVvYj/uTLezvWhqYdMHYQojFG
         p/xS7xwgLJuKyA83SxJqsOvpETVLESCzdmGHhu+DfC5PuORqeTbwoRy61hiMjxEprQwk
         TOFE2pYy9NLVlmbdWF5ZDmPNr8HExvowU1axm1GpHb3qev1VGtYW/MuyPpE9/ucmpJrn
         IslmcRMA788A3HAFbyGGf8M2TYSUiLi4qyr66tNL25jWQmMtAQSpu+vhG1nR4nNaCctE
         RhusjIQHDOm6RKJcN6QmN6E1TAxl6SUa8zdPrav1YpsxvDoDMpCrdiyaQhCsIjwxq/y2
         5WGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBzZIniUiDrAbKUBOEl7Fu05saOkQZfmXP6dGp7yl+c=;
        b=uw1YEaFOvc0kLdYH6N4ch+nc7UweSxItKScFBEDyhanDBowUUWGYXcKbOIm2lsr44p
         VFV8+bYzDn12WHkrt1IUd0clSwvtgcaPXp5eXVsF5j53bHRpgjeoo5Tcr5/BlCiNhtAn
         kfWx/FMY7WTjWHjUxM63OQ00SWBBuyRHNDAt3nu1wtbEl1HxXGUhGQ6sDT0DhOlckglE
         wbrL8E4qeg7YJ7mcujPuRg6YW8m8SZcUyK7rnVPhAJlceegCwVsmYnRi+vUBnJYy0iLs
         50yXqsgdXIIfCDnu7QmPE9GR+b8rZ1x6Qv6D2plld830+WJmuF2p4s36QGa9tNyLkCbN
         8SEA==
X-Gm-Message-State: AFqh2krHqhyHCmJGPYnqp6ZUSJza6eZO3/qobn298jxqewmwh0tG8E7A
        OIMi3kF1bUKzXT1BnG3m6FI4J5JXzXW/mQ==
X-Google-Smtp-Source: AMrXdXs8MdfTBQBWBdUP6AHWCvmRI/ZbCBkyrol/eSIYKI2ziAiaxqYNzjJdbo2fF9OBRFQYiKNzZw==
X-Received: by 2002:ac8:534c:0:b0:3a9:8183:6a04 with SMTP id d12-20020ac8534c000000b003a981836a04mr88018719qto.54.1673021135048;
        Fri, 06 Jan 2023 08:05:35 -0800 (PST)
Received: from bat.kanata.rendec.net (cpe00fc8d79db03-cm00fc8d79db00.cpe.net.fido.ca. [72.137.118.218])
        by smtp.gmail.com with ESMTPSA id s13-20020ac85ecd000000b003a69de747c9sm680063qtx.19.2023.01.06.08.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 08:05:34 -0800 (PST)
From:   Radu Rendec <radu.rendec@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 1/3] gpio: pcf857x: Replace 'unsigned' with 'unsigned int'
Date:   Fri,  6 Jan 2023 11:04:17 -0500
Message-Id: <20230106160419.1020733-2-radu.rendec@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106160419.1020733-1-radu.rendec@gmail.com>
References: <20230106160419.1020733-1-radu.rendec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Cosmetic change only to improve the coding style. No functional change,
since 'unsigned' and 'unsigned int' are identical as far as the compiler
is concerned.

Signed-off-by: Radu Rendec <radu.rendec@gmail.com>
---
 drivers/gpio/gpio-pcf857x.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index cec2f2c78255..14656d4f3a3d 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -73,11 +73,11 @@ struct pcf857x {
 	struct gpio_chip	chip;
 	struct i2c_client	*client;
 	struct mutex		lock;		/* protect 'out' */
-	unsigned		out;		/* software latch */
-	unsigned		status;		/* current status */
-	unsigned		irq_enabled;	/* enabled irqs */
+	unsigned int		out;		/* software latch */
+	unsigned int		status;		/* current status */
+	unsigned int		irq_enabled;	/* enabled irqs */
 
-	int (*write)(struct i2c_client *client, unsigned data);
+	int (*write)(struct i2c_client *client, unsigned int data);
 	int (*read)(struct i2c_client *client);
 };
 
@@ -85,7 +85,7 @@ struct pcf857x {
 
 /* Talk to 8-bit I/O expander */
 
-static int i2c_write_le8(struct i2c_client *client, unsigned data)
+static int i2c_write_le8(struct i2c_client *client, unsigned int data)
 {
 	return i2c_smbus_write_byte(client, data);
 }
@@ -97,7 +97,7 @@ static int i2c_read_le8(struct i2c_client *client)
 
 /* Talk to 16-bit I/O expander */
 
-static int i2c_write_le16(struct i2c_client *client, unsigned word)
+static int i2c_write_le16(struct i2c_client *client, unsigned int word)
 {
 	u8 buf[2] = { word & 0xff, word >> 8, };
 	int status;
@@ -119,7 +119,7 @@ static int i2c_read_le16(struct i2c_client *client)
 
 /*-------------------------------------------------------------------------*/
 
-static int pcf857x_input(struct gpio_chip *chip, unsigned offset)
+static int pcf857x_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct pcf857x	*gpio = gpiochip_get_data(chip);
 	int		status;
@@ -132,7 +132,7 @@ static int pcf857x_input(struct gpio_chip *chip, unsigned offset)
 	return status;
 }
 
-static int pcf857x_get(struct gpio_chip *chip, unsigned offset)
+static int pcf857x_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct pcf857x	*gpio = gpiochip_get_data(chip);
 	int		value;
@@ -141,10 +141,10 @@ static int pcf857x_get(struct gpio_chip *chip, unsigned offset)
 	return (value < 0) ? value : !!(value & (1 << offset));
 }
 
-static int pcf857x_output(struct gpio_chip *chip, unsigned offset, int value)
+static int pcf857x_output(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct pcf857x	*gpio = gpiochip_get_data(chip);
-	unsigned	bit = 1 << offset;
+	unsigned int	bit = 1 << offset;
 	int		status;
 
 	mutex_lock(&gpio->lock);
@@ -158,7 +158,7 @@ static int pcf857x_output(struct gpio_chip *chip, unsigned offset, int value)
 	return status;
 }
 
-static void pcf857x_set(struct gpio_chip *chip, unsigned offset, int value)
+static void pcf857x_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	pcf857x_output(chip, offset, value);
 }
-- 
2.39.0

