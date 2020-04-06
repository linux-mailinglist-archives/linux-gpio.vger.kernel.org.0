Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA2BD19FAD1
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2020 18:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729620AbgDFQxA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Apr 2020 12:53:00 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:36854 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729616AbgDFQxA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Apr 2020 12:53:00 -0400
Received: by mail-qk1-f193.google.com with SMTP id l25so8825741qkk.3;
        Mon, 06 Apr 2020 09:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=SapAmiCtw6FkuT5jKW5Pvl/sHY1boCbQG3iOESfxg2c=;
        b=MwHCR0T8WPrmfk7GydpAlRPyDyKia47s4RzvB7iclV0WIE8sBSyk0GdPlIN4O2qXJC
         BMDTEQBRNUjhSrCm2kgpfSvKnRmDAId8OYwwqVI+Fij0H050lXgquph/TSNNOAyjQ5lg
         Van/rZQkM9Yo3CPZnPi6WnBN3vIEkUr0nH+KVWZXaqfzcsxPh3rIjYXyrJFP59ONxwJs
         mrGLte3L9G35cKHh6itE9jyD62LyMHgxDoAwzMX2UpBVmIDCMbM/6OUCvFVvgY1tUxGY
         b/OQLUXfbreALvY4oY4mkQXk6GbM4z7Rxlpae0DWJ+DwkK3nE6NIPkklQ9ZN+lpkNeTp
         fGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SapAmiCtw6FkuT5jKW5Pvl/sHY1boCbQG3iOESfxg2c=;
        b=YVYqglKHQmc/BM8yYpUV3w6kjqoA2hnVLIVfVDmiRK1Zsn/2TitHtDLnLfOTpKq4Sf
         JyJ/GOSFuxRpq638f50Mc0gBejSn6uEuNZh+1UnR4JgJQ2WR5CteJSyn0b3Ofm6MV7l3
         YrRx09b0kH7NRxCraPrBk6gj9Kj0ABeubTrJXYSJtXH0aB3aUXQIQBZHCXmTV8ENIqcO
         ae+N1wapqcfm7XDwqCfJELhaBlJukRd4t4pReHx7YsadsgreME4EV6NUVuBfUXDim6DS
         1Te12jh5hiOiCy/DkxUyN11chEtydMtCRrcAYsXOkuJXy/LRhWJF04RFntJcOMOJme4y
         YnYw==
X-Gm-Message-State: AGi0PuZRigYQJl7TC8LIr0c1iyttwDU6jkzKz91tTEqFtVSjQWquvZXA
        /ruGSvjZEaj27gZHzipOBnQ=
X-Google-Smtp-Source: APiQypL0+bZB0iHqMyJr0tK+pGkgK5OtRNJtN5t8mfo2s0bfEsvvw/O/uC70Jclq+GJY6lS5bVEcpQ==
X-Received: by 2002:a37:7d81:: with SMTP id y123mr22767868qkc.102.1586191979712;
        Mon, 06 Apr 2020 09:52:59 -0700 (PDT)
Received: from black.hsd1.ma.comcast.net ([2601:199:417f:9090:d567:b912:d78:1de3])
        by smtp.gmail.com with ESMTPSA id p35sm15666925qtk.2.2020.04.06.09.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 09:52:58 -0700 (PDT)
From:   Paul Thomas <pthomas8589@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Paul Thomas <pthomas8589@gmail.com>
Subject: [PATCH] gpio: gpio-pca953x, Add get_multiple function
Date:   Mon,  6 Apr 2020 12:51:15 -0400
Message-Id: <20200406165115.25586-1-pthomas8589@gmail.com>
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
 drivers/gpio/gpio-pca953x.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 96d42f571a18..705115bde740 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -114,6 +114,7 @@ MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
 
 #define MAX_BANK 5
 #define BANK_SZ 8
+#define BANK_SFT 3 /* ilog2(BANK_SZ) */
 
 #define NBANK(chip) DIV_ROUND_UP(chip->gpio_chip.ngpio, BANK_SZ)
 
@@ -451,6 +452,41 @@ static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 	return !!(reg_val & bit);
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
@@ -547,6 +583,7 @@ static void pca953x_setup_gpio(struct pca953x_chip *chip, int gpios)
 	gc->get = pca953x_gpio_get_value;
 	gc->set = pca953x_gpio_set_value;
 	gc->get_direction = pca953x_gpio_get_direction;
+	gc->get_multiple = pca953x_gpio_get_multiple;
 	gc->set_multiple = pca953x_gpio_set_multiple;
 	gc->set_config = pca953x_gpio_set_config;
 	gc->can_sleep = true;
-- 
2.17.1

