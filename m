Return-Path: <linux-gpio+bounces-22060-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D86AE6648
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 15:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3EE717C3F8
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 13:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F074B2D12EA;
	Tue, 24 Jun 2025 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nl9K1+BQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCA52C3257
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771172; cv=none; b=PcyW2jhWZRXon/dUfvZT114e4i+kFWcqIGHEGrvOc4oouBTU8M8809cCjcRnGSIYGS6JbY7qyINA+0yF5AqiuAVytFXLEku9AlxOfus6lmi0ckRxlC3ewSc5m3E4VP94GjhtwmNDQx/qbF2njH02K9+c7c/L3mvMDwvDxy3NxHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771172; c=relaxed/simple;
	bh=HKr4h7407WiWxR4x2Da4XBzq8sxspEsXMROk8O+RVaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMGSWLlIe+Hbmyvs8qaHxIVNKxS3PcIYzMCNxMKx+80FmKOVbMPBrZjfseWtqXarOjjLsZPM9SDu/xK5mWl9B4cjCCglR/xQZyDshXx6nK6Jsykmz+OwyGCyVF093mZCIZSFCdoUydDlTxJAyzS63I22Uio1AHUd1pOQXnr4/wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nl9K1+BQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45310223677so40374865e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771169; x=1751375969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XWDrcCR7OT510Ct+OwfzYOyuZ8GrtVgHNMqiJtKBDc=;
        b=nl9K1+BQo7KoASPulXQFXkSfxiLILzv/PaSQXwc3kvw82ZlfPa8lSujKeMC/XY1FPw
         S7DrY+1l4aNkB9MzXWPKmlFvcX6Ol7oCC4ICKK4V3aTnhxm76e6pRgzRpj+V6LABnTIw
         KP9TTfEm5wnY91C4HFMdfwFI81BMk69/jJrpLkAq9VA3O6ZusS1uNqHjumpKgj+MN5mU
         PPb+dk0nLW+FeJKE1EI4al45dZt+v34tYP7OHCFfZR3A/3bS4aIVgI8vdupSrwLO/r8E
         P5hsg469J+3IuF87usgRg+BEyhS/7WHkCxvdlK4+yRRwPp22OUpUuntx/OkCwl4ut02g
         1Z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771169; x=1751375969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XWDrcCR7OT510Ct+OwfzYOyuZ8GrtVgHNMqiJtKBDc=;
        b=mpoiLCUEfAAxjQx+E1krlJwWQoQoYusB/RQvnndmxQHCLQ5KG6GIFwmnJviNDk7ecR
         UbtOqgZKQBEfjqDdzQtk3a85GwQ5f2KhLoeEWTTjOViCO2AHIUwrjg8I9Pz7YLbaHP+D
         Em60Ucauj2gy7EYqqPOeaZIKq6Yx3rp8UUzZGKz/3n3sjGfbji7z7sgBRa3FYuyE5KLN
         FGBdVyABPJ8HaKhv8fqNCtArR+j933NO/T5e5yGrdPT3FKPeIGtUnBHDiiA9IsWPjBKF
         oB8xmqY04WRP/JL4FqceQ96k3b3J8tGNKlha17526P4v4nc2pcvX0wVuKQjsBDD1CsHo
         BoHA==
X-Gm-Message-State: AOJu0Yy9Fr5qhtGZSlh+Vkx+7F1xBc6L5EouS+D4SW7Gvf74NkKA+Cor
	ibBC8TDZCyoWuC2uskTbrHaPRfNgTyLU/uZd4emwSB//2FAPlP3KBtNMVvl/1HBU2n0=
X-Gm-Gg: ASbGnctgnKKcGQmxLrZvHH1puNz4oKKfPowpcV7ss1mfkFuDRzcND3icS4pFyPdQdQa
	ZYJ2gS+nvyxTyr3BD9SEZia2MNVUImelmvuAbO3iws/gjcq4nthmEwmFYeK5OL510pPsa9eH7gV
	kI3CFXOtNlu020il8FfreGwRFmSzWvt8JjX4478kR2QuxjCmfiicx7u0mJrGrVnkLW4Ds1B1g7U
	z4lGh8awag6EiGHj0mvuVe0EEFSEMnpEuyhyFPp6M2dAeggRKlz/22enHyoZScqdCufaWSrGv95
	GfXm7VaPMR73swJkgBYdYfntAlCZpy4rylfzN5JM9OLcSsMoCHWdhWrl2t+o8tO27g==
X-Google-Smtp-Source: AGHT+IHock10RuoGmx9RjV0wcweNeUWiSlaHQv7qydV2y+gLq8elzq2R6RpRHGxEHqwYFF+B8DlZkQ==
X-Received: by 2002:a05:600c:474b:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-453659b87a8mr141107155e9.1.1750771169216;
        Tue, 24 Jun 2025 06:19:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:16 +0200
Subject: [PATCH RFT 5/6] ARM: s3c: crag6410: use generic device properties
 for gpio-mmio
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-5-a58c72eb556a@linaro.org>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M6ivCbrYHPALir/oej/d6m+XWZnB9b1K2kuZYU64O7E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXYHuWIS08dfkwBSN+97xWMlPd21eWVTsrnJ
 aCZTr2sEbCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql2AAKCRARpy6gFHHX
 cmJ5EADEZBGMrsssERYb0hbYHuDO71o5tJOkBGjtxDQMWd69JSv/peQj3COKiIsNF/Gr0nRibnI
 JQR9DYoPrU/zYNClACJIwUcBQhO90OGl3SJnCHw0+/oZJLkV9GODi/eWfP0pXJBMODhif0lmI6D
 by2gxddx5gLTJPdH3LgPzeCIqBdaZZVUcBczeKAUohCXubLUdGsNGjW6LBVv2551UT42GHRe/58
 HIDSQcnOkMs349hfYnJJ46B4Y0eVCIPKxn0O0vazcX1A4zZ8YoNyxalJFZePDAXceYixgodB5Ff
 FaGqb4GynaMX555Xm6gb3Q8qoTUk7Z3j8nneJGWVdsx4tn7CzRG6LAfB5nNr+ZPE8vt202uM6Jj
 ZLPw4u0x8y8vu0KY+mmao24DKhvsno+w60UcBwkWHMurz7eJYaC5mHdw2InYeVIYIAMdVNmLWXj
 f6nHsMpw4Y8Hq/W8nLSlRVr+tRyNoiXqPo5w23E0L+EXR90LFd/kB/KDYpe7DDfz6sIhy5+mR9k
 xAzi97fZ0kryw/CQ2Kl1sifpiX6jzvl2Z1xJkG2cB+O52G6RcPyzaPhSMssPiC/KLo5V4+dNdMy
 JlQYJJe1Bzv5/pPnYskdrYLZRWgkzswDLWNshjznUqRHVoRGjhrhKUTH7Gi7ksoj2i3xUmesxGU
 M7UJ/5rPUB2CDPw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The GPIO device in crag6410 is registered with struct bgpio_pdata passed
as platform_data to the gpio-mmio driver. We want to remove the
bgpio_pdata from the kernel and the gpio-mmio driver is now also able to
get the relevant values from the software node. Set up device properties
and switch to using platform_device_info to register the device as
platform_add_devices() doesn't allow us to pass device properties to the
driver model.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/mach-s3c/mach-crag6410.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index e5df2cb51ab27896d9dd80571f421e959db1fd1e..028169c7debf325ab6f51475d3595b92b1307189 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -252,14 +252,17 @@ static struct resource crag6410_mmgpio_resource[] = {
 	[0] = DEFINE_RES_MEM_NAMED(S3C64XX_PA_XM0CSN4, 1, "dat"),
 };
 
-static struct platform_device crag6410_mmgpio = {
+static const struct property_entry crag6410_mmgpio_props[] = {
+	PROPERTY_ENTRY_U32("gpio-mmio,base", MMGPIO_GPIO_BASE),
+	{ }
+};
+
+static struct platform_device_info crag6410_mmgpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= -1,
-	.resource	= crag6410_mmgpio_resource,
-	.num_resources	= ARRAY_SIZE(crag6410_mmgpio_resource),
-	.dev.platform_data = &(struct bgpio_pdata) {
-		.base	= MMGPIO_GPIO_BASE,
-	},
+	.res		= crag6410_mmgpio_resource,
+	.num_res	= ARRAY_SIZE(crag6410_mmgpio_resource),
+	.properties	= crag6410_mmgpio_props,
 };
 
 static struct platform_device speyside_device = {
@@ -373,7 +376,6 @@ static struct platform_device *crag6410_devices[] __initdata = {
 	&crag6410_gpio_keydev,
 	&crag6410_dm9k_device,
 	&s3c64xx_device_spi0,
-	&crag6410_mmgpio,
 	&crag6410_lcd_powerdev,
 	&crag6410_backlight_device,
 	&speyside_device,
@@ -871,6 +873,7 @@ static void __init crag6410_machine_init(void)
 
 	pwm_add_table(crag6410_pwm_lookup, ARRAY_SIZE(crag6410_pwm_lookup));
 	platform_add_devices(crag6410_devices, ARRAY_SIZE(crag6410_devices));
+	platform_device_register_full(&crag6410_mmgpio_devinfo);
 
 	gpio_led_register_device(-1, &gpio_leds_pdata);
 

-- 
2.48.1


