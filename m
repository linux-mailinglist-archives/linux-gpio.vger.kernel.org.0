Return-Path: <linux-gpio+bounces-7420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49267906988
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 12:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D30F2B27989
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 10:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF6A1411D2;
	Thu, 13 Jun 2024 10:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h5h1xFfn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B6E13E3E4;
	Thu, 13 Jun 2024 10:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718272935; cv=none; b=EgTkNKJRe1iGwKIeBynIgayfOwUvhqNU8oXG7NVHWhqedC/Y2+8cAi5ScHDPD7Aac/WbKZ+s2by+vQ7Hy25Enr/c5iKjV9+yBAHcDHLKve7UUarsVFnAPWcK5fNMWefEBkCy8/F05MriNlGhVPqbD/gHz+ekPCDEdRTAR2icTD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718272935; c=relaxed/simple;
	bh=iCniW7uaePOA1dtXDeiFM/T5PxkRK0/PIhc03+M6UJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDhTR4oaz8gqiXjrQsR/EI9LJg5vWBI7RBpVk6X/O72HR6Ri2ZE79x4RcUG1fnrjnEFShisCyGaS0QhhnM8JnIa8IZwojrVr73B3135VtFXsSF9iys7zm43TxlPNhpIlUEkN7DlBwkpiGKnL7SuQDwXL/qhE3zSbJq8Pk9cODMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h5h1xFfn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04449C2BBFC;
	Thu, 13 Jun 2024 10:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718272934;
	bh=iCniW7uaePOA1dtXDeiFM/T5PxkRK0/PIhc03+M6UJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h5h1xFfnpqdoYAX5OMp1h61xokPvKyrgu5pu422puTTxN2YhTSI2v0Shv/Y3+4wV6
	 Dj0U91kSaCPvN1AkbmJ/GyOlCUAXr6NkuHeIH+ZjKfYJfPFa19cMTv3qbLK7f6jb4W
	 ePTXHeELzSZk+Dr7orn5UDGZN3vOC/FfRJOAE4sk=
Date: Thu, 13 Jun 2024 12:02:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v8 2/2] misc: gpio-virtuser: new virtual testing driver
 for the GPIO API
Message-ID: <2024061356-uptake-ideology-e57b@gregkh>
References: <20240613092830.15761-1-brgl@bgdev.pl>
 <20240613092830.15761-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613092830.15761-3-brgl@bgdev.pl>

On Thu, Jun 13, 2024 at 11:28:30AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The GPIO subsystem used to have a serious problem with undefined behavior
> and use-after-free bugs on hot-unplug of GPIO chips. This can be
> considered a corner-case by some as most GPIO controllers are enabled
> early in the boot process and live until the system goes down but most
> GPIO drivers do allow unbind over sysfs, many are loadable modules that
> can be (force) unloaded and there are also GPIO devices that can be
> dynamically detached, for instance CP2112 which is a USB GPIO expender.
> 
> Bugs can be triggered both from user-space as well as by in-kernel users.
> We have the means of testing it from user-space via the character device
> but the issues manifest themselves differently in the kernel.
> 
> This is a proposition of adding a new virtual driver - a configurable
> GPIO consumer that can be configured over configfs (similarly to
> gpio-sim) or described on the device-tree.
> 
> This driver is aimed as a helper in spotting any regressions in
> hot-unplug handling in GPIOLIB.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../admin-guide/gpio/gpio-virtuser.rst        |  176 ++
>  Documentation/admin-guide/gpio/index.rst      |    1 +

sysfs documentation needs to go in Documentation/ABI/ not in a random
.rst file where the tools that check this will not catch it.

>  MAINTAINERS                                   |    8 +
>  drivers/misc/Kconfig                          |    8 +
>  drivers/misc/Makefile                         |    1 +
>  drivers/misc/gpio-virtuser.c                  | 1790 +++++++++++++++++

Why not put this in drivers/gpio/?  Why misc?

> +Both attributes allow to read and set arrays of GPIO values. User must pass
> +exactly the number of values that the array contains in the form of a string
> +containing zeroes and ones representing inactive and active GPIO states
> +respectively. In this example: ``echo 11 > values``.

sysfs is "one value per file", so why are there multiple values here?

If you want to just use this for testing, and want to put whatever you
want in the files, just use debugfs, that's what it is there for, not
sysfs.

> +config GPIO_VIRTUSER
> +	tristate "GPIO Virtual User Testing Module"
> +	select CONFIGFS_FS
> +	select IRQ_WORK
> +	help
> +	  This enables the configurable, configfs-based virtual GPIO consumer
> +	  testing driver.
> +

module name?

And you need more documentation here, I have no idea what this means
when it shows up in a Kconfig help entry :(

thanks,

greg k-h

