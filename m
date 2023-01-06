Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1846603E9
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jan 2023 17:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjAFQGY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Jan 2023 11:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235039AbjAFQGL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Jan 2023 11:06:11 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EABBEF
        for <linux-gpio@vger.kernel.org>; Fri,  6 Jan 2023 08:05:58 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id i20so2336255qtw.9
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jan 2023 08:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmxFSOInc/5IJfJrM4tkRRa6IOgyyj/wX3mI2I1gOgw=;
        b=B0bX7yOqv94jcYdFL7AwrWW4GcqCyhkvMdu4+GTieb7XlYddMror6YONevZUblpcs5
         VlfDE1cCZqgLjE24AA/mm9CkuM8iKJHwAsoNZ2Lkd8zeuTU1KUdZzGkTqIKywXWNeH2X
         90wdRSYrZQyIvznH0L+U98KKrwd31fo82eZ/YC4gPVaAWmw9bA98eqp0oH2rQmt9Va0F
         ZZgMfK2hlkuM0anRP8Nde4ixpF6Pekuzgyk+SGNT1Y40+IpdgrTi6EIpJMt7pZVwSqgC
         Vccq94oGpL0eBZW87zCP0E0Dxnl9pahqStjr0vIOMToaZlVbWP8K35Ur7GvPnvai4aDk
         12nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmxFSOInc/5IJfJrM4tkRRa6IOgyyj/wX3mI2I1gOgw=;
        b=Q4SG9YiSC/t2EmTBh8bC9G+CRANl/6sOHJrp5QFdfEPFhxPyMCSoAceNgBaaVOc/Nz
         vu+i4BEQNUp4lMJWVMXfGMg8UHTDbXcrVFiJm6E5Z9l+a9QomYbz95RioPauAgiLHUZT
         xYvXUh+B16EpjtxzanLQSSMfm64oOiR66/x9xWRkegxPfJhRRY4Kkhx41/IjuQh8Arbl
         y1wKEFRJh5A6t3T3FmG5+F/hKOQ6V7Ujr44nxo/aqGkgvcVgr6/vtntj3AtrFJLbNdvZ
         Lb0Y0r4Skjm6UPhZRiKBYl9euFr82IhokppWFhlrxM1j9/As+6kMsXAnubYwa+vskDUo
         zmyA==
X-Gm-Message-State: AFqh2kqZ+a5xmCtsmvVBscJFGKUSucaSC2WLS1+ccrXeiOXZR2mF/mX7
        ciXHnEIgTdkMQzYRdkiWJDwEGHT0E4xmMw==
X-Google-Smtp-Source: AMrXdXv7uoCOvR+VAOErmNdaHZz8S1zyIZBHPuIKVjq9Ix5Lv9CZR+48H2yHDxfk+rfZXv3b8SZVfQ==
X-Received: by 2002:a05:622a:5c85:b0:3a7:e271:fc05 with SMTP id ge5-20020a05622a5c8500b003a7e271fc05mr72052013qtb.3.1673021157246;
        Fri, 06 Jan 2023 08:05:57 -0800 (PST)
Received: from bat.kanata.rendec.net (cpe00fc8d79db03-cm00fc8d79db00.cpe.net.fido.ca. [72.137.118.218])
        by smtp.gmail.com with ESMTPSA id s13-20020ac85ecd000000b003a69de747c9sm680063qtx.19.2023.01.06.08.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 08:05:56 -0800 (PST)
From:   Radu Rendec <radu.rendec@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 3/3] gpio: pcf857x: Implement get_multiple/set_multiple methods
Date:   Fri,  6 Jan 2023 11:04:19 -0500
Message-Id: <20230106160419.1020733-4-radu.rendec@gmail.com>
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

This change allows the GPIO core to read/change multiple pins in a
single driver call and subsequent I2C transfer. It helps a lot with
PCF857x devices, since their I2C protocol always reads/changes all
existing pins anyway. Therefore, when the GPIO client code does a bulk
operation on multiple pins, the driver makes a single I2C transfer.

Signed-off-by: Radu Rendec <radu.rendec@gmail.com>
---
 drivers/gpio/gpio-pcf857x.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 1026973bc998..d9db878802b7 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -141,6 +141,21 @@ static int pcf857x_get(struct gpio_chip *chip, unsigned int offset)
 	return (value < 0) ? value : !!(value & (1 << offset));
 }
 
+static int pcf857x_get_multiple(struct gpio_chip *chip, unsigned long *mask,
+				unsigned long *bits)
+{
+	struct pcf857x *gpio = gpiochip_get_data(chip);
+	int value = gpio->read(gpio->client);
+
+	if (value < 0)
+		return value;
+
+	*bits &= ~*mask;
+	*bits |= value & *mask;
+
+	return 0;
+}
+
 static int pcf857x_output(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct pcf857x *gpio = gpiochip_get_data(chip);
@@ -163,6 +178,18 @@ static void pcf857x_set(struct gpio_chip *chip, unsigned int offset, int value)
 	pcf857x_output(chip, offset, value);
 }
 
+static void pcf857x_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				 unsigned long *bits)
+{
+	struct pcf857x *gpio = gpiochip_get_data(chip);
+
+	mutex_lock(&gpio->lock);
+	gpio->out &= ~*mask;
+	gpio->out |= *bits & *mask;
+	gpio->write(gpio->client, gpio->out);
+	mutex_unlock(&gpio->lock);
+}
+
 /*-------------------------------------------------------------------------*/
 
 static irqreturn_t pcf857x_irq(int irq, void *data)
@@ -275,7 +302,9 @@ static int pcf857x_probe(struct i2c_client *client)
 	gpio->chip.parent		= &client->dev;
 	gpio->chip.owner		= THIS_MODULE;
 	gpio->chip.get			= pcf857x_get;
+	gpio->chip.get_multiple		= pcf857x_get_multiple;
 	gpio->chip.set			= pcf857x_set;
+	gpio->chip.set_multiple		= pcf857x_set_multiple;
 	gpio->chip.direction_input	= pcf857x_input;
 	gpio->chip.direction_output	= pcf857x_output;
 	gpio->chip.ngpio		= id->driver_data;
-- 
2.39.0

