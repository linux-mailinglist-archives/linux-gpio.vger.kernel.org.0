Return-Path: <linux-gpio+bounces-22428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F09AEDD18
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 14:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6F93189B053
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 12:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7E228B51F;
	Mon, 30 Jun 2025 12:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SO1iYkty"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811CA28AAFF
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 12:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287048; cv=none; b=K0W1jpBICp+FaKYP+jR93inDCVeK4oNYKDEIh0vLl57aMq4UUsZOuV+SYg2drJlKYZGQPZBAe5PM6hIpSb0UMo8gihjXfN/zNU7gkYNJVo8kKcoCDSVNdIOTeZSM7TExvKkNBFy50pbwp1R4yJp1i9RXMCc9e5DBBS0vSTRHk1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287048; c=relaxed/simple;
	bh=cUaenc3rvl0teJ/NowJgsUrKnZg43rV4CQlKHGo5Nbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bzWDesfY9OTLg+bfr6u8PeqAk2KoOaTSwn+p6qGQIkFOplFNSNDL1JRUr5hFfvbFmTvm0haDXqK5HQj+s1/2tbOMQm4RKKh0L1f4qdhtPbj/UvTfFkVhoh5+LOwqw3SU5iJRMvuPHoh8lMIhgiBN/BmbAQYVzwZ3NpFpoJcXCnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SO1iYkty; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-453066fad06so28624535e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 05:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751287045; x=1751891845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9GLowzR6otD4zmMujrvPO89qTOr5wAjt/UHwvcJE1g=;
        b=SO1iYktyfKAi4kuCnoYfj7iQi54uo+QAi/OLuaX8XzM+2No7aCzbd0NzauqCke1qv6
         vDVNhMUtnVPPdb5/RXOUYVK6hzM0/dPDfFnX0AaSNfebGbOPmpqHCBnzjHuomC2gdODd
         3gpbw5OZFJLvmSWMSfjpnAE75lrF4ArBTWTW/kJn18IJm3lw9m1p5Ks/IZa+p7OONOed
         Gw8Xl56lKJU4mcYuYgHJiiw95uL9woIF5NPclT0EeHAUgK6SBszIYhRrY6vlRgOvFnkn
         xLCWTFZjeaxIOl5ySvisYw8ivDmiCF/VUMBLDFsja6DJafuhX42DGY913uJmoGCddZtH
         qrjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751287045; x=1751891845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9GLowzR6otD4zmMujrvPO89qTOr5wAjt/UHwvcJE1g=;
        b=YIWxKq97w4Rlupg5qFBYYxi6N2II48LK5DegSAEQ4Ea8ggFO9F3Ol1ZGM3V4yWH+oc
         3FWTV5svn9y8W46oE/dQi9r58oYyELTsWK8Db5KVAU3ibl9e5aZMbSt79HMnlc8HyDtU
         3YeMp0T4GKcjvX40hL6Ya0E8Fl1mbY1t5jZWZ/mnowjoxjyQsW4EkzL7azLuSDudZvMq
         0Rb5ojDi0D13ABtaiMSLTLrlortsF10ZH13WfizTBG2won8F4ED80DS330E40P0bHnGs
         KCx6fv5rOw3zvqhkY565xI377v8xkA/FgKcRB9zLShbdwwnJZ+HlT0pc1VcChMcD1i8A
         Z9Wg==
X-Gm-Message-State: AOJu0YxM7c0vlSaDCPVXdByI9jtU9fUm93WnHRZMVlNpxfyUJYVbuY4N
	gzO0VeDknxMBKk4ILe1FKsagJS4uYicCXxzqRZAHygnCJysS4qZANVE8c34DfVuyX38=
X-Gm-Gg: ASbGncsOJXFrDaqqEXYt5ceF7YAWCgZqMhQ8dGQcGMJtD2QSBdlNKNpZZ+tnhgK/qch
	xRYFgPLuk/jdIQ6L+7JfurdSOMR9e8QiesKi577N7IJ5dOruBlDuQRUReSXWudufcWG0fcsYkG+
	TKEYAXgONNySi+WtxdFG6MeIINtmjTbDKa8ObM7sPuOt4TGZeZtoqztn1pePMh8kFinskrVOd2x
	5arCa/Nqk+P7SdVhMk1wizv/CTL+SFYmcPIWiiiv0Sb4zkwg5gz4UvAmhtrAv7qlWXBQQ0qKrWO
	czeqrKj4f6VwgjXuByXHEBkMysTWZ7SG/ZqmYPfO0JzFnhLU1nMKR2My
X-Google-Smtp-Source: AGHT+IHeIscFUoOGPWT6ZviT8ymHKprVMmRN5ZRVeuYCasNZmZbt4cN2gXEocUtjCX/6XT6ra3ECVQ==
X-Received: by 2002:a05:6000:2b11:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a8ffdbefcamr8022219f8f.27.1751287044766;
        Mon, 30 Jun 2025 05:37:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa2a7sm10238192f8f.21.2025.06.30.05.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:37:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 14:37:11 +0200
Subject: [PATCH v3 04/10] gpio: sysfs: pass gpiod_data directly to internal
 GPIO sysfs functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-gpio-sysfs-chip-export-v3-4-b997be9b7137@linaro.org>
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
In-Reply-To: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3592;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ms0NUIquAuQ6uIRpaRWEi7RbBvFxHVK11v6RgPGf09k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYoT90lCXweh33FmrPJvAtlE/10Ook7ZvIDvUG
 virgCp7G9aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGKE/QAKCRARpy6gFHHX
 cr5NEACUbv07pZaQlQpYhhU+GjzEQaL8DrQ5Uz6q3+ugJ1ijIngNAmOnqQH0biZKjT3GTVzf9tK
 AsjCxjr6j1WhfMurmhv1vQcx4j84EiS/Web3o8GkBuwXJQRTTqJ9jgS3vojqEdVWvQr+I4ZGaTY
 voE3lI6RoICo0CJCzU/NarHB+rjLo42jrziXX/l80Wx/UoS/kHxjH8BL5LItsSzIKhvCiVJV56A
 1qJlQY9q4SAOB/IwEFdVf2F4OtkFzgd8UZ1+axIyEupU+pBxh5rALS/mnOwcrkFSFUTq6j8xIbP
 SA7+xYLlH9OA6GM4kZpES+z+pcUQrvcmiRHSMbWTuSPDbld4PmyPKkBSKDdnI86t9lXNlLxVBJf
 CkK5pi/hxY+hBR02mzV8wYbbnn0W+9pZUNUNZ1MnYZ6H9SD9j7X5iQsgVAsyaJrdEDPumXAv+CE
 czz3pQdzGXjfQZmLgz47gE5NObViURpwMZ9AGf1Pvwob+KRe5hP2e5/XqaYZ1VICv9KC2WOryTT
 O2hRqVeFJjYkCThfS/HCS/g3ogre+ZkyP23ZMmovat6eXabehv7CC9d0vs5cAzI4PsEFdiUDVCU
 bLiayh/K2tuAZOtLNMqqYaiFGWv+bb+ZmX45+OkYE8hq4IB+qt8kGfVU+/InixXyT/wiuD46n0+
 uqRy3fOw2HF5pjA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We don't use any fields from struct device in gpio_sysfs_request_irq(),
gpio_sysfs_free_irq() and gpio_sysfs_set_active_low(). We only use the
dev argument to get the associated struct gpiod_data pointer with
dev_get_drvdata().

To make the transition to not using dev_get_drvdata() across line
callbacks for sysfs attributes easier, pass gpiod_data directly to
these functions instead of having it wrapped in struct device.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 80bb58c96b9b45ce4e1a4def8085d71baa0ce45d..59b66ee222a84b36a05458c8cd6cfa1d568e6783 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -162,9 +162,8 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 }
 
 /* Caller holds gpiod-data mutex. */
-static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
+static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
 	unsigned long irq_flags;
 	int ret;
@@ -223,9 +222,8 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
  * Caller holds gpiod-data mutex (unless called after class-device
  * deregistration).
  */
-static void gpio_sysfs_free_irq(struct device *dev)
+static void gpio_sysfs_free_irq(struct gpiod_data *data)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
 
 	CLASS(gpio_chip_guard, guard)(desc);
@@ -278,12 +276,12 @@ static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
 		return size;
 
 	if (data->irq_flags)
-		gpio_sysfs_free_irq(dev);
+		gpio_sysfs_free_irq(data);
 
 	if (!flags)
 		return size;
 
-	status = gpio_sysfs_request_irq(dev, flags);
+	status = gpio_sysfs_request_irq(data, flags);
 	if (status)
 		return status;
 
@@ -294,9 +292,8 @@ static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR_RW(edge);
 
 /* Caller holds gpiod-data mutex. */
-static int gpio_sysfs_set_active_low(struct device *dev, int value)
+static int gpio_sysfs_set_active_low(struct gpiod_data *data, int value)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
 	unsigned int flags = data->irq_flags;
 	struct gpio_desc *desc = data->desc;
 	int status = 0;
@@ -309,8 +306,8 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 	/* reconfigure poll(2) support if enabled on one edge only */
 	if (flags == GPIO_IRQF_TRIGGER_FALLING ||
 	    flags == GPIO_IRQF_TRIGGER_RISING) {
-		gpio_sysfs_free_irq(dev);
-		status = gpio_sysfs_request_irq(dev, flags);
+		gpio_sysfs_free_irq(data);
+		status = gpio_sysfs_request_irq(data, flags);
 	}
 
 	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
@@ -345,7 +342,7 @@ static ssize_t active_low_store(struct device *dev,
 
 	guard(mutex)(&data->mutex);
 
-	return gpio_sysfs_set_active_low(dev, value) ?: size;
+	return gpio_sysfs_set_active_low(data, value) ?: size;
 }
 static DEVICE_ATTR_RW(active_low);
 
@@ -814,7 +811,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 		 * edge_store.
 		 */
 		if (data->irq_flags)
-			gpio_sysfs_free_irq(dev);
+			gpio_sysfs_free_irq(data);
 	}
 
 	put_device(dev);

-- 
2.48.1


