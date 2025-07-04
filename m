Return-Path: <linux-gpio+bounces-22796-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 219CDAF934E
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 14:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D33D5A0B21
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 12:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8312F949D;
	Fri,  4 Jul 2025 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yZMcLLVl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B76B2F7CFE
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633941; cv=none; b=VFqSnLcB5pcR0UQDKgphZgP8Z+mILQVwx47stqcsGJ5R6FYNq6ocl5/zBeo1cCOOTXwBJOI77M7fAQPm1lCp//ds5Sj2Fm9wQ9T3Fb+Ka2hPgLMOOWQXqcufCmzveQAZFjHVKCTV5eXs/tLsII5p/9q/PKXtX8y5Us2xdc9kFcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633941; c=relaxed/simple;
	bh=HhG83jFmoV5xdCHkj21aD/0tubc0+blTrTs2HK40gu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j/TA4YG89LIy1FZWDlcZv7SjXrtr89tMmMmxOWg+2gBHp25ZcAlWiTBpUalTyjLxObG425Lg/B5L7OTdGxh13hCKfDJAd5ft14+/cwUJm4KrQvfG5F8cmIt4QNBeEIvMhe3PS9P69C/RyT77JL+W/55+fSSpJ6pAA9H9lj6ecrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yZMcLLVl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4537deebb01so5373245e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 05:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751633936; x=1752238736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bPbuY7LrWyKcfoiO0z5WW0ENh7MgP8sldaKCSQKpoc=;
        b=yZMcLLVlo+eZGUAHn70X4OHKM2pqMKztGXtJ0zxaquuojx44hu/xbSmkjZk6V45uUC
         wzq9OFFDHAKrRx0+nOG7fuL6HP/1wXnsaCoJBOQpyRGJnUuzpcx8HWGzt30GUKUQroJN
         +4hsQmNoiV6X0mnV8EiFG1nuKkaP+afCQkHoVW+bPzoVeyYllk/InRaZv/eFJIcXvZJ4
         IBkuFy0tU2PK449+G1o+6GGResKv5cOA3FXJyeuSfpilczX0vs4RMQwq8BTMq1pV+zI2
         tf0PEOG1UrjGx5Wr9rQCCjvebrNgoTsOosuhOegnPOBspnp/x7bTF2vgf2HWW11CqqxM
         uNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633936; x=1752238736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bPbuY7LrWyKcfoiO0z5WW0ENh7MgP8sldaKCSQKpoc=;
        b=iCFwFBhVp3MX3hbxsYho/UIvaI3Pz3vKUJ2y8ZNykFWr564S1H+3hW6lyNiSXHwHTP
         eJYg+RyqhKeiA65daN4MpL/KSk2o/iKklEsH/K0/TQnqbNl9j883R0SjTt1Rc068geBJ
         JJl5SLtw4WalYictErUgq63Z57SuABcF01vaopmniHzvBs26rdG1pQyLSzrcA4GkZRzp
         aUiH/dYEAFWsJc1aV3chNqPoIOKQsU0GiBh5N2YoZ3I1h9YUnePyodnAczAIJLylw2/1
         PlHui/lM9N6kQRpO4xZ8dJ9n1GAwHTm06liJA0HHnqkT0wrxnmVjLQ8CuYeTlyU2PtLk
         Dzog==
X-Gm-Message-State: AOJu0YyqFCD2soskqIl+E+liUb4ZN5TlHutk541r/FWqnL4zcDkVdYXA
	LeSLHUP431ZwgRv8r5GcmrVQCSJRM6oMEEpTZdm/gFuWUgHTBKRLxAk9Mc4xhD8RsiC1RwjdJv+
	k/IrkIno=
X-Gm-Gg: ASbGnctYI7dGFzkHmsjI21oc1apHiEFIpEfGrBojAIG6CDDVCh0sDC7YlYGMgWrRrIH
	y0bZg4BZUFf2t9L4nllOjMstzy09N2v1asn/HRTb7sR+RW7Y4eHLRde/1BvvICsM1mBGTCTit6S
	/eQ+I1ez0KGzRjmiz+VasFNcZr5nyp1xOngLOyaBKRwldCrmXwasGA689xSQzCrLDUSHWBX+Li6
	JJ3QIcoCY7YEBnRSjhcXtagGeJQ1wk3aiJVVjdrYWWeSnoM581qiDIRs6jykITkI5JWLuQUG5He
	PW/wPGEiZzIapgG59fHxpk4L7/UzqQ5DRut1adLltnLHRcsNMAwBNYM=
X-Google-Smtp-Source: AGHT+IGCnX4hh4gtPYCGUQD4xyeDmsCfqHwBbBm0KTACazkJNfJ26QejQ49ZXkNB6N0XFeJwri9tew==
X-Received: by 2002:a05:600c:1c19:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-454b4e74ba9mr22014455e9.9.1751633936521;
        Fri, 04 Jul 2025 05:58:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:876:27c7:55ac:40ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm56129665e9.21.2025.07.04.05.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:58:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 04 Jul 2025 14:58:49 +0200
Subject: [PATCH v4 02/10] gpio: sysfs: add a parallel class device for each
 GPIO chip using device IDs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-gpio-sysfs-chip-export-v4-2-9289d8758243@linaro.org>
References: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
In-Reply-To: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9925;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FnQGtT4MFyQtsq5dSlUq/XlWDskcX3/x8jCYFrX9rOI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZ9AKj+lsEZ0SiZLHmFSXOrqLLXs/G4iRw8ZyX
 eLiyGhHmLuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGfQCgAKCRARpy6gFHHX
 cpBZEACRT0QpOUMn/TDhc2qh35/q2HXwJpXgLszxkfrMX7uFdyBZnqKC5l7NKWIvofvdpyZDA6s
 QdMenn8iXUg2u3PGun6XFu1HqnP+BCPSQ2YhWjhSpB9SvtkpESpvb2IWFK2W2Q+PvqWoMmfzD89
 qeiVZLIBUHQShKWUE2TLFU7fgLD4Ey/7H9Imdw9lr5U/81J2iYEi7HI+aSbjVJBziGvhMNPw5En
 6oSow2vbBAXZyCgIO4FtaSyIe4O2pKi6moEK42sy/c1/nhnE8vrLmsuPekYWT41t+IMbwRA2MMC
 yF14B/H7Gozj5o2o5j3IbrzryHtcu122UI13Jz7SS4CjTeFqi1tcH7xndLEg0pJ30NwlIYuJywM
 mtgAED0RxzlANSSTsVBumhJTCugFQOfnSiJ6B1AYCxKNuvcjIgtO8yU6f8CIG91Tjjz0M31waKX
 Plpw5265MWMvNLdvphumdCxUQwPwY/t06ESlLNEaGUO60nKP9Dk0LzGoblkw5NYU96zWR27/3TB
 pfUebOEARM+r9mzRbfzeyeBQDRRt5CRDF2tdLzO+zFGHLptC1vKvHA5/eCsa62I1utMzBxmKFEi
 Ub6sz5pb4113pxEgusQNjaWvv9QXZn0JRAihE5DHc5xE6ksdu34dOgrEp//bH3YqULwQUKQsSLH
 00XyqR5+q9GN+lw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to enable moving away from the global GPIO numberspace-based
exporting of lines over sysfs: add a parallel, per-chip entry under
/sys/class/gpio/ for every registered GPIO chip, denoted by device ID
in the file name and not its base GPIO number.

Compared to the existing chip group: it does not contain the "base"
attribute as the goal of this change is to not refer to GPIOs by their
global number from user-space anymore. It also contains its own,
per-chip export/unexport attribute pair which allow to export lines by
their hardware offset within the chip.

Caveat #1: the new device cannot be a link to (or be linked to by) the
existing "gpiochip<BASE>" entry as we cannot create links in
/sys/class/xyz/.

Caveat #2: the new entry cannot be named "gpiochipX" as it could
conflict with devices whose base is statically defined to a low number.
Let's go with "chipX" instead.

While at it: the chip label is unique so update the untrue statement
when extending the docs.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/ABI/obsolete/sysfs-gpio |   7 +-
 drivers/gpio/gpiolib-sysfs.c          | 192 +++++++++++++++++++++++++---------
 2 files changed, 150 insertions(+), 49 deletions(-)

diff --git a/Documentation/ABI/obsolete/sysfs-gpio b/Documentation/ABI/obsolete/sysfs-gpio
index 480316fee6d80fb7a0ed61706559838591ec0932..ff694708a3bef787afa42dedf94faf209c44dbf0 100644
--- a/Documentation/ABI/obsolete/sysfs-gpio
+++ b/Documentation/ABI/obsolete/sysfs-gpio
@@ -25,8 +25,13 @@ Description:
 	    /active_low ... r/w as: 0, 1
 	/gpiochipN ... for each gpiochip; #N is its first GPIO
 	    /base ... (r/o) same as N
-	    /label ... (r/o) descriptive, not necessarily unique
+	    /label ... (r/o) descriptive chip name
 	    /ngpio ... (r/o) number of GPIOs; numbered N to N + (ngpio - 1)
+	/chipX ... for each gpiochip; #X is the gpio device ID
+	    /export ... asks the kernel to export a GPIO at HW offset X to userspace
+	    /unexport ... to return a GPIO at HW offset X to the kernel
+	    /label ... (r/o) descriptive chip name
+	    /ngpio ... (r/o) number of GPIOs exposed by the chip
 
   This ABI is obsoleted by Documentation/ABI/testing/gpio-cdev and will be
   removed after 2020.
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index c4e85f2827697d0239ff6296caf49d243cf10fe8..990db0405cc86c42bad61295dc823f970199534e 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -45,6 +45,7 @@ struct gpiod_data {
 
 struct gpiodev_data {
 	struct gpio_device *gdev;
+	struct device *cdev_id; /* Class device by GPIO device ID */
 	struct device *cdev_base; /* Class device by GPIO base */
 };
 
@@ -399,6 +400,14 @@ static const struct attribute_group *gpio_groups[] = {
  *   /base ... matching gpio_chip.base (N)
  *   /label ... matching gpio_chip.label
  *   /ngpio ... matching gpio_chip.ngpio
+ *
+ * AND
+ *
+ * /sys/class/gpio/chipX/
+ *   /export ... export GPIO at given offset
+ *   /unexport ... unexport GPIO at given offset
+ *   /label ... matching gpio_chip.label
+ *   /ngpio ... matching gpio_chip.ngpio
  */
 
 static ssize_t base_show(struct device *dev, struct device_attribute *attr,
@@ -428,6 +437,111 @@ static ssize_t ngpio_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(ngpio);
 
+static int export_gpio_desc(struct gpio_desc *desc)
+{
+	int offset, ret;
+
+	CLASS(gpio_chip_guard, guard)(desc);
+	if (!guard.gc)
+		return -ENODEV;
+
+	offset = gpio_chip_hwgpio(desc);
+	if (!gpiochip_line_is_valid(guard.gc, offset)) {
+		pr_debug_ratelimited("%s: GPIO %d masked\n", __func__,
+				     gpio_chip_hwgpio(desc));
+		return -EINVAL;
+	}
+
+	/*
+	 * No extra locking here; FLAG_SYSFS just signifies that the
+	 * request and export were done by on behalf of userspace, so
+	 * they may be undone on its behalf too.
+	 */
+
+	ret = gpiod_request_user(desc, "sysfs");
+	if (ret)
+		return ret;
+
+	ret = gpiod_set_transitory(desc, false);
+	if (ret) {
+		gpiod_free(desc);
+		return ret;
+	}
+
+	ret = gpiod_export(desc, true);
+	if (ret < 0) {
+		gpiod_free(desc);
+	} else {
+		set_bit(FLAG_SYSFS, &desc->flags);
+		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
+	}
+
+	return ret;
+}
+
+static int unexport_gpio_desc(struct gpio_desc *desc)
+{
+	/*
+	 * No extra locking here; FLAG_SYSFS just signifies that the
+	 * request and export were done by on behalf of userspace, so
+	 * they may be undone on its behalf too.
+	 */
+	if (!test_and_clear_bit(FLAG_SYSFS, &desc->flags))
+		return -EINVAL;
+
+	gpiod_unexport(desc);
+	gpiod_free(desc);
+
+	return 0;
+}
+
+static ssize_t do_chip_export_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, ssize_t size,
+				    int (*handler)(struct gpio_desc *desc))
+{
+	struct gpiodev_data *data = dev_get_drvdata(dev);
+	struct gpio_device *gdev = data->gdev;
+	struct gpio_desc *desc;
+	unsigned int gpio;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &gpio);
+	if (ret)
+		return ret;
+
+	desc = gpio_device_get_desc(gdev, gpio);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	ret = handler(desc);
+	if (ret)
+		return ret;
+
+	return size;
+}
+
+static ssize_t chip_export_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	return do_chip_export_store(dev, attr, buf, size, export_gpio_desc);
+}
+
+static struct device_attribute dev_attr_export = __ATTR(export, 0200, NULL,
+							chip_export_store);
+
+static ssize_t chip_unexport_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t size)
+{
+	return do_chip_export_store(dev, attr, buf, size, unexport_gpio_desc);
+}
+
+static struct device_attribute dev_attr_unexport = __ATTR(unexport, 0200,
+							  NULL,
+							  chip_unexport_store);
+
 static struct attribute *gpiochip_attrs[] = {
 	&dev_attr_base.attr,
 	&dev_attr_label.attr,
@@ -436,6 +550,15 @@ static struct attribute *gpiochip_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gpiochip);
 
+static struct attribute *gpiochip_ext_attrs[] = {
+	&dev_attr_label.attr,
+	&dev_attr_ngpio.attr,
+	&dev_attr_export.attr,
+	&dev_attr_unexport.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(gpiochip_ext);
+
 /*
  * /sys/class/gpio/export ... write-only
  *	integer N ... number of GPIO to export (full access)
@@ -447,7 +570,7 @@ static ssize_t export_store(const struct class *class,
 			    const char *buf, size_t len)
 {
 	struct gpio_desc *desc;
-	int status, offset;
+	int status;
 	long gpio;
 
 	status = kstrtol(buf, 0, &gpio);
@@ -461,40 +584,7 @@ static ssize_t export_store(const struct class *class,
 		return -EINVAL;
 	}
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
-
-	offset = gpio_chip_hwgpio(desc);
-	if (!gpiochip_line_is_valid(guard.gc, offset)) {
-		pr_debug_ratelimited("%s: GPIO %ld masked\n", __func__, gpio);
-		return -EINVAL;
-	}
-
-	/* No extra locking here; FLAG_SYSFS just signifies that the
-	 * request and export were done by on behalf of userspace, so
-	 * they may be undone on its behalf too.
-	 */
-
-	status = gpiod_request_user(desc, "sysfs");
-	if (status)
-		goto done;
-
-	status = gpiod_set_transitory(desc, false);
-	if (status) {
-		gpiod_free(desc);
-		goto done;
-	}
-
-	status = gpiod_export(desc, true);
-	if (status < 0) {
-		gpiod_free(desc);
-	} else {
-		set_bit(FLAG_SYSFS, &desc->flags);
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
-	}
-
-done:
+	status = export_gpio_desc(desc);
 	if (status)
 		pr_debug("%s: status %d\n", __func__, status);
 	return status ? : len;
@@ -511,7 +601,7 @@ static ssize_t unexport_store(const struct class *class,
 
 	status = kstrtol(buf, 0, &gpio);
 	if (status < 0)
-		goto done;
+		return status;
 
 	desc = gpio_to_desc(gpio);
 	/* reject bogus commands (gpiod_unexport() ignores them) */
@@ -520,18 +610,7 @@ static ssize_t unexport_store(const struct class *class,
 		return -EINVAL;
 	}
 
-	status = -EINVAL;
-
-	/* No extra locking here; FLAG_SYSFS just signifies that the
-	 * request and export were done by on behalf of userspace, so
-	 * they may be undone on its behalf too.
-	 */
-	if (test_and_clear_bit(FLAG_SYSFS, &desc->flags)) {
-		gpiod_unexport(desc);
-		gpiod_free(desc);
-		status = 0;
-	}
-done:
+	status = unexport_gpio_desc(desc);
 	if (status)
 		pr_debug("%s: status %d\n", __func__, status);
 	return status ? : len;
@@ -561,6 +640,11 @@ static int match_gdev(struct device *dev, const void *desc)
 static struct gpiodev_data *
 gdev_get_data(struct gpio_device *gdev) __must_hold(&sysfs_lock)
 {
+	/*
+	 * Find the first device in GPIO class that matches. Whether that's
+	 * the one indexed by GPIO base or device ID doesn't matter, it has
+	 * the same address set as driver data.
+	 */
 	struct device *cdev __free(put_device) = class_find_device(&gpio_class,
 								   NULL, gdev,
 								   match_gdev);
@@ -787,6 +871,17 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 		return err;
 	}
 
+	data->cdev_id = device_create_with_groups(&gpio_class, parent,
+						  MKDEV(0, 0), data,
+						  gpiochip_ext_groups,
+						  "chip%d", gdev->id);
+	if (IS_ERR(data->cdev_id)) {
+		device_unregister(data->cdev_base);
+		err = PTR_ERR(data->cdev_id);
+		kfree(data);
+		return err;
+	}
+
 	return 0;
 }
 
@@ -802,6 +897,7 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 			return;
 
 		device_unregister(data->cdev_base);
+		device_unregister(data->cdev_id);
 		kfree(data);
 	}
 

-- 
2.48.1


