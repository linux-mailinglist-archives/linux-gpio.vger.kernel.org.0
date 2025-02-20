Return-Path: <linux-gpio+bounces-16294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC9FA3DAE3
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF93716B28A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E115C1F76B5;
	Thu, 20 Feb 2025 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="bqGwNzlV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B5C1F7076
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740056875; cv=none; b=fQB0GhqZYmfw52IdxHJgI+AH0EZOfpPcIzTX5wf3f0QHCKQPYyxYDGpQS9fjx1rsxBAi7WNSGLWyCSAv6DCQLGnIZ20gEpdrGIZNJ/4HwhepfyLYjP5TCBhkco5NZ7q3QCqXlEKuTojoK/1Qnr7fZgYJ0rCe+shlK5Yr+PJKyxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740056875; c=relaxed/simple;
	bh=DEUgsLMYzQJeYP7HLz/2kM+6qWl5Uv+qEDBre4YWS2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiRY1ci+ryO0zR0nURtLXsV6doRlwBoEHFBQx5xlEKairGUzu0/2yX6W+xpF7/78eYISTEi2j3MNyEExDG8jc9JG3/AkioeD3jl0CVfvAka6+DJPj2DCzVRu+z+xyoC+FyEzyaeN847d8NgDDkPQYriZoSxZgEubU6Ajq0eHIq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=bqGwNzlV; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1D9B3403E9
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740056866;
	bh=qHQ5bk3bFfd//jlt/3J7bYEvJSUgSlhwcN/AGKkiniw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=bqGwNzlVVe4ci7j23Q1ci60KLXcTxMygab/wITohVC+/jAhUNYPt4KoRGaYhfS4sI
	 Bt2vuK+crDQXAZNXoC4AMEaesQOiEhF/sZRmFmllbQN3qUPOx7khMGIa4pEjcJbMz6
	 /0CnW4PgzOgcyYdcvahglDfzRJraj/LXOpnxYc3S+0/ci2SuufIyoMv8ielTF6ew8c
	 VV5YRPFhaygjmLVz8qcxRvO6CPy0q+kbwOQE9G1OXI2a3lpIHeN3caQSfxJDM08RGf
	 6lyk8siI6O95pZkMQKBJPvaeLU7nOH+CfsDQi8swnPrkMTolfwfrOzx+VFrup3kgYN
	 UzX8ACtFfEdpw==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-220fff23644so23890225ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 05:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056862; x=1740661662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHQ5bk3bFfd//jlt/3J7bYEvJSUgSlhwcN/AGKkiniw=;
        b=s4KgmPPFZUetcH3t0d5R0Wy5oDv9N+okqsTfS1HLCdq8B/Vteq4tYKRXMPzt3NkMxX
         k21Qjb7919Lof3QlfAvIlOrc5JzzN9p092UVQdx+3FFVSJa/zYJReDOrq3/R3f9FGGFT
         wtBfvVm1FwRk9MD1pI0TtzRh7onYn7A8B3mBruywPs7W0qMeTaqsCxsiedtMHIzH4ZVL
         sFTl/O6AQyB+bI/1LWjzVxMK9iD9vBGH210+okGWpyqMx81JgSbWM0UK6vZBVHGxWoJl
         BHitbIO/y0DNwot5imATsNvPOnirSSsBmBwJm7DEG0SnsdhKjVt3s/j9OnEylw8fttsd
         vPEw==
X-Gm-Message-State: AOJu0Yzx1o/0GbZ1YZ/YWhO3f8Q9OAAbcbq/ti0rP0+wogFzDWH+Rb4k
	p/M7jZISoL2f5PJHbKp0xnf/kVzMoFPrlAwgLKzKD0GOQ1jHyiQbHSH/HSGjQWe7eEsuzAwDrq5
	1+BlwDlUZi3Hf2YNdD90+txXcXVwFZonZaAC1/DBUq3hoxJLeyHyWQmYuStK+GGTbdSGbadranX
	s=
X-Gm-Gg: ASbGncsKd+JNXodhK8fvheLX+/p9JZ0AulgYvTbmRsC4xEfBpxaV+Ef1C9gJlpiWvx7
	XScvGzBmKxfMnp5WZxjOVIal4E/X3K0HCDTBQQ1b/Qq1WLxfofSvBBphXp6sE2H1W7UlrI7Kewn
	2CnhUje6GMe67NZJ2nnfEIZUxhu8HYdUl4tH1cAUawbyiXWeIa8nsn7deJ7Fb/QWwI6bgdDOlil
	pzaLPanPMrXRHQmE0EUj6dhf5tTL/k1Pfj9bJBE6tLmKoZoniG3AnZ/gRL0pfPPVmBW0m7e4aj/
	GfHMGfI=
X-Received: by 2002:a17:902:f64a:b0:220:cb6c:2e30 with SMTP id d9443c01a7336-221040bf792mr340193295ad.49.1740056861586;
        Thu, 20 Feb 2025 05:07:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUvzkT3z9oVRPTo5evmNzGXeUQQKn8+wnnLKpf0ZShhjh5ZELZn27BQATNNMeWV73LG6+fpQ==
X-Received: by 2002:a17:902:f64a:b0:220:cb6c:2e30 with SMTP id d9443c01a7336-221040bf792mr340192975ad.49.1740056861199;
        Thu, 20 Feb 2025 05:07:41 -0800 (PST)
Received: from localhost ([240f:74:7be:1:256c:5029:b967:ebb0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5366242sm121069735ad.87.2025.02.20.05.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 05:07:40 -0800 (PST)
Date: Thu, 20 Feb 2025 22:07:38 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] gpio: introduce utilities for synchronous fake
 device creation
Message-ID: <wyicl2dgxkwxzfwd37cmhgshnqb3phmpeboz3gwqqfmbabaegy@tkjx56nj423u>
References: <20250218160333.605829-1-koichiro.den@canonical.com>
 <20250218160333.605829-2-koichiro.den@canonical.com>
 <CAMRc=MfmG0okVjV1nH78Aw18dFcoOAZ-UwU-iFc1VKb-BVcTxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfmG0okVjV1nH78Aw18dFcoOAZ-UwU-iFc1VKb-BVcTxQ@mail.gmail.com>

On Thu, Feb 20, 2025 at 12:06:33PM GMT, Bartosz Golaszewski wrote:
> On Tue, Feb 18, 2025 at 5:04 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > Both gpio-sim and gpio-virtuser share a mechanism to instantiate a
> > platform device, wait for probe completion, and retrieve the probe
> > success or error status synchronously. With gpio-aggregator planned to
> > adopt this approach for its configfs interface, it's time to factor
> > out the common code.
> >
> > Add dev-sync-probe.[ch] to house helper functions used by all such
> > implementations.
> >
> > No functional change.
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> 
> This is looking good now. A couple more nits for this series and the
> next iteration should be good to go.
> 
> A note on patch versioning: when you split an existing series into
> smaller, please keep the existing patch versioning. So if you had a
> series that went up to v3 and you split it into two smaller ones, the
> next time you submit it, it should be v4.
> 
> >  drivers/gpio/Kconfig          |  7 +++
> >  drivers/gpio/Makefile         |  3 ++
> >  drivers/gpio/dev-sync-probe.c | 96 +++++++++++++++++++++++++++++++++++
> >  drivers/gpio/dev-sync-probe.h | 25 +++++++++
> >  4 files changed, 131 insertions(+)
> >  create mode 100644 drivers/gpio/dev-sync-probe.c
> >  create mode 100644 drivers/gpio/dev-sync-probe.h
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 56c1f30ac195..2e4c5f0a94f7 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1863,6 +1863,13 @@ config GPIO_MPSSE
> >
> >  endmenu
> >
> > +# This symbol is selected by drivers that need synchronous fake device creation
> 
> This comment is unnecessary, please drop it.

Will fix it, thanks.

> 
> > +config DEV_SYNC_PROBE
> > +       tristate "Utilities for synchronous fake device creation"
> 
> Please don't make this available for users to select, this should be a
> hidden symbol only to be selected by its users.

Will fix it, thanks.

> 
> > +       help
> > +         Common helper functions for drivers that need synchronous fake
> > +         device creation.
> > +
> >  menu "Virtual GPIO drivers"
> >
> >  config GPIO_AGGREGATOR
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index af3ba4d81b58..af130882ffee 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -19,6 +19,9 @@ obj-$(CONFIG_GPIO_GENERIC)    += gpio-generic.o
> >  # directly supported by gpio-generic
> >  gpio-generic-$(CONFIG_GPIO_GENERIC)    += gpio-mmio.o
> >
> > +# Utilities for drivers that need synchronous fake device creation
> > +obj-$(CONFIG_DEV_SYNC_PROBE)           += dev-sync-probe.o
> > +
> >  obj-$(CONFIG_GPIO_104_DIO_48E)         += gpio-104-dio-48e.o
> >  obj-$(CONFIG_GPIO_104_IDI_48)          += gpio-104-idi-48.o
> >  obj-$(CONFIG_GPIO_104_IDIO_16)         += gpio-104-idio-16.o
> > diff --git a/drivers/gpio/dev-sync-probe.c b/drivers/gpio/dev-sync-probe.c
> > new file mode 100644
> > index 000000000000..82c8d7ae9fa7
> > --- /dev/null
> > +++ b/drivers/gpio/dev-sync-probe.c
> > @@ -0,0 +1,96 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> 
> Use GPL-2.0-or-later, same elsewhere.

Will fix it, thanks.

> 
> > +/*
> > + * Common code for drivers creating fake platform devices.
> > + *
> > + * Provides synchronous device creation: waits for probe completion and
> > + * returns the probe success or error status to the device creator.
> > + *
> > + * Copyright (C) 2025 Bartosz Golaszewski <brgl@bgdev.pl>
> 
> Please copy my copyright entry from the gpio-sim with the right date
> and add yours too, you did spend some time on this after all. Same for
> MODULE_AUTHOR(), feel free to add yourself too.

Will do so (i.e. change 2025 -> 2021 and add mine), thanks.

> 
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/slab.h>
> > +
> > +#include "dev-sync-probe.h"
> > +
> > +static int dev_sync_probe_notifier_call(struct notifier_block *nb,
> > +                                       unsigned long action,
> > +                                       void *data)
> 
> No need for this last line break.

Will fix it. Thanks, and sorry about silly mistakes.

> 
> > +{
> > +       struct dev_sync_probe_data *pdata;
> > +       struct device *dev = data;
> > +
> > +       pdata = container_of(nb, struct dev_sync_probe_data, bus_notifier);
> > +       if (!device_match_name(dev, pdata->name))
> > +               return NOTIFY_DONE;
> > +
> > +       switch (action) {
> > +       case BUS_NOTIFY_BOUND_DRIVER:
> > +               pdata->driver_bound = true;
> > +               break;
> > +       case BUS_NOTIFY_DRIVER_NOT_BOUND:
> > +               pdata->driver_bound = false;
> > +               break;
> > +       default:
> > +               return NOTIFY_DONE;
> > +       }
> > +
> > +       complete(&pdata->probe_completion);
> > +       return NOTIFY_OK;
> > +}
> > +
> > +void dev_sync_probe_init(struct dev_sync_probe_data *data)
> > +{
> > +       memset(data, 0, sizeof(*data));
> > +       init_completion(&data->probe_completion);
> > +       data->bus_notifier.notifier_call = dev_sync_probe_notifier_call;
> > +}
> > +EXPORT_SYMBOL_GPL(dev_sync_probe_init);
> > +
> > +int dev_sync_probe_register(struct dev_sync_probe_data *data,
> > +                           struct platform_device_info *pdevinfo)
> > +{
> > +       struct platform_device *pdev;
> > +       char *name;
> > +
> > +       name = kasprintf(GFP_KERNEL, "%s.%u", pdevinfo->name, pdevinfo->id);
> 
> pdevinfo->id is a signed integer
> 
> I'm also wondering if we could avoid the allocation here and keep on
> using snprintf() like in the existing drivers? On the other hand,
> memory is cheap so no big deal.

Are you assuming the following change?

   struct dev_sync_probe_data {
          struct platform_device *pdev;
  -       const char *name;
  +       char name[32];

          /* Synchronize with probe */
          struct notifier_block bus_notifier;

> 
> > +       if (!name)
> > +               return -ENOMEM;
> > +
> > +       data->driver_bound = false;
> > +       data->name = name;
> > +       reinit_completion(&data->probe_completion);
> > +       bus_register_notifier(&platform_bus_type, &data->bus_notifier);
> > +
> > +       pdev = platform_device_register_full(pdevinfo);
> > +       if (IS_ERR(pdev)) {
> > +               bus_unregister_notifier(&platform_bus_type, &data->bus_notifier);
> > +               kfree(data->name);
> 
> We could probably simplify it by using __free(kfree) with the name
> variable and just setting it at the end with no_free_ptr().

platform_device_register_full() call path might finish probe so before
calling it, we need to make sure the 'name' is filled in. That's why I
didn't used __free(kfree).

> 
> Bart
> 
> > +               return PTR_ERR(pdev);
> > +       }
> > +
> > +       wait_for_completion(&data->probe_completion);
> > +       bus_unregister_notifier(&platform_bus_type, &data->bus_notifier);
> > +
> > +       if (!data->driver_bound) {
> > +               platform_device_unregister(pdev);
> > +               kfree(data->name);
> > +               return -ENXIO;
> > +       }
> > +
> > +       data->pdev = pdev;
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(dev_sync_probe_register);
> > +
> > +void dev_sync_probe_unregister(struct dev_sync_probe_data *data)
> > +{
> > +       platform_device_unregister(data->pdev);
> > +       kfree(data->name);
> > +       data->pdev = NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(dev_sync_probe_unregister);
> > +
> > +MODULE_AUTHOR("Bartosz Golaszewski <brgl@bgdev.pl>");
> > +MODULE_DESCRIPTION("Utilities for synchronous fake device creation");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpio/dev-sync-probe.h b/drivers/gpio/dev-sync-probe.h
> > new file mode 100644
> > index 000000000000..4b3d52b70519
> > --- /dev/null
> > +++ b/drivers/gpio/dev-sync-probe.h
> > @@ -0,0 +1,25 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef DEV_SYNC_PROBE_H
> > +#define DEV_SYNC_PROBE_H
> > +
> > +#include <linux/completion.h>
> > +#include <linux/notifier.h>
> > +#include <linux/platform_device.h>
> > +
> > +struct dev_sync_probe_data {
> > +       struct platform_device *pdev;
> > +       const char *name;
> > +
> > +       /* Synchronize with probe */
> > +       struct notifier_block bus_notifier;
> > +       struct completion probe_completion;
> > +       bool driver_bound;
> > +};
> > +
> > +void dev_sync_probe_init(struct dev_sync_probe_data *data);
> > +int dev_sync_probe_register(struct dev_sync_probe_data *data,
> > +                           struct platform_device_info *pdevinfo);
> > +void dev_sync_probe_unregister(struct dev_sync_probe_data *data);
> > +
> > +#endif /* DEV_SYNC_PROBE_H */
> > --
> > 2.45.2
> >

