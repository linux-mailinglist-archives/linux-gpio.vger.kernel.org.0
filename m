Return-Path: <linux-gpio+bounces-2945-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8004A849696
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC9ADB222CD
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC6213AF9;
	Mon,  5 Feb 2024 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lw5MOHFe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B74134AA
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707125673; cv=none; b=LMEwSWtle6ZTC4eFjvZuz9F/Y/RWyJOg8SqexWYhwY6pQj+OBVtmNLYwrKJZyWwf3V6h9ZZvpn3MG5S7a4G9BX+DPd+6u6DtFypBZPiSbF1bELNg8q5TMVJE6tzx5aZYpxGD7nRVmwhQ6lM1TCDYOxREvHhNU7kgsOUKVoiuHIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707125673; c=relaxed/simple;
	bh=rvDmiJvoOjsEAG1Ifqh4V4UhyPYg6qZuDJ20zQ/Khlg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A6sYhcNGU0Ri8FrA0UGXTKGnyjUyC+MuCL6Qt/KhTgZuFTqGVzVD5QV8okKyZ3xwru085TcqNONl7JSfYtOSgzd2uOSlX5oWSLvCL+0jEG2uCQeeXGDb3v5YRNaS3x0bymhR4KRn7+DejoUjjGGf8y6tCTygjhGU9yj/2KOwJrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lw5MOHFe; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33b29b5ea96so929065f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 01:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707125669; x=1707730469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggk/HS4V+gdB4Ghsw/F6Qu63h8wKplBC7+YEgEKvm/I=;
        b=lw5MOHFe8DfzKx2vttTyd4yHtivqVHI/wtoGHeHt5J7vTRC3sYrZzviPf1HrqARmgD
         xQSkKqKjjnm+3cP63K7x7DRBxapvqLVP0/OMavRCOHlz8guTZO+4YDENwr6jGzlSBHRk
         +7tfSmiIBOxxZtYeLnutc9Y2WndHGL2eFOsrHeCx92zBiL6g+uWTWX3xaMafAqMjm/k9
         dbNZano0JMJRp5Ox+F7OkcSsgsXv7AYgCrxBn7Efa4hAU0I5pJpO+c8Db1tzDMG4wA44
         q/+sqIMjObQyezTG8NMcQVnw4sOuSGTqkVi/z3ZfRSuakqgXORGU/qYfisPBNmv369j3
         NH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125669; x=1707730469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggk/HS4V+gdB4Ghsw/F6Qu63h8wKplBC7+YEgEKvm/I=;
        b=EvGHR7xFdRmLpD3phD+CJ3KzglIK52s3e5P0Xzd/ZIbZgc4fCJ9asN3cTWIOxwnSN9
         9ZIX14Jqj7rhPNsbW+R2/lOOqHYbAbLNRvGJGiextAcGepu78M6/F5vkG9oeKLystOqf
         1/xDlL8dSfgYHvLnyuKZQvP2YjffOuJTIjehaQvV8hNjDymzNAowvlsqtcl7yrk+VkjB
         qnjIGPUG1K088SSnWlHYYUqLT8gVsz2ONLOKDweIY/VWaZUfDfkLBWP6pa6mE7ROoLfN
         Zcb/wAaJApyLRVERsoJ3pKXrNkBEEWtlnr8JRffoiTSp3As1LFEMZ72SvqdNWuQPlMkl
         CSXg==
X-Gm-Message-State: AOJu0YxVC1SDISQs98nc83iGIEw62OV6cL5rC8QFoO+jQ+tungKKSCNJ
	tzs9TxlXm4eydjKMV0W672oJz99F9SXyE53+vc7jPnHfamPcizXQAayQ3LNPE0Y=
X-Google-Smtp-Source: AGHT+IGmV+7oO3tTihglftOvAY9ys2JC0HqwERsmzJ5U7qwgZaAkLeRUyf/il5ao0F9eBGp+iUhtKA==
X-Received: by 2002:adf:db44:0:b0:337:d84c:1d6 with SMTP id f4-20020adfdb44000000b00337d84c01d6mr3723241wrj.18.1707125669370;
        Mon, 05 Feb 2024 01:34:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUwWtApFLfLTngT2lkUY8xlP8ZuNiah9r0wTDnJOYT7AjyUHSkQKKGQ/LAQz4/cydeGnZShFBn1MrvvPVo/PkEc/nACNX+IyRUnM6M6nnXnwZ5cLfLN9WuOwBvoZIQ8jVjIRsfP4LjMT9bEHv5eGfFCyvaqi2HLcKfSKh30/U8qIZGz652uPwvvV5NnrCwmS86MRCJlRPMWEzxmid9j6frzRqQglH9W+JAnkZ62dFIMHeHpTYmsJitoD+KMtC0WfZ3L52/QzmDYeIpiX6dbbdG5xCY/HxtiuaEoOi3IGQTnUW4FWAEQKJ9N3pVajdFRfKjOEuBNYk5MEiZqc1Qju124+XnPndyvkQ==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b0040fc771c864sm7980397wmg.14.2024.02.05.01.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:34:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 04/23] gpio: provide and use gpiod_get_label()
Date: Mon,  5 Feb 2024 10:33:59 +0100
Message-Id: <20240205093418.39755-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240205093418.39755-1-brgl@bgdev.pl>
References: <20240205093418.39755-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We will soon serialize access to the descriptor label using SRCU. The
write-side of the protection will require calling synchronize_srcu()
which must not be called from atomic context. We have two irq helpers:
gpiochip_lock_as_irq() and gpiochip_unlock_as_irq() that set the label
if the GPIO is not requested but is being used as interrupt. They are
called with a spinlock held from the interrupt subsystem.

They must not do it if we are to use SRCU so instead let's move the
special corner case to a dedicated getter.

First: let's implement and use the getter where it's applicable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 4 ++--
 drivers/gpio/gpiolib.c      | 9 +++++++--
 drivers/gpio/gpiolib.h      | 1 +
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 34d6712fa07c..2c0a0700762d 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2305,8 +2305,8 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 		if (desc->name)
 			strscpy(info->name, desc->name, sizeof(info->name));
 
-		if (desc->label)
-			strscpy(info->consumer, desc->label,
+		if (gpiod_get_label(desc))
+			strscpy(info->consumer, gpiod_get_label(desc),
 				sizeof(info->consumer));
 
 		dflags = READ_ONCE(desc->flags);
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4c18b693d06c..cfd311ec5dda 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -105,6 +105,11 @@ static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gc);
 
 static bool gpiolib_initialized;
 
+const char *gpiod_get_label(struct gpio_desc *desc)
+{
+	return desc->label;
+}
+
 static inline void desc_set_label(struct gpio_desc *d, const char *label)
 {
 	d->label = label;
@@ -2385,7 +2390,7 @@ char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)
 	 *
 	 * Until this happens, this allocation needs to be atomic.
 	 */
-	label = kstrdup(desc->label, GFP_ATOMIC);
+	label = kstrdup(gpiod_get_label(desc), GFP_ATOMIC);
 	if (!label)
 		return ERR_PTR(-ENOMEM);
 
@@ -4726,7 +4731,7 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
 			is_irq = test_bit(FLAG_USED_AS_IRQ, &desc->flags);
 			active_low = test_bit(FLAG_ACTIVE_LOW, &desc->flags);
 			seq_printf(s, " gpio-%-3d (%-20.20s|%-20.20s) %s %s %s%s\n",
-				   gpio, desc->name ?: "", desc->label,
+				   gpio, desc->name ?: "", gpiod_get_label(desc),
 				   is_out ? "out" : "in ",
 				   value >= 0 ? (value ? "hi" : "lo") : "?  ",
 				   is_irq ? "IRQ " : "",
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index c3ae5bfa3f2e..1058f326fe2b 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -208,6 +208,7 @@ int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce);
 int gpiod_hog(struct gpio_desc *desc, const char *name,
 		unsigned long lflags, enum gpiod_flags dflags);
 int gpiochip_get_ngpios(struct gpio_chip *gc, struct device *dev);
+const char *gpiod_get_label(struct gpio_desc *desc);
 
 /*
  * Return the GPIO number of the passed descriptor relative to its chip
-- 
2.40.1


