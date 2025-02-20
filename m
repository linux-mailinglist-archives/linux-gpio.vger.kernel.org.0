Return-Path: <linux-gpio+bounces-16279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A71A3D7D2
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 12:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A43C019C0A6F
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 11:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F241F0E3C;
	Thu, 20 Feb 2025 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="o/pvkaOe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BA71D2F53
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 11:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740049609; cv=none; b=LEyYfW7umhx4jD69cCP84nevMm87tkh4go+iJXp4NivL6SQgSX1jRDIux4WPnU692z4xqcF8jO7tUyhJWxXko80e4H6aOFGFd/970LBMFLOycbI4f9Fwiw7GExcbH5G0T64nlshz0tEPcJLDE39zyJUmEI317xSrHpEmOQTJM0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740049609; c=relaxed/simple;
	bh=s4oKU2urhj9RNrtr81iMhTiGLqIjJKH5+GeofWS3KbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVWvxTdRLcFSVLKBFLGJFktP7vCB8D6Ja9tnQiGVs3OPvD2arWdXuHOZCMya8Yn0DRrvF1rjjbr0qE0K0jyxoI96iqEG38Q/04FtD9+KjfW6RGrXrgypPAAM4xRVaMj/DUgwBXNhrKK1bvL8vpl77W2VQNB5RRt+Ur7wNYhaRP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=o/pvkaOe; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30a2594435dso19010871fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 03:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740049605; x=1740654405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88pa8QCAoCeSDudvr+A5HpADlByWDOmaes4keZ6fQD0=;
        b=o/pvkaOedVsv+F7Tcrp/wGLNu3KOY68hbjmDmGayeXKI4aQC97c9Y5aPcRs6D4YF7e
         GZgqT04uHw16nMWTIJ5Uv2YX+Ghy+WYw/hTcraifhBLzh22SrCF+ptkHaON5aw3zeueN
         2mjlMkUoQcwkTfvJPjwYFsMDZ/1QxgSojcClv3385/YqyBg5OX+1u7jaHGbEuGEBD7Ao
         BpYusu8dzKmnE1G2ffrf78kJcdDjr2XXBNSPdl4NjRD4uj1uto/ZIvNFMH0oWuOO5sGn
         SQFUBwHfwsSyvC+ADBrYwUZCGLWg97JiMjk+NGR2o9f/OhoOKolyxtKoNxI8k9h2qE5Y
         sHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740049605; x=1740654405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88pa8QCAoCeSDudvr+A5HpADlByWDOmaes4keZ6fQD0=;
        b=LH5wKKBHUc2y0r84yFQbxgsdhki5BvPHKm2LBpemcS7We10D1PVYuXjUhiynBy4Os/
         rNzBtp5oq7o/Dfj1jCGx7FL2f7jdgcSOLQMSyNSjF/4crVf92VMtPsfaEwlOS+tCUhgD
         0KOyScIAnpL5DLO2wEFnfTlXHIIsdU7bTB6y5sNxz5bOkojTnjorO0LaKKhJVimI55ix
         sTOaTrnHB+7tWB/n3Z/y5fDQ/P1fPZtAwsr0MqKH7XDSxO8PwPJDx7mAurgYE4ETi7Al
         wT+qXCZVQOhF8s06ea64iVllkWnMx1Syv5KhcUFzJI0Cls3RWVqTFuhIQQ15S03mtegS
         zsxw==
X-Gm-Message-State: AOJu0YzbBnI6vbjezTwruuxU8+FTcqsHZfINOnS79LYujnl5SkzQ8dJc
	x9P71szSL0uG6se9eK5eDfELvJBMmGfkJoPAF/OHJxmRS08xCtTp+4qWoEj4lPyNC4+vL28ync/
	zFKqR9lMA0eTJpw7MMAhs3gUWOgcBqmxdkS5Zxa+PlsoqVIN6lOmETw==
X-Gm-Gg: ASbGncsyPga0VUSP4sqBM2fU6k1LzCtDtkGHH0uy4c0zn2NnVu6IZfxiYpLclPy4d/b
	TM12lTuVSig9Qk+Rk+n/2nXAVxQdpYqJTu7VM/juiTlMc0Asa/bQMs8LBC5/nDD4pUUDgv7W1Q2
	xYuKqSeqdDSwxC1WC6jvJ5e8o7ar4=
X-Google-Smtp-Source: AGHT+IEIgYaUEeRevJZSYl0tzDjWAxt2VSybbzcorq3JaM2EWX3T7AIQp+wA4GNkixlVXwNuuPED7wcEoxsjycAjSn8=
X-Received: by 2002:a2e:9212:0:b0:309:20da:6188 with SMTP id
 38308e7fff4ca-30a505f0052mr10769781fa.6.1740049604792; Thu, 20 Feb 2025
 03:06:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218160333.605829-1-koichiro.den@canonical.com> <20250218160333.605829-2-koichiro.den@canonical.com>
In-Reply-To: <20250218160333.605829-2-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 12:06:33 +0100
X-Gm-Features: AWEUYZnaxcokDwDzqhQvZvbVjbnlZ3fuTWp3xxS-BpjrsQuhx8aJz5lOcSxy5Sg
Message-ID: <CAMRc=MfmG0okVjV1nH78Aw18dFcoOAZ-UwU-iFc1VKb-BVcTxQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: introduce utilities for synchronous fake
 device creation
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 5:04=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> Both gpio-sim and gpio-virtuser share a mechanism to instantiate a
> platform device, wait for probe completion, and retrieve the probe
> success or error status synchronously. With gpio-aggregator planned to
> adopt this approach for its configfs interface, it's time to factor
> out the common code.
>
> Add dev-sync-probe.[ch] to house helper functions used by all such
> implementations.
>
> No functional change.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---

This is looking good now. A couple more nits for this series and the
next iteration should be good to go.

A note on patch versioning: when you split an existing series into
smaller, please keep the existing patch versioning. So if you had a
series that went up to v3 and you split it into two smaller ones, the
next time you submit it, it should be v4.

>  drivers/gpio/Kconfig          |  7 +++
>  drivers/gpio/Makefile         |  3 ++
>  drivers/gpio/dev-sync-probe.c | 96 +++++++++++++++++++++++++++++++++++
>  drivers/gpio/dev-sync-probe.h | 25 +++++++++
>  4 files changed, 131 insertions(+)
>  create mode 100644 drivers/gpio/dev-sync-probe.c
>  create mode 100644 drivers/gpio/dev-sync-probe.h
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 56c1f30ac195..2e4c5f0a94f7 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1863,6 +1863,13 @@ config GPIO_MPSSE
>
>  endmenu
>
> +# This symbol is selected by drivers that need synchronous fake device c=
reation

This comment is unnecessary, please drop it.

> +config DEV_SYNC_PROBE
> +       tristate "Utilities for synchronous fake device creation"

Please don't make this available for users to select, this should be a
hidden symbol only to be selected by its users.

> +       help
> +         Common helper functions for drivers that need synchronous fake
> +         device creation.
> +
>  menu "Virtual GPIO drivers"
>
>  config GPIO_AGGREGATOR
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index af3ba4d81b58..af130882ffee 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -19,6 +19,9 @@ obj-$(CONFIG_GPIO_GENERIC)    +=3D gpio-generic.o
>  # directly supported by gpio-generic
>  gpio-generic-$(CONFIG_GPIO_GENERIC)    +=3D gpio-mmio.o
>
> +# Utilities for drivers that need synchronous fake device creation
> +obj-$(CONFIG_DEV_SYNC_PROBE)           +=3D dev-sync-probe.o
> +
>  obj-$(CONFIG_GPIO_104_DIO_48E)         +=3D gpio-104-dio-48e.o
>  obj-$(CONFIG_GPIO_104_IDI_48)          +=3D gpio-104-idi-48.o
>  obj-$(CONFIG_GPIO_104_IDIO_16)         +=3D gpio-104-idio-16.o
> diff --git a/drivers/gpio/dev-sync-probe.c b/drivers/gpio/dev-sync-probe.=
c
> new file mode 100644
> index 000000000000..82c8d7ae9fa7
> --- /dev/null
> +++ b/drivers/gpio/dev-sync-probe.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: GPL-2.0+

Use GPL-2.0-or-later, same elsewhere.

> +/*
> + * Common code for drivers creating fake platform devices.
> + *
> + * Provides synchronous device creation: waits for probe completion and
> + * returns the probe success or error status to the device creator.
> + *
> + * Copyright (C) 2025 Bartosz Golaszewski <brgl@bgdev.pl>

Please copy my copyright entry from the gpio-sim with the right date
and add yours too, you did spend some time on this after all. Same for
MODULE_AUTHOR(), feel free to add yourself too.

> + */
> +
> +#include <linux/device.h>
> +#include <linux/slab.h>
> +
> +#include "dev-sync-probe.h"
> +
> +static int dev_sync_probe_notifier_call(struct notifier_block *nb,
> +                                       unsigned long action,
> +                                       void *data)

No need for this last line break.

> +{
> +       struct dev_sync_probe_data *pdata;
> +       struct device *dev =3D data;
> +
> +       pdata =3D container_of(nb, struct dev_sync_probe_data, bus_notifi=
er);
> +       if (!device_match_name(dev, pdata->name))
> +               return NOTIFY_DONE;
> +
> +       switch (action) {
> +       case BUS_NOTIFY_BOUND_DRIVER:
> +               pdata->driver_bound =3D true;
> +               break;
> +       case BUS_NOTIFY_DRIVER_NOT_BOUND:
> +               pdata->driver_bound =3D false;
> +               break;
> +       default:
> +               return NOTIFY_DONE;
> +       }
> +
> +       complete(&pdata->probe_completion);
> +       return NOTIFY_OK;
> +}
> +
> +void dev_sync_probe_init(struct dev_sync_probe_data *data)
> +{
> +       memset(data, 0, sizeof(*data));
> +       init_completion(&data->probe_completion);
> +       data->bus_notifier.notifier_call =3D dev_sync_probe_notifier_call=
;
> +}
> +EXPORT_SYMBOL_GPL(dev_sync_probe_init);
> +
> +int dev_sync_probe_register(struct dev_sync_probe_data *data,
> +                           struct platform_device_info *pdevinfo)
> +{
> +       struct platform_device *pdev;
> +       char *name;
> +
> +       name =3D kasprintf(GFP_KERNEL, "%s.%u", pdevinfo->name, pdevinfo-=
>id);

pdevinfo->id is a signed integer

I'm also wondering if we could avoid the allocation here and keep on
using snprintf() like in the existing drivers? On the other hand,
memory is cheap so no big deal.

> +       if (!name)
> +               return -ENOMEM;
> +
> +       data->driver_bound =3D false;
> +       data->name =3D name;
> +       reinit_completion(&data->probe_completion);
> +       bus_register_notifier(&platform_bus_type, &data->bus_notifier);
> +
> +       pdev =3D platform_device_register_full(pdevinfo);
> +       if (IS_ERR(pdev)) {
> +               bus_unregister_notifier(&platform_bus_type, &data->bus_no=
tifier);
> +               kfree(data->name);

We could probably simplify it by using __free(kfree) with the name
variable and just setting it at the end with no_free_ptr().

Bart

> +               return PTR_ERR(pdev);
> +       }
> +
> +       wait_for_completion(&data->probe_completion);
> +       bus_unregister_notifier(&platform_bus_type, &data->bus_notifier);
> +
> +       if (!data->driver_bound) {
> +               platform_device_unregister(pdev);
> +               kfree(data->name);
> +               return -ENXIO;
> +       }
> +
> +       data->pdev =3D pdev;
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(dev_sync_probe_register);
> +
> +void dev_sync_probe_unregister(struct dev_sync_probe_data *data)
> +{
> +       platform_device_unregister(data->pdev);
> +       kfree(data->name);
> +       data->pdev =3D NULL;
> +}
> +EXPORT_SYMBOL_GPL(dev_sync_probe_unregister);
> +
> +MODULE_AUTHOR("Bartosz Golaszewski <brgl@bgdev.pl>");
> +MODULE_DESCRIPTION("Utilities for synchronous fake device creation");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpio/dev-sync-probe.h b/drivers/gpio/dev-sync-probe.=
h
> new file mode 100644
> index 000000000000..4b3d52b70519
> --- /dev/null
> +++ b/drivers/gpio/dev-sync-probe.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef DEV_SYNC_PROBE_H
> +#define DEV_SYNC_PROBE_H
> +
> +#include <linux/completion.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_device.h>
> +
> +struct dev_sync_probe_data {
> +       struct platform_device *pdev;
> +       const char *name;
> +
> +       /* Synchronize with probe */
> +       struct notifier_block bus_notifier;
> +       struct completion probe_completion;
> +       bool driver_bound;
> +};
> +
> +void dev_sync_probe_init(struct dev_sync_probe_data *data);
> +int dev_sync_probe_register(struct dev_sync_probe_data *data,
> +                           struct platform_device_info *pdevinfo);
> +void dev_sync_probe_unregister(struct dev_sync_probe_data *data);
> +
> +#endif /* DEV_SYNC_PROBE_H */
> --
> 2.45.2
>

