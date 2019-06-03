Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD39C33BB9
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 01:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfFCXGK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 19:06:10 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45579 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbfFCXGK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 19:06:10 -0400
Received: by mail-wr1-f67.google.com with SMTP id b18so13762917wrq.12
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2019 16:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=62silUQy/7aeoCdt04j9RpYNbsvvZNlBGQR0pM3QIso=;
        b=WIKmSZ7pmARWEEV8BS4zdhjal90nAuJ6g/h+Al3uuJLZ/SF75IhCnU2FOcjIEBTtIL
         3q/eTx0vKIgin9MseQixvBJOhL5eIcbrY7Wq/DJX+V4R5C5wR6dgaBcqog42t0Uzicg3
         r5jCXMadMkSGu4QDpZTwk8/mg3HyElt/ebrgNyKPeLu3hQ7uDENd9VfBQ21LsXfJfqOq
         /ByI4T6H2d2ep3AQ+97PsjthL4apmdzgqg7cNIkvft3KOIl7RfYWv+OGOmp/CCRwFfgg
         PBtq8eNRp4lgFqn6KfYSOUUoIqZAS7kJmqWiw3XsDOsu7wdE8dSWE+izZ1g42fFlXo/V
         jECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=62silUQy/7aeoCdt04j9RpYNbsvvZNlBGQR0pM3QIso=;
        b=ufrM2blhksmw2lry4hTdbIuLysW2MS2LHTR59YA+CheLuv+L50jMqhfqxClj9aVRr3
         c2KKgQ1fF+XR0vdGKsVShwaeIsEYxH5VOoWYwLhGHd2d5etSB9cUA7qnmuiKMUB2DlXu
         oCyzyzQfdysa7miPD/+9Gk/l2FIKwJfgP2rwdku4XmvVXFvDxf62SIkBhDi1/2zDrKfc
         C0Irlgo0spbTnu4TP2W8pr9GfFs443hxGEBT0OP0V5TlpLjFg0gkMaz4OV02IwvX8ama
         UfY64jIzWxDJVe+eh10trOkHikIKX4G28cOFH/72nDoqFzR1rL16oU74rD27ygH67EYY
         8hgw==
X-Gm-Message-State: APjAAAXwo3ObFG1YoUc01wushRxQsWpMXoXwB4+QL5g+MouG7KVoQwgw
        R0zEqyT4IMan7Jl5R1TqpWEDBK6ZCvA=
X-Google-Smtp-Source: APXvYqwzbYlppaBiGNG3xibokAvW5kKOT8stf9KnukNhM6WUM84jeiZz32Ywlsl/kCnkPoSZJIqMsg==
X-Received: by 2002:adf:e843:: with SMTP id d3mr8354832wrn.249.1559603167811;
        Mon, 03 Jun 2019 16:06:07 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id u19sm38142957wmu.41.2019.06.03.16.06.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 16:06:06 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Federico Vaga <federico.vaga@cern.ch>,
        Pat Riehecky <riehecky@fnal.gov>,
        Alessandro Rubini <rubini@gnudd.com>
Subject: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
Date:   Tue,  4 Jun 2019 01:06:04 +0200
Message-Id: <20190603230604.30938-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This tries to convert the FMC subsystem to use GPIO descriptors.
I say try because several pieces of this puzzle seems to not
be in the mainline kernel.

For details of this change, see drivers/gpio/TODO.

We assume the FMC device is created somewhere and the GPIOs can
be added in this place using gpio descriptor tables from
<linux/gpio/machine.h> as in other conversions, but the place
where the FMC device is created does not seem to be in the
mainline Linux kernel. We assume the index ordering can be
made to match the current GPIO index order in FMC which
isn't especially specific.

We get rid of some GPIO compatibility defines for kernel 3.0
in the process, it is long overdue.

It might be that gpio numbers in this subsystem has nothing
to do with gpio numbers in the GPIO subsystem, and it is just
including <linux/gpio.h> and reusing some defines for no
good reason. Then this should be changed to some approach
decoupling FMC from the GPIO subsystem.

Cc: Federico Vaga <federico.vaga@cern.ch>
Cc: Pat Riehecky <riehecky@fnal.gov>
Cc: Alessandro Rubini <rubini@gnudd.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/fmc/fmc-core.c    |  1 +
 drivers/fmc/fmc-trivial.c | 21 ++++++++++++++++-----
 include/linux/fmc.h       | 15 ++++-----------
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/fmc/fmc-core.c b/drivers/fmc/fmc-core.c
index bbcb505d1522..f08b6f81f442 100644
--- a/drivers/fmc/fmc-core.c
+++ b/drivers/fmc/fmc-core.c
@@ -14,6 +14,7 @@
 #include <linux/device.h>
 #include <linux/fmc.h>
 #include <linux/fmc-sdb.h>
+#include <linux/gpio/consumer.h>
 
 #include "fmc-private.h"
 
diff --git a/drivers/fmc/fmc-trivial.c b/drivers/fmc/fmc-trivial.c
index 8defdee3e3a3..bab02d17f02c 100644
--- a/drivers/fmc/fmc-trivial.c
+++ b/drivers/fmc/fmc-trivial.c
@@ -15,7 +15,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/fmc.h>
 
 static struct fmc_driver t_drv; /* initialized later */
@@ -31,12 +31,12 @@ static irqreturn_t t_handler(int irq, void *dev_id)
 
 static struct fmc_gpio t_gpio[] = {
 	{
-		.gpio = FMC_GPIO_IRQ(0),
-		.mode = GPIOF_DIR_IN,
+		.gpio_index = FMC_GPIO_IRQ(0),
+		.flags = GPIOD_IN,
 		.irqmode = IRQF_TRIGGER_RISING,
 	}, {
-		.gpio = FMC_GPIO_IRQ(1),
-		.mode = GPIOF_DIR_IN,
+		.gpio_index = FMC_GPIO_IRQ(1),
+		.flags = GPIOD_IN,
 		.irqmode = IRQF_TRIGGER_RISING,
 	}
 };
@@ -45,6 +45,7 @@ static int t_probe(struct fmc_device *fmc)
 {
 	int ret;
 	int index = 0;
+	int i;
 
 	index = fmc_validate(fmc, &t_drv);
 	if (index < 0)
@@ -53,6 +54,16 @@ static int t_probe(struct fmc_device *fmc)
 	ret = fmc_irq_request(fmc, t_handler, "fmc-trivial", IRQF_SHARED);
 	if (ret < 0)
 		return ret;
+	/*
+	 * All GPIOs are associated with the FMC device using machine
+	 * descriptor tables or similar. Pick the indices we want.
+	 */
+	for (i = 0; i < ARRAY_SIZE(t_gpio); i++) {
+		t_gpio[i].gpiod = devm_gpiod_get_index(&fmc->dev,
+						       NULL,
+						       t_gpio[i].gpio_index,
+						       t_gpio[i].flags);
+	}
 	/* ignore error code of call below, we really don't care */
 	fmc_gpio_config(fmc, t_gpio, ARRAY_SIZE(t_gpio));
 
diff --git a/include/linux/fmc.h b/include/linux/fmc.h
index 3dc8a1b2db7b..452688aa97db 100644
--- a/include/linux/fmc.h
+++ b/include/linux/fmc.h
@@ -15,6 +15,7 @@
 #include <linux/list.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/gpio/consumer.h>
 
 struct fmc_device;
 struct fmc_driver;
@@ -99,9 +100,9 @@ struct fmc_driver {
  */
 struct fmc_gpio {
 	char *carrier_name; /* name or NULL for virtual pins */
-	int gpio;
-	int _gpio;	/* internal use by the carrier */
-	int mode;	/* GPIOF_DIR_OUT etc, from <linux/gpio.h> */
+	int gpio_index;
+	struct gpio_desc *gpiod;
+	enum gpiod_flags flags; /* see <linux/gpio/consumer.h> */
 	int irqmode;	/* IRQF_TRIGGER_LOW and so on */
 };
 
@@ -115,14 +116,6 @@ struct fmc_gpio {
 #define FMC_GPIO_USER(x)	((x) + 0x1400)	/*  256 of them */
 /* We may add SCL and SDA, or other roles if the need arises */
 
-/* GPIOF_DIR_IN etc are missing before 3.0. copy from <linux/gpio.h> */
-#ifndef GPIOF_DIR_IN
-#  define GPIOF_DIR_OUT   (0 << 0)
-#  define GPIOF_DIR_IN    (1 << 0)
-#  define GPIOF_INIT_LOW  (0 << 1)
-#  define GPIOF_INIT_HIGH (1 << 1)
-#endif
-
 /*
  * The operations are offered by each carrier and should make driver
  * design completely independent of the carrier. Named GPIO pins may be
-- 
2.20.1

