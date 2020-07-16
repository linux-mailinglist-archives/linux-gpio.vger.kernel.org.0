Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4D82224EC
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 16:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbgGPOKa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 16 Jul 2020 10:10:30 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:38918 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgGPOK3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 10:10:29 -0400
Received: by mail-oo1-f66.google.com with SMTP id c4so1194817oou.6;
        Thu, 16 Jul 2020 07:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wWt5ahbOxhvdXh73SENCOrj8jOaH1VwJmV03whzLYgE=;
        b=ULZI7n4dybtGsi76UbkjhAfHPnp37FEle9rz3B9qLnCqRxHEm6/m9gaWNzy1hQl3iP
         orbPeCyxsIX+hFlj+TjwFgUd2SHjfluB8gRXLr1AEH/6xMxZ2ch9XreUzYAznPqo3rkZ
         GoONWoOQ9cQnU0SZkU5Zh5D9GTCyzLVXxEQaXG02+CuHsS7Wm07qNaaSLaLBDq0Pb0p3
         Y4QeNGw7wGj4orAM2pGk1Mmkm4q3E8PswVZWjOnUG0faNbXRdfIj5kn1c9AyzR4+TWec
         4ITfS18J1rIQMNbdFQWCUrz3VmUVPGg1Ss/ujwvRsXZF9eICnz1R8qYgYriWd5DyeJey
         iWTw==
X-Gm-Message-State: AOAM530OeG2PcqXAndYlKU0XWbZctitzV1vYsnOXi0rbEj2UkftEzS2n
        3RJUUb+4JlJi45rsaWBOgE7ma+UEZi/JAisxRL0=
X-Google-Smtp-Source: ABdhPJw8wK+W7tpnF6N131Op+T2pjdMUds/9+LliMx2aV95aWg/91xH1jsNMr0L7zwbdga4KDdhVG+97BQ8Vdx4dD+A=
X-Received: by 2002:a4a:5209:: with SMTP id d9mr4371731oob.40.1594908627931;
 Thu, 16 Jul 2020 07:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200423090118.11199-1-geert+renesas@glider.be>
 <20200423090118.11199-5-geert+renesas@glider.be> <520d1d07-7530-e133-af6e-a8b4615829b8@amsat.org>
 <e279f622-3af6-5073-dac0-4c452a88c32b@amsat.org>
In-Reply-To: <e279f622-3af6-5073-dac0-4c452a88c32b@amsat.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Jul 2020 16:10:16 +0200
Message-ID: <CAMuHMdU_d-Wd1G37=fUUmmoWgSwyu7M0Rjq1Kw-2H=pbo1CFNg@mail.gmail.com>
Subject: Re: [PATCH QEMU v2 4/5] ARM: PL061: Add gpiodev support
To:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
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

On Thu, Apr 23, 2020 at 12:08 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> On 4/23/20 11:33 AM, Philippe Mathieu-Daudé wrote:
> > On 4/23/20 11:01 AM, Geert Uytterhoeven wrote:
> >> Make the PL061 GPIO controller user-creatable, and allow the user to tie
> >> a newly created instance to a gpiochip on the host.
> >>
> >> To create a new GPIO controller, the QEMU command line must be augmented
> >> with:
> >>
> >>     -device pl061,host=<gpiochip>
> >>
> >> with <gpiochip> the name or label of the gpiochip on the host.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> >> --- a/hw/gpio/pl061.c
> >> +++ b/hw/gpio/pl061.c
> >> @@ -12,11 +12,14 @@
> >>  #include "hw/arm/fdt.h"
> >>  #include "hw/gpio/pl061.h"
> >>  #include "hw/irq.h"
> >> +#include "hw/qdev-properties.h"
> >>  #include "hw/sysbus.h"
> >>  #include "migration/vmstate.h"
> >> +#include "qapi/error.h"
> >>  #include "qemu/log.h"
> >>  #include "qemu/module.h"
> >>  #include "sysemu/device_tree.h"
> >> +#include "sysemu/gpiodev.h"
> >>
> >>  //#define DEBUG_PL061 1
> >>
> >> @@ -41,6 +44,9 @@ static const uint8_t pl061_id_luminary[12] =
> >>  typedef struct PL061State {
> >>      SysBusDevice parent_obj;
> >>
> >> +#ifdef CONFIG_GPIODEV
> >> +    char *host;
> >> +#endif
> >>      MemoryRegion iomem;
> >>      uint32_t locked;
> >>      uint32_t data;
> >> @@ -370,10 +376,39 @@ static void pl061_init(Object *obj)
> >>      qdev_init_gpio_out(dev, s->out, 8);
> >>
> >> +#ifdef CONFIG_GPIODEV
> >> +static Property pl061_properties[] = {
> >> +    DEFINE_PROP_STRING("host", PL061State, host),
> >> +    DEFINE_PROP_END_OF_LIST(),
> >> +};
> >> +
> >> +static void pl061_realize(DeviceState *dev, Error **errp)
> >> +{
> >> +    PL061State *s = PL061(dev);
> >> +
> >> +    if (!dev->opts) {
> >> +        /* Not created by user */
> >> +        return;
> >> +    }
> >> +
> >> +    if (!s->host) {
> >> +        error_setg(errp, "'host' property is required");
> >> +        return;
> >> +    }
> >> +
> >> +    qemu_gpiodev_add(dev, s->host, 8, errp);
> >> +}
> >> +#endif /* CONFIG_GPIODEV */
> >> +
> >>  static void pl061_class_init(ObjectClass *klass, void *data)
> >>  {
> >>      DeviceClass *dc = DEVICE_CLASS(klass);
> >>
> >> +#ifdef CONFIG_GPIODEV
> >> +    device_class_set_props(dc, pl061_properties);
> >> +    dc->realize = pl061_realize;
> >> +    dc->user_creatable = true;
> >> +#endif
> >>      dc->vmsd = &vmstate_pl061;
> >>      dc->reset = &pl061_reset;
> >>  }
> >> diff --git a/qemu-options.hx b/qemu-options.hx
> >> index 292d4e7c0cef6097..182de7fb63923b38 100644
> >> --- a/qemu-options.hx
> >> +++ b/qemu-options.hx
> >> @@ -875,6 +875,15 @@ SRST
> >>  ``-device isa-ipmi-bt,bmc=id[,ioport=val][,irq=val]``
> >>      Like the KCS interface, but defines a BT interface. The default port
> >>      is 0xe4 and the default interrupt is 5.
> >> +
> >> +#ifdef CONFIG_GPIODEV
> >> +``-device pl061,host=gpiochip``
> >> +    Add a PL061 GPIO controller, and map its virtual GPIO lines to a GPIO
> >> +    controller on the host.
> >> +
> >> +    ``host=gpiochip``
> >> +        The name or label of the GPIO controller on the host.
> >> +#endif
> >>  ERST
> >>
> >>  DEF("name", HAS_ARG, QEMU_OPTION_name,
> >>
> >
> > Instead of restricting this to the pl061, it would be cleaner you add a
> > GPIO_PLUGGABLE_INTERFACE (or GPIO_BINDABLE_INTERFACE or better name),
> > and have TYPE_PL061 implement it.
>
> IOW your backend should consume devices implementing this generic interface.

Thanks for the suggestion! I had a look into implementing this.

Please pardon my QEMU illiteracy, but I fail to see how adding an
interface, and letting frontends like pl061.c implement it, will help:
  - The backend never has to call directly into the frontend: all
    communication is done indirectly, using existing core qemu irq and
    qdev gpio calls.
  - The frontend has to call into the backend once, at initialization
    time, to pass the host= parameter, and the number of GPIOs supported
    by the frontend (through qemu_gpiodev_add()).
  - Generalizing host= parsing in the backend would be nice, to avoid
    duplicating this in each and every frontend, but AFAIU, an interface
    cannot use device_class_set_props(), as InterfaceClass is not
    derived from DeviceClass.

Note that when adding more features later (input support, and e.g.
pull-up/down support), the frontend will have to call into the backend
to change GPIO line configuration at runtime, but this is from frontend
to backend again, not the other way around.

I do agree that if we ever want to support multiple backends,
implementing that through an interface (for the backend, not for the
frontend) would be needed.

What am I missing?
Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
