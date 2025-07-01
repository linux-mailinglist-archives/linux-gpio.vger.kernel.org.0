Return-Path: <linux-gpio+bounces-22484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE98AEF759
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 13:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91A2C168B2C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 11:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F11A274665;
	Tue,  1 Jul 2025 11:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="P1Jen1zS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE55A2749E2
	for <linux-gpio@vger.kernel.org>; Tue,  1 Jul 2025 11:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370595; cv=none; b=bz7wrMkhVcPse+wyFDBs9ee+6q2lxh/bkkx5qL+TmQ+eyu7puN7jxKPjLw1r3iVM8pOLHjt+Sw4JsQaiUD+VKs66a3bRG1i8PXioGt6nR2acVXOUd5Ooa11hWvFH+x/ejupaIWdH12d1xHB3fYy8WOyri1apMhtpivk/mpw9Fb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370595; c=relaxed/simple;
	bh=m8g10qpaHzBwCwL13B2EwAjy8RqqGFIRTWKPTOvRXes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NAlFeT24jLdiCJWAxsI2uUTow6UwNmVvoAzM/5/3NBcFQ/0QjSJkXNc5hqrdVYYGpIQRaqpEz5wbE8ADvJ+bz6+BE/0J8DFpt2iUmeqTD1oWGijoWkpUl8pwAKQfTx//YiVzIL/6L+OeTtd7y9iSZA34BKkbCPrhVbK14e0nCBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=P1Jen1zS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-453643020bdso48238025e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jul 2025 04:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751370591; x=1751975391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izGYiVRCi02r3mHWqGF4QIu9SBmrk+ZHTmWL1Vrn6tY=;
        b=P1Jen1zSJJCf+PXCmXE5SI+6QdnIRcwfwKAVIT3l61W2ywABm1vIQYmcBHrtvmbCUt
         yBEsTAlSTm03SUJuGIbPpvYihWr0e5+G/4wA7sg3qos+CAku3p7qFhHin0YlgTjZZ2tT
         33k8bGxtg63GhR0ooTX/ZDpPKYK0auWqBk/vJZ49ondjq+TWBqDZ9ajtBu0Ezar74cHo
         eDk1xfCmA0p6HWCgDmEbx3+sUGxJx9TPz4GejnrMOfgi5dOQWZ0suUKgPFg8eqAQTDeY
         xy4v5rVdCRHfmLBwhMEEHOFv+QQWlxw5nRWWTX+lEOTctYfkqz9VzRNBL63VZsiqSBlk
         bgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370591; x=1751975391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izGYiVRCi02r3mHWqGF4QIu9SBmrk+ZHTmWL1Vrn6tY=;
        b=lgt2rprGxyAaeFrvC8ANUx6ZkQKZu3fnaM54BRlGwLfn41HLRXn9XDPXR4AwQVbpx6
         jfEdu0h1GeWfHz/qshBhD4f+duO94NP76TIv1IvguSWKJLRRo739yup1XyKsI20JS2bQ
         D2dgmELsL0zpXxeEzptB1nuxiKJZvZGWbAgMtTM4RFUvzeDe2sohiAwD9/kXK3y/Y2P9
         s5Qbxb7efVref2BXwZtq/P8i58DnRco/MJGAz5A3SDftXnzuawFCr/wzaDviLr9X2s42
         HyZY3hoYBasqqevmtH8xcq+9CuMY0VQS2b3kDpYO3rIqvaVF3oLyQpL1q4O8FSfXY3dX
         +VGA==
X-Gm-Message-State: AOJu0YxrH0TfAxlEKyu/AzpE2Yr8dJYeFxHxxVrAEgVscuwHJ4IXlF7G
	k3dHPtVboyagmzOZJ31mWcq1/V4R+Rf30Hrk3+XJhpphxiPyCz/K8EhrQrYh0Q1b2EY=
X-Gm-Gg: ASbGnctTi+HJDoCIhGEpXPgalVNbVAaMCiz32u0EfLRy0Cu7G7Vk9+prW5wYFyVPLKP
	iOZIPYklqZHVagiGquY15KYEFP8o/9xKGaqtHh88DqVh8S+l5Z7UfioirE6HSA8bKI24s0Vwfo/
	RvbVkyYduLfeA4i7tTaiFhF4+q8YmSx800CXer26VHIf8ctKMiobo9d7twpotL/tblh9ON9y1nI
	9qqiTqsK7/cEv70gI5fE2ONL34c9BvjniUZvakj/IWJIURTH39gEeIIomCdgyq4lOM/gmFMvZi1
	wSikxiuttZdfCU8qFtIRW+iVJDF+Y13jIei06lFkJ27e/AeblTSeXA==
X-Google-Smtp-Source: AGHT+IFrcmk0/tbiV/1dv+6YlxrA5d22+2IS83WwEoAaJRu/KYB6N6nKzdbcBuOnEP7Enr6/jTeGEg==
X-Received: by 2002:a05:600c:1f94:b0:453:c39:d0c2 with SMTP id 5b1f17b1804b1-4538ee8562dmr175036385e9.24.1751370591152;
        Tue, 01 Jul 2025 04:49:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm193988925e9.5.2025.07.01.04.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:49:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 13:49:38 +0200
Subject: [PATCH RFT v2 4/6] ARM: omap1: ams-delta: use generic device
 properties for gpio-mmio
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-gpio-mmio-pdata-v2-4-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3706;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7iayfgJ1dAZc21AW/gMObpJaTK4Jre7W6uoH3VtFMTk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY8tXdkaoNLb+tPOwKTmXWO2Kc1HFqnzGAwtoq
 Y0sJyZVX3yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGPLVwAKCRARpy6gFHHX
 clDND/9BuRpZx3u9XqWNJ7hOLcErccn0sL4gSURj0Br9j+kDJJr46tueiThfMZpkPEwlYT6h3s3
 Q47+uYZ8bV9WkhY+59KzB8otEDdNvsMP05xEdnLoD0h8C2l12eu+jAUZv5lI3ueCGW5/fxcXjT0
 Iucu9kXJbjwq+EU/+ucAuMzRT9/GqyiP++t6Kvw9A62uldgPVPhgir3m7KMVeSNzVFXfevpsmkB
 aIHOTAwDDGwDRferwWj/9GQlHB4BuapKCS992iP1tQgbCWhev7bMZdqdDhtYt2iYkZYndrQGdg0
 9Dj84j79kyzrWjE+OEDPdw3DVEg20KVvJP6SlRx8RcSpd18sT4U7bSkqkbRMo1si3/oLWgVo+ae
 VIWNZmQjj5ZHCwvAJcjQDJNIJpnmayRzQc/ealI5muuiAzpWCl+oSjYlLevvI23fJI2dVfxSWva
 Ut+objfa15+H2NMgDVpPkKOrMUPKsZb24Az4Rn/q7Trmk3lsx9jReF6gpCPjqb04ZDmhMWnBp3B
 ciR4Ytq03ponzgxA90LttFx9K7+tvdAxup6UD6urmPjpT09F6vEpZTkPzqJN3L4OadivrVR+Xxx
 DkycKLK4K5DCQhrrN7QOsoiEmCh9WYAgQhDhTMOyDjQ0jWBYddTPm4Z+LvjGqBqHOWzlfGFD5jF
 Xc13UlKAP1cOiXw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The two latch GPIO devices in ams-delta are registered with struct
bgpio_pdata passed as platform_data to the gpio-mmio driver. We want to
remove the bgpio_pdata from the kernel and the gpio-mmio driver is now
also able to get the relevant values from the software node. Set up
device properties and switch to using platform_device_info to register
the devices as platform_add_devices() doesn't allow us to pass device
properties to the driver model.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/mach-omap1/board-ams-delta.c | 42 +++++++++++++++++------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 0daf6c5b5c1cbcfd5bd15203cad119d39aa95f19..16392720296cd224732450c85419c35bbab506f6 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -19,6 +19,7 @@
 #include <linux/mtd/nand-gpio.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
@@ -175,20 +176,18 @@ static struct resource latch1_resources[] = {
 
 #define LATCH1_LABEL	"latch1"
 
-static struct bgpio_pdata latch1_pdata = {
-	.label	= LATCH1_LABEL,
-	.base	= -1,
-	.ngpio	= LATCH1_NGPIO,
+static const struct property_entry latch1_gpio_props[] = {
+	PROPERTY_ENTRY_STRING("label", LATCH1_LABEL),
+	PROPERTY_ENTRY_U32("ngpios", LATCH1_NGPIO),
+	{ }
 };
 
-static struct platform_device latch1_gpio_device = {
+static const struct platform_device_info latch1_gpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= 0,
-	.resource	= latch1_resources,
-	.num_resources	= ARRAY_SIZE(latch1_resources),
-	.dev		= {
-		.platform_data	= &latch1_pdata,
-	},
+	.res		= latch1_resources,
+	.num_res	= ARRAY_SIZE(latch1_resources),
+	.properties	= latch1_gpio_props,
 };
 
 #define LATCH1_PIN_LED_CAMERA		0
@@ -213,20 +212,18 @@ static struct resource latch2_resources[] = {
 
 #define LATCH2_LABEL	"latch2"
 
-static struct bgpio_pdata latch2_pdata = {
-	.label	= LATCH2_LABEL,
-	.base	= -1,
-	.ngpio	= LATCH2_NGPIO,
+static const struct property_entry latch2_gpio_props[] = {
+	PROPERTY_ENTRY_STRING("label", LATCH2_LABEL),
+	PROPERTY_ENTRY_U32("ngpios", LATCH2_NGPIO),
+	{ }
 };
 
-static struct platform_device latch2_gpio_device = {
+static struct platform_device_info latch2_gpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= 1,
-	.resource	= latch2_resources,
-	.num_resources	= ARRAY_SIZE(latch2_resources),
-	.dev		= {
-		.platform_data	= &latch2_pdata,
-	},
+	.res		= latch2_resources,
+	.num_res	= ARRAY_SIZE(latch2_resources),
+	.properties	= latch2_gpio_props,
 };
 
 #define LATCH2_PIN_LCD_VBLEN		0
@@ -542,8 +539,6 @@ static struct gpiod_lookup_table keybrd_pwr_gpio_table = {
 };
 
 static struct platform_device *ams_delta_devices[] __initdata = {
-	&latch1_gpio_device,
-	&latch2_gpio_device,
 	&ams_delta_kp_device,
 	&ams_delta_audio_device,
 	&ams_delta_serio_device,
@@ -697,6 +692,9 @@ static void __init ams_delta_init(void)
 	omap1_usb_init(&ams_delta_usb_config);
 	platform_add_devices(ams_delta_devices, ARRAY_SIZE(ams_delta_devices));
 
+	platform_device_register_full(&latch1_gpio_devinfo);
+	platform_device_register_full(&latch2_gpio_devinfo);
+
 	/*
 	 * As soon as regulator consumers have been registered, assign their
 	 * dev_names to consumer supply entries of respective regulators.

-- 
2.48.1


