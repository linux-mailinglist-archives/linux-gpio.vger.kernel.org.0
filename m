Return-Path: <linux-gpio+bounces-20257-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BD6AB9BD7
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 14:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 400BB9E82D6
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 12:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F5E23BCFD;
	Fri, 16 May 2025 12:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RyiCCUvm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00333158520;
	Fri, 16 May 2025 12:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747397961; cv=none; b=X2XPXSWHjBH3s2Az0xgP10ylVEljB/nnnU1BbumQgdEdG2fvtjds2IpuekDkvzCO2J44n1VAzdnvIvnk6btJOZN+k59U7PEHXcPXlAL3NG8mbVfD73l6EW8/1Uu5RQ+hOU7zz8yllxQuRCyEu0jMdurwb1eUNSgy1/aphw0OtMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747397961; c=relaxed/simple;
	bh=Fcg+JWkvcZH1Z0cctkokT8yd5m4s1jckd+YU3YEbcG8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=n67TwDIQUQboXZCDFcWrVEGM00B74vGRc11AArhX2UJm0PMurCTNTfsrDs0UajVNPpMsWad4c0OaQZII1CNnbheYzYhMRtzn4Yv0Uq9UJQ78Bfn66ypzD/0mfW06K6xFdmzntsdc4xMnzq9wgOpCuj9kXItSqpoemLkOv2DjH7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RyiCCUvm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747397960; x=1778933960;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Fcg+JWkvcZH1Z0cctkokT8yd5m4s1jckd+YU3YEbcG8=;
  b=RyiCCUvmSJAZvWIgJab6P+E3ha0rYUOYqc4GI8cTWHqldXAQZOUqP/fP
   p0rjwYAw1hOrmS8X2Lujx8Jd/Yjc5xPpkbCsapl1YMSa+Fsoc7wZ3dei4
   WASTZn3MOBg342K9k1MSk2F9kfQ2kF4sYjdhBa18H8nyU2r/W3vbRabSb
   L7YvFdOEmTabsnmcW1IaRHbd0xtLwLQVxq62JiSy2o/ZGpSRV0N2mSIhK
   8eimYEx1X8l4TlI9YZL0k5t25/UMq+zmkp8CkqzIVn0oyw5cUnowfaSF6
   EGXLkG4lrxTGAXiHui5Cvavv+KvLg7cnrf1a+HajcvD1pHrfxLfU+cXj9
   g==;
X-CSE-ConnectionGUID: k7ZSf14gSCKegh79GNteCA==
X-CSE-MsgGUID: BqbrZWAvTW2/XOyNBjpH7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49353851"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="49353851"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 05:19:19 -0700
X-CSE-ConnectionGUID: iA2lZ15ERLmg1Yu/PVRF0g==
X-CSE-MsgGUID: IvuoMZssTe6Dm2b1qsLgAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="139213792"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.94])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 05:19:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 16 May 2025 15:19:11 +0300 (EEST)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, 
    Linus Walleij <linus.walleij@linaro.org>, 
    Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, 
    Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
    Dongliang Mu <dzm91@hust.edu.cn>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v1 1/1] gpiolib-acpi: Update file references in the
 Documentation and MAINTAINERS
In-Reply-To: <20250516095306.3417798-1-andriy.shevchenko@linux.intel.com>
Message-ID: <02bdf242-cbfd-18e2-fabc-82f20823dcbb@linux.intel.com>
References: <20250516095306.3417798-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-42645495-1747397951=:1009"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-42645495-1747397951=:1009
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 16 May 2025, Andy Shevchenko wrote:

> The recent changes in the gpiolib-acpi.c need also updates in the Documen=
tation
> and MAINTAINERS. Do the necessary changes here.
>=20
> Fixes: babb541af627 ("gpiolib: acpi: Move quirks to a separate file")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20250516193436.09bdf8cc@canb.auug.org.a=
u
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/driver-api/gpio/index.rst                    | 2 +-
>  Documentation/translations/zh_CN/driver-api/gpio/index.rst | 2 +-
>  MAINTAINERS                                                | 2 +-
>  drivers/platform/x86/intel/int0002_vgpio.c                 | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driv=
er-api/gpio/index.rst
> index 34b57cee3391..43f6a3afe10b 100644
> --- a/Documentation/driver-api/gpio/index.rst
> +++ b/Documentation/driver-api/gpio/index.rst
> @@ -27,7 +27,7 @@ Core
>  ACPI support
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -.. kernel-doc:: drivers/gpio/gpiolib-acpi.c
> +.. kernel-doc:: drivers/gpio/gpiolib-acpi-core.c
>     :export:
> =20
>  Device tree support
> diff --git a/Documentation/translations/zh_CN/driver-api/gpio/index.rst b=
/Documentation/translations/zh_CN/driver-api/gpio/index.rst
> index e4d54724a1b5..f64a69f771ca 100644
> --- a/Documentation/translations/zh_CN/driver-api/gpio/index.rst
> +++ b/Documentation/translations/zh_CN/driver-api/gpio/index.rst
> @@ -42,7 +42,7 @@ ACPI=E6=94=AF=E6=8C=81
> =20
>  =E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=A0=
=81=E4=B8=AD:
> =20
> -drivers/gpio/gpiolib-acpi.c
> +drivers/gpio/gpiolib-acpi-core.c
> =20
>  =E8=AE=BE=E5=A4=87=E6=A0=91=E6=94=AF=E6=8C=81
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b827049501..d1290bbb6ac6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10105,7 +10105,7 @@ L:=09linux-acpi@vger.kernel.org
>  S:=09Supported
>  T:=09git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-i=
ntel.git
>  F:=09Documentation/firmware-guide/acpi/gpio-properties.rst
> -F:=09drivers/gpio/gpiolib-acpi.c
> +F:=09drivers/gpio/gpiolib-acpi-*.c
>  F:=09drivers/gpio/gpiolib-acpi.h
> =20
>  GPIO AGGREGATOR
> diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platfor=
m/x86/intel/int0002_vgpio.c
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
> =20
>=20

Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

I assume this goes through some other tree than pxd86 ?

--=20
 i.

--8323328-42645495-1747397951=:1009--

