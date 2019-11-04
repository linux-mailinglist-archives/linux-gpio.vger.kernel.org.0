Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4C5EE7FD
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 20:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbfKDTL5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 14:11:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:42854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728174AbfKDTL4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Nov 2019 14:11:56 -0500
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F14B220B7C;
        Mon,  4 Nov 2019 19:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572894715;
        bh=4uwt5YvYXaSGeYlBkTOwqpHXisD3hCbNZENR9nDwerY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rpXbOwfjQYaabV08/lPS34ocHLNfqP+gaFvA3GbP9t09YpuGl/4RAJ+Mcom5gh/Tp
         NuSp/1woKnSS1eUkTy94G6zPT9MV4RbVSFP6NA3uv1zEN3e5MPhh5ZpGZf5L4Hk/fq
         pDl7e1rztiwSLwHV2BoXLyoC861rtxmFZ3JD7nnA=
Received: by mail-qk1-f175.google.com with SMTP id q70so18693756qke.12;
        Mon, 04 Nov 2019 11:11:54 -0800 (PST)
X-Gm-Message-State: APjAAAUlnpslRac0WYmzbN9/tRS5q4P0tZycFFYIa5Ed6pgtX/iPxzHU
        BJ2w7b7ZpYkPOXsIiNO8QS+rSiejK7UfY8wXYA==
X-Google-Smtp-Source: APXvYqyP/KdQJngkXNhVCwWMouCionXi0KcfwCegGVHnqeAY1T258TDIcGL8h01SsJsky01NM0wVNecG+be90nNQbAo=
X-Received: by 2002:a37:9847:: with SMTP id a68mr6137575qke.223.1572894713951;
 Mon, 04 Nov 2019 11:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20191030120440.3699-1-peter.ujfalusi@ti.com> <CAL_JsqK-eqoyU7RWiVXMpPZ8BfT8a0WB47756s8AUtyOqbkPXA@mail.gmail.com>
 <5bca4eb6-6379-394f-c95e-5bbbba5308f1@ti.com> <20191030141736.GN4568@sirena.org.uk>
 <f9c181d1-5e0c-5e82-a740-f4e97822604f@ti.com> <CAL_JsqJ4WdaRvmZcjQG-jVyOOeKZX9fn1WcQZGWfUPqwunQCFw@mail.gmail.com>
 <1258a5bf-a829-d47a-902f-bf2c3db07513@ti.com> <CAL_Jsq+V0oAdVCaW+S12CUa4grCJhZD8OGDeu=0ohcGgxOkPVg@mail.gmail.com>
 <5669a4c1-2bc1-423b-1407-073317f7df7e@ti.com>
In-Reply-To: <5669a4c1-2bc1-423b-1407-073317f7df7e@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 4 Nov 2019 13:11:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJbhG+-zVs9bjHg8asGuM1+FNnGJ0xx7qcPBwuRX35ijw@mail.gmail.com>
Message-ID: <CAL_JsqJbhG+-zVs9bjHg8asGuM1+FNnGJ0xx7qcPBwuRX35ijw@mail.gmail.com>
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 1, 2019 at 10:20 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrot=
e:
>
>
>
> On 01/11/2019 15.46, Rob Herring wrote:
> > On Thu, Oct 31, 2019 at 3:00 AM Peter Ujfalusi <peter.ujfalusi@ti.com> =
wrote:
> >>
> >>
> >>
> >> On 30/10/2019 20.49, Rob Herring wrote:
> >>> On Wed, Oct 30, 2019 at 9:30 AM Peter Ujfalusi <peter.ujfalusi@ti.com=
> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 30/10/2019 16.17, Mark Brown wrote:
> >>>>> On Wed, Oct 30, 2019 at 03:32:09PM +0200, Peter Ujfalusi wrote:
> >>>>>> On 30/10/2019 15.12, Rob Herring wrote:
> >>>>>
> >>>>>>> Why can't we just add a shared flag like we have for interrupts?
> >>>>>>> Effectively, we have that for resets too, it's just hardcoded in =
the
> >>>>>>> the drivers.
> >>>>>
> >>>>>> This would be kind of the same thing what the
> >>>>>> GPIOD_FLAGS_BIT_NONEXCLUSIVE does, which was a quick workaround fo=
r
> >>>>>> fixed-regulators afaik.
> >>>>>
> >>>>> The theory with that was that any usage of this would need the
> >>>>> higher level code using the GPIO to cooperate so they didn't step
> >>>>> on each other's toes so the GPIO code should just punt to it.
> >>>>
> >>>> But from the client driver point of view a GPIO is still GPIO and if=
 the
> >>>> components are unrelated then it is hard to patch things together fr=
om
> >>>> the top.
> >>>
> >>> You can't escape a driver being aware. If a driver depends on that
> >>> GPIO to actually be set to states the driver says, then it can't be
> >>> guaranteed to work. For example, maybe the driver assumes the device
> >>> is in reset state after toggling reset and doesn't work if not in
> >>> reset state. The driver has to be aware no matter what you do in DT.
> >>
> >> That's true for some device, but it is also true that some can not
> >> tolerate being reset without them knowing it.
> >
> > You mean a reset when the driver is not loaded would not work? How
> > could that ever work?
>
> No, what I mean is that one device is reset because the driver for the
> other device toggles the GPIO line.
>
> If one driver toggles the GPIO line directly then the GPIO line is going
> to be toggled for all the devices the GPIO line is connected to.

Of course. That would be the typical case. I'd assume we would want to
handle that the same way as shared resets. Reset can only be asserted
when all clients want reset asserted. I guess when the first client
probes, it asserts and deasserts the reset.

>
> > I don't think you can have any reset control in
> > the drivers in that case.
>
> The device needs the RST line to be high, otherwise it is not
> accessible. If it does not have reset control how can we make sure that
> the GPIO line is in correct state?

Just like the reset code, drivers register their use of the reset and
the core tracks users and prevents resetting when not safe. Maybe the
reset subsystem needs to learn about GPIO resets. It could even
default to knowing 'reset-gpios' property as we've somewhat
standardized that. Then you just register your GPIO reset line with
the reset subsystem. When it gets the same line registered more than
once, then it knows to handle sharing the line. If you need to know
the line is shared before then, then you need something in DT. A flag
is enough for that.

> gpio-hog does not work all the time because we can not trust probe order
> and w/o gpio binding on the user deferred probing is not possible.
> If for some reason the gpio controller is probed after the drivers
> depending on the reset/enable GPIO then there's not much we can do.
>
> >> If all users of the shared GPIO have full control over it then they ca=
n
> >> just toggle it whatever way they want. How would a regulator, codec,
> >> amplifier would negotiate on what to do with the shared GPIO?
> >>
> >> Another not uncommon setup is when the two components needs different =
level:
> >> C1: ENABLE is high active
> >> C2: RESET is high active
> >>
> >> To enable C1, the GPIO should be high. To enable C2 the GPIO must be l=
ow.
> >> In the board one of the branch of the shared GPIO needs (and have) a
> >> logic inverter.
> >>
> >> If they both control the same GPIO then they must have requested it wi=
th
> >> different GPIO_ACTIVE_ since the drivers are written according to chip
> >> spec, so C1 sets the GPIO to 1, C2 sets it to 0, the inversion for one
> >> of them must happen in gpio core, right?
> >
> > No, drivers are written to set the state to active/inactive.
>
> I think the drivers are written in a way to follow what their datasheets
> are tells. If it say that the GPIO line must be high to enable the
> device then they gpiod_set_value(1), if the line must be low to enable
> them then they will gpiod_set_value(0).

gpiod_set_value(1) sets the line to the active state defined in DT
GPIO flags, not the electrical level of the signal. This issue is a
good example of precisely why the gpiod API was defined this way. I do
think it is a bit confusing though. Perhaps reusing _{get,set}_value
API was not the best naming.


> > The DT GPIO_ACTIVE_ flags can depend on an inverter being present (BTW,=
 there
> > was a recent attempt to do an inverter binding).
>
> Yes.
> If the line is inverted on the board, than the DT GPIO_ACTIVE_LOW will
> invert it to the correct level.

Yes, if the signal is normally GPIO_ACTIVE_HIGH.

> We have two off the shelf components, C1 and C2. They have a driver
> written based on the datasheets.
> C1 needs HIGH (LOW reset/disable)
>  uses gpiod_set_value(1) to enable the device

No. The active state for a 'reset-gpios' is the state in which reset
is active/asserted. So gpiod_set_value(1) should always mean 'assert
reset'.

If we're talking about an 'enable-gpios', then the active state is
when the device is active/enabled. So it's the inverse of
'reset-gpios'.

> C2 needs LOW (HIGH reset/disable)
>  uses gpiod_set_value(0) to enable the device

Yes. The GPIO flag would be GPIO_ACTIVE_HIGH and gpiod_set_value(0) is
reset de-asserted.

> When they are connected to a dedicated GPIO the DT binding has
> GPIO_ACTIVE_HIGH since when the GPIO is set to 1 it goes HIGH, right?

No, as explained above. C2 would be GPIO_ACTIVE_HIGH, C1 would be
GPIO_ACTIVE_LOW normally.

> If two device is connected to one GPIO one of them needs an inverter on
> the GPIO line after it is split into two, let say C2 got inverted line:
> C1 tells in DT that the line is not inverted: GPIO_ACTIVE_HOGH
> C2 tells in DT that the line is inverted: GPIO_ACTIVE_LOW

C1 needs GPIO_ACTIVE_LOW here.

> GPIO HIGH -> D1 is enabled
>           -> !HIGH -> LOW -> D2 is enabled
>
> If both would request the same physical GPIO then how would this work? A
> single GPIO can not be handled in inverted and non inverted way at the
> same time.
>
> But this is just a side effect that this would be easy to handle with
> this DT binding and driver.
> After all, it will describe the GPIO line split.
>
> >> It should be possible to add pass-through mode for gpio-shared so that
> >> all requests would propagate to the root GPIO if that's what needed fo=
r
> >> some setups.
> >>
> >> That way the gpio-shared would nicely handle the GPIO inversions, woul=
d
> >> be able to handle cases to avoid unwanted reset/enable of components o=
r
> >> allow components to be ninja-reset.
> >
> > What does ninja-reset mean?
>
> Ninjas attack from ambush ;)
> The device is reset w/o it's driver being aware that it ever happened as
> other driver toggled the shared GPIO line.
>
> >> I think it would be possible to add gpiod_is_shared(struct gpio_desc
> >> *desc) so users can check if the GPIO is shared - it would only return
> >> true if the gpio-shared is not in pass-through mode so they can know
> >> that the state they see on their gpio desc is not necessary matching
> >> with reality.
> >> Probably another gpiod_shared_get_root_value() to fetch the root's sta=
te?
> >>
> >> I intentionally not returning that in the driver as clients might skip=
 a
> >> gpio_set_value() seeing that the GPIO line is already in a state they
> >> would want it, but that would not register their needs for the level.
> >>
> >> - P=C3=A9ter
> >>
> >> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> >> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>
> - P=C3=A9ter
>
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
