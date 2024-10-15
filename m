Return-Path: <linux-gpio+bounces-11350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3DB99E2C3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 11:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FACB1C21A97
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 09:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD8E1DD55A;
	Tue, 15 Oct 2024 09:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VJ25AqOi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FEE1BE854;
	Tue, 15 Oct 2024 09:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728984442; cv=none; b=Q1Y6TRi6GvGTQKt7ynsR1oX3otBEd+BDhJHoPC6E030DckyucwTxomSlIaXXyBnE7FyZqK35U3g5NuNkeloMQevC6E6sMnXnf3miq8kJ4i3oPvAFy3y8kXu3odu/W+kB1qJhgOjCxMAKY92NetNtqdUGHbTUghSEwuqAi59S2o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728984442; c=relaxed/simple;
	bh=sUyNLwgvdyHnZjnJWQfiCuf+BL42Uc3XJFAl7cruPN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fr72Y7gNctucuOIaqVJO2epJAE7ADNtXcraiRhR1uU2kDIe645jDfz/2BLFD4a9BTrixV0Y7DJkninJDNbKdXn6GKwS47stQcCLzGTGVvIlrg1bjXhl5STaoUIWhN6VmW5Z8gbhrXStKnFkOUEoJP2usK/KWIxEIq9pl+toSbAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VJ25AqOi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296C8C4CEC6;
	Tue, 15 Oct 2024 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728984441;
	bh=sUyNLwgvdyHnZjnJWQfiCuf+BL42Uc3XJFAl7cruPN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJ25AqOiDE0QjNFKL5wK+Bhf81LORAA+oOT4+xHtugKBpF2VZhMvIGJxM8XBPqvYW
	 6K3r6edYD14b5c0oFFne5a3zpVTJV469BNm1sFVezo444pvFwCPvsj11reNHlpcHnT
	 KSmsLF1rCTDDWON1bOeH2kWvqYW51418mEAzl4zA=
Date: Tue, 15 Oct 2024 11:27:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio: create the /sys/class/gpio mount point with
 GPIO_SYSFS disabled
Message-ID: <2024101510-shifter-pursuable-ded5@gregkh>
References: <20241015-gpio-class-mountpoint-v2-0-7709301876ef@linaro.org>
 <20241015-gpio-class-mountpoint-v2-2-7709301876ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015-gpio-class-mountpoint-v2-2-7709301876ef@linaro.org>

On Tue, Oct 15, 2024 at 10:00:24AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> User-space may want to use some kind of a compatibility layer for the
> deprecated GPIO sysfs ABI. This would typically involve mounting
> a fuse-based filesystem using the GPIO character device to emulate the
> sysfs behavior and layout.

Ick, no, don't mount a filesystem in /sys/class/ that's crazy, and
wrong.  See my other response for why.

> With GPIO_SYSFS disabled, the /sys/class/gpio directory doesn't exist
> and user-space cannot create it.

userspace should NOT be creating it.

> In order to facilitate moving away from
> the sysfs, add a new Kconfig option that indicates to GPIOLIB that is
> should create an always-empty directory where the GPIO class interface
> would exist and enable this option by default if GPIO_SYSFS is not
> selected.

No, either support a real sysfs api here, or don't.  Don't paper over
the api change by allowing this type of fake interface to live here,
that is just going to be a maintance nightmare.  Attempting to push the
"we don't support this user/kernel api anymore" off to a userspace
developer is not how to do kernel development.

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/Kconfig   | 18 ++++++++++++++++++
>  drivers/gpio/gpiolib.c |  6 ++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index efddc6455315..1a3535bda779 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -69,6 +69,24 @@ config GPIO_SYSFS
>  	  use the character device /dev/gpiochipN with the appropriate
>  	  ioctl() operations instead.
>  
> +config GPIO_SYSFS_CLASS_MOUNT_POINT
> +	bool "Create empty /sys/class/gpio directory" if EXPERT
> +	depends on !GPIO_SYSFS
> +	default y

Only "default y" if you can not boot without this enabled.  I doubt
that's the case here.  If it is the case here, then don't remove the
sysfs api in the first place.

And why is it being removed?  Who relies on it that can't live with it
being gone?


> +	help
> +	  Say Y here to create an empty /sys/class/gpio directory.
> +
> +	  User-space may want to use some kind of a compatibility layer for the
> +	  deprecated GPIO sysfs ABI. This would typically involve mounting
> +	  a fuse-based filesystem using the GPIO character device to emulate
> +	  the sysfs behavior and layout.
> +
> +	  This option makes GPIOLIB create an empty directory at /sys/class/gpio
> +	  where user-space can mount the sysfs replacement and avoid having to
> +	  change existing programs to adjust to different filesystem paths.
> +
> +	  If unsure, say Y.
> +
>  config GPIO_CDEV
>  	bool
>  	prompt "Character device (/dev/gpiochipN) support" if EXPERT
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 97346b746ef5..1c8bd765d8e1 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4899,6 +4899,12 @@ static int __init gpiolib_dev_init(void)
>  		return ret;
>  	}
>  
> +#if IS_ENABLED(CONFIG_GPIO_SYSFS_CLASS_MOUNT_POINT)
> +	ret = sysfs_create_mount_point(class_kobj, "gpio");
> +	if (ret)
> +		pr_err("gpiolib: failed to create the GPIO class mountpoint\n");
> +#endif /* CONFIG_GPIO_SYSFS_CLASS_MOUNT_POINT */

Nit, I think we know what the #endif is for, it was only 3 lines above :)

thanks,

greg k-h

