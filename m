Return-Path: <linux-gpio+bounces-25893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B3DB517C4
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 15:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60F307B4048
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 13:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5361E520A;
	Wed, 10 Sep 2025 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CTpkmJkZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382061DC994
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757510440; cv=none; b=et1TfRx7q5Y4fc5kLx6/VKMaU2Kla86YA5Z4bKpfTN5lIEpSJaEaDLhBbLWwkpc99VQYFiGFf1bsBFMic5fuKtNxU/sBbA977HnDAFhpNj/akz6eiNYgn7GGL1Tl0upk99vXjUbOA/tmHtaCzCFp7za+Bax3yjerLzmU547F6gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757510440; c=relaxed/simple;
	bh=XseQeA7sXB9vEWlhl8sP7mXuhQrwTs6I/tpTJTtr9OQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWi8kw321EI+x+qMjw4Nmsd5O2gDCvmVEdKMnxStQTZXmsTy2FAQ8DbsnRX4KQJVEMnmJkQ522us8YPSnC7Vj0OHkVmNaDdqcx/rKt0GkIz2QZ9NIT1ZOcm+hCVW1vEuVuR+tbilqLDxRlWq71xQrWLW+cj2jYuwrdofJi/oEHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CTpkmJkZ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-56afe77bc1eso1063746e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 06:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757510436; x=1758115236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usNnOQgay2wuHNuAsZIrVK6KkYxVcLo34sEGpIoKo6U=;
        b=CTpkmJkZ00pkx+b6rpiiDVMT7r4RD7700e0hhg4QM45anZ+qOpepmGEt27sAd5OKMs
         bVkdRjcambGitUG8RhCajyKi4C23cadUmTG97PqWUVZGvBXc6hpNPoO9Ve2euMTFgoDO
         Fv1c8EldzpAL3VT0qjoRNNtd9OfTbcjhwhKI2uGVC2v8ThtvQiAYYHWXjSBm7qHgod1F
         S0vAadH81VuIuQ4+1PjXJQh1dTjg4/n034LmlsAFylWUhu4tlY8zZFoIMCThxRkcoVs4
         OKGihbGwV+gSpVrIrsGY0+umc+gX6HcfsbBXW7HYSYgsRStKPyhEq9uD/x75XWV3xB6C
         K/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757510436; x=1758115236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usNnOQgay2wuHNuAsZIrVK6KkYxVcLo34sEGpIoKo6U=;
        b=PTgVV1xpM6O3oq4BtC8f0Yf8GS2ajwwG0RHoHR89fzN0fyN2cL+2Ky1obqU17USLt9
         NkqFxVy4/06Mi79wD/NS0JL25VvGopWu4P5/VUjUhYzRmBd3XZfL7MD/kPrFTLHVl5QU
         G1stM/C+ovUCWztbErYpMN7nPWAVpkxPiCVuLDGHCHcO33HgpQv5S9HiFdyboou1ulSZ
         pkgkGDDU23l6rxDXWt9fnHvkr21O/mzZ36iLhr9UQ8UpI5GHoPCmKQcp2r2jVJ0m48Ps
         exSq1VX9udkFgPqwv7u8EwggXwPv9xsYQMeBveSAbC+8b+hMlQkkrvPIR6DUWP84sonO
         kl6A==
X-Forwarded-Encrypted: i=1; AJvYcCVpMxHDqSB4WrDoOe/5X0SIFwEZE5cG02qWypoRdTiEXknT2cDl0M6BUGi7j18rFqUyl4VcVyVTWFaZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmd1VxZ9hySDN1l8syTvi18rUrwn7EReTo+fwm7GprftbZX1Hh
	37dYcmRrNZmitOX/euCX9ErPhh/JjFlEZCUaNEX63SLLLvNf0kQ7uIYHiQz0YVGgHqDIumhwiPp
	R7ABa0kworbh3kgw+RcZ4FFj/ks6Poq0Bv1cbkqe9J9tuxMNUlrvWs9Q=
X-Gm-Gg: ASbGncvhMGTKP3er/r7geHU759kPP7xMN0LoeebCK3hD7EC5FrLPFv6yFvcLX/gG9T1
	R2AtfAuylRPn4Jxqf08Arn6q6QlCphjybUNUcHql2VYy1u08Y5YEhUg5yDcLeQkFTa5+lk6rq+t
	rWakYZ5fHUIIfZvVTY0ecbA7dGujasivjPQK+OaKQcvw43I7vvSKRrA2ywqeT3MxO+3EA3rGj4s
	ouLCa4DIL8SzQwpw/4olL0aOiAUutWuEqUPmro=
X-Google-Smtp-Source: AGHT+IFGzIpKbCawcWSHU3YFRZA7B9ZLpt7+F1f3L40bSlxrJT4HzCRKZZzF5+nwMXCnxr4NzPDqMPCV/h6C1bMUfIk=
X-Received: by 2002:a05:6512:258a:b0:55f:71d2:e5b6 with SMTP id
 2adb3069b0e04-56262667e84mr4297836e87.30.1757510436175; Wed, 10 Sep 2025
 06:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910121749.63853-1-hansg@kernel.org>
In-Reply-To: <20250910121749.63853-1-hansg@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 15:20:24 +0200
X-Gm-Features: Ac12FXyAoKzLZSKI4azLvsrvFG1sk00s-CXgxnYuyzscfcvUnyyEUwXZBEUuPXM
Message-ID: <CAMRc=MdLJSd7JOA5Z=FP7q-XVc2WYMhnj7zO+hk8_0JhB9MTUA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: Add Intel USBIO GPIO driver
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 2:17=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>
> Add a a driver for the GPIO auxbus child device of the Intel USBIO USB
> IO-expander used by the MIPI cameras on various new (Meteor Lake and
> later) Intel laptops.
>
> Co-developed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
> ---
> Changes in v3:
> - Drop (offset >=3D gc->ngpio) check and make usbio_gpio_get_bank_and_pin=
()
>   return void
> - Propagate usbio_gpio_set() ret val in usbio_gpio_direction_output()
> - Use devm_gpiochip_add_data() and drop auxiliary_driver remove() callbac=
k
>
> Changes in v2:
> - Add a config_mutex protect usbio_gpio_update_config() calls, which
>   read-modify-write banks[x].config, racing with each other
> - Adjust usbio_gpio_get() to have an int return value and propagate the
>   usbio_control_msg() return value
> - Use __le16, __le32 type + cpu_to_le16() and friends for on wire words
> - Some small style fixes from Sakari's review
> ---
>  MAINTAINERS               |   1 +
>  drivers/gpio/Kconfig      |  11 ++
>  drivers/gpio/Makefile     |   1 +
>  drivers/gpio/gpio-usbio.c | 250 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 263 insertions(+)
>  create mode 100644 drivers/gpio/gpio-usbio.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3410699ad0b2..53694bd91861 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12699,6 +12699,7 @@ M:      Israel Cepeda <israel.a.cepeda.lopez@inte=
l.com>
>  M:     Hans de Goede <hansg@kernel.org>
>  R:     Sakari Ailus <sakari.ailus@linux.intel.com>
>  S:     Maintained
> +F:     drivers/gpio/gpio-usbio.c
>  F:     drivers/usb/misc/usbio.c
>  F:     include/linux/usb/usbio.h
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index e43abb322fa6..5d3ca3dd2687 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1448,6 +1448,17 @@ config GPIO_LJCA
>           This driver can also be built as a module. If so, the module
>           will be called gpio-ljca.
>
> +config GPIO_USBIO
> +       tristate "Intel USBIO GPIO support"
> +       depends on USB_USBIO
> +       default USB_USBIO
> +       help
> +         Select this option to enable GPIO driver for the INTEL
> +         USBIO driver stack.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called gpio_usbio.
> +
>  config GPIO_LP3943
>         tristate "TI/National Semiconductor LP3943 GPIO expander"
>         depends on MFD_LP3943
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 379f55e9ed1e..8c55e2d5de42 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -90,6 +90,7 @@ obj-$(CONFIG_GPIO_JANZ_TTL)           +=3D gpio-janz-tt=
l.o
>  obj-$(CONFIG_GPIO_KEMPLD)              +=3D gpio-kempld.o
>  obj-$(CONFIG_GPIO_LATCH)               +=3D gpio-latch.o
>  obj-$(CONFIG_GPIO_LJCA)                +=3D gpio-ljca.o
> +obj-$(CONFIG_GPIO_USBIO)               +=3D gpio-usbio.o
>  obj-$(CONFIG_GPIO_LOGICVC)             +=3D gpio-logicvc.o
>  obj-$(CONFIG_GPIO_LOONGSON1)           +=3D gpio-loongson1.o
>  obj-$(CONFIG_GPIO_LOONGSON)            +=3D gpio-loongson.o
> diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
> new file mode 100644
> index 000000000000..31a376e91877
> --- /dev/null
> +++ b/drivers/gpio/gpio-usbio.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Intel Corporation.
> + * Copyright (c) 2025 Red Hat, Inc.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
> +#include <linux/dev_printk.h>

No need to pull this if you include device.h.

> +       usbio_acpi_bind(gpio->adev, usbio_gpio_acpi_hids);
> +
> +       for (bank =3D 0; bank < USBIO_MAX_GPIOBANKS && bank_desc[bank].bm=
ap; bank++)
> +               gpio->banks[bank].bitmap =3D le32_to_cpu(bank_desc[bank].=
bmap);
> +
> +       gpio->gc.label =3D ACPI_COMPANION(dev) ?
> +                                       acpi_dev_name(ACPI_COMPANION(dev)=
) : dev_name(dev);
> +       gpio->gc.parent =3D dev;
> +       gpio->gc.owner =3D THIS_MODULE;
> +       gpio->gc.get_direction =3D usbio_gpio_get_direction;
> +       gpio->gc.direction_input =3D usbio_gpio_direction_input;
> +       gpio->gc.direction_output =3D usbio_gpio_direction_output;
> +       gpio->gc.get =3D usbio_gpio_get;
> +       gpio->gc.set =3D usbio_gpio_set;
> +       gpio->gc.set_config =3D usbio_gpio_set_config;
> +       gpio->gc.base =3D -1;
> +       gpio->gc.ngpio =3D bank * USBIO_GPIOSPERBANK;
> +       gpio->gc.can_sleep =3D true;
> +
> +       auxiliary_set_drvdata(adev, gpio);
> +

Now you no longer need this as there's no remove() anymore.

Bart

