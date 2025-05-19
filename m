Return-Path: <linux-gpio+bounces-20305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 381D6ABC87E
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 22:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32FB61B65A95
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 20:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCD6219300;
	Mon, 19 May 2025 20:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NBgUCaLu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C47217F33;
	Mon, 19 May 2025 20:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747686952; cv=none; b=Cq3x7g1aKeJjBMWoXJM2h1eVPSO0cCJGoHsohERd4RIU441smykQi0DyIgUwRQiXI7NvGYw9y9GAtU0F8HUuIvluw8H59NeadVTy/IhsEbxghHp7eTCmYQPc3OVEfgENqApz7EIRrOjWE4Y4lvUVmkwv2u+62f2ZXx4B82sPBMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747686952; c=relaxed/simple;
	bh=RRfj6sklt52XV9KPvHuEGNGS2C+bYmaNrEa80a65PI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+XJPROUVftIBWmlq6sw/RKAqaQKRAhDY1Yg95+8P7GjmRqb1gJBkE7RX8UxqvBoY5Y0UB2FeNNHo8JAqVxTITYFEjnWsMh42LKw8AlBWAdQ2/aDj/uuZsXf8zaiDLR4KwnM+DOhm3LhHys23+gqrGHJb/UGJCWrLuWBoMWP6Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NBgUCaLu; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=XaOMJJ7u0iVjtCw5+/d6aptsqLr44Y26RgnYyUy9xVc=; b=NBgUCaLuUPXMiMVXiPqUaXkdef
	mlcIza4vAcC7k6AJTdxqfWCBK1Lu/hQz+GkIqtoKoI+dZu1nzxi8Z+gsRxGk4j4QIfduTINgTNxjk
	3GPe+cvaWIZCOU96gYWLGvSSDxq8mQGJReeBzAPbc+TMVYmWPVj5I1rJGRvK/fZUOQ/ug9r5lpqeW
	kLulKgVgI6/RFVnyuNRxZbParm/AeeKE82BOBAD9h7SehsOr56hEGvhkN//iiafM9bd6Bcl6I7GJH
	y+YHlENrb7Qh42nM2FlMghYJuFK/wcWd4JlwAawkiSmMFcXogA5ljX94fUaI6WTwRjSLT1xxpribk
	sINQz2DA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7D8-00000002M1C-1ryQ;
	Mon, 19 May 2025 20:35:46 +0000
Message-ID: <e50896d2-f44a-42da-8bfc-446e80980e80@infradead.org>
Date: Mon, 19 May 2025 13:35:42 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] gpiolib-acpi: Update file references in the
 Documentation and MAINTAINERS
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Dongliang Mu <dzm91@hust.edu.cn>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250516095306.3417798-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250516095306.3417798-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/16/25 2:52 AM, Andy Shevchenko wrote:
> The recent changes in the gpiolib-acpi.c need also updates in the Documentation
> and MAINTAINERS. Do the necessary changes here.
> 
> Fixes: babb541af627 ("gpiolib: acpi: Move quirks to a separate file")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20250516193436.09bdf8cc@canb.auug.org.au
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/driver-api/gpio/index.rst                    | 2 +-
>  Documentation/translations/zh_CN/driver-api/gpio/index.rst | 2 +-
>  MAINTAINERS                                                | 2 +-
>  drivers/platform/x86/intel/int0002_vgpio.c                 | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
> index 34b57cee3391..43f6a3afe10b 100644
> --- a/Documentation/driver-api/gpio/index.rst
> +++ b/Documentation/driver-api/gpio/index.rst
> @@ -27,7 +27,7 @@ Core
>  ACPI support
>  ============
>  
> -.. kernel-doc:: drivers/gpio/gpiolib-acpi.c
> +.. kernel-doc:: drivers/gpio/gpiolib-acpi-core.c
>     :export:
>  
>  Device tree support
> diff --git a/Documentation/translations/zh_CN/driver-api/gpio/index.rst b/Documentation/translations/zh_CN/driver-api/gpio/index.rst
> index e4d54724a1b5..f64a69f771ca 100644
> --- a/Documentation/translations/zh_CN/driver-api/gpio/index.rst
> +++ b/Documentation/translations/zh_CN/driver-api/gpio/index.rst
> @@ -42,7 +42,7 @@ ACPI支持
>  
>  该API在以下内核代码中:
>  
> -drivers/gpio/gpiolib-acpi.c
> +drivers/gpio/gpiolib-acpi-core.c
>  
>  设备树支持
>  ==========
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b827049501..d1290bbb6ac6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10105,7 +10105,7 @@ L:	linux-acpi@vger.kernel.org
>  S:	Supported
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
>  F:	Documentation/firmware-guide/acpi/gpio-properties.rst
> -F:	drivers/gpio/gpiolib-acpi.c
> +F:	drivers/gpio/gpiolib-acpi-*.c
>  F:	drivers/gpio/gpiolib-acpi.h
>  
>  GPIO AGGREGATOR
> diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/x86/intel/int0002_vgpio.c
> index 3b48cd7a4075..b7b98343fdc6 100644
> --- a/drivers/platform/x86/intel/int0002_vgpio.c
> +++ b/drivers/platform/x86/intel/int0002_vgpio.c
> @@ -23,7 +23,7 @@
>   * ACPI mechanisms, this is not a real GPIO at all.
>   *
>   * This driver will bind to the INT0002 device, and register as a GPIO
> - * controller, letting gpiolib-acpi.c call the _L02 handler as it would
> + * controller, letting gpiolib-acpi call the _L02 handler as it would
>   * for a real GPIO controller.
>   */
>  

-- 
~Randy

