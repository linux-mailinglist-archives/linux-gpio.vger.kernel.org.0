Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0369E6603E8
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jan 2023 17:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjAFQGX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Jan 2023 11:06:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235030AbjAFQGL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Jan 2023 11:06:11 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B11A13E8D
        for <linux-gpio@vger.kernel.org>; Fri,  6 Jan 2023 08:05:53 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id c11so2303330qtn.11
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jan 2023 08:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wl7oPQkbuaJw+zIbpo6ndUFcganXRRTYDTirwFtTRlU=;
        b=XPnB0btjjd5T4NSo1vRo7n4dpsKtPVyzPg3VfdsPGPsgp+PGzZGO3FUqVtkjM6D9li
         kEhy89efwSqKl1QoGEwWJYZK7MTHpOzzjXjXRep1HewvZMc8tfEKhcNgAFQGz9JpEU1Y
         GL3KT2XkvGM0C2fsKJjf7aFS/KInCxoH2oBvbZvkTbgQpVCzKuSLCQSiDQcMGQ9wd/dp
         /PRqeovjRp4ct8JTvzYaejvXimrLkEDKIXjLdI2h5/bLd6NM3mM5/LnMWhReLL/IxJCY
         bUNzCeF+JGaa40MLElpT3GQ/9MKxN98A4SVyXPq6+1BFk9GvWQlFurqYCQ8hRgzd8b/s
         oYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wl7oPQkbuaJw+zIbpo6ndUFcganXRRTYDTirwFtTRlU=;
        b=dsid89HTqKAb7WL5v8nZnuR73KxC4Hb9HX63g6Fl4QPA5fRNJ2PG02ItrhgdwLIPf1
         5CbqqZfZPDSnbx68LTMp086ZTm4KMM+B2DoZBBtZ9MzNAvmWwjx9pXQeEVgMA51eYS3P
         0QJnhVcp+XJ1SxX30wH1DyeLn0jsZUC8XqK4X2R2ir9jvS0IAT+x3p1n5rza98lS+WTD
         RttjWKGQPxI0s3q9WXTWRLT2JVBZg3GPFf8JKOQxl5CP3utfneJwoRC5Fhk2e4LirsXB
         EA5w6fNj1febmkRWwM+JOLQQ0gyo0fE66LQPv0Z9NxWHx5LfyJ1ZryuOMQxpQ5HmeAwa
         6GWw==
X-Gm-Message-State: AFqh2krdEbeIeSIxuGo8N/hepRJxnpFIiu956z70LfUBa+6ktH3kWq2a
        OqTk9ffu8RA2euSkItJ/9JjMuu7WforTfg==
X-Google-Smtp-Source: AMrXdXuafFQYWOldN4THlCqBulCkaTdVQKHTZVetUAr4Xvhvadqhr64mTdGHzqPwkeil2B15wKNdNg==
X-Received: by 2002:a05:622a:1f09:b0:3a7:eb01:5dde with SMTP id ca9-20020a05622a1f0900b003a7eb015ddemr66623573qtb.14.1673021152156;
        Fri, 06 Jan 2023 08:05:52 -0800 (PST)
Received: from bat.kanata.rendec.net (cpe00fc8d79db03-cm00fc8d79db00.cpe.net.fido.ca. [72.137.118.218])
        by smtp.gmail.com with ESMTPSA id s13-20020ac85ecd000000b003a69de747c9sm680063qtx.19.2023.01.06.08.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 08:05:51 -0800 (PST)
From:   Radu Rendec <radu.rendec@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 2/3] gpio: pcf857x: Fix indentation of variable declarations
Date:   Fri,  6 Jan 2023 11:04:18 -0500
Message-Id: <20230106160419.1020733-3-radu.rendec@gmail.com>
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

No functional changes. This is a whitespace change only.

Signed-off-by: Radu Rendec <radu.rendec@gmail.com>
---
 drivers/gpio/gpio-pcf857x.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 14656d4f3a3d..1026973bc998 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -121,8 +121,8 @@ static int i2c_read_le16(struct i2c_client *client)
 
 static int pcf857x_input(struct gpio_chip *chip, unsigned int offset)
 {
-	struct pcf857x	*gpio = gpiochip_get_data(chip);
-	int		status;
+	struct pcf857x *gpio = gpiochip_get_data(chip);
+	int status;
 
 	mutex_lock(&gpio->lock);
 	gpio->out |= (1 << offset);
@@ -134,8 +134,8 @@ static int pcf857x_input(struct gpio_chip *chip, unsigned int offset)
 
 static int pcf857x_get(struct gpio_chip *chip, unsigned int offset)
 {
-	struct pcf857x	*gpio = gpiochip_get_data(chip);
-	int		value;
+	struct pcf857x *gpio = gpiochip_get_data(chip);
+	int value;
 
 	value = gpio->read(gpio->client);
 	return (value < 0) ? value : !!(value & (1 << offset));
@@ -143,9 +143,9 @@ static int pcf857x_get(struct gpio_chip *chip, unsigned int offset)
 
 static int pcf857x_output(struct gpio_chip *chip, unsigned int offset, int value)
 {
-	struct pcf857x	*gpio = gpiochip_get_data(chip);
-	unsigned int	bit = 1 << offset;
-	int		status;
+	struct pcf857x *gpio = gpiochip_get_data(chip);
+	unsigned int bit = 1 << offset;
+	int status;
 
 	mutex_lock(&gpio->lock);
 	if (value)
@@ -167,7 +167,7 @@ static void pcf857x_set(struct gpio_chip *chip, unsigned int offset, int value)
 
 static irqreturn_t pcf857x_irq(int irq, void *data)
 {
-	struct pcf857x  *gpio = data;
+	struct pcf857x *gpio = data;
 	unsigned long change, i, status;
 
 	status = gpio->read(gpio->client);
@@ -250,11 +250,11 @@ static const struct irq_chip pcf857x_irq_chip = {
 static int pcf857x_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
-	struct pcf857x_platform_data	*pdata = dev_get_platdata(&client->dev);
-	struct device_node		*np = client->dev.of_node;
-	struct pcf857x			*gpio;
-	unsigned int			n_latch = 0;
-	int				status;
+	struct pcf857x_platform_data *pdata = dev_get_platdata(&client->dev);
+	struct device_node *np = client->dev.of_node;
+	struct pcf857x *gpio;
+	unsigned int n_latch = 0;
+	int status;
 
 	if (IS_ENABLED(CONFIG_OF) && np)
 		of_property_read_u32(np, "lines-initial-states", &n_latch);
@@ -401,8 +401,8 @@ static int pcf857x_probe(struct i2c_client *client)
 
 static void pcf857x_remove(struct i2c_client *client)
 {
-	struct pcf857x_platform_data	*pdata = dev_get_platdata(&client->dev);
-	struct pcf857x			*gpio = i2c_get_clientdata(client);
+	struct pcf857x_platform_data *pdata = dev_get_platdata(&client->dev);
+	struct pcf857x *gpio = i2c_get_clientdata(client);
 
 	if (pdata && pdata->teardown)
 		pdata->teardown(client, gpio->chip.base, gpio->chip.ngpio,
-- 
2.39.0

