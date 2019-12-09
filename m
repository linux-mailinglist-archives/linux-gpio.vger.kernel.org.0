Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D008F117471
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 19:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfLISkx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 13:40:53 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:48569 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726265AbfLISkx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 13:40:53 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47WsQL1kDfzCS;
        Mon,  9 Dec 2019 19:38:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1575916698; bh=mP4IVsF26GolA/qoisGsW9KuB5321gAdX6Kb63gtye0=;
        h=Date:From:Subject:To:Cc:From;
        b=jeOGNh1PmUYaOWnTMdS5bJGwov6KUqbN4Z/HZPr59kqzhJHrCrEwSzxRDtj+yqOGp
         oJ2HwCpZn8AERqQq/JerhZh8EXVm8iZmlUKyQ3kBqjl5vfnktoY99713MWmbCaM6sz
         k6LOkBaCixjpzwHTUVdTDjkmsOF0mtqIDXjwMPzmhpn1hXfmTdRp/dqlLM47wJj55I
         giYnSukMPAF2PFzVrIG9qGoZedCyryiBcd34LYuy7+rTKHHhTnfbkCee97huTmKZ3G
         5vBK0XHn/nmGy8EljwFT1a9FCjZeUEQLzDIh0F9jF6jIyVN8uLBUS6W81xqdhLeOF9
         UMGgxLIeh+btQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Mon, 09 Dec 2019 19:40:50 +0100
Message-Id: <56d2568cd45a13c738e2804d04348566a8ee8d03.1575916778.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH] gpio: add gpiod_toggle_active_low()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add possibility to toggle active-low flag of a gpio descriptor. This is
useful for compatibility code, where defaults are inverted vs DT gpio
flags or the active-low flag is taken from elsewhere.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/gpio/gpiolib.c        | 11 +++++++++++
 include/linux/gpio/consumer.h |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9913886ede90..6130691e2047 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3363,6 +3363,17 @@ int gpiod_is_active_low(const struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_is_active_low);
 
+/**
+ * gpiod_toggle_active_low - toggle whether a GPIO is active-low or not
+ * @desc: the gpio descriptor to change
+ */
+void gpiod_toggle_active_low(struct gpio_desc *desc)
+{
+	VALIDATE_DESC_VOID(desc);
+	change_bit(FLAG_ACTIVE_LOW, &desc->flags);
+}
+EXPORT_SYMBOL_GPL(gpiod_toggle_active_low);
+
 /* I/O calls are only valid after configuration completed; the relevant
  * "is this a valid GPIO" error checks should already have been done.
  *
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 5215fdba6b9a..bf2d017dd7b7 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -158,6 +158,7 @@ int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce);
 int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
+void gpiod_toggle_active_low(struct gpio_desc *desc);
 
 int gpiod_is_active_low(const struct gpio_desc *desc);
 int gpiod_cansleep(const struct gpio_desc *desc);
@@ -483,6 +484,12 @@ static inline int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 	return -ENOSYS;
 }
 
+static inline void gpiod_toggle_active_low(struct gpio_desc *desc)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(desc);
+}
+
 static inline int gpiod_is_active_low(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
-- 
2.20.1

