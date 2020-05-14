Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 001341D3080
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 15:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgENNA3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 09:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726056AbgENNA2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 May 2020 09:00:28 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A114C061A0C;
        Thu, 14 May 2020 06:00:27 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id p12so2664983qtn.13;
        Thu, 14 May 2020 06:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=z6WOKhYc3LBk7MDZUdCfkm93NHPFxuz30hVZ9EsTSJY=;
        b=eT6a31lXMYbpMmePM3w2g8mpZeu+6ZCGfi+ihbQIGZB7mp5akrcERZJ+d7tWh3PUSi
         YsJdlUB5atJGK2D819evYElM3lRGMXzxV+ND2Dnj/8NzSTry7i4ZuZZ+BYhVV4PyA9mR
         FEbabEsHZm91Bp8fCfg6cbediwk95zq0Ui0hW+CV+7/PD8hUVgFM0erv9wMET337qpO0
         Pw0JgikhQlg4pabcMmoekfFN80ViwxYE88FGJa2VvKDzREiYb6sXkTAnCxX9uNCH5fVl
         6/CBD08zoqwII5v8DGI9Cwy1wosGT6zKsKbSDd/RUfKv94IvHYUbitUOrpwgW70BgzSZ
         kz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=z6WOKhYc3LBk7MDZUdCfkm93NHPFxuz30hVZ9EsTSJY=;
        b=JFgrxm3L4AgHbzUZ44/hqaPwUHlIa86fXryfffc1k5HW0j87jTUcTMAM5QWUnnFfsj
         KlfmNbC3hJthGTR1Iy4AShSuzL1RjBBb81tgijn2m+d/Vwc4SP+9TLYM8Ujq9/2pgYgf
         5sD7oiUnyXDvv1xixH/QavR5LaMzQlJe0HfQK2qIOqK3azd+F/gzkJvsk+MKDKQbfqDi
         VkaLH5qdEwHUnBVw7TaXnI8mtMbfQ/zeUqo77KkWpi9GOyJO1sCHK5j8/SE1fdYATH+i
         x+62OrrBuTu3E3RVrHgcx6dkASvymv04zZZEhoQ0R6VfGYAJA6mLbuuXda8kIqYJ/wVZ
         OxHA==
X-Gm-Message-State: AOAM533G6qzIUVc4IuBr3U81X1Wa1kZ/oSCBx8Xg/i2GYpqx0mUZfgkj
        KiCMNRXxhrbbUcN5V255PL742LxvWurxRQ==
X-Google-Smtp-Source: ABdhPJwUPArE3/PN49KiSxkIfZTbNFqpTHDn0QvN073tvinjkho7qc4/vmlunVwycSLNmjQVWrSleQ==
X-Received: by 2002:ac8:4e56:: with SMTP id e22mr4363384qtw.185.1589461226336;
        Thu, 14 May 2020 06:00:26 -0700 (PDT)
Received: from sca.dev ([201.17.110.164])
        by smtp.gmail.com with ESMTPSA id g144sm2473724qke.18.2020.05.14.06.00.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 06:00:25 -0700 (PDT)
From:   Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <alencar.fmce@imbel.gov.br>
To:     linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org,
        Rodrigo Alencar <alencar.fmce@imbel.gov.br>,
        Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Subject: [PATCH] gpio: gpio-max730x: bring gpiochip_add_data after port config
Date:   Thu, 14 May 2020 10:00:12 -0300
Message-Id: <1589461212-27357-1-git-send-email-alencar.fmce@imbel.gov.br>
X-Mailer: git-send-email 1.9.3
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpiochip_add_data being called before might cause premature calls of
the gpiochip operations before the port_config values are initialized,
which would possibily write zeros to port gonfiguration registers,
an operation not allowed. For example, if there are gpio-hog nodes
in a device-tree, the sequence of function calls are performed

gpiochip_add_data
of_gpiochip_add
of_gpiochip_scan_gpios
of_gpiochip_add_hog
gpiod_hog
gpiochip_request_own_desc
gpiod_configure_flags
gpiod_direction_output/gpiod_direction_input

which would call later the gpiochip operation direction_output or
direction_input prior the port_config[] initialization.

Moreover, gpiochip_get_data is replaced by the container_of macro
inside the gpiochip operations, which would allow the calling of
max7301_direction_input prior to gpiochip_add_data

Signed-off-by: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
---
 drivers/gpio/gpio-max730x.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-max730x.c b/drivers/gpio/gpio-max730x.c
index 1e1935c51096..b8c1fe20f49a 100644
--- a/drivers/gpio/gpio-max730x.c
+++ b/drivers/gpio/gpio-max730x.c
@@ -47,7 +47,7 @@
 
 static int max7301_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct max7301 *ts = gpiochip_get_data(chip);
+	struct max7301 *ts = container_of(chip, struct max7301, chip);
 	u8 *config;
 	u8 offset_bits, pin_config;
 	int ret;
@@ -89,7 +89,7 @@ static int __max7301_set(struct max7301 *ts, unsigned offset, int value)
 static int max7301_direction_output(struct gpio_chip *chip, unsigned offset,
 				    int value)
 {
-	struct max7301 *ts = gpiochip_get_data(chip);
+	struct max7301 *ts = container_of(chip, struct max7301, chip);
 	u8 *config;
 	u8 offset_bits;
 	int ret;
@@ -189,10 +189,6 @@ int __max730x_probe(struct max7301 *ts)
 	ts->chip.parent = dev;
 	ts->chip.owner = THIS_MODULE;
 
-	ret = gpiochip_add_data(&ts->chip, ts);
-	if (ret)
-		goto exit_destroy;
-
 	/*
 	 * initialize pullups according to platform data and cache the
 	 * register values for later use.
@@ -214,7 +210,9 @@ int __max730x_probe(struct max7301 *ts)
 		}
 	}
 
-	return ret;
+	ret = gpiochip_add_data(&ts->chip, ts);
+	if (!ret)
+		return ret;
 
 exit_destroy:
 	mutex_destroy(&ts->lock);
-- 
2.23.0.rc1

