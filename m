Return-Path: <linux-gpio+bounces-934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC40802DAF
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDEB7280E7D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 08:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4D6111A5;
	Mon,  4 Dec 2023 08:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wm+D+Cr/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484DB114
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 00:57:33 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40c0e7b8a9bso1520265e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 00:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701680251; x=1702285051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CmguLwHno4+ep63d/2yDufPK8h00mOPzfPbypUQQUes=;
        b=wm+D+Cr/2hpPZaNmEgfm7IBMJ5KbbNRgF4Ed85HacNnpJ+sJiYSUL9kURrJYzDBnF+
         hDDhV3IgKdjuWg+8mR/9lCtJyg5jVbeLqhB9qyx/XGfy9uw071xkAzM2UlAvrpEPDVZN
         Ih7+v0CjRjLgMp6Rx8xZVZWtZIzcgCImL7H8bXOXhdgwl6bwZCSPpFjStL00XhXmxb0/
         EhU3hZCVEZX7p8rlUC1WrSLRpsakbAGoDmXOaWSPMaK3svmQUdiTFSk1RL9oESNKTNJF
         YyApPX0FFnkOKsPIZcPYBVqe90ZXasTdOdJtnkJIPgCsBe7ADp18Tk4lC+OoTHU7BlHW
         4S+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701680251; x=1702285051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmguLwHno4+ep63d/2yDufPK8h00mOPzfPbypUQQUes=;
        b=IIAXkJPUVg02+OdDXKHjAM906uDfuWqPzEZNGbPtgvKQob34YjjjxZu+WAy31Hwhb+
         sUwohobm5/LqpUNnkdNR/WzsYRr7eGCsgHCaSWH1zs3XEzF3VxKZrlu7irkvk73VqEY5
         HYzks9GiPw0P40XQBJ9AkY26zvuvHAq2sf3EjFoRppIIyHmNgyNCw54a2wrHOuxLQXtB
         OwIodmiyJ5TqxcobBr+1brwBJeqCLpJ1RD+TjYUy6nxCiuvVb4u+JIF2EDFzyWCUFIWE
         cCq58zI8Dnyso/CQH7w8Job9TnS7WyjgigirzLyrFNswECdsL1VHopWLOuWqIObz5tN7
         hogg==
X-Gm-Message-State: AOJu0YyLblII++2A9salb90Jd0c+VaB07kiIVWW0SpLT7RD5bylneRo8
	ZZzL5sLbUuboopLdBo2vcvI+XEbrhE89q2tfHA8=
X-Google-Smtp-Source: AGHT+IGlHrnh/zRPQHg5kwgbA5JDhMx75IzN2GwOeCmQhdS3AylUMLuQ9R6672yKnucAuT2owNf8kw==
X-Received: by 2002:a05:600c:3503:b0:40b:4b93:a369 with SMTP id h3-20020a05600c350300b0040b4b93a369mr2268142wmq.14.1701680251485;
        Mon, 04 Dec 2023 00:57:31 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4cb1:229e:8c33:122a])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c4f0f00b0040b33222a39sm17959138wmq.45.2023.12.04.00.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 00:57:31 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] gpio: sim: implement the dbg_show() callback
Date: Mon,  4 Dec 2023 09:57:19 +0100
Message-Id: <20231204085719.17928-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a custom implementation of the dbg_show() callback that prints
all requested lines together with their label, direction, value and
bias. This improves the code coverage of GPIOLIB.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- use PTR_IF() instead of #ifdef

 drivers/gpio/gpio-sim.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 1928209491e1..49c3e51bf8e4 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -20,6 +20,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irq_sim.h>
+#include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
@@ -28,6 +29,7 @@
 #include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/string_helpers.h>
@@ -224,6 +226,25 @@ static void gpio_sim_free(struct gpio_chip *gc, unsigned int offset)
 	}
 }
 
+static void gpio_sim_dbg_show(struct seq_file *seq, struct gpio_chip *gc)
+{
+	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
+	const char *label;
+	int i;
+
+	guard(mutex)(&chip->lock);
+
+	for_each_requested_gpio(gc, i, label)
+		seq_printf(seq, " gpio-%-3d (%s) %s,%s\n",
+			   gc->base + i,
+			   label,
+			   test_bit(i, chip->direction_map) ? "input" :
+				test_bit(i, chip->value_map) ? "output-high" :
+							       "output-low",
+			   test_bit(i, chip->pull_map) ? "pull-up" :
+							 "pull-down");
+}
+
 static ssize_t gpio_sim_sysfs_val_show(struct device *dev,
 				       struct device_attribute *attr, char *buf)
 {
@@ -460,6 +481,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	gc->to_irq = gpio_sim_to_irq;
 	gc->request = gpio_sim_request;
 	gc->free = gpio_sim_free;
+	gc->dbg_show = PTR_IF(IS_ENABLED(CONFIG_DEBUG_FS), gpio_sim_dbg_show);
 	gc->can_sleep = true;
 
 	ret = devm_gpiochip_add_data(dev, gc, chip);
-- 
2.40.1


