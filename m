Return-Path: <linux-gpio+bounces-1116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF62780A07E
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 11:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BED8BB20BB4
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 10:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB10A14AA1;
	Fri,  8 Dec 2023 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EP/4/5Pz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D591708
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 02:20:28 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-33330a5617fso1995612f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 02:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702030826; x=1702635626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcBt1H06VnpfQ+udlk19+9Kb0QwElKrjTxgmIfyINVE=;
        b=EP/4/5PzeliOihBSme+38ywRnGlLD66AtuLseXgTuycU+ECUhwT+OU7b+wfjw6JAEd
         XJvfgXcFymhoMF377pSpRmjGSZLPDPBwqBZ8K40Hx+EB8vH1ZGN579M03/yLtiXqJ2q7
         1vs+86Z0TEDigQOYzWUXxl02ZN7nHxcU1fzzmfVv5+EniOLFMt7t93bdTzDOpHZV7ZK6
         HN0y9dNxR2oHi+oDcxShw/k4c4EdDJ2ZxJADcwdHtg/+1z84KbqMsif+MQOlJV4ta4Xe
         pR1m7HEDJmxu4i3O7h308iqL9Vrp2yrJYj72MoeLZ0AHq0PlugDwrCJlEtJmEh5S7P5t
         jyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030826; x=1702635626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcBt1H06VnpfQ+udlk19+9Kb0QwElKrjTxgmIfyINVE=;
        b=WA3LyhOxDdb26BWK1KPEGOQ6yr/u9jzgWAF9jGwmJRVWjH7feOBPZzIMTVo21J5oGj
         XVxpgi7unQ0B+TfHEPRt5avkWOodsB8uKRLeHXk9aTYQAvcLl9WXdS5O5m5WSo+fsbY/
         8zh9Q5HtUZ2pGOKdHkcgwg4Lm6Z5282VPUpxrGRn5iVySYks8uKtLEYv1sgmPbAHOLnF
         ic5Q0nRk9Rz/mjAf5DriCE2U5CXTyndmvdrncPZNufRFUsi9JEL9I5nA5IXBGs4mi9UF
         CZfARq1aH18rD7H9EMLMCuKJ1dsw2HbMpn5DWPFojeKok0QkM2acxjHRXVJbSDez3Fq4
         d+9A==
X-Gm-Message-State: AOJu0YwIL70tzHD3GRMBJb/SCvzSsM5BWIvMADFQAbl3Hp6+pemejWa/
	1E26ohcbq9jk0bjDdKNefJMZBg==
X-Google-Smtp-Source: AGHT+IEpU9lE4FCaeTWGdOHg5eeTKFEHWPUdBguqaSRXsB3xDodFBETQgvOVjS81LezAfe+3OSSyow==
X-Received: by 2002:adf:ed06:0:b0:333:380f:2d2d with SMTP id a6-20020adfed06000000b00333380f2d2dmr2777351wro.92.1702030826702;
        Fri, 08 Dec 2023 02:20:26 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b162:2510:4488:c0c3])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d4850000000b003334926fb81sm1678026wrs.90.2023.12.08.02.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:20:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 1/2] gpiolib: rename static functions that are called with the lock taken
Date: Fri,  8 Dec 2023 11:20:19 +0100
Message-Id: <20231208102020.36390-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231208102020.36390-1-brgl@bgdev.pl>
References: <20231208102020.36390-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Rename two functions that read or modify the global GPIO device list but
don't take the lock themselves (and need to be called with it already
acquired). Use the _unlocked() suffix which seems to be used quite
consistently across the kernel despite there also existing the _locked()
suffix for the same purpose.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4e190be75dc2..779f8b21bf05 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -290,7 +290,7 @@ struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev)
 EXPORT_SYMBOL_GPL(gpio_device_get_chip);
 
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
-static int gpiochip_find_base(int ngpio)
+static int gpiochip_find_base_unlocked(int ngpio)
 {
 	struct gpio_device *gdev;
 	int base = GPIO_DYNAMIC_BASE;
@@ -363,7 +363,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_direction);
  * Return -EBUSY if the new chip overlaps with some other chip's integer
  * space.
  */
-static int gpiodev_add_to_list(struct gpio_device *gdev)
+static int gpiodev_add_to_list_unlocked(struct gpio_device *gdev)
 {
 	struct gpio_device *prev, *next;
 
@@ -907,7 +907,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	 */
 	base = gc->base;
 	if (base < 0) {
-		base = gpiochip_find_base(gc->ngpio);
+		base = gpiochip_find_base_unlocked(gc->ngpio);
 		if (base < 0) {
 			spin_unlock_irqrestore(&gpio_lock, flags);
 			ret = base;
@@ -927,7 +927,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	}
 	gdev->base = base;
 
-	ret = gpiodev_add_to_list(gdev);
+	ret = gpiodev_add_to_list_unlocked(gdev);
 	if (ret) {
 		spin_unlock_irqrestore(&gpio_lock, flags);
 		chip_err(gc, "GPIO integer space overlap, cannot add chip\n");
-- 
2.40.1


