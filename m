Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0001A82C3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 17:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729797AbgDNPaz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 11:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729745AbgDNPax (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 11:30:53 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3DF4C061A0C;
        Tue, 14 Apr 2020 08:30:52 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id m67so13594665qke.12;
        Tue, 14 Apr 2020 08:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=jBqDfN4lTOD/UXF95/1jBgkBwtLfgcKvYX6T0k+P7eI=;
        b=N2brScgcTAlCak8gvTtMfCRF1Y8/W2qB684M25BNZ4DWW0CZFNB5X1fHGdapIW8RCf
         /2LXu4oi+59P2i2cEWyB/i8G3NhtHwItNMBU4mq2E3H/8woxRluVWbnN3yt9OJLqxTvb
         3ZqU8dyqMhvw6h/zxMo3tfkDCbLjMrf81uR1oNwOnKRnFI7TYg5FyBnXfv4zHXbjk4db
         DsW6myjnzgKeDySn2vncsty8DAAP6Wf6WoOC1Sk7+eY1E1NWRULAmrUo40N24Zc86N7q
         O6hE7JrUCWXVR5HbnSw8kaGmkM+B0v0gvJgGAXYOmCRi0QoCoBPK9co+DxPXZF9P6smx
         QloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jBqDfN4lTOD/UXF95/1jBgkBwtLfgcKvYX6T0k+P7eI=;
        b=aTbeXjhkiVKmmt6KGBy1s4ZKjOI9B0Kmc3eIY4y3vFTWN6rPaOp0sYa9LnJMjMTacq
         5Asd2NRoDnfL37S60l6Ts2sog7D7OTZaClHMoYp8DzHGFSoCvBVYm9LmUhBmhkbFp/Iz
         AbvRC+LwrzexFjiuX0kQZdj0vpYRYHyTn5XYO8HuuRQ+wOtPUXJYj0ySFyDfuqSKIMl1
         MQBcxUXEvZtHeFoFeXyg83TSv3TfJLEXLN4k+s6UFv4ys7QOot+rZ3bQt6sL79ElQmI9
         Qx6urDfGhhFYHIvuIzPBvvhf4d/sShmYALk16fZ32pLLEme1IhyCvGx9bXe6MdmXtGi1
         SdaQ==
X-Gm-Message-State: AGi0PuZCKd9m9Io1cet0noHDSkGQNyxBRFuzRQLaRwThGk+5NflNyfcv
        BAjSD+TcQ6bXn1jwg6iVJAw=
X-Google-Smtp-Source: APiQypLEHZPeW7SZSa71SE76BIhpdKrW9M4W1sd+NGbge1OmFuyxss4V6n2ZxGJ9aNL4waWNYILJlA==
X-Received: by 2002:a37:6fc5:: with SMTP id k188mr21428004qkc.145.1586878251906;
        Tue, 14 Apr 2020 08:30:51 -0700 (PDT)
Received: from black.hsd1.ma.comcast.net ([2601:199:417f:9090:b508:1c80:770a:b21e])
        by smtp.gmail.com with ESMTPSA id q13sm10553106qki.136.2020.04.14.08.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 08:30:51 -0700 (PDT)
From:   Paul Thomas <pthomas8589@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Paul Thomas <pthomas8589@gmail.com>
Subject: [PATCH v2] gpio: gpio-pca953x, Add get_multiple function
Date:   Tue, 14 Apr 2020 11:28:42 -0400
Message-Id: <20200414152843.32129-1-pthomas8589@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Implement a get_multiple function for gpio-pca953x. If a driver
leaves get_multiple unimplemented then gpio_chip_get_multiple()
in gpiolib.c takes care of it by calling chip->get() as needed.
For i2c chips this is very inefficient. For example if you do an
8-bit read then instead of a single i2c transaction there are
8 transactions reading the same byte!

This has been tested with max7312 chips on a 5.2 kernel.

Signed-off-by: Paul Thomas <pthomas8589@gmail.com>
---
 changes from v1: rebased to 5.7-rc1

 drivers/gpio/gpio-pca953x.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 5638b4e5355f..6317510b0dc3 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -115,6 +115,7 @@ MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
 
 #define MAX_BANK 5
 #define BANK_SZ 8
+#define BANK_SFT 3 /* ilog2(BANK_SZ) */
 #define MAX_LINE	(MAX_BANK * BANK_SZ)
 
 #define NBANK(chip) DIV_ROUND_UP(chip->gpio_chip.ngpio, BANK_SZ)
@@ -466,6 +467,41 @@ static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
+static int pca953x_gpio_get_multiple(struct gpio_chip *gc,
+				      unsigned long *mask, unsigned long *bits)
+{
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	unsigned int reg_val;
+	int offset, value, i, ret = 0;
+	u8 inreg;
+
+	/* Force offset outside the range of i so that
+	 * at least the first relevant register is read
+	 */
+	offset = gc->ngpio;
+	for_each_set_bit(i, mask, gc->ngpio) {
+		/* whenever i goes into a new bank update inreg
+		 * and read the register
+		 */
+		if ((offset >> BANK_SFT) != (i >> BANK_SFT)) {
+			offset = i;
+			inreg = pca953x_recalc_addr(chip, chip->regs->input,
+						    offset, true, false);
+			mutex_lock(&chip->i2c_lock);
+			ret = regmap_read(chip->regmap, inreg, &reg_val);
+			mutex_unlock(&chip->i2c_lock);
+			if (ret < 0)
+				return ret;
+		}
+		/* reg_val is relative to the last read byte,
+		 * so only shift the relative bits
+		 */
+		value = (reg_val >> (i % 8)) & 0x01;
+		__assign_bit(i, bits, value);
+	}
+	return ret;
+}
+
 static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 				      unsigned long *mask, unsigned long *bits)
 {
@@ -551,6 +587,7 @@ static void pca953x_setup_gpio(struct pca953x_chip *chip, int gpios)
 	gc->get = pca953x_gpio_get_value;
 	gc->set = pca953x_gpio_set_value;
 	gc->get_direction = pca953x_gpio_get_direction;
+	gc->get_multiple = pca953x_gpio_get_multiple;
 	gc->set_multiple = pca953x_gpio_set_multiple;
 	gc->set_config = pca953x_gpio_set_config;
 	gc->can_sleep = true;
-- 
2.17.1

