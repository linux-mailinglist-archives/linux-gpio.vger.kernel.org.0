Return-Path: <linux-gpio+bounces-28100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD4FC354D8
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 12:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D1DB18C660A
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 11:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBE230FC00;
	Wed,  5 Nov 2025 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UUeMFiI2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F31C30C633
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 11:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341197; cv=none; b=e2sLUCCYHeNT4rRlI390xSvtBhishF6EYptVnAd2g/fBXloqtLmhj64GkKvdAysd3GIVoFTkJmJr32FxVoBaBkU/gIntshT+kjzj8kxzHL0Cav4Hy337ZXfOLPtPjsRsMnSsuKAhTwNhnOU78OmIzGwo9vdeRLW5Wzven1KtTRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341197; c=relaxed/simple;
	bh=y+ju+eJvK8HzYCUKH5EbHPD0aKHBQeN8wwLP+uV2/K4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4h1GS4IVvZwklTjJGwdT1M3Jj5jCxb4JeglNsy388vAamUTZWO772ZgnKY1ePC5WSkeK0EntAw+GqApawYwmfstcp/AARDU7wxwZf25gD9AfCp6hP6KZXK/zTdGruQg2MWpGRRTZII5Dz33SGiMDUsvTk7PZg6Q6S/ZKNPtyuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UUeMFiI2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59445ee9738so241259e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 03:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762341194; x=1762945994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JG51Hq++miK2Fex6Vfp0eKhsrvnsMhGhZv9+TnKZ4f0=;
        b=UUeMFiI2K5GitHqS5G/wlBFiXfsai5SRWNT+vI2Il+ujcLP3UZL3Ex4OxynSZjquvg
         bFvotS5qWWENEqHC9U4hWBSUJ9At+oaH1xxmzG6ECxtxkKwTd4ez5B1J4Qbje+a9ena4
         8AWXrIJLBCb2eOZQsf6EiTiUj9j+9Es6hpi/LbA6ZPylstxcEF1XOHn+QlXvUuoAl0Y5
         Xc0ofzcJrHRV1a1gusnDvUG3Lz+E7Lu1N8d/NU4JMLOK2TFjG+W3UN0nJru5s3gVTQec
         usdh5YzGOQ5y6glkWkh6M0RqBNqRjWPAZlTVZiFDKTnHIq736ND1N0IrD7WbNfBRySko
         VFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762341194; x=1762945994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JG51Hq++miK2Fex6Vfp0eKhsrvnsMhGhZv9+TnKZ4f0=;
        b=KD0kILeUrfR0pISWo45s2mBaPKNOfAm9bKHOTceG0uvBZPpPMaz9aFyrB6BnMuZ8u/
         UfP7uLQvvSxCkIgju1HMyV7n8mnT/VYbk+OqOi6JhJVNGg2JAqMEW5WBiY3fHZBdVniT
         k5/8IxmB/FGzfh/AjbFcITvCkjHXPB/4o0Bj5Z6mCx37D132DVFkzMNyOtnmyJeckn45
         a3SS+drTH1U++ldvxG2Lj81mEEJxbxop8Vm/r6oe1cbF4BwWWOV2vu0bmNrCdFIIUnPa
         6ae5wiepDrx0f5rOmUgMRcx8HFis/j7Sk1irAVYoiclG1vc8i9lJ6J0Awg9mA2Fk/BMU
         J+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVIPzLYpzcONT7aZ6y3QhjzNK6YFygisf08u/GizE5wvOuYbgJDiZx9A1IcK/1lnjZ6Ysa+EcUUuc/t@vger.kernel.org
X-Gm-Message-State: AOJu0YxJCQK35pFcDXUDh4wjuuvjnN76olc0I4FOANHy4kRFk3wQtp7w
	Ykeq5R1p7ukUVrrJM7h6HmL4nqyDIj5dvnUH48oCTPXiEKrzK+rocAm4yJ0OKmRQjJpxN8NE8Tn
	wsJcV5ULOt5DWhfAzo13BQO/bq0MKxJbVg3OC4+vr4g==
X-Gm-Gg: ASbGncs/4di14CuYykylpmxNd5hKBPynMrmNvQmU2nZQSZHmsVqss0NDalmXZx1WWjx
	d01u2fDNCxI+H6yzZd0LbpSDcxxt8+pLUnlBVS9CotuPiRWANNlLIBIqtX3jktxHu+PAfu7KlfJ
	GHtAadibpqda623A/ymsLVRoVAK3sR35nNaWlQUhhXJq1bEtAqHQyC6WxlSdSz43Rb8X7a7KND4
	9oHGHeTKucVAGnBBl1Bn5ygQHXi/nUedpOgRPfdhPK6Bz2/qEXbjHHW5IGefdgGb/iScehEAcBg
	Kvlg+ek9ljEMQCiD
X-Google-Smtp-Source: AGHT+IHDSaXviCfITtg/FMcF5Bu77Gbwi/aiVMbNVLeu3JkIbzZIrWvYPYHyWiNt0LQo+iniDeT7EH+k0eJ0DFliQVI=
X-Received: by 2002:a05:6512:61a1:b0:563:2efc:dea7 with SMTP id
 2adb3069b0e04-5943d7c9126mr1005125e87.34.1762341193497; Wed, 05 Nov 2025
 03:13:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104-ltc4283-support-v3-0-4bea496f791d@analog.com> <20251104-ltc4283-support-v3-3-4bea496f791d@analog.com>
In-Reply-To: <20251104-ltc4283-support-v3-3-4bea496f791d@analog.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 5 Nov 2025 12:13:02 +0100
X-Gm-Features: AWmQ_bmQd858eXoItm7LwqkIZXbCZS2AkKpBWiMVEPi0lh3UwpYTx2HZMgJHzUk
Message-ID: <CAMRc=MeWyDOFfUnX8eV9+9tykinB+Hd9duf-v+UOCvcYKt9g9Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 11:31=E2=80=AFAM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:
>
> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> The LTC4283 device has up to 8 pins that can be configured as GPIOs.
>
> Note that PGIO pins are not set as GPIOs by default so if they are
> configured to be used as GPIOs we need to make sure to initialize them
> to a sane default. They are set as inputs by default.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> ---
>  MAINTAINERS                 |   2 +
>  drivers/gpio/Kconfig        |  15 +++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-ltc4283.c | 217 ++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 235 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d02fdf0a0593..76a659408c8c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14757,9 +14757,11 @@ F:     drivers/hwmon/ltc4282.c
>
>  LTC4283 HARDWARE MONITOR AND GPIO DRIVER
>  M:     Nuno S=C3=A1 <nuno.sa@analog.com>
> +L:     linux-gpio@vger.kernel.org
>  L:     linux-hwmon@vger.kernel.org
>  S:     Supported
>  F:     Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> +F:     drivers/gpio/gpio-ltc4283.c
>  F:     drivers/hwmon/ltc4283.c
>
>  LTC4286 HARDWARE MONITOR DRIVER
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 7ee3afbc2b05..58610f77a75e 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1741,6 +1741,21 @@ config GPIO_WM8994
>
>  endmenu
>
> +menu "AUXBUS GPIO expanders"
> +       depends on AUXILIARY_BUS
> +

Please call the section "Auxiliary Bus GPIO drivers"

It's not very clear what "AUXBUS" is.

> +config GPIO_LTC4283
> +       tristate "Analog Devices LTC4283 GPIO support"
> +       depends on SENSORS_LTC4283
> +       help
> +         If you say yes here you want the GPIO function available in Ana=
log
> +         Devices LTC4283 Negative Voltage Hot Swap Controller.
> +
> +         This driver can also be built as a module. If so, the module wi=
ll
> +         be called gpio-ltc4283.
> +
> +endmenu
> +
>  menu "PCI GPIO expanders"
>         depends on PCI
>
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index ec296fa14bfd..b6550944ed78 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -99,6 +99,7 @@ obj-$(CONFIG_GPIO_LP873X)             +=3D gpio-lp873x.=
o
>  obj-$(CONFIG_GPIO_LP87565)             +=3D gpio-lp87565.o
>  obj-$(CONFIG_GPIO_LPC18XX)             +=3D gpio-lpc18xx.o
>  obj-$(CONFIG_GPIO_LPC32XX)             +=3D gpio-lpc32xx.o
> +obj-$(CONFIG_GPIO_LTC4283)             +=3D gpio-ltc4283.o
>  obj-$(CONFIG_GPIO_MACSMC)              +=3D gpio-macsmc.o
>  obj-$(CONFIG_GPIO_MADERA)              +=3D gpio-madera.o
>  obj-$(CONFIG_GPIO_MAX3191X)            +=3D gpio-max3191x.o
> diff --git a/drivers/gpio/gpio-ltc4283.c b/drivers/gpio/gpio-ltc4283.c
> new file mode 100644
> index 000000000000..885af67146a8
> --- /dev/null
> +++ b/drivers/gpio/gpio-ltc4283.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Analog Devices LTC4283 GPIO driver
> + *
> + * Copyright 2025 Analog Devices Inc.
> + */

Add a newline.

> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitmap.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>

In ASCII '_' sorts before 'u'.

With that fixed:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

