Return-Path: <linux-gpio+bounces-28396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70659C52B01
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 15:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32BD4426592
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 13:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B72C33ADB5;
	Wed, 12 Nov 2025 13:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G9cdtQQ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074D2338918
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 13:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955754; cv=none; b=uTTUmZN7/fPf0gvO4uyIWaaND28Yal0N0aa8i5+vvabYdyf2TCfrBtpUlSpXg14K3vEHxs4F2+dFmFx6PDPEOOqQ1O7L6+VIo7fmKmNFsfJ2mbB531JjUgmWYhiFtBgvijpiLEErOfUG9yph6yJzmxtKqzKWJ1tZa823TXBCuzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955754; c=relaxed/simple;
	bh=QD6mLhmU5x+wBz3cjbrtkC+qGfrTopjdkBF+9DflXwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKUQlJKL5nWJ7cN9vBltMtNN0gFBffj1goVEVGJ55pY+CxLVS6KTgMc1OwrrAfn7bj0vCqVUCTdHIQbLigFTtB/nXiO9j8Z9w+Odn5Kg/luH2U1KfundyDwBzMF1tUeMffqpaI45dvEtgj3pt/hyqbLi6mmfYlomnQzcy5BZ6Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G9cdtQQ1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47778704516so4534995e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 05:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955749; x=1763560549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqf/JX2L7LJxSdDCATW4KSy8LDgu/Cgd29UQPhypHSU=;
        b=G9cdtQQ1YZnO4Hg+LaiYa/oQKY6AVRB8+suvDjiCT+MJIXz+pNTsErPllL5qRpzDXD
         ixZZpIv8pLhEwSHQbhGTXP6GjpoR1giPT9ibRN8ZYuXITPIws4WijFL5zRjzYodTBTz6
         UURLhKKtYvDE2NDchvySwxLjBX/7Nw/HCqJK/3n0e2FdLmWKXZHdhl4FpY30UqlgDaRZ
         +k81t73BF/9bbHz9r9P7qQL+xQZzbkoNyygg3ntm0MdPi51RRSOAsTYUa2Oqrp5IXUxh
         hOYVNPc9/BRY6LA8sVL1IYar8wkzI43v0H4lsyZXIW4ZuS7GhK+BU30eizai7gQNmrDm
         YKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955749; x=1763560549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uqf/JX2L7LJxSdDCATW4KSy8LDgu/Cgd29UQPhypHSU=;
        b=Nh7Ycx+2YPKd0EwcP9qsJ9bMrr9Poo4nNXlWaULQfyF/uQZJ9x3Ylc0SHUv1AsSapp
         /viD2bb0plY0xngv4EniyQstR4ol8zAG83+YcRN9433EURfBogjaZsHV6dD1LjVASUk2
         m54RN5RIl1D/hOL/5JZ7LMT2ppOeVLq+S3wXmlYj5iy6NcpeOOgqeF+4L5+R1tMsIdLI
         CfRhkxHR7dltaNl1v9p1QInVsiFRx+OslsRT0VtqB/wX+w7CvVloWiQxJwecb+T3WMwf
         GRsG9XQkg0q0wpiusrN5FUhOdWyzPRI38kzTqEeqkM1EZgz1z7w7NUAT0QoRUrLFZQzK
         Wpdw==
X-Forwarded-Encrypted: i=1; AJvYcCXpl+VGspa6+gstL31v7fjwSHUjeAAvTaqvswpbgH1NCOG1/ctkjYDHdonW1mIEcsd4QxvNRvv1C4+U@vger.kernel.org
X-Gm-Message-State: AOJu0YxE7tMSc8gNNTu3BBwt38shytBux3tozkULW2uZK2rynOZ3/tLA
	A2q6dLvd8+TZoWSa4CXdZMaBPMFne5fLR/T7HMD5aQWoaRGeCc2ZJSxiz/kwCD/tWgU=
X-Gm-Gg: ASbGnctLIVVeRm/Br1ARVSbYfWgt7KCVtYM79lz9Q+K6lSjUspl6mFXFvXNGPHGqMO6
	ggL4IMOFb3BTZgfNynh5kMDppVIhbRYjCY9F25Z2/GvT7GLOIinxN6D4vWF06Fs3hVpT2UAquz0
	tHNL5crJvyqsdMMwVxl+9mdVlkfkwck5UCsei5jZO3XNDsN6N6sIaIDvaubF4F0SsX2Jh1sIJrP
	2j6V/AYAaDjJTFWsDa++0uwzT9kDyZR6G7DDOiqbWMDkEznLc0XyNmE5Md7sg6tBYvz+0GJjWZu
	PhYEXHibmHxC+k68jmZc8EpgJyKT+LWVr4EWXWMRq+ILFWoswkO9BnDUoGME5DQ1V/jgC8pm4oP
	52TSslvO0TvcXkFikDnaoqRdvqyZUEXHHyAqR1aMhFLEeE9rnAnsoz4Y66B/SAHGZLrQ=
X-Google-Smtp-Source: AGHT+IEFNNscHY36LRUkabyqy8pJkgvj8lmUeTc4bSwD2osPChT3dNC9Hz4duL4aGHcwmKNCJ8VeaQ==
X-Received: by 2002:a05:600c:3113:b0:45d:d353:a491 with SMTP id 5b1f17b1804b1-47787044ccbmr30737595e9.1.1762955749313;
        Wed, 12 Nov 2025 05:55:49 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:35 +0100
Subject: [PATCH v4 06/10] gpio: provide gpiod_is_shared()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-6-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4871;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rku5j8/61mOnZo3K42RMkCwcBTvPmLvpWhJ//UjCrvY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHW5VasetWt4Jh3G+BgPMs12efA7BJwxMkfN
 LcE6bdJIyqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1gAKCRAFnS7L/zaE
 wyd0D/9nnLMMOh4sABy5YsnZXVjgdMnmhhhkvdisFsVsPBV5TdVo/A7IhF054U2v5Uf6AF6M79q
 JKYRgvSvOiVoAK9cd6Go279E5RxLepgNj3QQeUZktSE7dYru17LTKqyFhuCl4nTbJBa4vKMFpZk
 4FmCLE00GUkv9sFfJaTYmLAoM9bKTl5a5PCL/lzQlAOXeQNcW8nuTLFWQ5DjYj6NCXX1BtvluBX
 fGN2+VFE4s4ZG2eMA6SjZXl2Ld7Or34kZqrNk29UjtwLu5tHGZlitked6O287oU0aUDEOuOoe58
 wuq0mXhxryoQoVZ5vaRLg6/nln6JZEiiNUPyA6IJr4d+xvhE3Y5A1H4pxDrDfBUPGCOc+mTPVqf
 t+KydMKuSENCE9s0hrAMkJXGfTq2XWMDfVmAk5eLqgJ8AOBcbvFUWuWvnClrCWJELcKLNXqJq7H
 k/YyvmMLu3gj04lAngDuLFhdostRkko2DGNlRe+qHZO3O4XErlCwRB6srlPh4jpjlzyrnBJLLSi
 ddeU7IRRp+5x+JvnFQFQguPXJfiI/UT5/gYie1UKRGbctmpjnwmeEG4GtZTXOCNaxV8c50oPVyi
 BjJodEz9ejOIsugiXzpWd7gGACNRr1Jmrj+Bi38K3wLeJLqGzlaOwsPe+lHRPC/aSKek5zBPSF8
 1gKY7wU6NFDHO7A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide an interface allowing consumers to check if a GPIO descriptor
represents a GPIO that can potentially be shared by multiple consumers
at the same time. This is exposed to allow subsystems that already
work around the limitations of the current non-exclusive GPIO handling
in some ways, to gradually convert to relying on the new shared GPIO
feature of GPIOLIB.

Extend the gpiolib-shared module to mark the GPIO shared proxy
descriptors with a flag checked by the new interface.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-shared.c | 18 ++++++++++++++++++
 drivers/gpio/gpiolib.c        | 20 ++++++++++++++++++++
 drivers/gpio/gpiolib.h        |  1 +
 include/linux/gpio/consumer.h |  9 +++++++++
 4 files changed, 48 insertions(+)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 56b9b03cbb6dbcdf095a656fc36ff321770035da..c22eaf05eef23a7f5f111708c3db9412c4c30231 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -314,6 +314,24 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
 
 	guard(mutex)(&gpio_shared_lock);
 
+	list_for_each_entry(entry, &gpio_shared_list, list) {
+		list_for_each_entry(ref, &entry->refs, list) {
+			if (gdev->dev.parent == &ref->adev.dev) {
+				/*
+				 * This is a shared GPIO proxy. Mark its
+				 * descriptor as such and return here.
+				 */
+				__set_bit(GPIOD_FLAG_SHARED_PROXY,
+					  &gdev->descs[0].flags);
+				return 0;
+			}
+		}
+	}
+
+	/*
+	 * This is not a shared GPIO proxy but it still may be the device
+	 * exposing shared pins. Find them and create the proxy devices.
+	 */
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c59fe05c838e073b4bc99c4a7667cb1ff40c26b4..91e0c384f34ae5c0ed61ccd3a978685d4f72e867 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3997,6 +3997,26 @@ int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name)
 }
 EXPORT_SYMBOL_GPL(gpiod_set_consumer_name);
 
+/**
+ * gpiod_is_shared() - check if this GPIO can be shared by multiple consumers
+ * @desc: GPIO to inspect
+ *
+ * Returns:
+ * True if this GPIO can be shared by multiple consumers at once. False if it's
+ * a regular, exclusive GPIO.
+ *
+ * Note:
+ * This function returning true does not mean that this GPIO is currently being
+ * shared. It means the GPIO core has registered the fact that the firmware
+ * configuration indicates that it can be shared by multiple consumers and is
+ * in charge of arbitrating the access.
+ */
+bool gpiod_is_shared(const struct gpio_desc *desc)
+{
+	return test_bit(GPIOD_FLAG_SHARED_PROXY, &desc->flags);
+}
+EXPORT_SYMBOL_GPL(gpiod_is_shared);
+
 /**
  * gpiod_to_irq() - return the IRQ corresponding to a GPIO
  * @desc: gpio whose IRQ will be returned (already requested)
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index c9de4bb10584206f4888c0f28468762a3680aae6..77f6f2936dc263a67b31a38799a841128a57603a 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -205,6 +205,7 @@ struct gpio_desc {
 #define GPIOD_FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
 #define GPIOD_FLAG_EVENT_CLOCK_HTE	19 /* GPIO CDEV reports hardware timestamps in events */
 #define GPIOD_FLAG_SHARED		20 /* GPIO is shared by multiple consumers */
+#define GPIOD_FLAG_SHARED_PROXY		21 /* GPIO is a virtual proxy to a physically shared pin. */
 
 	/* Connection label */
 	struct gpio_desc_label __rcu *label;
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 994d46874d560416175c9099e18180237839bd4c..cafeb7a40ad1c25aeb7deaf598410d5f2f004a82 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -167,6 +167,8 @@ int gpiod_cansleep(const struct gpio_desc *desc);
 int gpiod_to_irq(const struct gpio_desc *desc);
 int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
 
+bool gpiod_is_shared(const struct gpio_desc *desc);
+
 /* Convert between the old gpio_ and new gpiod_ interfaces */
 struct gpio_desc *gpio_to_desc(unsigned gpio);
 int desc_to_gpio(const struct gpio_desc *desc);
@@ -522,6 +524,13 @@ static inline int gpiod_set_consumer_name(struct gpio_desc *desc,
 	return -EINVAL;
 }
 
+static inline bool gpiod_is_shared(const struct gpio_desc *desc)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(desc);
+	return false;
+}
+
 static inline struct gpio_desc *gpio_to_desc(unsigned gpio)
 {
 	return NULL;

-- 
2.51.0


