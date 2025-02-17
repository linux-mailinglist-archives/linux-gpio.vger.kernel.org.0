Return-Path: <linux-gpio+bounces-16162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D5FA388E2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 17:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C0287A266A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 16:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46587224AFF;
	Mon, 17 Feb 2025 16:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="e4w1t3FP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E8CDDBE
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 16:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739808746; cv=none; b=J0/0+Swrag8i/PGJc/eLtBRRynRRBK/nU2vlfwpZ9npjOrUUQdzZD5BWCwSaj8x82ZYPZPfII708WZnp/uWSurO6ZhAqJPdE/qc8Pf37JKbQXPDsU1tOECyqaZ/JmEmvLytxdE/N2jyYrNThrsBT7I6PH/kjrBwsty+kRSPko/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739808746; c=relaxed/simple;
	bh=BSdpLDe+Bk7rLLcbs3B1euM951K9mGEuqk2VpmnmFio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2jXOECpmlK9dyXBKwJbkpa/NNtQcxSEvGQdl4QtDC6NPBLCiKbbcK6uEmuA9vWhSxrA0OKb/o9WWIu2q8U9x/8taGK5k2NjXTVdKhBJBDceuiZ434fIZvbuPaDbpRGb1KZqwRWHGhaZ51rWXkLt9uh4jHsFYZxz6vYY3s8H4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=e4w1t3FP; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F16AF3F2A0
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 16:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739808739;
	bh=F714eHIUurwbY0eC9hkimzXvjJPjIfRrGDwQyWyCsPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=e4w1t3FPUeYscXCxlUsB575NJANLhaW8Rhr6UzyjvafWj4tj0QnG8jv3vVXsDUv60
	 0mto47Az9lhZ79nv/Ck3aFzRkMt7bOEgS1rRqOqLn2ZibG5kEMf8RfSn5TESP7ER/5
	 A6h4o2sESBbBJh1ppeEKnYFVms+NCqJjIQu5WrVS5uguFaR3HB2LVsQobU0Vz4NrD3
	 2LE+VG7OwEUyxTkUgzpgEz4xpTkt7MvMRzoxXWDeu8iX+aD5ZasrKUcMzsaGViN/iT
	 g5UFo6YhL5lWmW4H6YBUUrPjurIz1wuULrEs+9F9oEElo+tL4Mpbn6AYUvhg8tE6OB
	 7w8seCSTX5h4Q==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22107b29ac3so35334185ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 08:12:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739808737; x=1740413537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F714eHIUurwbY0eC9hkimzXvjJPjIfRrGDwQyWyCsPs=;
        b=IoHvSbDljFgis/HOVD9ljwjBOQMEVLTv2K64jYvevH/4Ms89z6O7bkL9NF68NZbWDq
         ldDLOTImkbr/+udpTo/AxCjbfNgwnka6v6of+SznDq23I6sdiQmXkAZyTJ9jxKfQa933
         uoCxD2+fcOqt2vlFuMN4HALbD3QcxTlMEKYrfYWFN6ehmObZc/snIdZT5Ozo6T6jhBJa
         0zdN4/Dhd4USK08rkVPzp1shAeXJYEf1ZF6PA4J+h0Ny88ghXc2uUs5ncpXhefHc76CL
         0kTPfV71b8gsEeM6Zcmdo0E7v3AoBg6JZwwXFdhyLDCN2DP2vuHF3xyGBl3mjZqc+Tih
         ghow==
X-Gm-Message-State: AOJu0Yx6wOsFM5amRD1oeQcHvUwT86XSbk8VIGQsVbngAi1KVFPg2JgC
	DS1NeFHWSBGGw/ln6HhJtcPTlxOqj7LIMxuYsF3s4RW8F0WhVd+HUnrRTDM1LT3MKOBEoGKIDBV
	ATIZzG80Oe/9cuUgxP01rd2iv8XxCntT1nfLpCoN3WGzZMmWiUsbtW6pquXWhSLW8X98WNP9BD5
	c=
X-Gm-Gg: ASbGncs/E8HIaDfHHxucMZq/pwYZuumHDlGspPFa2uXPug4a01lK/oh4Ykaav+V+0ew
	xmUwfJTqpu1p68jTPsWW3uoU76g6dZraj1Y4HdOEcVS/FPt0uVidufn9jf+8pDMuM0TU2jcdgXV
	YAT7K72O+M9TECEOTLBXJgNzV9yIXc+VFbpzWK7uL02NfKSReO4qgeiy6JWoTdRSOD0Xv4RkSAq
	BudX45TbtXFBpmBlwTnrNjHMbybe0PJf4LD+acQnseiUDKeTqeTYgWEsU/BaQ5lUDbOcBWgnfZf
	Ts2N+AI=
X-Received: by 2002:a17:902:d50d:b0:216:4676:dfb5 with SMTP id d9443c01a7336-22104714fcbmr174518135ad.21.1739808737536;
        Mon, 17 Feb 2025 08:12:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkLajzt2sroVWG8rTsLm/ZBxWA2YNk5tT2HgiisoPu94Ds+st1KJob0/S/81+czoWepLMp+w==
X-Received: by 2002:a17:902:d50d:b0:216:4676:dfb5 with SMTP id d9443c01a7336-22104714fcbmr174517775ad.21.1739808737130;
        Mon, 17 Feb 2025 08:12:17 -0800 (PST)
Received: from localhost ([240f:74:7be:1:a56a:cda4:c8e9:c45c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545c814sm73980875ad.148.2025.02.17.08.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:12:16 -0800 (PST)
Date: Tue, 18 Feb 2025 01:12:14 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] gpio: pseudo: common helper functions for pseudo
 gpio devices
Message-ID: <d2qdoq3f3jk6gzgsjeqszgaqk7z523r7cfnopxfq4ghsbsqgp3@zjw67ewqzi5u>
References: <20250217142758.540601-1-koichiro.den@canonical.com>
 <20250217142758.540601-2-koichiro.den@canonical.com>
 <CAMRc=McB0bcG4jERmUyrQ=eTP+kcfLBBAOaT7mCMKbgUB1W5nw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McB0bcG4jERmUyrQ=eTP+kcfLBBAOaT7mCMKbgUB1W5nw@mail.gmail.com>

On Mon, Feb 17, 2025 at 04:46:30PM GMT, Bartosz Golaszewski wrote:
> On Mon, Feb 17, 2025 at 3:28 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > Both gpio-sim and gpio-virtuser share a mechanism to instantiate a
> > platform device and wait synchronously for probe completion.
> > With gpio-aggregator adopting the same approach in a later commit for
> > its configfs interface, it's time to factor out the common code.
> >
> > Add gpio-pseudo.[ch] to house helper functions used by all the pseudo
> > GPIO device implementations.
> >
> > No functional change.
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> 

Thanks for the review.

> Looking at this patch now, I've realized that there is nothing
> GPIO-specific here. It's a mechanism for synchronous platform device
> probing. I don't think its place is in drivers/gpio/ if we're making
> it a set of library functions. Can I suggest moving it to lib/ and
> renaming the module as pdev_sync_probe or something else that's
> expressive enough to tell users what it does? You can make me the
> maintainer of that module if you wish (feel free to add yourself
> too!).

I had vaguely envisioned that this might eventually contain some
GPIO-specific code for some reason, and also it's just a tiny utility to
reduce code duplication, which is why I placed it in the neighborhood,
drivers/gpio/. However, of course you’re right, there’s nothing
GPIO-specific here, so moving it to lib/ makes sense.

I'm not really sure if this method for synchronous platform device probing
can be broadly accepted as a general solution, but I have no objections to
making the change. I'll move it as you suggested and send v2, setting you
as its maintainer.

> 
> >  drivers/gpio/Kconfig       |  4 ++
> >  drivers/gpio/Makefile      |  1 +
> >  drivers/gpio/gpio-pseudo.c | 86 ++++++++++++++++++++++++++++++++++++++
> >  drivers/gpio/gpio-pseudo.h | 24 +++++++++++
> >  4 files changed, 115 insertions(+)
> >  create mode 100644 drivers/gpio/gpio-pseudo.c
> >  create mode 100644 drivers/gpio/gpio-pseudo.h
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 56c1f30ac195..1e2c95e03a95 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1863,6 +1863,10 @@ config GPIO_MPSSE
> >
> >  endmenu
> >
> > +# This symbol is selected by some pseudo gpio device implementations
> > +config GPIO_PSEUDO
> > +       bool
> 
> Please make it tristate - modules that use it are already tristate.

Thanks for pointing that out. I'll fix it.

> 
> > +
> >  menu "Virtual GPIO drivers"
> >
> >  config GPIO_AGGREGATOR
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index af3ba4d81b58..5eb54147a1ab 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -136,6 +136,7 @@ obj-$(CONFIG_GPIO_PISOSR)           += gpio-pisosr.o
> >  obj-$(CONFIG_GPIO_PL061)               += gpio-pl061.o
> >  obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)       += gpio-pmic-eic-sprd.o
> >  obj-$(CONFIG_GPIO_POLARFIRE_SOC)       += gpio-mpfs.o
> > +obj-$(CONFIG_GPIO_PSEUDO)              += gpio-pseudo.o
> >  obj-$(CONFIG_GPIO_PXA)                 += gpio-pxa.o
> >  obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)     += gpio-raspberrypi-exp.o
> >  obj-$(CONFIG_GPIO_RC5T583)             += gpio-rc5t583.o
> > diff --git a/drivers/gpio/gpio-pseudo.c b/drivers/gpio/gpio-pseudo.c
> > new file mode 100644
> > index 000000000000..6e3da05440d8
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-pseudo.c
> > @@ -0,0 +1,86 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Helper functions for Pseudo GPIOs
> > + *
> > + * Copyright 2025 Canonical Ltd.
> 
> Well, I'd say that most of the code here is still mine, so I'll go
> ahead and shamelessly claim some credit: it would make sense to keep
> my copyright.

Sure, sorry about that. I'll fix it.

> 
> > + */
> > +
> > +#include "gpio-pseudo.h"
> > +
> > +static int pseudo_gpio_notifier_call(struct notifier_block *nb,
> > +                                    unsigned long action,
> > +                                    void *data)
> > +{
> > +       struct pseudo_gpio_common *common;
> > +       struct device *dev = data;
> > +
> > +       common = container_of(nb, struct pseudo_gpio_common, bus_notifier);
> > +       if (!device_match_name(dev, common->name))
> > +               return NOTIFY_DONE;
> > +
> > +       switch (action) {
> > +       case BUS_NOTIFY_BOUND_DRIVER:
> > +               common->driver_bound = true;
> > +               break;
> > +       case BUS_NOTIFY_DRIVER_NOT_BOUND:
> > +               common->driver_bound = false;
> > +               break;
> > +       default:
> > +               return NOTIFY_DONE;
> > +       }
> > +
> > +       complete(&common->probe_completion);
> > +       return NOTIFY_OK;
> > +}
> > +
> > +void pseudo_gpio_init(struct pseudo_gpio_common *common)
> > +{
> > +       memset(common, 0, sizeof(*common));
> > +       init_completion(&common->probe_completion);
> > +       common->bus_notifier.notifier_call = pseudo_gpio_notifier_call;
> > +}
> > +EXPORT_SYMBOL_GPL(pseudo_gpio_init);
> > +
> > +int pseudo_gpio_register(struct pseudo_gpio_common *common,
> > +                        struct platform_device_info *pdevinfo)
> > +{
> > +       struct platform_device *pdev;
> > +       char *name;
> > +
> > +       name = kasprintf(GFP_KERNEL, "%s.%u", pdevinfo->name, pdevinfo->id);
> > +       if (!name)
> > +               return -ENOMEM;
> > +
> > +       common->driver_bound = false;
> > +       common->name = name;
> > +       reinit_completion(&common->probe_completion);
> > +       bus_register_notifier(&platform_bus_type, &common->bus_notifier);
> > +
> > +       pdev = platform_device_register_full(pdevinfo);
> > +       if (IS_ERR(pdev)) {
> > +               bus_unregister_notifier(&platform_bus_type, &common->bus_notifier);
> > +               kfree(common->name);
> > +               return PTR_ERR(pdev);
> > +       }
> > +
> > +       wait_for_completion(&common->probe_completion);
> > +       bus_unregister_notifier(&platform_bus_type, &common->bus_notifier);
> > +
> > +       if (!common->driver_bound) {
> > +               platform_device_unregister(pdev);
> > +               kfree(common->name);
> > +               return -ENXIO;
> > +       }
> > +
> > +       common->pdev = pdev;
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(pseudo_gpio_register);
> > +
> > +void pseudo_gpio_unregister(struct pseudo_gpio_common *common)
> > +{
> > +       platform_device_unregister(common->pdev);
> > +       kfree(common->name);
> > +       common->pdev = NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(pseudo_gpio_unregister);
> > diff --git a/drivers/gpio/gpio-pseudo.h b/drivers/gpio/gpio-pseudo.h
> > new file mode 100644
> > index 000000000000..093112b6cce5
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-pseudo.h
> > @@ -0,0 +1,24 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef GPIO_PSEUDO_H
> > +#define GPIO_PSEUDO_H
> > +
> > +#include <linux/completion.h>
> > +#include <linux/platform_device.h>
> > +
> > +struct pseudo_gpio_common {
> 
> After moving to lib/ this could be named "pdev_sync_probe_data"?

Hm, I can't think of anything else right now. I'll use the name. Thanks!

> 
> > +       struct platform_device *pdev;
> > +       const char *name;
> > +
> > +       /* Synchronize with probe */
> > +       struct notifier_block bus_notifier;
> > +       struct completion probe_completion;
> > +       bool driver_bound;
> > +};
> > +
> > +void pseudo_gpio_init(struct pseudo_gpio_common *common);
> > +int pseudo_gpio_register(struct pseudo_gpio_common *common,
> > +                        struct platform_device_info *pdevinfo);
> > +void pseudo_gpio_unregister(struct pseudo_gpio_common *common);
> > +
> > +#endif /* GPIO_PSEUDO_H */
> > --
> > 2.45.2
> >
> 
> Bartosz

