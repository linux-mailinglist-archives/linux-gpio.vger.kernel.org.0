Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9579B65CB54
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jan 2023 02:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237861AbjADBVD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Jan 2023 20:21:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238678AbjADBUt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Jan 2023 20:20:49 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA6B229
        for <linux-gpio@vger.kernel.org>; Tue,  3 Jan 2023 17:20:47 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id g7so26210493qts.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Jan 2023 17:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K4ZfwpwN0OpFR2AcviVVfw3uKPQlm3wDrsxTvCNoIiU=;
        b=eNqBU+nSbZmeeMhPw/pJMoHsX3Yv7M0u5UD7MlXm+dt+zSTr+/JkZfBqZ4Njy94IUl
         4MGDm4vhDN5lTbaQIULRTot7cYnugXp0aC+E8oPZHBXRgEQ+E68ayHzKMkym50uU+vS3
         1/Ci4+jEbDNpTKXsam0jbl/+ggyla7DElScVDjqvrz9cje8qddJw+TI5ZXON5cpetcql
         B/HHLxe/mst/h6NeIIRWnLzrvlp1o4ogYUYjgoTIN1tmHEdVnK7MCWbrhvzyu+WA8SW5
         9e3GcaxrESZvek24RUypCuwU6NW3y/ehuHlNo25+/Uaw7RBgvB6NEO/fk6qIT2sJDV29
         vPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4ZfwpwN0OpFR2AcviVVfw3uKPQlm3wDrsxTvCNoIiU=;
        b=OsukxGvoM6WzWb/cO+4nbWdGjpRFxhsHMSDRsMgdPwvQVNMdajupBGIzBPsbRgSkgb
         DiyfScdwBf91t5REuCJ0arNDfsqCDKmyfAX0vvYPdpR5KNUbLYzS5Yvl+QXOJfyBTAJa
         B9dTvLLJLZl8zneapvZNVVgkicq6t4LwgPpPdgaFLjMjnVtqRVTTCpqYHg68vuOiHute
         Ekcw2JBFP3ZvxJxo4UXvNHLwPmBbCd9d+EM1QKBDEucC9sN+Ri3l+AQ0CU9yIoL5lHQb
         I+SKuYMNmHEztt7IZgqzj1rArzlnCQA5Cfs7OlKHBVFUYv8xM/H230H3NLXdSgkMCXB+
         RKjg==
X-Gm-Message-State: AFqh2kpsMkT8leCfJeaLiW26StBE0LuAu+rAy2B9JkntXOtHiRueYP7J
        mjghaw+sh3qB4xfkawID+FAJMCiEJZ0rPg==
X-Google-Smtp-Source: AMrXdXss6F4vremCWb2VUCxI63SyAR/gfH6UMATGjRLbTX9voWhyYJq6eCZBrvBCSLHZaIZZvMUSCQ==
X-Received: by 2002:ac8:4cc8:0:b0:3a8:e528:dab5 with SMTP id l8-20020ac84cc8000000b003a8e528dab5mr53015198qtv.0.1672795246346;
        Tue, 03 Jan 2023 17:20:46 -0800 (PST)
Received: from bat.kanata.rendec.net (cpe00fc8d79db03-cm00fc8d79db00.cpe.net.fido.ca. [72.137.118.218])
        by smtp.gmail.com with ESMTPSA id h4-20020ac846c4000000b003a7fc70d59csm19698353qto.41.2023.01.03.17.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 17:20:45 -0800 (PST)
From:   Radu Rendec <radu.rendec@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpio: pcf857x: Implement get_multiple/set_multiple methods
Date:   Tue,  3 Jan 2023 20:20:13 -0500
Message-Id: <20230104012013.831820-1-radu.rendec@gmail.com>
X-Mailer: git-send-email 2.39.0
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
index cec2f2c78255..8a8ffeaa8b22 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -141,6 +141,21 @@ static int pcf857x_get(struct gpio_chip *chip, unsigned offset)
 	return (value < 0) ? value : !!(value & (1 << offset));
 }
 
+static int pcf857x_get_multiple(struct gpio_chip *chip, unsigned long *mask,
+				unsigned long *bits)
+{
+	struct pcf857x	*gpio = gpiochip_get_data(chip);
+	int		value = gpio->read(gpio->client);
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
 static int pcf857x_output(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct pcf857x	*gpio = gpiochip_get_data(chip);
@@ -163,6 +178,18 @@ static void pcf857x_set(struct gpio_chip *chip, unsigned offset, int value)
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

