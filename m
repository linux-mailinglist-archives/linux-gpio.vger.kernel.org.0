Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB49391709
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 14:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233082AbhEZMGx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 08:06:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:35536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232027AbhEZMGx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 May 2021 08:06:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBC02613D3
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622030722;
        bh=1Az+CvH7DqEYubhN9gr4W0Clssi4xBffO2wPokdilYo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RNrz1UDXpugINAjnyIjzDvqE8QtuVdRlsGN9NnRgRAqlITsVLDiWuhWt3HO69XWLW
         bykvKsxdySPInCkrvy0t/9kFANXj65efPaudJ5Iv3mIaveMqxIwvCBVkWkYB6hxC3F
         r2f2ydQvgdO9fiETwQi8l6b8m+FfNW00vAmEi4Jel9qUw1EIr/05OePWvoMKF/lva1
         T1tPv0mQx4xMB2HDCJHDG4WKKPM2SDyDwKitk35cjmVbkQbZRQg+kvJ5YK574VuDB/
         Q7GECGLpcWtQ4935knunxoPlnl4x8V9qBNNr76Zyy5HWFJvon3Sw2DyMznfa+5FcYw
         e1X+3IetBzFdg==
Received: by mail-ej1-f48.google.com with SMTP id z16so1413725ejr.4
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 05:05:21 -0700 (PDT)
X-Gm-Message-State: AOAM531ZlKtvL6yZjNWWDvMI98WXI1r8gzgevZPRusYA5AqFBqY1dJoX
        CgDJIFgvId/CbcNhYjz3zuUUKrxBe9ptao0IZwE=
X-Google-Smtp-Source: ABdhPJzWeCNXIvm0LosRhT/plT7h8SZIi/MSWaJHEuJ+iI4iI+O7tRzn64SAA2j6Kb5lfCUC/6gMpdkrQ1st6zR9G/o=
X-Received: by 2002:a17:906:1806:: with SMTP id v6mr13228788eje.454.1622030720473;
 Wed, 26 May 2021 05:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210525054149.1792-1-kunyang_fan@asus.com>
In-Reply-To: <20210525054149.1792-1-kunyang_fan@asus.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 26 May 2021 08:05:04 -0400
X-Gmail-Original-Message-ID: <CAJKOXPebmHPKJU5Zti2jUw+-NaCP9YYDdMRUM1R48u0iK2mRgA@mail.gmail.com>
Message-ID: <CAJKOXPebmHPKJU5Zti2jUw+-NaCP9YYDdMRUM1R48u0iK2mRgA@mail.gmail.com>
Subject: Re: [PATCH 1/5] mfd: Add support for IO functions of AAEON devices
To:     aaeon.asus@gmail.com
Cc:     linux-gpio@vger.kernel.org, acelan.kao@canonical.com,
        Kunyang_Fan <kunyang_fan@asus.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 25 May 2021 at 01:42, <aaeon.asus@gmail.com> wrote:
>
> From: Kunyang_Fan <kunyang_fan@asus.com>
>
> This adds the supports for multiple IO functions of the
> AAEON x86 devices and makes use of the WMI interface to
> control the these IO devices including:
>
> - GPIO
> - LED
> - Watchdog
> - HWMON
>
> It also adds the mfd child device drivers to support
> the above IO functions.
>
> Signed-off-by: Kunyang_Fan <kunyang_fan@asus.com>
> ---
>  MAINTAINERS             | 12 +++++++
>  drivers/mfd/Kconfig     | 12 +++++++
>  drivers/mfd/Makefile    |  1 +
>  drivers/mfd/mfd-aaeon.c | 77 +++++++++++++++++++++++++++++++++++++++++

Please CC all required maintainers - you skipped several people. You
will get their list from scripts/get_maintainer.pl.

>  4 files changed, 102 insertions(+)
>  create mode 100644 drivers/mfd/mfd-aaeon.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1c19c1e2c970..49783dd44367 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -257,6 +257,18 @@ W: http://www.adaptec.com/
>  F:     Documentation/scsi/aacraid.rst
>  F:     drivers/scsi/aacraid/
>
> +AAEON DEVICE DRIVER WITH WMI INTERFACE
> +M:     Edward Lin<edward1_lin@asus.com>

Missing space.

> +M:     Kunyang Fan <kunyang_fan@asus.com>
> +M:     Frank Hsieh <frank2_hsieh@asus.com>
> +M:     Jacob Wu <jacob_wu@asus.com>

Why do you need four maintainers? Did they contribute to the code? Are
they all going to provide reviews?

> +S:     Supported
> +F:     drivers/gpio/gpio-aaeon.c
> +F:     drivers/hwmon/hwmon-aaeon.c
> +F:     drivers/leds/leds-aaeon.c
> +F:     drivers/mfd/mfd-aaeon.c
> +F:     drivers/watchdog/wdt_aaeon.c
> +
>  ABI/API
>  L:     linux-api@vger.kernel.org
>  F:     include/linux/syscalls.h
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index a37d7d171382..f172564eed0d 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2053,6 +2053,18 @@ config MFD_WCD934X
>           This driver provides common support WCD934x audio codec and its
>           associated Pin Controller, Soundwire Controller and Audio codec.
>
> +

No double blank lines.

> +config MFD_AAEON
> +       tristate "AAEON WMI MFD devices"
> +       depends on ASUS_WMI
> +       help
> +         Say yes here to support mltiple IO devices on Single Board Computers

Please run spellcheck on entire submission.

> +         produced by AAEON.
> +
> +         This driver leverages the ASUS WMI interface to access device
> +         resources.
> +
> +
>  menu "Multimedia Capabilities Port drivers"
>         depends on ARCH_SA1100
>
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 9367a92f795a..36fff3d0da7e 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -264,3 +264,4 @@ obj-$(CONFIG_MFD_ROHM_BD718XX)      += rohm-bd718x7.o
>  obj-$(CONFIG_MFD_STMFX)        += stmfx.o
>
>  obj-$(CONFIG_SGI_MFD_IOC3)     += ioc3.o
> +obj-$(CONFIG_MFD_AAEON)                += mfd-aaeon.o
> diff --git a/drivers/mfd/mfd-aaeon.c b/drivers/mfd/mfd-aaeon.c
> new file mode 100644
> index 000000000000..9d2efde53cad
> --- /dev/null
> +++ b/drivers/mfd/mfd-aaeon.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * UP Board main platform driver and FPGA configuration support
> + *
> + * Copyright (c) 2021, AAEON Ltd.
> + *
> + * Author: Kunyang_Fan <knuyang_fan@aaeon.com.tw>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

No need for GPL text since you use SPDX.

> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/gpio.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/leds.h>
> +#include <linux/wmi.h>
> +
> +#define AAEON_WMI_MGMT_GUID      "97845ED0-4E6D-11DE-8A39-0800200C9A66"
> +
> +struct aaeon_wmi_priv {
> +       const struct mfd_cell *cells;
> +       size_t ncells;
> +};
> +
> +static const struct mfd_cell aaeon_mfd_cells[] = {
> +       { .name = "gpio-aaeon" },
> +       { .name = "hwmon-aaeon"},
> +       { .name = "leds-aaeon"},
> +       { .name = "wdt-aaeon"},
> +};
> +
> +static const struct aaeon_wmi_priv aaeon_wmi_priv_data = {
> +       .cells = aaeon_mfd_cells,
> +       .ncells = ARRAY_SIZE(aaeon_mfd_cells),
> +};
> +
> +static int aaeon_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +       struct aaeon_wmi_priv *priv;
> +
> +       if (!wmi_has_guid(AAEON_WMI_MGMT_GUID)) {
> +               dev_info(&wdev->dev, "AAEON Management GUID not found\n");
> +               return -ENODEV;
> +       }
> +
> +

No double blank lines.

> +       priv = (struct aaeon_wmi_priv *)context;
> +       dev_set_drvdata(&wdev->dev, priv);

No, why do you need to store device ID table as private data?

Best regards,
Krzysztof
