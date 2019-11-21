Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6731054D4
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 15:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfKUOrx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 09:47:53 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39045 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfKUOrw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 09:47:52 -0500
Received: by mail-lj1-f194.google.com with SMTP id p18so3526190ljc.6
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 06:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rgd4jF91R+rgjedOLF1KEM/oHEun6CYyuuh6iHBRru8=;
        b=Lq4exT5tohXgfK/4YHkl0FNJSGyjWly+xHi6fLfjSEDdHDFYVV7wPP7QjNbspQ20Ni
         ewK7EEczCCniTPdDikrwuo5CVV/GZzYpUv5N2oucKbqXzCx5OaRtb8CkVQV2FSsDFOG7
         DZ8NmRJVYzDOsgQLmlwfmO45e8J4YNzAU4zzaeTOFeWSYHpDANNzaTWoQyYKqu0nSWwT
         MVxQZ+oYh1+YqdC+YEQrA3uAc1DI73/QNazp8XO88qH8sgm0N86HY67DR1hqPdQ1/qJS
         oP7qehJSLgOD9R5AFA5s0KLONMwsizqKAlopQCHfrrj2Dd+pVWzi8pR2fJOGL+ZjMkQj
         Q6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rgd4jF91R+rgjedOLF1KEM/oHEun6CYyuuh6iHBRru8=;
        b=Hhkwp12zNRkD6YP3UkeBmsaXah9+6/iy28PA/EJcnK4MJVNtDcy7zSfIkx3F+KcWop
         Ko/HwQg7eB2wVUD8Df9WmE8W+YPy1i8yxmC0KFpO1WcXaKUOgfbFBWXZaoIVplk/z/Mu
         ePovUzaD9oFc/A1e9FXy2Kel7Y0hM8sTydIIhSKiicmNEBck7m3nVrVy+gvkunnGHWyc
         s6diAEL5VacNAba/tMUkfPOxxUhqw+xZWw9/4SYBZ2kga83h7qF12bRiUVuq7z5jsQx2
         4/e9gT3K72PBSsNLU4cJqO16hJ/dqN14LRF4L2MTxJBjuDFYbyFGsftHbmFwsTO6CKo3
         2hQw==
X-Gm-Message-State: APjAAAWy/Whpqgv+ToODHX8rfAF4+G3sUrX9C3H5yAsI8Mg7JktzhP3R
        ZyFPZrT4sW6gF2t0QTXKwe6yv3j9HUQ/FsCnohz7Dg==
X-Google-Smtp-Source: APXvYqwpA3cRH0JOe5hzsZglOV9vYtuQrxuIKdB45IJNsXbC/8UauccMkXlbzwCghqjPAdpiHnaoAA4DEnjrSk1Ukdo=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr7655231ljb.42.1574347668239;
 Thu, 21 Nov 2019 06:47:48 -0800 (PST)
MIME-Version: 1.0
References: <20191030114530.872-1-peter.ujfalusi@ti.com> <CACRpkdbw9MVrQMSgVMenSqAOiti1pAy4d2LvWY-ssx9dhzWEcw@mail.gmail.com>
 <8bd0f286-dc54-72a6-0aaf-2dc7b9972883@ti.com> <CACRpkdZ-qf3OKAxsoj+36V_N6Y_gFte1LHM+66OqekXBAWxsVA@mail.gmail.com>
 <56916577-8d39-f98f-9fd6-2fdc6e1e0023@ti.com>
In-Reply-To: <56916577-8d39-f98f-9fd6-2fdc6e1e0023@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 15:47:36 +0100
Message-ID: <CACRpkdYLn2p+smpcqLj=mD1=NRNAXHbqL25Y6OB93+ZCWk6PAw@mail.gmail.com>
Subject: Re: [RFC 0/2] gpio: Support for shared GPIO lines on boards
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Grant Likely <glikely@secretlab.ca>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 19, 2019 at 9:33 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
> On 13/11/2019 19.06, Linus Walleij wrote:
> > On Fri, Nov 8, 2019 at 12:20 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:

> >> gpiod_deassert() would be equivalent to Philipp's
> >> gpiod_politely_suggest_value()
> >
> > I don't intuitively understand the semantics of these calls.
> > Consider Rusty Russells API design manifesto:
> > http://sweng.the-davies.net/Home/rustys-api-design-manifesto
>
> imho the gpiod is API level -7 in the Rusty scale.

I would agree that the double-inversion of DT or machine flags
for active low/high and then gpiod_set_value() to high makes it
low and vice versa mutatis mutandis is pretty -7

But my comment was not about that, but about the ambiguity
of some *_politely_suggest_* API.

I mean adding a new confusing API to the mess is hardly
going to make things better, two wrongs doesn't make one
right.

> > It seems like a totally different and entirely syntactic problem
> > separate from the reset business you're trying to solve?
> >
> > We had this discussion before this week and yeah, if we
> > historically named the logical levels on the line "asserted"
> > and "deasserted" everywhere it would be great.
>
> Yeah, it is extremely awkward currently:
> rst-gpois = <&gpio0 1 GPIO_ACTIVE_LOW>;
>
> devm_gpiod_get_optional(dev, "rst",  GPIOD_OUT_LOW |
>                                      GPIOD_FLAGS_BIT_NONEXCLUSIVE);
>
> Would set the initial output level to _high_

Yeah I understand what the problem is.... :/

> > These APIs really need names that can be understood right off
> > and they should be compile-time optional (a Kconfig option) so
> > that drivers that really need them can select to have them
> > explicitly.
>
> At the end the goal is to have only assert/deassert API for GPIO, or do
> you want to keep set_value()?

The problem can me split in two, non-conflated things:

1. Rename gpiod_set_value() to e.g. gpiod_set_state(bool asserted)
    this is a purely syntactic change with no semantic effect.
    This makes it clear what happens and fixes the issue with
    the hard to understand name of the function, but does not
    change the semantic allowing you to say assert a GPIO line
    several times after another, as that would wreak havoc in the
    kernel. And after all there is nothing about that name that
    suggest it would be reference counting anything.

2. Add a new reference-counted stateful API that does not allow you to
   handle your usecase.

I would recommend not conflating the two things.

> Imho the gpiod_direction_output_raw() should not be allowed to be used
> by drivers.

So how do you suggest that drivers/w1/masters/w1-gpio.c
handle the usecase of overriding a nominally open drain-flagged
line to pump some voltage in the line at some regular intervals,
notwithstanding the logical level of the line?

This use of GPIO isn't dealing with something boolean logical,
but something directly electromagnetic.

It would be nice if GPIO was only about logical levels,
but it is not, and that is why gpiod_set_raw() exists.

There are other users in the kernel that are just cheating
or thinking wrong, it'd be nice if those could be fixed.
It doesn't mean the API has no valid usecases.

> CONFIG_GPIOLIB_ASSER_API as selectable config option?

CONFIG_GPIOLIB_REFCOUNTING_API is more to the
point I think, because that is what you want to achieve.

Then the function calls can very well be named something
with *assert* in them.

> But it is one thing to change gpiod users as we have heavy use of the
> legacy gpio API:
> git grep gpio_request | wc -l
> 1868

That can be done with a sed script if someone takes on the
task.

> That does not really matter in this case.

Nope.

> > So begin with creating a way to pull the shared handling of
> > regulators into gpiolib with these clearly cut semantics
> > delete the NONEXCLUSIVE thing and then when you are
> > done with that exploit the same
> > infrastructure for GPIO reset.
>
> The logic is relatively simple, 229 lines in gpio-shared, but moving
> that into core will explode things a bit and going to add more
> complexity to all gpio lines.

I would just add a flag such as in drivers/gpio/gpiolib.h:

#define FLAG_REFERENCE_COUNTED  15      /* GPIO uses the reference
counting API */

If anyone grabs a GPIO with this flag it needs to be accessed
using the refcounting API and all other uses with the
regular API denied.

The same the other direction, if FLAG_REQUESTED is already
set, the refcounting API should bail out.

Do not try to support a use case such as allowing the gpiod
to be grabbed unrefcounted and later turned into a refcounted
gpiod. Only grab it through the refcount-specific API.

This way it's almost as cleanly separated as the code is
separated into regulator right now, just that it lives in
a place where it can be reused by others needing
reference counting.

Then surround code with:

if (IS_ENABLED(CONFIG_GPIOLIB_REFCOUNTING_API)
     /* test flag */

Then the code size impact should be zero if the refcounting API
is not selected.

Then just create an add-on that only affects the lines that explicitly
want refcounting. Wrap a gpiod in another struct or something
struct gpio_refcount_desc?

> For one, we must maintain a list of clients requesting the line to be
> able to do proper refcounting and this needs to be done for all pins as
> we don't know beforehand that the given line is going to be shared.

If you want to deny the same client to ask for the same line
twice then you need a list like that indeed. (It's a good strict semantic
check anyways.)

> Or add gpio-shared block similar to gpio-hog to prepare a given line for
> sharing? I think this might be a better thing to do and some of the code
> from gpio-shared.c can be reused.

I would just add a flag and try to keep this API entirely on the
side for now.

Yours,
Linus Walleij
