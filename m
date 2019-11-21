Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44EA9104CB5
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 08:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfKUHiX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 02:38:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:40588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726170AbfKUHiX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Nov 2019 02:38:23 -0500
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E9672089F;
        Thu, 21 Nov 2019 07:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574321901;
        bh=iPaegC2Fc/YfqxXzQq+rKC4ut3oJhHjxsJHyhJOMr6o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Gxmr7hkqoqe4nozqTBM5oRmtM3cW053hJ1ImnHqQFqn1tLjOTuUcVPQFfefy/lrPK
         yeX0TKfwGDSz3ZuemTTnDzyMNjNySRvpFCGcqHoF/ttJLxHAHrHwH889CiGd6tCK0Y
         3oa+LmP/JdwIg1SLH+4Bw3porGtIoT1wzexr5ExY=
Received: by mail-lj1-f177.google.com with SMTP id g3so2014686ljl.11;
        Wed, 20 Nov 2019 23:38:21 -0800 (PST)
X-Gm-Message-State: APjAAAUhvwKWD3iH1D8OJsUHN9o6gygBy/lOZPra62d2T2wbXQk9MyQ9
        CMFLXS7sH+COC/i9fSOvPVA1oLx8E0LpHHWsr10=
X-Google-Smtp-Source: APXvYqzIZSww42wLMbKd99lnRiuy4DvVWuQlpvBLqdlbdGUmZM2j6BMEs6rEqORD0iP6Pis5OViGamvZ0Ari2qlGhoY=
X-Received: by 2002:a2e:3009:: with SMTP id w9mr6359832ljw.74.1574321899606;
 Wed, 20 Nov 2019 23:38:19 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191121072643epcas2p452071a503725c7764acf5084d24425b1@epcas2p4.samsung.com>
 <001001d5a03d$05de1f70$119a5e50$@samsung.com>
In-Reply-To: <001001d5a03d$05de1f70$119a5e50$@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 21 Nov 2019 15:38:08 +0800
X-Gmail-Original-Message-ID: <CAJKOXPckbRowhCmnJfT8-DT3gYaTpDOf0wVxmxdf-tZpOyM5ew@mail.gmail.com>
Message-ID: <CAJKOXPckbRowhCmnJfT8-DT3gYaTpDOf0wVxmxdf-tZpOyM5ew@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: modularize samsung pinctrl driver
To:     =?UTF-8?B?6rWs7ZiE6riw?= <hyunki00.koo@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-gpio@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Thanks for the patch. Few comments below:

On Thu, 21 Nov 2019 at 15:26, =EA=B5=AC=ED=98=84=EA=B8=B0 <hyunki00.koo@sam=
sung.com> wrote:
>
> Enable samsung pinctrl driver to be compiled as modules.

Why? What's the benefit? Are platforms capable of such boot? Pinctrl
is needed early - even before mounting rootfs...
What about module unloading? Is it reasonable?
Please answer to all this also in commit message.

>
> Change-Id: I92a9953c92831a316f7f50146898ff19831549ec

This does not belong to Git.

> Signed-off-by: Hyunki Koo <hyunki00.koo@samsung.com>

You "From" name is different than written here in Signed-off-by. They
should match and I do not know Korean to be able to tell whether they
really match or not :).
How about using Latin transliteration also in "From" field?

> ---
>  drivers/pinctrl/samsung/Kconfig                |  5 +----
>  drivers/pinctrl/samsung/Makefile               | 13 +++++++------
>  drivers/pinctrl/samsung/pinctrl-exynos-arm.c   |  2 ++
>  drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  2 ++
>  drivers/pinctrl/samsung/pinctrl-exynos.c       |  2 ++
>  drivers/pinctrl/samsung/pinctrl-samsung.c      | 13 +++++++++++++
>  6 files changed, 27 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pinctrl/samsung/Kconfig
> b/drivers/pinctrl/samsung/Kconfig
> index 425fadd6c346..25e16984ef23 100644
> --- a/drivers/pinctrl/samsung/Kconfig
> +++ b/drivers/pinctrl/samsung/Kconfig
> @@ -3,14 +3,13 @@
>  # Samsung Pin control drivers
>  #
>  config PINCTRL_SAMSUNG
> -       bool
> +       tristate "Pinctrl driver data for Samsung SoCs"
>         select PINMUX
>         select PINCONF
>
>  config PINCTRL_EXYNOS
>         bool "Pinctrl driver data for Samsung EXYNOS SoCs"
>         depends on OF && GPIOLIB && (ARCH_EXYNOS || ARCH_S5PV210)
> -       select PINCTRL_SAMSUNG
>         select PINCTRL_EXYNOS_ARM if ARM && (ARCH_EXYNOS || ARCH_S5PV210)
>         select PINCTRL_EXYNOS_ARM64 if ARM64 && ARCH_EXYNOS
>
> @@ -25,9 +24,7 @@ config PINCTRL_EXYNOS_ARM64
>  config PINCTRL_S3C24XX
>         bool "Samsung S3C24XX SoC pinctrl driver"
>         depends on ARCH_S3C24XX && OF
> -       select PINCTRL_SAMSUNG
>
>  config PINCTRL_S3C64XX
>         bool "Samsung S3C64XX SoC pinctrl driver"
>         depends on ARCH_S3C64XX
> -       select PINCTRL_SAMSUNG
> diff --git a/drivers/pinctrl/samsung/Makefile
> b/drivers/pinctrl/samsung/Makefile
> index ed951df6a112..b3ac01838b8a 100644
> --- a/drivers/pinctrl/samsung/Makefile
> +++ b/drivers/pinctrl/samsung/Makefile
> @@ -1,9 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Samsung pin control drivers
>
> -obj-$(CONFIG_PINCTRL_SAMSUNG)  +=3D pinctrl-samsung.o
> -obj-$(CONFIG_PINCTRL_EXYNOS)   +=3D pinctrl-exynos.o
> -obj-$(CONFIG_PINCTRL_EXYNOS_ARM)       +=3D pinctrl-exynos-arm.o
> -obj-$(CONFIG_PINCTRL_EXYNOS_ARM64)     +=3D pinctrl-exynos-arm64.o
> -obj-$(CONFIG_PINCTRL_S3C24XX)  +=3D pinctrl-s3c24xx.o
> -obj-$(CONFIG_PINCTRL_S3C64XX)  +=3D pinctrl-s3c64xx.o
> +obj-$(CONFIG_PINCTRL_SAMSUNG)  +=3D pinctrl-samsung-super.o
> +pinctrl-samsung-super-$(CONFIG_PINCTRL_SAMSUNG)        +=3D pinctrl-sams=
ung.o
> +pinctrl-samsung-super-$(CONFIG_PINCTRL_EXYNOS) +=3D pinctrl-exynos.o
> +pinctrl-samsung-super-$(CONFIG_PINCTRL_EXYNOS_ARM)     +=3D pinctrl-exyn=
os-
> arm.o
> +pinctrl-samsung-super-$(CONFIG_PINCTRL_EXYNOS_ARM64)   +=3D pinctrl-exyn=
os-
> arm64.o
> +pinctrl-samsung-super-$(CONFIG_PINCTRL_S3C24XX)        +=3D pinctrl-s3c2=
4xx.o
> +pinctrl-samsung-super-$(CONFIG_PINCTRL_S3C64XX)        +=3D pinctrl-s3c6=
4xx.o

I don't get why you need to rename obj to pinctrl-samsung-super?

> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> index 85ddf49a5188..28906bf213c4 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> @@ -14,6 +14,7 @@
>  // external gpio and wakeup interrupt support.
>
>  #include <linux/device.h>
> +#include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/slab.h>
>  #include <linux/err.h>
> @@ -891,3 +892,4 @@ const struct samsung_pinctrl_of_match_data
> exynos5420_of_data __initconst =3D {
>         .ctrl           =3D exynos5420_pin_ctrl,
>         .num_ctrl       =3D ARRAY_SIZE(exynos5420_pin_ctrl),
>  };
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index b6e56422a700..2b19476ad5ff 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -14,6 +14,7 @@
>  // external gpio and wakeup interrupt support.
>
>  #include <linux/slab.h>
> +#include <linux/module.h>
>  #include <linux/soc/samsung/exynos-regs-pmu.h>
>
>  #include "pinctrl-samsung.h"
> @@ -422,3 +423,4 @@ const struct samsung_pinctrl_of_match_data
> exynos7_of_data __initconst =3D {
>         .ctrl           =3D exynos7_pin_ctrl,
>         .num_ctrl       =3D ARRAY_SIZE(exynos7_pin_ctrl),
>  };
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c
> b/drivers/pinctrl/samsung/pinctrl-exynos.c
> index ebc27b06718c..630d606330f1 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -18,6 +18,7 @@
>  #include <linux/irqdomain.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip/chained_irq.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/slab.h>
> @@ -713,3 +714,4 @@ exynos_retention_init(struct samsung_pinctrl_drv_data
> *drvdata,
>
>         return ctrl;
>  }
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c
> b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index de0477bb469d..4483eaed27f8 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -15,6 +15,7 @@
>  // but provides extensions to which platform specific implementation of
> the gpio
>  // and wakeup interrupts can be hooked to.
>
> +#include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
> @@ -1275,6 +1276,7 @@ static const struct of_device_id
> samsung_pinctrl_dt_match[] =3D {
>  #endif
>         {},
>  };
> +MODULE_DEVICE_TABLE(of, samsung_pinctrl_dt_match);
>
>  static const struct dev_pm_ops samsung_pinctrl_pm_ops =3D {
>         SET_LATE_SYSTEM_SLEEP_PM_OPS(samsung_pinctrl_suspend,
> @@ -1296,3 +1298,14 @@ static int __init samsung_pinctrl_drv_register(voi=
d)
>         return platform_driver_register(&samsung_pinctrl_driver);
>  }
>  postcore_initcall(samsung_pinctrl_drv_register);
> +
> +static void __exit samsung_pinctrl_drv_unregister(void)
> +{
> +       platform_driver_unregister(&samsung_pinctrl_driver);
> +}
> +module_exit(samsung_pinctrl_drv_unregister);

Since .suppress_bind_attrs are defined, I find it weird to be able to
unload module... Another warning sign...

> +
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Hyunki Koo <hyunki00.koo@samsung.com>");

I cannot find any contributions to this file from you. The author
should be the main contributor(s). You need to go through history...

> +MODULE_DESCRIPTION("Samsung Exynos PINCTRL driver");

That's not Exynos but Samsung-generic part... Samsung Exynos/S3C/S5P
pinctrl driver.

Best regards,
Krzysztof
