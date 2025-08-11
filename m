Return-Path: <linux-gpio+bounces-24222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905DDB217FD
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 00:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B924C463196
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 22:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A212E4241;
	Mon, 11 Aug 2025 22:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2QG2YWq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDEF2E3398;
	Mon, 11 Aug 2025 22:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754950352; cv=none; b=A9pYowKrAVjVkYsPSOEiRrFvus3ks6bezHXof7QTcpPMPPjPV5/pCWA7aQNeCx20QfEtHp2b10QnLcuUGXxGKIYjs1j5ROn8HmaXGyot+v00arXDo1/v7uQYVl0WZjFF0TqnX47HLXNzRBCpNuB21OM4+RO5NpCXF1G/fArxImc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754950352; c=relaxed/simple;
	bh=0lFlTnmRdYlJuefLalXJ+MDNBg2V7j3tqehFPcGA5RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJPIHRcIvwx5NHRqcrt/D3epHoMuVRm0OrpyUlRWuAWmihMwm71IJHsmeCvn5dX+LPIkrJOhq2XrVHO/oW4241MFWoOV3bkPZ09U4bIc1gVYMVldc7ELi7luVgzT5D0Tx6C+2k9NcBqepG4k/mqv5UcYZJ6G/b+CSLwu9WCVZMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2QG2YWq; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23ffa7b3b30so44924555ad.1;
        Mon, 11 Aug 2025 15:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754950350; x=1755555150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RqJrUsfEO14skXwVHw60ZeSAxfYi13UplTdLpgZgptc=;
        b=M2QG2YWq29Hq787SB2rUsbGYk8QMgPXxusvrLrnclHHWZqSLpgS5QITsge+M16OlCk
         WQPUMxzhbXZPZGYmZr7xIEEez15K1QjK0TJ5tDuMz3E8jkb0V3baGn8xjvCkkCpWGfg0
         MyXqYI2YTYMpCCuO6MlAOPSxAKhW32yY7JAMXHbVJC+qbpo3O5PwKMDiVUIjhJMmqqi2
         MjIlJPg7if3pSr93GnU+/JdKiJdZsUn6hx+hfGbs5dddlC8f23OiSvEeKL1oJ/MXCagV
         YxWnnlJkyluVL/0WOusS0cGcpFjdTF9pxLneSDPlsrhBciJtQ9ZcXY2wUNxZJKO5tJC7
         7ZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754950350; x=1755555150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqJrUsfEO14skXwVHw60ZeSAxfYi13UplTdLpgZgptc=;
        b=M57FKboOeHttsi/lhdgKws6yis2LFaZW/LihzWsdDPI5BkZMVgioKyKVoLG1fB4Urg
         E6PKzHueiQhchjSfh1z06Z5LeRQqqPEyIFPIumHl4QoJmnk5kv+cCcDAKgRyugMWS21D
         cTn2/MBawL+OQ9O2Uar6olZ1gv/w0TnVQx4ugxcx4Z12Kv/QP66Fkbz1J38k7HY3BabX
         wQBg4ro7vxB/uHHcKLUeBEazu8bD+ywa157ZScz6HSXKtj4z9bSRnJeP1PcZJWgyaelY
         Are2lNjwFECtbwXhCAC82G1W+a/94rSFqUU6Wl57UQ/Kg0BVZYTXFdi0dZwhjkrCr2Kl
         hycw==
X-Forwarded-Encrypted: i=1; AJvYcCUcuy7wr9Zed9zlNnhWejciENR0DcvsA7nGGwYZmDBKRKwX/tMlh9IFLRLq4/8snqZIPRPdk1xf00gz@vger.kernel.org, AJvYcCUfmYWDuVK2h8bGe407MTlvazwbwZ0IdedgCqSSFpOuSldGRugQxm5LbdTO6yiKH4M6Xk8KoF3NGitORrLb@vger.kernel.org, AJvYcCVoq0rGFD/DYICoj8ezECq2y2qYX/eDy53KTCpbjDgqfwi2Tmkb3pGJOX/seOP01sw+rP+OWe8omvue@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx9IrCH6rOoJgXmckmC8VLSvsS2dZgczebV7YfTeCMgOl8SDI/
	tC3urpvdpxKWBu9SfQF4m0Pa9NZw9upxCuwnrkGpOjtvtxI6bOp3kGEc
X-Gm-Gg: ASbGncv5waYmkiaKVSrJqDk9gkMJG0MmuXL1SujBKfOfKfkj/aeUBFuKj+5CtGIBvK/
	UfjDs6UfGKgsEqZ56Q07C9muBVzmOAk1RNzz7w93mxxgyIoTkR1FNHHgYYzT9X8hgzscQ0fVEPh
	t8CTZFh+aFEfJSSFZge0mczVyEGDvaDlT3HMCNpnOt5j1Kl8JQaPBXlZhhNrwQTuKG6yxjayrE/
	OZdNz/j5lF4D8LVd5/kXi/6/y7Betc6Ysg360QLA3z70TriLjoy+pjQRiHFRJDy1OJA3Depn9TL
	s2W5xOiJW23AM937Eas2a6Sgp6huBkrswGSXQ+K3Ccldb0814Mk8gXW/Vjq4McsKXPdQUiI9bHB
	D1MjOlMJp8f1q/jAN89kH6A4ZY+wEZWZU1Q==
X-Google-Smtp-Source: AGHT+IHQ0wKiPFm7cQpdNNp8qTVDuZceywWB+nCRVoQFGfyGYnmGBMcF0PmiZ748OX9kCYU59/mZzg==
X-Received: by 2002:a17:902:ea08:b0:240:1bdc:afc3 with SMTP id d9443c01a7336-242c225a785mr207173445ad.44.1754950349923;
        Mon, 11 Aug 2025 15:12:29 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7933:7499:67d8:279a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976a1csm285249835ad.78.2025.08.11.15.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 15:12:29 -0700 (PDT)
Date: Mon, 11 Aug 2025 15:12:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 19/21] usb: udc: pxa: remove unused platform_data
Message-ID: <jlhn73mol2g65mnbfya7w4ejtkddkkus4miii6js44x7rni2x4@54tm5dblenk4>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-20-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808151822.536879-20-arnd@kernel.org>

On Fri, Aug 08, 2025 at 05:18:04PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> None of the remaining boards put useful data into the platform_data
> structures, so effectively this only works with DT based probing.
> 
> Remove all code that references this data, to stop using the legacy
> gpiolib interfaces. The pxa27x version already supports gpio
> descriptors, while the pxa25x version now does it the same way.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-pxa/devices.c              |  7 ----
>  arch/arm/mach-pxa/gumstix.c              |  1 -
>  arch/arm/mach-pxa/udc.h                  |  8 -----
>  drivers/usb/gadget/udc/pxa25x_udc.c      | 41 ++++++++----------------
>  drivers/usb/gadget/udc/pxa25x_udc.h      |  2 +-
>  drivers/usb/gadget/udc/pxa27x_udc.c      | 35 +++-----------------
>  drivers/usb/gadget/udc/pxa27x_udc.h      |  2 --
>  include/linux/platform_data/pxa2xx_udc.h | 15 ---------
>  8 files changed, 19 insertions(+), 92 deletions(-)
>  delete mode 100644 arch/arm/mach-pxa/udc.h
> 
> diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
> index 7695cfce01a1..edad956a1483 100644
> --- a/arch/arm/mach-pxa/devices.c
> +++ b/arch/arm/mach-pxa/devices.c
> @@ -11,7 +11,6 @@
>  #include <linux/platform_data/i2c-pxa.h>
>  #include <linux/soc/pxa/cpu.h>
>  
> -#include "udc.h"
>  #include <linux/platform_data/video-pxafb.h>
>  #include <linux/platform_data/mmc-pxamci.h>
>  #include "irqs.h"
> @@ -83,10 +82,6 @@ void __init pxa_set_mci_info(const struct pxamci_platform_data *info,
>  		pr_err("Unable to create mci device: %d\n", err);
>  }
>  
> -static struct pxa2xx_udc_mach_info pxa_udc_info = {
> -	.gpio_pullup = -1,
> -};
> -
>  static struct resource pxa2xx_udc_resources[] = {
>  	[0] = {
>  		.start	= 0x40600000,
> @@ -108,7 +103,6 @@ struct platform_device pxa25x_device_udc = {
>  	.resource	= pxa2xx_udc_resources,
>  	.num_resources	= ARRAY_SIZE(pxa2xx_udc_resources),
>  	.dev		=  {
> -		.platform_data	= &pxa_udc_info,
>  		.dma_mask	= &udc_dma_mask,
>  	}
>  };
> @@ -119,7 +113,6 @@ struct platform_device pxa27x_device_udc = {
>  	.resource	= pxa2xx_udc_resources,
>  	.num_resources	= ARRAY_SIZE(pxa2xx_udc_resources),
>  	.dev		=  {
> -		.platform_data	= &pxa_udc_info,
>  		.dma_mask	= &udc_dma_mask,
>  	}
>  };
> diff --git a/arch/arm/mach-pxa/gumstix.c b/arch/arm/mach-pxa/gumstix.c
> index 1713bdf3b71e..6074815a4bca 100644
> --- a/arch/arm/mach-pxa/gumstix.c
> +++ b/arch/arm/mach-pxa/gumstix.c
> @@ -39,7 +39,6 @@
>  
>  #include "pxa25x.h"
>  #include <linux/platform_data/mmc-pxamci.h>
> -#include "udc.h"
>  #include "gumstix.h"
>  #include "devices.h"
>  
> diff --git a/arch/arm/mach-pxa/udc.h b/arch/arm/mach-pxa/udc.h
> deleted file mode 100644
> index 9a827e32db98..000000000000
> --- a/arch/arm/mach-pxa/udc.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/*
> - * arch/arm/mach-pxa/include/mach/udc.h
> - *
> - */
> -#include <linux/platform_data/pxa2xx_udc.h>
> -
> -extern void pxa_set_udc_info(struct pxa2xx_udc_mach_info *info);
> -
> diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
> index b97fb7b0cb2c..bad151aedec1 100644
> --- a/drivers/usb/gadget/udc/pxa25x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa25x_udc.c
> @@ -12,7 +12,7 @@
>  /* #define VERBOSE_DEBUG */
>  
>  #include <linux/device.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/ioport.h>
> @@ -261,24 +261,12 @@ static void nuke (struct pxa25x_ep *, int status);
>  /* one GPIO should control a D+ pullup, so host sees this device (or not) */
>  static void pullup_off(void)
>  {
> -	struct pxa2xx_udc_mach_info		*mach = the_controller->mach;
> -	int off_level = mach->gpio_pullup_inverted;
> -
> -	if (gpio_is_valid(mach->gpio_pullup))
> -		gpio_set_value(mach->gpio_pullup, off_level);
> -	else if (mach->udc_command)
> -		mach->udc_command(PXA2XX_UDC_CMD_DISCONNECT);
> +	gpiod_set_value(the_controller->pullup_gpio, 0);
>  }
>  
>  static void pullup_on(void)
>  {
> -	struct pxa2xx_udc_mach_info		*mach = the_controller->mach;
> -	int on_level = !mach->gpio_pullup_inverted;
> -
> -	if (gpio_is_valid(mach->gpio_pullup))
> -		gpio_set_value(mach->gpio_pullup, on_level);
> -	else if (mach->udc_command)
> -		mach->udc_command(PXA2XX_UDC_CMD_CONNECT);
> +	gpiod_set_value(the_controller->pullup_gpio, 1);
>  }
>  
>  #if defined(CONFIG_CPU_BIG_ENDIAN)
> @@ -1190,8 +1178,7 @@ static int pxa25x_udc_pullup(struct usb_gadget *_gadget, int is_active)
>  
>  	udc = container_of(_gadget, struct pxa25x_udc, gadget);
>  
> -	/* not all boards support pullup control */
> -	if (!gpio_is_valid(udc->mach->gpio_pullup) && !udc->mach->udc_command)
> +	if (!udc->pullup_gpio)
>  		return -EOPNOTSUPP;
>  
>  	udc->pullup = (is_active != 0);
> @@ -2343,19 +2330,17 @@ static int pxa25x_udc_probe(struct platform_device *pdev)
>  
>  	/* other non-static parts of init */
>  	dev->dev = &pdev->dev;
> -	dev->mach = dev_get_platdata(&pdev->dev);
>  
>  	dev->transceiver = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
>  
> -	if (gpio_is_valid(dev->mach->gpio_pullup)) {
> -		retval = devm_gpio_request_one(&pdev->dev, dev->mach->gpio_pullup,
> -					       GPIOF_OUT_INIT_LOW, "pca25x_udc GPIO PULLUP");
> -		if (retval) {
> -			dev_dbg(&pdev->dev,
> -				"can't get pullup gpio %d, err: %d\n",
> -				dev->mach->gpio_pullup, retval);
> -			goto err;
> -		}
> +	dev->pullup_gpio = devm_gpiod_get_index_optional(&pdev->dev, "pullup", 0,
> +						    GPIOD_OUT_LOW);

I think this should be GPIOD_OUT_HIGH: you want this to be active and
GPIO is likely "active low".

Thanks.

-- 
Dmitry

