Return-Path: <linux-gpio+bounces-22660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CF3AF600C
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 19:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EED6170537
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 17:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129C721D3EC;
	Wed,  2 Jul 2025 17:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Clj8hYgu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB852F50B2;
	Wed,  2 Jul 2025 17:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477484; cv=none; b=h/tkRHVoqbwPqc58nIrrh6BXBNEZrS+68kL/9+VLSHzi+6TfN85wUmyfDR+4/Hnj9ObegTLYTmCxH+YIesJMXdFIT50sq1nW1Lvygm6elOH3d6UosZ2Is7gjxxidT1MvnMsvS+xN1NbxrD6YDpJ/mvtHRoYYSKa60GzmwoSIL5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477484; c=relaxed/simple;
	bh=G+orHAF8XOTCINVvtBezAeB2WIZ6YVp5CgWCAcP9hLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uF6QGLsRFl5R13s+rzlLAaDlo2aOtN8jg3EOD/QDcyp27Izdpskc+r+nJvs54udysv+t8xuaIVkTXC3bL3oPYB0P2P6U8b3zngGtSWxwv8e8UuQ+lZdJrcvom7mRrRYV9+wdYyfpPpXIfPbgRRkoSzM0JWn8eyDRmzS/kFy6cy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Clj8hYgu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso49250535e9.2;
        Wed, 02 Jul 2025 10:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751477481; x=1752082281; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=asF3D2ihOKbd8HNb0tatN9FktDeMCIWfujlxMxgR2Jc=;
        b=Clj8hYguhUclxeJJ7l/bvzhhEl7o6ktP3A1TZfckAxUerydG9/4c6rjam0DBsxmRiN
         8cozz+6a9DRnKHAXVsWFhqOi1FF/5EpHic7wBahe8gQ3Sz3aBfwaUh3R7x4h04J3GR40
         6EfJxDj7BCTtoApGXLHNsFEUL58hSOWfGbhGaBZJWvOOMYLnCI5MuxsgVN1Xu7KJ0iWi
         bdiVFMfYkFv4Fh6RW0nhi4rqh60jDAhBoUJIx+ZUSHTR+NyiwCGN42HPLZSjyxM2t70M
         Gg3J7+FgCuNNAW22PzFVh+CxBUPpWLEd7WUGZtgJ1Nud05YV7I+we/OZ1ew/5Uoj+8BS
         gFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751477481; x=1752082281;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=asF3D2ihOKbd8HNb0tatN9FktDeMCIWfujlxMxgR2Jc=;
        b=d7OrW6cT0vCmcmiFHb4PCupiS20e++aOhbv6oDPjdnsvOTgBVJKeeFLmtYhA/rPwW9
         eQO+uSfDS0h80KZuqwl85qYwQFErspMwvphFNAnC8IaXcyA9pGoDYuexASPbpka3ShqK
         7I/4WURs5Madb/uXxA198w/U+RBij4UsvUiCoof7Erp2zGJfCvy98mhrTqYIQ1cd95gW
         lf4SSMAzRzRBxyK7f3bUFSTNYkWWTeWYJ9Orkcm9bOHMPEHSi1g6kDJ/NP60D50uyroj
         DX91AQDOkhqTvZrCcIG4G0ENLGTSXoqyvaF0g96VE0lPz3YBWsluKR3SZVW+ph+i23eF
         3IHg==
X-Forwarded-Encrypted: i=1; AJvYcCV1kjiqy+oMySqjIXmGVTN3tmchhc5YJ2v4hR7RQlpsLGXN0LRQ3Qcq+D3ULdnLKL15w3Hv8cHNroYgv2c=@vger.kernel.org, AJvYcCVfizXybdxFtuANcVwJH4Ksu7+bN3Y19gkMOm6MJlzIntPzI7VbMAyxI2geZw9587nLJtgXREp/yW/zuA==@vger.kernel.org, AJvYcCWyY3pNhwMzbeex6SQ2K2bhIG6tZY5kyYCQ07fqZ7o9EJ91hDs8Wle0xp/EgfDpIo2eAVcLT5QgbnuYB1etCaPMbNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIc+1jBZtzJp/94b6ZCa3qUzSzeTRDJzYlapktzOT98GzaKSck
	IruZ9f9D5N27yxNpa9lOi6di3oT1ybftTytWhtSdOrhbYw3kju6laLrc
X-Gm-Gg: ASbGnctDBF/QXKOjl/o+L7Y17KCZJF0uQkXxCCAqn55lOc46Ia9Wreko+z2Sd6jne3+
	Xn8Jd1qWUR5tHJwpsAiCGax9qbleqwqJlJi7Wt48/sbi1yyiezJKwkppIU13t+CGYJ8ITA0hS4k
	KNE2KZTizVa0UYwAcQMKRHLOcNF/pYn/ttxD9n5t0JZf4oll420SBRSpN4mdpL7hzqqdLp9taFj
	PGnbiMvtEHf4rQZiyAKQCU/1AbsN7tb7pS4DpKdZza6r26RTHDAkBKwfH41XvH16bxlql+bAPrE
	sC4VU1MH0+djClLaLZ5h5WdcPl/Zr4XuTRGuOBPGAg6mVO4YFPYi0giC+Vn/zofGI3Vrh0zOY+/
	0xG/L0BtsTtlYwT5C4dbrV34MTuvf4DnywEM1zR9vfOLBMg0VyKRO
X-Google-Smtp-Source: AGHT+IEy0lczmqisRYiq55PfynlMUAy8/Mwfp/b6dz/a8xMr1aLb26ndDyLOvjuXrp6A/iZDlNiYZg==
X-Received: by 2002:a05:600c:4745:b0:445:49e:796b with SMTP id 5b1f17b1804b1-454a9cc478dmr6992135e9.17.1751477481011;
        Wed, 02 Jul 2025 10:31:21 -0700 (PDT)
Received: from dell.localnet (2a01-114f-400e-9dc0-0000-0000-0000-0540.ea.ipv6.supernova.orange.pl. [2a01:114f:400e:9dc0::540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52ca4sm16687615f8f.58.2025.07.02.10.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 10:31:20 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject:
 Re: [PATCH RFT v2 4/6] ARM: omap1: ams-delta: use generic device properties
 for gpio-mmio
Date: Wed, 02 Jul 2025 19:31:18 +0200
Message-ID: <12693741.O9o76ZdvQC@dell>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-4-ebf34d273497@linaro.org>
References:
 <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
 <20250701-gpio-mmio-pdata-v2-4-ebf34d273497@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5899106.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5899106.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Date: Wed, 02 Jul 2025 19:31:18 +0200
Message-ID: <12693741.O9o76ZdvQC@dell>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-4-ebf34d273497@linaro.org>
MIME-Version: 1.0

On Tuesday, 1 July 2025 13:49:38 CEST Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The two latch GPIO devices in ams-delta are registered with struct
> bgpio_pdata passed as platform_data to the gpio-mmio driver. We want to
> remove the bgpio_pdata from the kernel and the gpio-mmio driver is now
> also able to get the relevant values from the software node. Set up
> device properties and switch to using platform_device_info to register
> the devices as platform_add_devices() doesn't allow us to pass device
> properties to the driver model.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

> ---
>  arch/arm/mach-omap1/board-ams-delta.c | 42 +++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
> index 0daf6c5b5c1cbcfd5bd15203cad119d39aa95f19..16392720296cd224732450c85419c35bbab506f6 100644
> --- a/arch/arm/mach-omap1/board-ams-delta.c
> +++ b/arch/arm/mach-omap1/board-ams-delta.c
> @@ -19,6 +19,7 @@
>  #include <linux/mtd/nand-gpio.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/regulator/fixed.h>
>  #include <linux/regulator/machine.h>
> @@ -175,20 +176,18 @@ static struct resource latch1_resources[] = {
>  
>  #define LATCH1_LABEL	"latch1"
>  
> -static struct bgpio_pdata latch1_pdata = {
> -	.label	= LATCH1_LABEL,
> -	.base	= -1,
> -	.ngpio	= LATCH1_NGPIO,
> +static const struct property_entry latch1_gpio_props[] = {
> +	PROPERTY_ENTRY_STRING("label", LATCH1_LABEL),
> +	PROPERTY_ENTRY_U32("ngpios", LATCH1_NGPIO),
> +	{ }
>  };
>  
> -static struct platform_device latch1_gpio_device = {
> +static const struct platform_device_info latch1_gpio_devinfo = {
>  	.name		= "basic-mmio-gpio",
>  	.id		= 0,
> -	.resource	= latch1_resources,
> -	.num_resources	= ARRAY_SIZE(latch1_resources),
> -	.dev		= {
> -		.platform_data	= &latch1_pdata,
> -	},
> +	.res		= latch1_resources,
> +	.num_res	= ARRAY_SIZE(latch1_resources),
> +	.properties	= latch1_gpio_props,
>  };
>  
>  #define LATCH1_PIN_LED_CAMERA		0
> @@ -213,20 +212,18 @@ static struct resource latch2_resources[] = {
>  
>  #define LATCH2_LABEL	"latch2"
>  
> -static struct bgpio_pdata latch2_pdata = {
> -	.label	= LATCH2_LABEL,
> -	.base	= -1,
> -	.ngpio	= LATCH2_NGPIO,
> +static const struct property_entry latch2_gpio_props[] = {
> +	PROPERTY_ENTRY_STRING("label", LATCH2_LABEL),
> +	PROPERTY_ENTRY_U32("ngpios", LATCH2_NGPIO),
> +	{ }
>  };
>  
> -static struct platform_device latch2_gpio_device = {
> +static struct platform_device_info latch2_gpio_devinfo = {
>  	.name		= "basic-mmio-gpio",
>  	.id		= 1,
> -	.resource	= latch2_resources,
> -	.num_resources	= ARRAY_SIZE(latch2_resources),
> -	.dev		= {
> -		.platform_data	= &latch2_pdata,
> -	},
> +	.res		= latch2_resources,
> +	.num_res	= ARRAY_SIZE(latch2_resources),
> +	.properties	= latch2_gpio_props,
>  };
>  
>  #define LATCH2_PIN_LCD_VBLEN		0
> @@ -542,8 +539,6 @@ static struct gpiod_lookup_table keybrd_pwr_gpio_table = {
>  };
>  
>  static struct platform_device *ams_delta_devices[] __initdata = {
> -	&latch1_gpio_device,
> -	&latch2_gpio_device,
>  	&ams_delta_kp_device,
>  	&ams_delta_audio_device,
>  	&ams_delta_serio_device,
> @@ -697,6 +692,9 @@ static void __init ams_delta_init(void)
>  	omap1_usb_init(&ams_delta_usb_config);
>  	platform_add_devices(ams_delta_devices, ARRAY_SIZE(ams_delta_devices));
>  
> +	platform_device_register_full(&latch1_gpio_devinfo);
> +	platform_device_register_full(&latch2_gpio_devinfo);
> +
>  	/*
>  	 * As soon as regulator consumers have been registered, assign their
>  	 * dev_names to consumer supply entries of respective regulators.
> 
> 


--nextPart5899106.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmhlbOYACgkQ2WqSnlts
jBqrFAf8Dn8vIXOgPM71DorIvYxA2dblFx/ioM03kGPEIyBdo9u5oreR8gnbeJ0M
6nL5gblHZVjt8w24qn5cS+Y2CE1hERe9+2H27nbeBUt8jR1i+oH6lMNWTxEqcARB
a6t639w3mfDggBfB6ylR/Figq2vACpInNkOMATa0czpIlHks8j/hg4we3HM7ikv/
i8+Yq5lBagufNyl4T2qtAMyR7TLvYommOqsIDJgXd5WwknQSs8doQtQUKjPh9+DF
MBYbY8jYcv6s9LeaUAjbRCXriJm6ja36+fayWHxmrHXdOZyXYxFfrUp3y9JrEZZO
ej3300qSjoZkFgKR/vnA4rJxJP6m6w==
=taj6
-----END PGP SIGNATURE-----

--nextPart5899106.DvuYhMxLoT--




