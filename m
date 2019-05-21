Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDBDA24B17
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2019 11:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbfEUJDL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 May 2019 05:03:11 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35073 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbfEUJDL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 May 2019 05:03:11 -0400
Received: by mail-wm1-f68.google.com with SMTP id q15so2028740wmj.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 May 2019 02:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5R288mKF0GeHgJxCPpIdKCMHA/0CyoeQ5qge6u2tdDc=;
        b=pp8mOjd7Mqs7yfAH43C6eB3d9rmh5jCVdEhDqU+Aug0+WajfS82ikNUV0LIXbA7tvR
         GiEy7Q8pt8JgbacuMahdKch3HK6U286+qD0Aba9TVrFSpnIfFveJ96qnzZ2zO2kX8dt1
         wi5xQcY/HMjYR9AhAUvRBXqw1Jhm6+mqmOSJlW41wQm2OcEwu0gauPLqZJMoP1wgnrAA
         JFa0/dqis26Zwlg+wkVoYUaJReioOvFd7MY+BbyIBEdCh6kD7kWv2pgqTLFgAt7pUQC/
         9+mAFIHrmYIahtfh+3vb13EqZYNILpT9bI4rwKAKNcknH25HW5ulQ20HEZHTEXKHRRJM
         K7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5R288mKF0GeHgJxCPpIdKCMHA/0CyoeQ5qge6u2tdDc=;
        b=DbGamNcG+BSYUZh0JwUbMmVK1dKSKgTD3WgO2tx1quoVzWRAndzOxxelYha4Qh0JZ0
         KLCNJI2MTk1my2+BXCyILfLdN+NdGKgPZ8F2lq9lOzkpg6lRSoKHkENmGx9ESyK1ur1/
         RK3LnOFxE+hgjqmz8SjQPT9hLtcGhf8N0Ryco296m6br1nDSDNC8viLT1KjUTYRFl3Vu
         /v729nmiHt1svqu4iMBDKZdY/DgxlRh4L6yK3xrxSddYCkFOTBRl3aFLEaAwvkhYr9bw
         jBa7tUaDjfhB/nM+l1Cw1Rwn5kwCPPnbBysBnGRr0RqPNGD4dwPfuvORWP9fav/R1q40
         UdxA==
X-Gm-Message-State: APjAAAWZJWqCouXrFxjX88kjkWZwl+K9GCktW6o5Xs9h/TThdgx0uNQg
        MlaHg5FLCjrdNgxA7E0EIjX4ysYO8Ko=
X-Google-Smtp-Source: APXvYqyYRmwwb6Ur91PzaPTRyj5uJeV4urFJ2olz107d6M1dE6T9hSGdHqM0jQjQDKlGiWhJgCMxFA==
X-Received: by 2002:a7b:cd0e:: with SMTP id f14mr2414832wmj.127.1558429389238;
        Tue, 21 May 2019 02:03:09 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id j28sm35898692wrd.64.2019.05.21.02.03.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 02:03:08 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/2] gpio: max732x: use i2c_new_dummy_device()
Date:   Tue, 21 May 2019 11:03:05 +0200
Message-Id: <20190521090306.28113-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We now have a resource managed version of i2c_new_dummy_device() that
also returns an actual error code instead of a NULL-pointer. Use it
in the max732x GPIO driver and simplify code in the process.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-max732x.c | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index f03cb0ba7726..7fd1bdfe00e5 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -652,12 +652,12 @@ static int max732x_probe(struct i2c_client *client,
 	case 0x60:
 		chip->client_group_a = client;
 		if (nr_port > 8) {
-			c = i2c_new_dummy(client->adapter, addr_b);
-			if (!c) {
+			c = devm_i2c_new_dummy_device(&client->dev,
+						      client->adapter, addr_b);
+			if (IS_ERR(c)) {
 				dev_err(&client->dev,
 					"Failed to allocate I2C device\n");
-				ret = -ENODEV;
-				goto out_failed;
+				return PTR_ERR(c);
 			}
 			chip->client_group_b = chip->client_dummy = c;
 		}
@@ -665,12 +665,12 @@ static int max732x_probe(struct i2c_client *client,
 	case 0x50:
 		chip->client_group_b = client;
 		if (nr_port > 8) {
-			c = i2c_new_dummy(client->adapter, addr_a);
-			if (!c) {
+			c = devm_i2c_new_dummy_device(&client->dev,
+						      client->adapter, addr_a);
+			if (IS_ERR(c)) {
 				dev_err(&client->dev,
 					"Failed to allocate I2C device\n");
-				ret = -ENODEV;
-				goto out_failed;
+				return PTR_ERR(c);
 			}
 			chip->client_group_a = chip->client_dummy = c;
 		}
@@ -678,36 +678,34 @@ static int max732x_probe(struct i2c_client *client,
 	default:
 		dev_err(&client->dev, "invalid I2C address specified %02x\n",
 				client->addr);
-		ret = -EINVAL;
-		goto out_failed;
+		return -EINVAL;
 	}
 
 	if (nr_port > 8 && !chip->client_dummy) {
 		dev_err(&client->dev,
 			"Failed to allocate second group I2C device\n");
-		ret = -ENODEV;
-		goto out_failed;
+		return -ENODEV;
 	}
 
 	mutex_init(&chip->lock);
 
 	ret = max732x_readb(chip, is_group_a(chip, 0), &chip->reg_out[0]);
 	if (ret)
-		goto out_failed;
+		return ret;
 	if (nr_port > 8) {
 		ret = max732x_readb(chip, is_group_a(chip, 8), &chip->reg_out[1]);
 		if (ret)
-			goto out_failed;
+			return ret;
 	}
 
 	ret = gpiochip_add_data(&chip->gpio_chip, chip);
 	if (ret)
-		goto out_failed;
+		return ret;
 
 	ret = max732x_irq_setup(chip, id);
 	if (ret) {
 		gpiochip_remove(&chip->gpio_chip);
-		goto out_failed;
+		return ret;
 	}
 
 	if (pdata && pdata->setup) {
@@ -719,10 +717,6 @@ static int max732x_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, chip);
 	return 0;
-
-out_failed:
-	i2c_unregister_device(chip->client_dummy);
-	return ret;
 }
 
 static int max732x_remove(struct i2c_client *client)
@@ -744,9 +738,6 @@ static int max732x_remove(struct i2c_client *client)
 
 	gpiochip_remove(&chip->gpio_chip);
 
-	/* unregister any dummy i2c_client */
-	i2c_unregister_device(chip->client_dummy);
-
 	return 0;
 }
 
-- 
2.21.0

