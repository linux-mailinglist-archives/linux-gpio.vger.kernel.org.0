Return-Path: <linux-gpio+bounces-1762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8902381B230
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 10:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 457AE2815AA
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 09:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1178E4CB37;
	Thu, 21 Dec 2023 09:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LfIFaajh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739534E1A9
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3366e78d872so464088f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 01:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703150150; x=1703754950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mD/dxcpKDkGqyDT0hW/nURglpnMq+ut1OW2xwKTP0cc=;
        b=LfIFaajhsO0cSzKMHpN5AC2hxlEf5NUgTcpaZn8b0+Gv2MqZJ3kBRuY9uM0lPH+YfE
         nuIsOqwVVXQrYXR9oDiIzdrI39foXgGC2Qzu7YUdbJdXazcOQS5D5+UOa9t/D0sMUbSY
         v6nScwU7UavUbJ5NbXHsbP2PP+RCXxCxDirNSlvMg2MItTUOv/j68lXuEHrjMmUdhoKe
         70q3/mrg2QDNiZgU0KK8e4xJfjaHTWfFzvekBMp8VtEE4/1wicPu6UzvRXblPeCy4c/q
         MESr5bSFe5vuWY5ZqBo/8QQl0G9qyMx8c+PQfxLL+l5Go1dcNCkRWqLAjFZnCqfSrB5u
         yhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703150150; x=1703754950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mD/dxcpKDkGqyDT0hW/nURglpnMq+ut1OW2xwKTP0cc=;
        b=eD3k2v+h4ocPYtCmmDRWC9bfef3/oxKfSglvb2fvcMpi/LPdFMXtah10zCYOxLl6fa
         YUJK/3GZQdutaC0NczsplulHRQfq8SQc37kTHLXw+/t3sPvijNsplJjy706ZiiD9mPhq
         Y67pIayzLEhW77q5p1BS05NCfBi0J4FSryHTPur3KPyEuNGhYgQdDqmCHflPoB8lmIFI
         ghNc0nsibJUnnAKbYNpkF9rRe4w9VTsef5/GzCfsuoTaX9g5YY5DZF/AsiDp6TTT4u0u
         ehWsbUhEeZVnyJuuO9zhKi2Fmvw/XG5Va60sfoEnpzagJr6jAjQXr+p2rUnYr7T4pCj4
         BSfw==
X-Gm-Message-State: AOJu0Yxou2EwE7Tii+fhnFWOVk3ww3N7g4Os/Z8SnNDQ/Zr0qR+WSkey
	ox6tymJTAODqFGJVUtQnd0DdeA==
X-Google-Smtp-Source: AGHT+IFrftLkKBC2zN9KxCzcfRYYYlTm1CsExtiwU/o1asMnRUTi2nV6CU4GLvRvMVMg8MB+Y45snA==
X-Received: by 2002:a05:600c:202:b0:40d:3d98:249c with SMTP id 2-20020a05600c020200b0040d3d98249cmr195593wmi.196.1703150150419;
        Thu, 21 Dec 2023 01:15:50 -0800 (PST)
Received: from brgl-uxlite.. ([2a02:8440:c20c:e072:65b3:1998:74df:2809])
        by smtp.gmail.com with ESMTPSA id s13-20020a05600c45cd00b0040d414b57e8sm122157wmo.26.2023.12.21.01.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:15:50 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 1/2] gpiolib: drop tabs from local variable declarations
Date: Thu, 21 Dec 2023 10:15:46 +0100
Message-Id: <20231221091547.57352-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Older code has an annoying habit of putting tabs between the type and the
name of the variable. This doesn't really add to readability and newer
code doesn't do it so make the entire file consistent.

While at it: convert 'unsigned' to 'unsigned int'.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v1 -> v2:
- arrange variables we're touching in a reverse x-mass tree

 drivers/gpio/gpiolib.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c9ca809b55de..bdfa3d119c2e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1049,8 +1049,8 @@ EXPORT_SYMBOL_GPL(gpiochip_add_data_with_key);
 void gpiochip_remove(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
-	unsigned long	flags;
-	unsigned int	i;
+	unsigned long flags;
+	unsigned int i;
 
 	down_write(&gdev->sem);
 
@@ -2186,10 +2186,10 @@ EXPORT_SYMBOL_GPL(gpiochip_remove_pin_ranges);
  */
 static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 {
-	struct gpio_chip	*gc = desc->gdev->chip;
-	int			ret;
-	unsigned long		flags;
-	unsigned		offset;
+	struct gpio_chip *gc = desc->gdev->chip;
+	unsigned long flags;
+	unsigned int offset;
+	int ret;
 
 	if (label) {
 		label = kstrdup_const(label, GFP_KERNEL);
@@ -2301,9 +2301,9 @@ int gpiod_request(struct gpio_desc *desc, const char *label)
 
 static bool gpiod_free_commit(struct gpio_desc *desc)
 {
-	bool			ret = false;
-	unsigned long		flags;
-	struct gpio_chip	*gc;
+	struct gpio_chip *gc;
+	unsigned long flags;
+	bool ret = false;
 
 	might_sleep();
 
@@ -2577,8 +2577,8 @@ int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
  */
 int gpiod_direction_input(struct gpio_desc *desc)
 {
-	struct gpio_chip	*gc;
-	int			ret = 0;
+	struct gpio_chip *gc;
+	int ret = 0;
 
 	VALIDATE_DESC(desc);
 	gc = desc->gdev->chip;
@@ -2927,7 +2927,7 @@ static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *des
 
 static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 {
-	struct gpio_chip	*gc;
+	struct gpio_chip *gc;
 	int value;
 
 	gc = desc->gdev->chip;
@@ -3222,7 +3222,7 @@ static void gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value
 
 static void gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 {
-	struct gpio_chip	*gc;
+	struct gpio_chip *gc;
 
 	gc = desc->gdev->chip;
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
@@ -4709,13 +4709,11 @@ core_initcall(gpiolib_dev_init);
 
 static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 {
-	struct gpio_chip	*gc = gdev->chip;
-	struct gpio_desc	*desc;
-	unsigned		gpio = gdev->base;
-	int			value;
-	bool			is_out;
-	bool			is_irq;
-	bool			active_low;
+	struct gpio_chip *gc = gdev->chip;
+	bool active_low, is_irq, is_out;
+	unsigned int gpio = gdev->base;
+	struct gpio_desc *desc;
+	int value;
 
 	for_each_gpio_desc(gc, desc) {
 		if (test_bit(FLAG_REQUESTED, &desc->flags)) {
-- 
2.40.1


