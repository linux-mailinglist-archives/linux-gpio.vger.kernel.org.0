Return-Path: <linux-gpio+bounces-28395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B351C529F5
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 15:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3FB6427FBB
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 13:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DB1339B36;
	Wed, 12 Nov 2025 13:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PbsGWQfA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F9E1EB9E3
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955751; cv=none; b=H1PO3zKtdZnoVrHMEi8riEKr2DGapC69zn/4LgX2p+tGnrZ4oS16QkjNWBV320iTe+jizIkqQlNeyRI8uArBBaOb8PHPe5XLMFj65ZarPiuDZX4GXGMPrml9BkuJx10msGzm3DyBbL2J/LQumWWLB3iw2cKCNUEnlOQ8a2QV+B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955751; c=relaxed/simple;
	bh=3Y14NIoJOg2A5e7NhoQrMadfDwtba7VUZVWmEJyeugk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uT+x5vWsaZiRppGGPCStDuEw8tYXPNzrijG03hvhfDU42oVqWqt9NIi6ZwX8PLxVoPPEyLpEpLniuSVcscIZYcdfp/RVfgRU5Xp5GrTYzaT8ngt5kB84aJFtEh9WxFKIiYxa8rSU/FHn1nt/hxOHiN2nQEWrsIR2sruF9sZBTh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PbsGWQfA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47755de027eso6481035e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 05:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955748; x=1763560548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHDkpdBIkAui+sOwURBjRa8uCHeO7j00sh0QVBNbm7E=;
        b=PbsGWQfA4H06UhRh32IW9v7MTskc5QHUtTH2+8zjyeC37AYNR5LlugNC7R0NyXBFCU
         0j8wp3JXNxrZ+MfqyocPLBH7BAWPZ5p3QCGRR+f+YaKXMtggsg/yWBKyfa7MxdoTf+4K
         MsLHHHGY+mfoap5CDI+FBRe+TVlORuwREQ0sE61LLBQHCa9YfTzYzabqJH+NlmYqHv0w
         J/ff++E+6Ej5C1jnZeeUhhmpK5jPqrlwrMUNCPG1Lod28j5CJ3MAjY0hsYRigkZ+5cv1
         rYbnQNPQcoFhrP35O9aYFgxGkRYA4VZgZjU9dAXOxEMb/R23ECihOIFWat8gw+wheIXM
         Of1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955748; x=1763560548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iHDkpdBIkAui+sOwURBjRa8uCHeO7j00sh0QVBNbm7E=;
        b=GfK9b6EdCLSj45SA/7IG4RIqjjVkxtvQwVwsu5NR/lzSm+Uk7/s+NoKD59bomwRqmo
         JmizvpxGlS30fPFS+1wT0NWhUuN5vTquwO/ZYDtb+aioJPgcjipLlWDUCVZcGft5vT7x
         2xOETbn05fDJREqmzuvaBkhFwnqLrDfCSJhQJGB5e3UMxKfhZCk1rCYAZwjvYxZaKcAG
         DWls9Xtofq+lC69eOxOSAneQ2K2NNjBEd99ydPt2nsaMISu3lr31b+4CxVEf8fitkk4l
         NrAHCpHRbz6updrNWJvKgopnHfxPFSFaztbF3NRzNdXS+a1E19U3cszFHUTUoip4P2na
         G+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWARX+NuzjiHEWXuuvJWAeS3BKIXPtpK+1HhjOEjuhqCGhv8wxJ6KuXNPy2k3pA98yDz3w2+Cd/Qymd@vger.kernel.org
X-Gm-Message-State: AOJu0YwDs9fjgvdrtxcaL6cutZw4PZikEEdFaWcihCiH7zES/opOxf7a
	74lVBo/8hT16agMj1P0oH0fyMb2of+5J2wJTPipCC+Bymx3CD7pmBfh+oq0P68aOc84=
X-Gm-Gg: ASbGncv4gk9fAmzfxKP4IinaFZOUe4AV216fYIsm1qBptyeAEg5ihX4FZzhnkTl7qdm
	ocvlM5vRE2wyf7gYijLauYyAkKeOu18CJTMyO7ym7y1QpYJAjtR/39PblVntsDPYlJNAgfKWuEd
	zqQ1tN5/TJLAjZ55eyikW3xD8jQwI77/EM4w9vUXieTzFGQuhNXy8oyidAFOUQqXoDDXgJ2F1g5
	51H9n0l5dwWERpPmsxg/XYGP3g9vXZFj+DxcFqYibxoxR5gxobuP9Dg2VHLdMnMV8MNPjEqGIsL
	ls8vGS06XRxjGNHU24VndnHQWHx+jlOUptyB6QOnuzAJ01FqoRiT9JrdVnAcSF+9O1EiU5HmZiO
	wNJAKgRLwG2nG5LQxDaMdyKl6AU1UGi0mcdvWoZBo77ZAp516J4tk8LTcbTmAPVibHV0=
X-Google-Smtp-Source: AGHT+IE1m/lfGGA9jUE04kJURKhYINHzlwKRis11jsG5v9Y4unsiMKmAyG3c24nrHJCwH+vPFfgVMQ==
X-Received: by 2002:a05:600c:6305:b0:477:1326:7b4b with SMTP id 5b1f17b1804b1-4778708e66bmr26506715e9.19.1762955747543;
        Wed, 12 Nov 2025 05:55:47 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:46 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:34 +0100
Subject: [PATCH v4 05/10] gpiolib: support shared GPIOs in core subsystem
 code
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-5-b51f97b1abd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4529;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AmdhmrGwNQekKUZMok9IIzwjRaNxDuviwqIp/MhPR5A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHWryXicSatd6ZW0nliwok8A3Z6ggfafAewq
 EZ+P6kfOlWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1gAKCRAFnS7L/zaE
 w0/ED/9OB9/L38MYlq9i08Z6GeffUbPMAcKM3KtVy4fVrmm8NxkDb5fdangJdaI4cz6n6/TI5UL
 qMnmJhYHDPim+wIGI6qxRNUQSfynPXGp0/YO/wOg5dj+xBn+m9KBNCDH2sFxkcdLn03FTgBAW+/
 Ch3bG3mod1OAlt9ryvejRDUL2P9HR2jHd6FQp5Fjfs8ItDBBS+hG5W5sshAxHZmy3o0X1XsTdP6
 kCUHpraGJcWd2nGRbKbCqCoQp/Nt5ANyOhAL8o6QRAwrR5GIWTl4nZkt6cTKwjFiJCXN14bhbt9
 xfj4ZQuZ3F6WrnJ0hGxeRuTaoyfZsJQVKo4aeAkK8W2gyuVY9xdiGJUcga0kjkbPyjiaaF87Pk1
 vJ12P9kc+ijBk2SY14erx7PceZ3ll2fI/TEcIXHsEX8ZccnsGdziL2YS5UiEni5LXPhN+yY9MnF
 Qo6XuQ2AXh8w4LaH8JsTr2eHfQ92UT94MW+YP/Ni2QR3eHP+PS4gQey2IUV5bVeQhoMR8bysXw9
 1KpsS01+LicdwF4aL+v0AwdrwMbYTbZV5Yy39Ke9NRvPq5BkL0MB3wGzIxicLSHUPWvqIFDrshp
 rpyJM0p0Go8LIqNqUq3CR1DoBTtwVL0DWTQlRSBb1AfJ2a7X725/0qydGg/zQtast9HfIloE/NV
 /RT9pvuSj8nMpaQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the final step in adding official support for shared GPIOs, enable
the previously added elements in core GPIO subsystem code. Set-up shared
GPIOs when adding a GPIO chip, tear it down on removal and check if a
GPIO descriptor looked up during the firmware-node stage is shared and
fall-back to machine lookup in this case.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 50 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3659acc600d9622d5d2baeb055ac083556f344a9..c59fe05c838e073b4bc99c4a7667cb1ff40c26b4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -37,6 +37,7 @@
 #include "gpiolib-acpi.h"
 #include "gpiolib-cdev.h"
 #include "gpiolib-of.h"
+#include "gpiolib-shared.h"
 #include "gpiolib-swnode.h"
 #include "gpiolib-sysfs.h"
 #include "gpiolib.h"
@@ -1213,6 +1214,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (ret)
 		goto err_remove_irqchip_mask;
 
+	ret = gpio_device_setup_shared(gdev);
+	if (ret)
+		goto err_remove_irqchip;
+
 	/*
 	 * By first adding the chardev, and then adding the device,
 	 * we get a device node entry in sysfs under
@@ -1224,10 +1229,13 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (gpiolib_initialized) {
 		ret = gpiochip_setup_dev(gdev);
 		if (ret)
-			goto err_remove_irqchip;
+			goto err_teardown_shared;
 	}
+
 	return 0;
 
+err_teardown_shared:
+	gpio_device_teardown_shared(gdev);
 err_remove_irqchip:
 	gpiochip_irqchip_remove(gc);
 err_remove_irqchip_mask:
@@ -1296,6 +1304,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	/* Numb the device, cancelling all outstanding operations */
 	rcu_assign_pointer(gdev->chip, NULL);
 	synchronize_srcu(&gdev->srcu);
+	gpio_device_teardown_shared(gdev);
 	gpiochip_irqchip_remove(gc);
 	acpi_gpiochip_remove(gc);
 	of_gpiochip_remove(gc);
@@ -4659,11 +4668,29 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 	scoped_guard(srcu, &gpio_devices_srcu) {
 		desc = gpiod_fwnode_lookup(fwnode, consumer, con_id, idx,
 					   &flags, &lookupflags);
+		if (!IS_ERR_OR_NULL(desc) &&
+		    test_bit(GPIOD_FLAG_SHARED, &desc->flags)) {
+			/*
+			 * We're dealing with a GPIO shared by multiple
+			 * consumers. This is the moment to add the machine
+			 * lookup table for the proxy device as previously
+			 * we only knew the consumer's fwnode.
+			 */
+			ret = gpio_shared_add_proxy_lookup(consumer, lookupflags);
+			if (ret)
+				return ERR_PTR(ret);
+
+			/* Trigger platform lookup for shared GPIO proxy. */
+			desc = ERR_PTR(-ENOENT);
+			/* Trigger it even for fwnode-only gpiod_get(). */
+			platform_lookup_allowed = true;
+		}
+
 		if (gpiod_not_found(desc) && platform_lookup_allowed) {
 			/*
 			 * Either we are not using DT or ACPI, or their lookup
-			 * did not return a result. In that case, use platform
-			 * lookup as a fallback.
+			 * did not return a result or this is a shared GPIO. In
+			 * that case, use platform lookup as a fallback.
 			 */
 			dev_dbg(consumer,
 				"using lookup tables for GPIO lookup\n");
@@ -4686,14 +4713,19 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 			return ERR_PTR(ret);
 
 		/*
-		 * This happens when there are several consumers for
-		 * the same GPIO line: we just return here without
-		 * further initialization. It is a bit of a hack.
-		 * This is necessary to support fixed regulators.
+		 * This happens when there are several consumers for the same
+		 * GPIO line: we just return here without further
+		 * initialization. It's a hack introduced long ago to support
+		 * fixed regulators. We now have a better solution with
+		 * automated scanning where affected platforms just need to
+		 * select the provided Kconfig option.
 		 *
-		 * FIXME: Make this more sane and safe.
+		 * FIXME: Remove the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag after
+		 * making sure all platforms use the new mechanism.
 		 */
-		dev_info(consumer, "nonexclusive access to GPIO for %s\n", name);
+		dev_info(consumer,
+			 "nonexclusive access to GPIO for %s, consider updating your code to using gpio-shared-proxy\n",
+			 name);
 		return desc;
 	}
 

-- 
2.51.0


