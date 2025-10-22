Return-Path: <linux-gpio+bounces-27444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C3CBFC24C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F0586567837
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D16A34AB09;
	Wed, 22 Oct 2025 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gfi4QrAn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E247726ED3A
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138676; cv=none; b=urUD+gAv084DiTkCOqTV/qKaDgi2ShuH5rUBx2FSX02NdKZxusKh9iTH0c1wjFVZCsllqyCX0VccregrCD1o9Oc6rwbV0Bph+zLzwZrT1uIJd4QZZ3dLzzyBBnlE5nSNvIEZalLoPONYQY1qBKsSuy5o9XxJVQk4A6e5Iea77YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138676; c=relaxed/simple;
	bh=LPm9YBzUQ4gQfPx8tMp97rKvgm+IC1c2b9DnnDCOC8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jMHwzZIboxY9wDiBqm++Fyy10ReebEXR4G4/bPPaGkhMJpTr68dxQroa0QQbEfDMAB/NeVYL5sWrr8r2VK1HbHA3nnX0wobGYYQjA4XBP/TjqNeiB5ocMBHMmn+GIYXArHIewXouqHgElb3TQDBrnHfrj024OyJlGkclsMeIUOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gfi4QrAn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so23525515e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138671; x=1761743471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JxC4wP5bi/PqrvaNLx4qtWBYafzvA8adhEOxdIGx4g=;
        b=Gfi4QrAnssPfFlc8pR1BSuXZ1EpTExNqaLGYPZgcUy5g4e4iI4A14wO5mSBbcATMJh
         7iiHEAWxWoRwkGLtdIJ0Z3rUWeo5ba0Aq/+RAxFT6PDBrUcqBJ1Qu9wNiJ4HGUjLo7gR
         7BGnQMn1pvLab7aTPyFlyjPaqX9hJq0QoUb5+Ip3hnRwDQl8+MB0ELQdy98eob6LhyFf
         E03NzoE/c3ONIt7TZ510pz/sJyYbsSEyvLsrFUf007UeT0RFIuhQ2aA92gD3dF9BfEUA
         7VBBRLpxDczniy2/xzsP3VsfPtfr0sK0blhcK0VCVCH9o0lvChrJ/ORUjdNZGxLYAP/P
         68Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138671; x=1761743471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JxC4wP5bi/PqrvaNLx4qtWBYafzvA8adhEOxdIGx4g=;
        b=u68GZYwsrb21w8U9WXNkeU3dLBG8j7kVKVxuZLokkUKxP1cR31ErfCFVH/tUfdSh5M
         iDxI2AfJK8dkAGktDSFU/hRdaTHxpu3zuDBiYvkHZIbKqhh1YyUDdknJvR6sD2mCt5QM
         Guo9/RWF+w/IqcaFjp2tShlT+0+vofMxnR+HDSSoQyKwqVXhgLRNoDBqTmuolAqWDI5y
         sx5WbquE54oa4VNfB3qZwPZTf5k38mM3KpK8ATo64D7q2MlR+s8jbQ00eSGaZ32a6Zmr
         YLAKVvpB6PjBU9LcyVVj6pBBWMZACThH20aj8pmgBrcwwtaY6Nh7hD9vtO495J8GW+cG
         lOKA==
X-Forwarded-Encrypted: i=1; AJvYcCWp0SYA1hCGCB9lJLETgutQi/y4wXiWQl63+BlthIaXqvl178QK2nbyAbhUR5dy8S0mHgJLjOrQ8WRJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8pkjRAa+RB/plxkwSZhc956TAA2L++eKrZMbxgCm423S8sq+A
	wG/KJJS5rDk6MvtGP/4+8rL4F2E4V9dMNda78RIQpv2muyHvcuEW0Ub4fIOQZWdRU8Q=
X-Gm-Gg: ASbGncsesVMYlGbrzmv8U91NkQgQj0pdRqR5P1AviRZUIyg4jEZEI2OgFy7OpVN6Ure
	g7qHpoP3FsyF/0mO0toA5pgz4Zmd9XblHPBbe1bEDQUY8pzRPM9ME+l4zxDC+IuNAe3VGvpWaok
	UVxaw7KtIWxsn/3hlK5aFPIf6oZ8QHqp6ri7kAJ7tSi8BIVpUIsRoe+sZcZ+ULp6GeoTx8GxQFm
	u5IZqXjAZFm5e7gimSVY1ierY8GAUNzjplbgc3biRp/aCTHLf182xpC9UYSrkbp10bC3J+vw13B
	Vpm2CYS890m+DaFsEBIa3pCTPM6EXLvnUIx7NgM9KxFmVrc4vOxWa7XuVM2MFjcDUrBGQJKe8/r
	ONrNs2q5FVMqTnPRC9SjEQ0dWNvz3hfc5ZMtKnfS6OhU0cr470hdc/zRL9w7NTVq3eYMbIYc=
X-Google-Smtp-Source: AGHT+IHo7fpOJ7A4/PDFJApxVJPuvZ2+KhtSRrGrKQkN9hTz6RoVFtBwlxLDGySMMqM9OycqmRHnhw==
X-Received: by 2002:a05:600c:3e07:b0:46e:450d:e037 with SMTP id 5b1f17b1804b1-4711786c560mr160425345e9.5.1761138671092;
        Wed, 22 Oct 2025 06:11:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:44 +0200
Subject: [PATCH v2 05/10] gpiolib: support shared GPIOs in core subsystem
 code
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-5-d34aa1fbdf06@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
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
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4422;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zqXCTaI+O2fDGRyRHcv5jGy43WgDG3dY8izHkuOqT+8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfdN6WlD8MNTI0j9WttuM9GjMl2b/JJHHe5o
 KvW0ta3RKaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3QAKCRARpy6gFHHX
 cqSuD/9q1cd7HMe1XSEd4nF6dgis0elTdxxSKaEEOn4CmMimW6BoSdKLxlhAjaUYHolIY3lso6q
 FvKuLQ2VYwRNhHYvR2ZyjsPNv1adhD8f9WaAD9qjMJX942vR9KW4DYf7u83G+fMRXTW01V0x4tA
 sYHA44FyHa5JRbjKnYc0AjlnS3Rj50FjhhJWALXcI3YWU/sqcu90aof58IAI3hZQ/35j9i++VAz
 KoON8D4dPHJONeZh5VpM4guVUN5GRz3scQtiUlqE7Zb+QkL5pjX8Y8K2XkdSVh5Qjr4jJwmI2f/
 FcHboakvuRX4D8eBfb6B3ctXaQN8gjBOjkBo316BiDVQAMdkyU8GyoKptnm4howzrP1El0SHW8L
 Yh57Q8C+nVmRnqpJE5h9gPsg3MLEpHp67bw+yEhHqjaOWt3uunDCEgE6+ckk3jNmWu/2JowcaJh
 ZIc28gzPMQTPRr+bKm/X+Bn6GkbKQIIckVPwWvKbv7RaI8xqxZrd4m6jGwiX3tYYMSNI49L56h8
 akFjclqSdu2sKUzNtYnNeCRjQVrMyGPQi862Eens6P6K8VJ6EfQbAwEaj0qwqwUn8i8bQb8/OJ1
 IASPaL60AFqsfMYYYX1IwD0mdykLKKhYJQjKZcpBakJxjaCtLNt16nsAVSj/FSsTbTwvMwZ3prk
 4hqIq3rq17kDweA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the final step in adding official support for shared GPIOs, enable
the previously added elements in core GPIO subsystem code. Set-up shared
GPIOs when adding a GPIO chip, tear it down on removal and check if a
GPIO descriptor looked up during the firmware-node stage is shared and
fall-back to machine lookup in this case.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 50 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ba5df8a233fe75e16bae615f7f7c8591066c056e..03fd60e787fcf5846519fb2db9a701770ed15d6b 100644
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
@@ -1200,6 +1201,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (ret)
 		goto err_remove_irqchip_mask;
 
+	ret = gpio_device_setup_shared(gdev);
+	if (ret)
+		goto err_remove_irqchip;
+
 	/*
 	 * By first adding the chardev, and then adding the device,
 	 * we get a device node entry in sysfs under
@@ -1211,10 +1216,13 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
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
@@ -1283,6 +1291,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	/* Numb the device, cancelling all outstanding operations */
 	rcu_assign_pointer(gdev->chip, NULL);
 	synchronize_srcu(&gdev->srcu);
+	gpio_device_teardown_shared(gdev);
 	gpiochip_irqchip_remove(gc);
 	acpi_gpiochip_remove(gc);
 	of_gpiochip_remove(gc);
@@ -4646,11 +4655,29 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
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
@@ -4673,14 +4700,19 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
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
2.48.1


