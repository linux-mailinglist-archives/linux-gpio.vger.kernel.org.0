Return-Path: <linux-gpio+bounces-17432-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43479A5C3AA
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 15:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 752D016D037
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 14:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA4E25BAAE;
	Tue, 11 Mar 2025 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eLRiegRk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D8D1C3BF9
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741702809; cv=none; b=fFBXsYijZU7Qmjf86dLtcwLzkmZ10Kh5OF/6Za88BpFdkxcSFoxhNyAuAo1LaKNsn+TIWtRBaDl9Qj9LhYnQBxZNsZUrIaOqEPETa2dE+DtSSOklF29tVrUDN+1SaVaqG4t8SQb910LLaSfbyxZ1usvvbHelnZhSPoOlF9kxV0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741702809; c=relaxed/simple;
	bh=cmoBnmYROyr1vTCfbv4khA9GTiVhMeUO3b4dsrEgK2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H7PYWsUg9vJj4e8vklYKZHaJrXqCMSBv1kuujfdG/TqJDDfv+EIUCxURb1PYTHgovCBwWWjb6lhFwRXt42Aiawv6b/trcYBNr3nDSpKfQJpyGFXYInSZ8YE5PawMavWeorS5Q4BwyZqds0f4dz70ZndbI22doNG6LlmYbF6Ep/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eLRiegRk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso5364395e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 07:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741702804; x=1742307604; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6ajwEUDxB1mv9ikaPpTiM6Af18J/u+Q+MVbC1QE0kg=;
        b=eLRiegRksI9Uxv1YZkjHfGpeJ8HRV0TWWaze5yRX6WIth78wd7Z53z4jlG1fCJJiT2
         CZq11pQbBgWOgimHvCPamBeBnK3QvDUIA7OAIwclE/gbxsStYkVgh5fnuHkCSDQKlgQG
         e4v8DSqVCaBYd5zCqyLdORlbv/XSU3vZ6PqD/5SJv45fQSDzPVeLepPXQNmKrjOd+jfs
         Zuai9OAEDzw+R0lu9o39RHIXGZYiBMiCcU7pGmg8982NOV2HVRDUhzAZCls+80/fm3qK
         lgWZsK971zQOIeQfjZGyx2ZR8ujcYgLkfpbrn26qQqxTkWtqi4XKCsQ98dujzDM+WahJ
         Odjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741702804; x=1742307604;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6ajwEUDxB1mv9ikaPpTiM6Af18J/u+Q+MVbC1QE0kg=;
        b=YWsfEDYd+zxydl3PY8/A6SRRyecGGHmo8YLA4N8ro97t+uAQ9USG0sFHENI5g48XCc
         4k9R/kownHGHCBpCZd/3x4pL7JckAmC9G/xKv6kbmFezwASP9u0B13aTVPZQxCV8MEh7
         0dTbQRLY9+xMohnCmZlYo+XcDFAj6tcHA8lSou16w02pJ2mg+udr6gdtQfp+A4qsh33A
         1senuTWSg3TqYkrd1t5KfsTM4QK+0JYcJhx8Db1cYslIMAoesfMmI6vq71GodrfLZQbG
         nkn3GEiCCB7xQGklmUbZp/wUtNaueJ3wHTnHhOhm2ayfucy5QuRPUZS7Ph9SA7CGiXHC
         FJGQ==
X-Gm-Message-State: AOJu0Ywbej6y3TwDZAS0hGaR+m8h53UJ26CghCjmRubA5OA1Ih7gKDjD
	wx6ABQ2cim9VLnG/SLE8sGUqR8oblgcRI3Rk3dJfr5OcWvnmP/bAQk4ueuOx/Dw=
X-Gm-Gg: ASbGncvAF2aLz/5Bs8JqXyTzNcn2/HEpRxwuktVlEUW6aToQDE9y/s5W/6plgcKwFv5
	bwgg/A7gtToy6jk6Z5q7OEjqlVfU1dBU+4dCkUW+iMmn2YxwEV4SReQcrreX3sC4zaRxfVvvwQo
	ZBFDNflYazoLeq0t6MS6+2gf5yKObHQ4VvqEFd8FPwJvdeuwUBvgEQ+AIPJGc6PmdEfuaG6DrBH
	q1BO1pwLYVDtKxy4MQfZLA++aCHmc0TMaZY4m1yeh7uGD7Al2K2DIY1VsqELyhJyZUFEOZyUFqM
	WbYJcCUBNBYeSXk7KlJ4+Ss+4PO3V0QFQ6G7
X-Google-Smtp-Source: AGHT+IEC45NYHRE2fvrpMgbBacd2HbN8g4QiPFZ2DzbZrET5lw5lJdvYj+StfFG1LHsSLXOsGFsGGA==
X-Received: by 2002:a05:600c:1c22:b0:439:8634:9909 with SMTP id 5b1f17b1804b1-43d01d50313mr46305895e9.14.1741702803632;
        Tue, 11 Mar 2025 07:20:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5946:3143:114d:3f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cf85f2359sm72333765e9.27.2025.03.11.07.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 07:20:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 15:19:51 +0100
Subject: [PATCH] gpiolib: don't allow setting values on input lines
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-gpio-set-check-output-v1-1-d971bca9e6fa@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIZG0GcC/x3MQQqAIBBA0avErBtolKC6SrQIm3QIUtQikO6et
 HyL/wskjsIJpqZA5FuS+LOC2gaMW0/LKFs1qE71nSZCG8Rj4ozGsTnQXzlcGQetyNDQjytrqG2
 IvMvzf+flfT/CfOfWZwAAAA==
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3338;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5ZfF6iWBiiBJbZn8mf1Ew+4qYOUTKuHr1XALe0cVmmw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn0EaSIs8WFMJ8+wZxg6gDL1dsFCswJ1bNWBZJI
 EhaRPwwkvSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ9BGkgAKCRARpy6gFHHX
 ckBLD/9pQ4RFnqUq3lijtQHM0IdgfpAFUF36AKwikYFe4Uh1PNZkTrpyUnFq1jcBjupqvBhT2P9
 EBu0CgHkug/1CpCAHnuk33nfc9n+7BT4E+VSrknSW2eDADlBDEVXRifHFEZPqb49ySZYOFtF+Kr
 GvbD7pxXymDXg+78fo8xhJZCg5cc62jmE94nhccwC7ii/5bEVCTgk7uGVKw4SYIuxfKUChan6Q4
 h3kzJ8+MdtWuhhf6UWP3j2F3CpL5JsizVg3g3RF2HLl/HlfYjJugTJYNCeEYkl3loUp3TaHl7Ws
 ifBMowBJmB1H59dFzJNcwPrpzeylUOa+Qqo7Zl65e0EKrO1Llid/SXGRQsOv40znTZK68O2AuM+
 s0wwONBorZNoRbPUH9IU+PYQfN9dHi64iAT4xzoqrR6TakGlFJBP9fLPn0Kh37CWl4WRtgh1SqQ
 uIy97acYi7j6sxmHY+qRiW+5Hx2u1As0zkAL/6ap6OILniF15UjTCpJdzhoeaWwHhdqMJ+HTt1f
 8WDB3gn4Aw46phcebyBge6XXa/HQZnWpJn6XJBYT5J4mmUmH9jyHQ/1W3Ru9U5UFXe33ZvZcQgR
 zg7GBJPo97uOOUxKZidfDm9eixvZOdSQMrm7J8n7ZIawZY1lxwak7sA94pl+9cu4P6d/x2XOrgT
 kMcSVNcjbtTASzQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Some drivers as well as the character device and sysfs code check
whether the line actually is in output mode before allowing the user to
set a value.

However, GPIO value setters now return integer values and can indicate
failures. This allows us to move these checks into the core code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c  |  3 ---
 drivers/gpio/gpiolib-sysfs.c | 12 +++++-------
 drivers/gpio/gpiolib.c       | 12 ++++++++++++
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 40f76a90fd7d..8da9c28d57f6 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1366,9 +1366,6 @@ static long linereq_set_values(struct linereq *lr, void __user *ip)
 	/* scan requested lines to determine the subset to be set */
 	for (num_set = 0, i = 0; i < lr->num_lines; i++) {
 		if (lv.mask & BIT_ULL(i)) {
-			/* setting inputs is not allowed */
-			if (!test_bit(FLAG_IS_OUT, &lr->lines[i].desc->flags))
-				return -EPERM;
 			/* add to compacted values */
 			if (lv.bits & BIT_ULL(i))
 				__set_bit(num_set, vals);
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 1acfa43bf1ab..4a3aa09dad9d 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -134,16 +134,14 @@ static ssize_t value_store(struct device *dev,
 	long value;
 
 	status = kstrtol(buf, 0, &value);
-
-	guard(mutex)(&data->mutex);
-
-	if (!test_bit(FLAG_IS_OUT, &desc->flags))
-		return -EPERM;
-
 	if (status)
 		return status;
 
-	gpiod_set_value_cansleep(desc, value);
+	guard(mutex)(&data->mutex);
+
+	status = gpiod_set_value_cansleep(desc, value);
+	if (status)
+		return status;
 
 	return size;
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e5eb3f0ee071..a4b746e80e57 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3592,6 +3592,9 @@ static int gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 
 static int gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 {
+	if (unlikely(!test_bit(FLAG_IS_OUT, &desc->flags)))
+		return -EPERM;
+
 	CLASS(gpio_chip_guard, guard)(desc);
 	if (!guard.gc)
 		return -ENODEV;
@@ -3663,6 +3666,12 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 		if (!can_sleep)
 			WARN_ON(array_info->gdev->can_sleep);
 
+		for (i = 0; i < array_size; i++) {
+			if (unlikely(!test_bit(FLAG_IS_OUT,
+					       &desc_array[i]->flags)))
+				return -EPERM;
+		}
+
 		guard(srcu)(&array_info->gdev->srcu);
 		gc = srcu_dereference(array_info->gdev->chip,
 				      &array_info->gdev->srcu);
@@ -3722,6 +3731,9 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 			int hwgpio = gpio_chip_hwgpio(desc);
 			int value = test_bit(i, value_bitmap);
 
+			if (unlikely(!test_bit(FLAG_IS_OUT, &desc->flags)))
+				return -EPERM;
+
 			/*
 			 * Pins applicable for fast input but not for
 			 * fast output processing may have been already

---
base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
change-id: 20250311-gpio-set-check-output-8321c1859ae3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


