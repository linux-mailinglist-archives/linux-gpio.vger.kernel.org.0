Return-Path: <linux-gpio+bounces-16300-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D5A3DB18
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 913423A8EC1
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08B71F8BAF;
	Thu, 20 Feb 2025 13:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="BZiG6FQM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B691F428F
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 13:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740057418; cv=none; b=c4wXhu/lGP2k8ko6UQLxwp6jw32SLkqqfb9FHNbSEkyVSCsGjdcL/QWhDg6Qnm3Ohhy0em/NoMMFp/3zflfp5kR8ZRY/huA7cdFL13xGTzCNjZ9NZB6mp4DZTz9/je1/fQBJBClH+60/BcML+wyN+fd5dNWPbkrCs+6LvUfEU8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740057418; c=relaxed/simple;
	bh=O/pcslFcpr0f5ZTidXgUY3uercvjLQ7TRdPWR0Zdbus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwrpRfLaJSyjtz2FM+w17C93+YmmB8lSx5Rm/28RgaWM2z+BmfFbrRIGDYfgJhdhoJBpRhdYPDu7QJZTs6TWoSi2imhNrf1FwbrEHVYsvUcVh/uLNlGChc0zN+m2et8u4TXcfWissFovPbBoBsH5aFTUOP8F3e1aXVmOG3ehACY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=BZiG6FQM; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 21216403EC
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 13:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740057409;
	bh=/8aQoZaTUfoNowvRR47KlMkTIP5mw7gRFDUg5NhsTws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=BZiG6FQMnsP5e2lg1DBizExx6RS1p+CbGq4lXopy/ha5vwdhXT88LxZUf7l/VtJz7
	 QB8EkWb8mIWfI1N7koL0GQK3augi4U/gR1cdhIeJTTh/MzeKF4C9SQOc29tg9GkZfO
	 G/7yCuQlVrc6yDbShNy0rYOzXHeT1D2wlM/0gGh8GH1lOO3XxAhecgMfmSZOiVEsZG
	 wPT4YbFOzHQhwN/94OXDQtZrtC9V9rePVuR3sgbn72+yz+W7LpnYlzrC2+i64rdRN8
	 6X9qryriF+hHL4ivYYOmWhGYFssiZGTgfkIUF0Od4EEXGwK2rZqvNp9/cXt7rpUa1m
	 ax7QmFbHRLCYQ==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-220ec5c16e9so22293505ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 05:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740057405; x=1740662205;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8aQoZaTUfoNowvRR47KlMkTIP5mw7gRFDUg5NhsTws=;
        b=aZ5K7DtT+IEYTDkwqQ9ngE9OmFNgkykmXHZagXxb5qV2Y4//6w1E9Qu5idQwBWSwTs
         Qk27+feG32KVP+RI3ZCX4NlKRE2dbbqs0QZ9/6UMD5HYYl00uESrxmprQKxnA1PRrw1l
         y+aR9I3+7bLkrnxlrQpXkh8NaLBQ5Npsrc6K4V0QoZduXVLGxjmaOF7X0rkW6EvkCGlK
         xap+Og9PToalwHsgtuFQ7QKwTx3TVUdJllZWJYnWU+E5nsMyevzAOSM0i8GAMR2Wlzyt
         r1tyZjQwCOVCJSexVbH5hh5jDCPg0wxSpsbelNX7Fvp9UshNux/oArv0cnKMtX7q36t1
         N1+w==
X-Gm-Message-State: AOJu0YywWtV8cGJ2xrJvivvlDIO6zK1EXgKESk6OIEpR3bPQ4cv8I6c3
	RQ+67XX8uA+fwA+o/pbXEfaTEj+H4O9AqYhDZOci+9uibrp10o13hME2LT6B2PzoVPo/IRdQ1B8
	ngbxTjAqiNC4NIMU+Nr5EoFXt2sblqUTpCRbyYNf+cqV5aojdwJxUF/gXZScWRjYd+lEAQzO43G
	k=
X-Gm-Gg: ASbGnctE2gQtzGyUPYKP653CYb4ru3CHFpPMLNLGoPPXkK1rBPBkpsYc6iuOnqpHngL
	9KoDCDZHe59WAIid7usHnpUwEfcnQS8zGTsqn1dXHyFwSdfHxZoK5aQNCfhhDBnueIkvOutJ3Wv
	vTStSdMjrPtTc0ukniDwhROx+yeR7F22oBXbDaHw+yhmEM41l2XLJ+vDCJnvJ5kbMV5e67raC8P
	FvpjlnezAKq+E92IOhkhWIn4Q9rrJq1JrTlMW2tbu8DnvRUXdvX4MEf5Vu8a/CuWRCEOMg08a+v
	rs7Ds7A=
X-Received: by 2002:a17:902:e54e:b0:220:ff3f:6cc5 with SMTP id d9443c01a7336-221040bf806mr376361055ad.35.1740057405203;
        Thu, 20 Feb 2025 05:16:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2KOSUptvPinX/k5Saw4tMLamZZbv8gxiM+tqxI2xfqILR4P+Ah0orpEgtGVVBfOoZdxm3uA==
X-Received: by 2002:a17:902:e54e:b0:220:ff3f:6cc5 with SMTP id d9443c01a7336-221040bf806mr376360765ad.35.1740057404797;
        Thu, 20 Feb 2025 05:16:44 -0800 (PST)
Received: from localhost ([240f:74:7be:1:256c:5029:b967:ebb0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7327590ff12sm8310169b3a.115.2025.02.20.05.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 05:16:44 -0800 (PST)
Date: Thu, 20 Feb 2025 22:16:41 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] gpio: introduce utilities for synchronous fake
 device creation
Message-ID: <guth2xon24ui6qstxtm6lmrdv3z2ktsfwgcdz4n4twzty2b6vd@r5rjsetmfdjt>
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

Somehow I forgot to reply here.
I got it, thank you. I'll be careful not to make the same mistake next time.

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
> 
> > +config DEV_SYNC_PROBE
> > +       tristate "Utilities for synchronous fake device creation"
> 
> Please don't make this available for users to select, this should be a
> hidden symbol only to be selected by its users.
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

