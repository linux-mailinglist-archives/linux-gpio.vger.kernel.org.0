Return-Path: <linux-gpio+bounces-24123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBEBB1FDEB
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 04:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB54D3ADB86
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 02:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964CB248F6A;
	Mon, 11 Aug 2025 02:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJHyZbli"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BEE3594F;
	Mon, 11 Aug 2025 02:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754879247; cv=none; b=Lb07IMmnvgU3amGWvd1V+L7sKQwnps9A80OaWJMsH8X4WFu2rOeWTtNRBB+XQ9ZCLhJYujJoSlP9+I6AXCw5Xup40DsYi8oSQs5zcu4ZmbPMj30nFTKMKNk6VBNfWQ5k1hgJS/97PUMdMkPKdVCfNXpWqvI1Z6XMn7p5EBK8Ey8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754879247; c=relaxed/simple;
	bh=aMKWzvDtm/8g+NdL6hwVVMiy6H2j95sMRGkquX9m2Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvdOqI5o/9CbnoQvdnpCdJRafnF0HOiPeBpT/HnyD+QpiZ0zkJzKCfkQeX9ZMDOSX3FOA1LtXPNdfSJ+4NYYCLYnmTOST5iY82djn0EJKkozILg95/eEzxydVkHtejQPfC6xmluFO2p5Jl34RZKZpA1Cg8sbmDHoO8UZHoNcQcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJHyZbli; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24041a39005so24274785ad.2;
        Sun, 10 Aug 2025 19:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754879245; x=1755484045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xslMt/NExvfPIQBfixpVYmv0aftSa67Btq8uVf+dkXs=;
        b=VJHyZbliHpBBcv1v69AyK4C90cUon7/7/1iQCJIBqlGbTwUxySaVY4sWk2TaotqH7I
         kxZHEqua/QNT4ul6Y1zR90ABAiGsunOCDtYbR1D1sgKF/CM3Fs64eYC8yKbXVwT2BrMR
         NESWT/SpuF5Cnck6eCyukWdYTXIv3eHls/pvSZdCZbqRdIMiWbVbGPuSrLQCW5lwKiiz
         IQL7Z3EFgjEGuuPJCEshKhSx5h4vzT8vud2fHZTPupkB8j0Ny6oPPVzrJZc945vbhQEp
         l2PWguC4kRRgf/YU3YcrfjE9ahLodQ6K1m6AsEPurAgSFuqqTcwN6bkNIp/Z6P/NFcTu
         CUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754879245; x=1755484045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xslMt/NExvfPIQBfixpVYmv0aftSa67Btq8uVf+dkXs=;
        b=MVneasNrfCsdZNoi40A7u/EpjRN8x/AYfg32Rj/KVtrB4nWllYlFB/68aWlmORmbQJ
         9q+syouKKGaqGw43DjYdrsKU53huO+nctSrXIAHuMvL4jh0KMGs0OEQdTYKeiY701W/y
         RQK7Jf5dMb9mquH1/Srk8hSlh6bx4oPinIU+/JA03zVbizGH3UFUzTKYK3DlQATO18Sm
         ODgfbkSXqMMqL0Oaq6g0UEVh+nswAEb0NXwAH5vVlsdeY5zmcmYSVYjbAAhFrT7w9gL2
         Rg5kJkv5oJIxpsBb4MfrZWwlIi6h07MaoKr4aRQ1HOf3xnH7H9fg8UeTHpyp4F8t+lq7
         Rf5g==
X-Forwarded-Encrypted: i=1; AJvYcCUuFKKLMR5J+oITqifQYAuw94okvODh6QQEqZr/VGR3Gc1bmv2VaQPgSH8FbV142dRhgXhzPzvJGi8W61JT@vger.kernel.org, AJvYcCVX5LfVI5U3ZL/LeGSG2LILLoAEqbtP6T8SBlsotnTKj9vOLUAYS871V9U9B+4MWo0c5yvK34H6uKxl@vger.kernel.org, AJvYcCXbGY53HN8vOogiTdvph5jD67qZr37R4siuV03uFMQLWiMbezo2QRNSEAKtebuD+u05H0GZtsbVfSX6rII=@vger.kernel.org, AJvYcCXkg7CMN2X734MCPbPCQ4pHjeIGpg2+rhfeo3QE776BwaoH9Xz96p7mpyhxUISlZc1UnRfjA5NN/UZXvTgf2s3dXBZ/HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeYvAVp10UbsiYGiv4HK3hmktZmnX1xJnEjUR/l7amZv7YA95e
	9GsCT/iqcWASiHcaKB61L7okOrRkanSli2XiCouoruFcC7P9Ujb1lYEQ6WlmZA==
X-Gm-Gg: ASbGncv1GhVv6iSILmRiKQex2xaayYkoLUBCpcO8gSFKDS4XYFDFt/me68BRl+NJv9a
	rOTCJ7IDpXwPFC+HbN5tlW23z+f52mScIZvmkF6/+udr3xtp0l2z6McJCwNNPOcX62eKHi8Ihy4
	GEexjujrY9C+pwNToZ4MHezpt8F2FFYitQDgnkelR9mzCuh+M0hX8jYgMuNXswRsbjVAKD9Vjfe
	d1OqGK8E9ttbwj/h/+5dvd+5Wr3lt2Rcd3fkMptUUI6iQ6B6XZoXHJ384JjaVdUoXayDqrZRYIQ
	/A/MM2Ovhy/1CATxzc4x22wwtTBg+Jin21bUKX0week1sfQAjgL0jro83Abfa9hLS7b6KHhXzSG
	tryX5hNkTHZdVHF/TQ0ESZR8=
X-Google-Smtp-Source: AGHT+IF4W3uH1gueWAxmlk3UPjhyyXbryqb+gwcqzXF5ZvDE1+kn1zeMIZFQMxtqyDIKQWXJN2kWpw==
X-Received: by 2002:a17:902:ebc6:b0:242:9bbc:3644 with SMTP id d9443c01a7336-242c225a177mr151867975ad.54.1754879244961;
        Sun, 10 Aug 2025 19:27:24 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:69d7:30de:b05e:915b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2422ba1e09csm233091565ad.16.2025.08.10.19.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 19:27:24 -0700 (PDT)
Date: Sun, 10 Aug 2025 19:27:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Lee Jones <lee@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, linux <linux@treblig.org>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 05/21] x86/platform: select legacy gpiolib interfaces
 where used
Message-ID: <npijagtgyad33xxlq46b7kwzydhcgt5tkgd5ihsjl6t4czbqyf@umovipwh73i2>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-6-arnd@kernel.org>
 <aJccS7fdcx0INYTA@smile.fi.intel.com>
 <3190334c-538d-4e2d-80a4-6e24b255e844@app.fastmail.com>
 <9bc69944-a34e-4a4e-9071-7d2049d12449@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bc69944-a34e-4a4e-9071-7d2049d12449@kernel.org>

Hi Hans,

On Sun, Aug 10, 2025 at 05:12:46PM +0200, Hans de Goede wrote:
> Hi Arnd, Andy,
> 
> On 9-Aug-25 9:44 PM, Arnd Bergmann wrote:
> > On Sat, Aug 9, 2025, at 12:00, Andy Shevchenko wrote:
> >> On Fri, Aug 08, 2025 at 05:17:49PM +0200, Arnd Bergmann wrote:
> >>> From: Arnd Bergmann <arnd@arndb.de>
> >>>
> >>> A few old machines have not been converted away from the old-style
> >>> gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
> >>> symbol so the code still works where it is needed but can be left
> >>> out otherwise.
> >>
> >>> --- a/drivers/platform/x86/x86-android-tablets/Kconfig
> >>> +++ b/drivers/platform/x86/x86-android-tablets/Kconfig
> >>> @@ -8,6 +8,7 @@ config X86_ANDROID_TABLETS
> >>>  	depends on I2C && SPI && SERIAL_DEV_BUS
> >>>  	depends on GPIOLIB && PMIC_OPREGION
> >>>  	depends on ACPI && EFI && PCI
> >>> +	select GPIOLIB_LEGACY
> >>>  	select NEW_LEDS
> >>>  	select LEDS_CLASS
> >>>  	select POWER_SUPPLY
> >>
> >> Hmm... This is a surprising change. But I leave it to Hans.
> 
> Yes I was surprised by this myself since I explicitly removed
> all legacy GPIO use from the x86-android-tablets code a while
> ago (or so I thought).
> 
> > I think the only function that still needs it is
> > x86_android_tablet_probe() doing
> > 
> > static struct gpio_keys_button *buttons;
> > 
> >                 for (i = 0; i < dev_info->gpio_button_count; i++) {
> >                         ret = x86_android_tablet_get_gpiod(dev_info->gpio_button[i].chip,
> >                                                            dev_info->gpio_button[i].pin,
> >                                                            dev_info->gpio_button[i].button.desc,
> >                                                            false, GPIOD_IN, &gpiod);
> > 
> >                         buttons[i] = dev_info->gpio_button[i].button;
> >                         buttons[i].gpio = desc_to_gpio(gpiod);
> >                         /* Release GPIO descriptor so that gpio-keys can request it */
> >                         devm_gpiod_put(&x86_android_tablet_device->dev, gpiod);
> >                 }
> > 
> > So the driver itself uses gpio descriptors, but it passes
> > some of them into another driver by number. There is probably
> > an easy workaround that I did not see.
> 
> Ah I see, so this is basically in the same boat as
> drivers/input/misc/soc_button_array.c which also first
> gets a gpio_desc and then calls desc_to_gpio() to store
> the GPIO number in struct gpio_keys_button which is passed
> as platform_data to drivers/input/keyboard/gpio_keys.c
> 
> The gpio_keys driver then converts things back
> into a gpio_desc in gpio_keys_setup_key()
> using devm_gpio_request_one() + gpio_to_desc()
> 
> So it looks like we need to add a gpiod member to
> struct gpio_keys_button (include/linux/gpio_keys.h)
> and modify gpio_keys.c to prefer that over using
> button->gpio, something like the attached patch
> basically.
> 
> I won't have time to work on this until September,
> so if someone wants to take the attached patch and run
> with it go for it.
> 
> Note the x86-android-tablets / soc_button_array code
> will become responsible for requesting / releasing
> the gpiod when using the new gpio_keys_button.gpiod
> member.
> 
> For the x86-android-tablets code this is easy, just drop
> these 2 lines:
> 
>                         /* Release GPIO descriptor so that gpio-keys can request it */
>                         devm_gpiod_put(&x86_android_tablet_device->dev, gpiod);
> 
> And for soc_button_array.c it is _probably_ just a matter
> of switching to devm_gpiod_get_index() and drop the
> gpiod_put().
> 
> I have hardware to test both the x86-android-tablets
> code as well as the soc_button_array code. I might be
> able to do a quick test on August 22nd or 29th.

I just sent out a v2 of my series from '23 converting
x86-android-tablets to use PROPERTY_ENTRY_GPIO(), including converting
buttons and switches:


https://lore.kernel.org/all/20250810-x86-andoroid-tablet-v2-0-9c7a1b3c32b2@gmail.com/

I do not have hardware so it probably is busted but if you could make it
work that would be great.

Thanks.

-- 
Dmitry

