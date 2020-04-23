Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA60E1B586D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2020 11:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgDWJlm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 23 Apr 2020 05:41:42 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33418 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgDWJlm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Apr 2020 05:41:42 -0400
Received: by mail-ot1-f68.google.com with SMTP id j26so4986695ots.0;
        Thu, 23 Apr 2020 02:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0xshtJGFmIVpnTFVR1yoPS4cLrAg5tMlLKvvDBmyaBo=;
        b=lq3TdEEmgwfE8U0HzGUlvCEQbyM/wnf4QzfmRay7FBxdhsqaMFvlUpzqzKs/KLdyk/
         nWC+/bhJeVf+rfPFJfi+kQPa2Ag7jwO4UhRJK8aQBoywc7AewRg2k00cuY7OewoZL+jY
         nAKhYjKGP2rvxXCzMKPBvCRcfCtYcgFVykTJHMpkGmdeFs3XjP/OddW3mLtRfysoMRyv
         B5KE3RtETKF8/BI7/x2pRJ3woiO1cAgWWZPJZfH94cAorKJFwJIhTalvRtoHo6spEhLd
         bGQLTMyiol5mqXLWUEM9Opv6BEb1MIwoqwHIDm60xwWxTxAsXY2PI2DNlGI8F6487axR
         JU7w==
X-Gm-Message-State: AGi0PubOLTPLP2DRFHe7/JyHLUkzelPTTPau+iVe6Mxvf88Vf2P9bKCI
        rZCmgQoWuvQ1AF/ulLgMBL7+VJ55cRz9hoKPg80=
X-Google-Smtp-Source: APiQypKTQ38CBvNiS1ye67LjCvLSobpQz2r7lRaV8eZql0rvRTNiYFUv9xr52OJnF3F+KkW9Y9d08tEkvTKshSMobHg=
X-Received: by 2002:aca:d50f:: with SMTP id m15mr2367854oig.54.1587634901058;
 Thu, 23 Apr 2020 02:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200423090118.11199-1-geert+renesas@glider.be>
 <20200423090118.11199-4-geert+renesas@glider.be> <5dbfd026-3807-b122-ce60-1339a5252fca@amsat.org>
In-Reply-To: <5dbfd026-3807-b122-ce60-1339a5252fca@amsat.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Apr 2020 11:41:29 +0200
Message-ID: <CAMuHMdWf2RfGvSizXKonmAB84kPyAPwZ3mF1PayK_mdn=wwRkw@mail.gmail.com>
Subject: Re: [PATCH QEMU v2 3/5] Add a GPIO backend using libgpiod
To:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alexander Graf <graf@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Philippe,

Thanks for your comments!

On Thu, Apr 23, 2020 at 11:28 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> On 4/23/20 11:01 AM, Geert Uytterhoeven wrote:
> > Add a GPIO controller backend, to connect virtual GPIOs on the guest to
> > physical GPIOs on the host.  This allows the guest to control any
> > external device connected to the physical GPIOs.
> >
> > Features and limitations:
> >   - The backend uses libgpiod on Linux,
> >   - For now only GPIO outputs are supported,
> >   - The number of GPIO lines mapped is limited to the number of GPIO
> >     lines available on the virtual GPIO controller.
> >
> > Future work:
> >   - GPIO inputs,
> >   - GPIO line configuration,
> >   - Optimizations for controlling multiple GPIO lines at once,
> >   - ...
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- /dev/null
> > +++ b/backends/gpiodev.c
> > @@ -0,0 +1,94 @@
> > +/*
> > + * QEMU GPIO Backend
> > + *
> > + * Copyright (C) 2018-2020 Glider bv
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include <errno.h>
>
> <errno.h> probably not needed.

It is indeed included by one of the other header files.
What is the QEMU policy w.r.t. that?

>
> > +#include <gpiod.h>
>
> Please move this one...
>
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/config-file.h"
> > +#include "qemu/cutils.h"

I forgot to remove the two above...

> > +#include "qemu/error-report.h"
> > +#include "qemu/module.h"
> > +#include "qemu/option.h"

... and the two above.

> > +#include "qapi/error.h"
> > +
> > +#include "sysemu/gpiodev.h"
> > +
> > +#include "hw/irq.h"
> > +#include "hw/qdev-core.h"
>
> ... here:
>
> #include <gpiod.h>

OK.

> > --- a/configure
> > +++ b/configure
> > @@ -509,6 +509,7 @@ libpmem=""
> >  default_devices="yes"
> >  plugins="no"
> >  fuzzing="no"
> > +gpio=""
>
> Maybe name this feature 'libgpiod'?

Makes sense.

> >
> >  supported_cpu="no"
> >  supported_os="no"
> > @@ -1601,6 +1602,10 @@ for opt do
> >    ;;
> >    --gdb=*) gdb_bin="$optarg"
> >    ;;
> > +  --disable-gpio) gpio="no"
> > +  ;;
> > +  --enable-gpio) gpio="yes"
>
> Ditto: --enable-libgpiod, because else it seems rather confusing.

OK.

> > --- /dev/null
> > +++ b/include/sysemu/gpiodev.h
> > @@ -0,0 +1,12 @@
> > +/*
> > + * QEMU GPIO Backend
> > + *
> > + * Copyright (C) 2018-2020 Glider bv
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/typedefs.h"
>
> "qemu/typedefs.h" not needed in includes.

While removing that works, it does mean the header file is no longer
self-contained:

include/sysemu/gpiodev.h:10:23: error: unknown type name ‘DeviceState’

> > +
> > +void qemu_gpiodev_add(DeviceState *dev, const char *name, unsigned int maxgpio,
> > +                      Error **errp);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
