Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE5D187B7F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2020 09:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbgCQIsU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Mar 2020 04:48:20 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40675 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgCQIsU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2020 04:48:20 -0400
Received: by mail-ot1-f66.google.com with SMTP id h17so2181449otn.7;
        Tue, 17 Mar 2020 01:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TF9ZPq6K3m7hthYQMxgsfrxGm1XjgIE20ka3eMWPfOI=;
        b=cti8u4IeylfjBU/nTFCiR13/cPOQK70zY/obqWbtRzRsjjvuzd4wt77cSzGtdee8dA
         HDiMOFOuEh2GRULpOqozom0ujWZCuvXuRT+LxPeaMHjABHwpEvTfwFYNGh2oZ//4i3XP
         V9AXFycY8+Ml5lzv04unrY4q30Fvt2+vm0nNjjxUT4uZTHL0NRy/mNVhQcZ6HRwtw534
         NpGRunMjc7B71h7a4N5+Euu+Sm3ERhVQm5aWJpNtQyUey64VCIwSh6srdU5Dxfn1njCM
         1MKGxgDmHCL7e8bDM7wAvODtaxeWaMoGsNykLRn3w2O9UUH05szRCcCHhL3tIKc7CRSb
         f12g==
X-Gm-Message-State: ANhLgQ1TDk9VBxtnoz3QtYyFKyPVvo1V1gggDERAaX1VK946S+hkQCpC
        HF0f9nSJhQ799SDuUCMwJKt7fg61RblEq525uGk=
X-Google-Smtp-Source: ADFU+vvY8Z0ef/19Mtjmqmv34pha/3636uxkMdzDg1Xxss7VCZaBeH5oruI+jGiAKjqfKhyWlQxYBTSwLqHEgrCeU/s=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr2783773otk.145.1584434899513;
 Tue, 17 Mar 2020 01:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200218151812.7816-1-geert+renesas@glider.be>
 <20200218151812.7816-3-geert+renesas@glider.be> <CACRpkda1JAnC=Feb39GeKEEP6q8Qwpsth6J+4OKj6A8S3YAUyQ@mail.gmail.com>
In-Reply-To: <CACRpkda1JAnC=Feb39GeKEEP6q8Qwpsth6J+4OKj6A8S3YAUyQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Mar 2020 09:48:08 +0100
Message-ID: <CAMuHMdVwbGNOWk+MK-XZSrSMY3nNnn0sfJ0UZFXaZgQh-tQDZw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] gpiolib: Add support for GPIO line table lookup
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Mar 12, 2020 at 3:21 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Feb 18, 2020 at 4:18 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Currently GPIOs can only be referred to by GPIO controller and offset in
> > GPIO lookup tables.
> >
> > Add support for looking them up by line name.
> > Rename gpiod_lookup.chip_label to gpiod_lookup.key, to make it clear
> > that this field can have two meanings, and update the kerneldoc and
> > GPIO_LOOKUP*() macros.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
>
> I will try to understand why this change is necessary to implement
> the gpio aggregator (probablt I will comment that on the other
> patches like "aha now I see it" or so, but it would help a lot if the
> commit message
> would state the technical reason to why we need to do this change,
> like what it is that you want to do and why you cannot do it without
> this change.

It's very simple: how do you want the user to refer to a specific GPIO
line? Currently he can only do so by gpiochip label and index.
However, there exists another stable reference: the (optional) line name,
which can be attached using "gpio-line-names" in DT or ACPI.
As this is the most use-centric way to refer to a GPIO, it makes sense
to support lookup based on that, too.

Will reword to make this clearer.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
