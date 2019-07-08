Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C18461CDF
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 12:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729333AbfGHKY0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 8 Jul 2019 06:24:26 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39134 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbfGHKYZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 06:24:25 -0400
Received: by mail-oi1-f196.google.com with SMTP id m202so12185109oig.6;
        Mon, 08 Jul 2019 03:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZH94yRQagyEtEFCXe5BGPELbKznvxiS9C2fS8RtGieU=;
        b=ALsZFk1Msu3eJ1CUslIyqTPO/0RTDWPbyne7OJdObOwOoLXefN6Vj7xL4yBO8L+7IZ
         8QSfpzSlpP+/4bojcMcVu3+ktmQjzK2ECJB2LjePSE0poWPpTnetskEVg3kGdPxwf+s6
         tVHyCEgef64W/pv+Mjg30+fznkGGWFr34aokOB8A3Q1Y4PEqdIO5aLuKXujxMat2luzt
         jkfV2rBIo3aQDy/KMlB7d5rLHtSU53RAXH33K/dN4yhO0vh5jRFYQOvJpLjRNvwaQU0e
         FWIR57YfIVR3CZAXu6/TtkeUasx0k71D3HgP0vbTcqYf41tdsT14ezCU9dhEzxLoBgQl
         ysaw==
X-Gm-Message-State: APjAAAUQLIt0bsPrJKfmIiTVvZKsRaldHDfeG6q7Ftmt7/IXCXMyCpWt
        SPXmzmLov/apo7v1/uBEOv+NWDAx56cmKznMa7E=
X-Google-Smtp-Source: APXvYqwSYKqvIlZpX/kEBMpX3NmwEXdcEPgN/3e1aYMYlW0L0auvkQf9qdI+BIfG8hC8I/lwj/25JbA37h2UxuYXNIw=
X-Received: by 2002:aca:3bc6:: with SMTP id i189mr8740984oia.153.1562581464846;
 Mon, 08 Jul 2019 03:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190705160536.12047-1-geert+renesas@glider.be> <CAMpxmJXOrDLdw6ZPBHxzsDRYiLmhRNCb-s_Z=Gu=Ecg1XA5ONQ@mail.gmail.com>
In-Reply-To: <CAMpxmJXOrDLdw6ZPBHxzsDRYiLmhRNCb-s_Z=Gu=Ecg1XA5ONQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jul 2019 12:24:13 +0200
Message-ID: <CAMuHMdWdb0dcS8Nvk-Poz2dT7nuHjFhqpsRPZZnSKsc3VffcRA@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Graf <agraf@suse.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Mon, Jul 8, 2019 at 11:45 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> pt., 5 lip 2019 o 18:05 Geert Uytterhoeven <geert+renesas@glider.be> napisał(a):
> > GPIO controllers are exported to userspace using /dev/gpiochip*
> > character devices.  Access control to these devices is provided by
> > standard UNIX file system permissions, on an all-or-nothing basis:
> > either a GPIO controller is accessible for a user, or it is not.
> > Currently no mechanism exists to control access to individual GPIOs.
> >
> > Hence add a virtual GPIO driver to aggregate existing GPIOs (up to 32),
> > and expose them as a new gpiochip.  This is useful for implementing
> > access control, and assigning a set of GPIOs to a specific user.
> > Furthermore, it would simplify and harden exporting GPIOs to a virtual
> > machine, as the VM can just grab the full virtual GPIO controller, and
> > no longer needs to care about which GPIOs to grab and which not,
> > reducing the attack surface.
> >
> > Virtual GPIO controllers are instantiated by writing to the "new_device"
> > attribute file in sysfs:
> >
> >     $ echo "<gpiochipA> <gpioA1> [<gpioA2> ...]"
> >            "[, <gpiochipB> <gpioB1> [<gpioB2> ...]] ...]"
> >             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
> >
> > Likewise, virtual GPIO controllers can be destroyed after use:
> >
> >     $ echo gpio-virt-agg.<N> \
> >             > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> I like the general idea and the interface looks mostly fine. Since
> this is new ABI I think it needs to be documented as well.

Sure.

> I'm having trouble building this module:
>
>   CALL    scripts/atomic/check-atomics.sh
>   CALL    scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
>   Kernel: arch/arm/boot/Image is ready
>   Building modules, stage 2.
>   MODPOST 235 modules
> ERROR: "gpiod_request" [drivers/gpio/gpio-virt-agg.ko] undefined!
> ERROR: "gpiochip_get_desc" [drivers/gpio/gpio-virt-agg.ko] undefined!
> ERROR: "gpiod_free" [drivers/gpio/gpio-virt-agg.ko] undefined!
> scripts/Makefile.modpost:91: recipe for target '__modpost' failed
> make[1]: *** [__modpost] Error 1
> Makefile:1287: recipe for target 'modules' failed
> make: *** [modules] Error 2
> make: *** Waiting for unfinished jobs....
>
> I'm not sure what the problem is.

Oops. As this is an RFC, I didn't bother trying to build this driver as
a module, only builtin.  Apparently the 3 symbols above are not yet
exported using EXPORT_SYMBOL_GPL().

> > --- /dev/null
> > +++ b/drivers/gpio/gpio-virt-agg.c
> > @@ -0,0 +1,390 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +//
> > +// GPIO Virtual Aggregator
> > +//
> > +// Copyright (C) 2019 Glider bvba
> > +
> > +#include <linux/gpio/driver.h>
> > +#include <linux/idr.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "gpiolib.h"
> > +
> > +#define DRV_NAME       "gpio-virt-agg"
> > +#define MAX_GPIOS      32
>
> Do we really need this limit? I see it simplifies the code, but maybe
> we can allocate the relevant arrays dynamically and not limit users?

Sure. That limit can be lifted.

> > +static int gpio_virt_agg_set_config(struct gpio_chip *chip,
> > +                                   unsigned int offset, unsigned long config)
> > +{
> > +       struct gpio_virt_agg_priv *priv = gpiochip_get_data(chip);
> > +
> > +       chip = priv->desc[offset]->gdev->chip;
> > +       if (chip->set_config)
> > +               return chip->set_config(chip, offset, config);
> > +
> > +       // FIXME gpiod_set_transitory() expects success if not implemented

BTW, do you have a comment about this FIXME?

> > +       return -ENOTSUPP;
> > +}

> > +static int gpio_virt_agg_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       const char *param = dev_get_platdata(dev);
> > +       struct gpio_virt_agg_priv *priv;
> > +       const char *label = NULL;
> > +       struct gpio_chip *chip;
> > +       struct gpio_desc *desc;
> > +       unsigned int offset;
> > +       int error, i;
>
> This 'i' here is reported as possibly not initialized:
>
> drivers/gpio/gpio-virt-agg.c: In function ‘gpio_virt_agg_probe’:
> drivers/gpio/gpio-virt-agg.c:230:13: warning: ‘i’ may be used
> uninitialized in this function [-Wmaybe-uninitialized]
>   int error, i;
>              ^

Oops, should be preinitialized to zero. WIll fix.

> > +static int gpio_virt_agg_remove(struct platform_device *pdev)
> > +{
> > +       struct gpio_virt_agg_priv *priv = platform_get_drvdata(pdev);
> > +       unsigned int i;
> > +
> > +       gpiochip_remove(&priv->chip);
> > +
> > +       for (i = 0; i < priv->chip.ngpio; i++)
> > +               gpiod_free(priv->desc[i]);

Perhaps I should use gpiod_put() instead, which is exported to modules?

> > +
> > +       return 0;
> > +}
>
> You shouldn't need this function at all. It's up to users to free descriptors.

This frees the upstream descriptors, not the descriptors used by users
of the virtual gpiochip. Shouldn't they be freed, as they are no longer
in use?

Note that .probe() doesn't use devm_gpiochip_add_data(), as the upstream
descriptors need to be freed after the call to gpiochip_remove().

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
